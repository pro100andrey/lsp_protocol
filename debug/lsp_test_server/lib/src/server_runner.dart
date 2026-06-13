import 'dart:io';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';

import 'services/completion_service.dart';
import 'services/document_service.dart';
import 'services/hover_service.dart';

/// Registers all LSP handlers.
///
/// Usage:
///
///     // stdio (default)
///     final runner = ServerRunner();
///     await runner.run();
///
///     // TCP socket
///     final runner = ServerRunner.fromChannel(channel);
///     await runner.run();
final class ServerRunner {
  ServerRunner()
    : _server = LspServer(),
      _docService = DocumentService(),
      _completionService = CompletionService(),
      _hoverService = HoverService();

  /// Creates a server backed by an arbitrary byte [channel] (e.g. a TCP
  /// socket).
  ServerRunner.fromChannel(StreamChannel<List<int>> channel)
    : _server = LspServer.fromChannel(channel),
      _docService = DocumentService(),
      _completionService = CompletionService(),
      _hoverService = HoverService();

  final LspServer _server;
  final DocumentService _docService;
  final CompletionService _completionService;
  final HoverService _hoverService;

  /// Registers all handlers and starts listening on stdio.
  Future<void> run() async {
    _registerHandlers();
    await _server.listen();
  }

  void _registerHandlers() {
    // -------------------------------------------------------------------------
    // General
    // -------------------------------------------------------------------------
    _server.general.onInitialize((params, context) async {
      logInfo('Received initialize request');

      const fileOptions = FileOperationRegistrationOptions(
        filters: [
          .new(
            pattern: .new(glob: '**/*.txt', matches: .file),
          ),
        ],
      );

      const fileOperations = FileOperationOptions(
        willCreate: fileOptions,
        willRename: fileOptions,
        willDelete: fileOptions,
        didCreate: fileOptions,
        didRename: fileOptions,
        didDelete: fileOptions,
      );

      return .new(
        capabilities: .new(
          positionEncoding: .uTF16,
          hoverProvider: const .bool(true),
          completionProvider: const .new(
            triggerCharacters: ['.', ':', '_'],
          ),
          definitionProvider: const .bool(true),
          referencesProvider: const .bool(true),
          documentSymbolProvider: const .bool(true),
          workspaceSymbolProvider: const .bool(true),
          textDocumentSync: .textDocumentSyncOptions(
            const .new(
              change: .full,
              openClose: true,
            ),
          ),
          workspace: (
            workspaceFolders: const .new(
              supported: true,
              changeNotifications: .bool(true),
            ),
            fileOperations: fileOperations,
          ),
        ),
        serverInfo: (name: 'lsp-test-server', version: '0.2.0'),
      );
    });

    _server.general.onInitialized((_, context) async {
      logInfo('Received initialized notification');
    });

    _server.general.onShutdown((context) async {
      logInfo('Received shutdown request');
    });

    _server.general.onExit((context) async {
      logInfo('Received exit notification');
    });

    // -------------------------------------------------------------------------
    // Workspace folders
    // -------------------------------------------------------------------------

    _server.workspace.onDidChangeWorkspaceFolders((params, context) async {
      logInfo(
        'Workspace folders changed: '
        '${params.event.added.map((e) => e.name).join(', ')}',
      );
    });

    // -------------------------------------------------------------------------
    // Text Document Sync
    // -------------------------------------------------------------------------

    _server.textDocument.onDidOpen((params, context) async {
      logInfo('Document opened: ${params.textDocument.uri}');
      _docService.open(params.textDocument.uri, params.textDocument.text);
    });

    _server.textDocument.onDidChange((params, context) async {
      logInfo('Document changed: ${params.textDocument.uri}');
      final uri = params.textDocument.uri;
      final existingText = _docService.get(uri);
      if (existingText == null) {
        return;
      }

      var text = existingText;
      for (final change in params.contentChanges) {
        final fullText = change.asText;
        if (fullText != null) {
          text = fullText.text;
        } else {
          final rangeChange = change.asRangeRangeLengthText;
          if (rangeChange != null) {
            final startOffset = _positionToOffset(
              text,
              rangeChange.range.start,
            );
            final endOffset = _positionToOffset(text, rangeChange.range.end);
            text = text.replaceRange(
              startOffset,
              endOffset,
              rangeChange.text,
            );
          }
        }
      }

      _docService.update(uri, text);
      _publishDiagnostics(uri, text);
    });

    _server.textDocument.onDidClose((params, context) async {
      logInfo('Document closed: ${params.textDocument.uri}');
      _docService.close(params.textDocument.uri);
      _clearDiagnostics(params.textDocument.uri);
    });

    // -------------------------------------------------------------------------
    // textDocument/hover
    // -------------------------------------------------------------------------

    _server.textDocument.onHover((params, context) async {
      logInfo(
        'Hover request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      return _hoverService.getHover(params);
    });

    // -------------------------------------------------------------------------
    // textDocument/completion
    // -------------------------------------------------------------------------

    _server.textDocument.onCompletion((params, context) async {
      logInfo('Completion request: ${params.textDocument.uri}');
      final documentText = _docService.get(params.textDocument.uri);
      final items = _completionService.getCompletions(
        params,
        documentText: documentText,
      );

      return .completionItemList(items);
    });

    // -------------------------------------------------------------------------
    // textDocument/definition
    // -------------------------------------------------------------------------

    _server.textDocument.onDefinition((params, context) async {
      logInfo(
        'Definition request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      final text = _docService.get(params.textDocument.uri);
      if (text == null) {
        return null;
      }

      final lines = _splitLines(text);
      if (params.position.line >= lines.length) {
        return null;
      }

      final line = lines[params.position.line];
      final word = _extractWordAtPosition(line, params.position.character);

      if (word == null || word.isEmpty) {
        return null;
      }

      // Find all occurrences of the word in the document
      final locations = <Location>[];
      for (var i = 0; i < lines.length; i++) {
        final lineText = lines[i];
        var startIndex = 0;
        while (true) {
          final index = lineText.indexOf(word, startIndex);
          if (index == -1) {
            break;
          }

          locations.add(
            .new(
              uri: params.textDocument.uri,
              range: .new(
                start: .new(line: i, character: index),
                end: .new(line: i, character: index + word.length),
              ),
            ),
          );
          startIndex = index + 1;
        }
      }

      if (locations.length == 1) {
        return DefinitionResult.definition(
          Definition.location(locations.first),
        );
      }
      return DefinitionResult.definition(Definition.locationList(locations));
    });

    // -------------------------------------------------------------------------
    // textDocument/references
    // -------------------------------------------------------------------------

    _server.textDocument.onReferences((params, context) async {
      logInfo(
        'References request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      final text = _docService.get(params.textDocument.uri);
      if (text == null) {
        return [];
      }

      final lines = _splitLines(text);
      if (params.position.line >= lines.length) {
        return [];
      }

      final line = lines[params.position.line];
      final word = _extractWordAtPosition(line, params.position.character);

      if (word == null || word.isEmpty) {
        return [];
      }

      final locations = <Location>[];
      for (var i = 0; i < lines.length; i++) {
        final lineText = lines[i];
        var startIndex = 0;
        while (true) {
          final index = lineText.indexOf(word, startIndex);
          if (index == -1) {
            break;
          }
          locations.add(
            .new(
              uri: params.textDocument.uri,
              range: .new(
                start: .new(line: i, character: index),
                end: .new(line: i, character: index + word.length),
              ),
            ),
          );
          startIndex = index + 1;
        }
      }

      return locations;
    });

    // -------------------------------------------------------------------------
    // textDocument/documentSymbol
    // -------------------------------------------------------------------------

    _server.textDocument.onDocumentSymbol((params, context) async {
      logInfo('DocumentSymbol request: ${params.textDocument.uri}');

      final text = _docService.get(params.textDocument.uri);
      if (text == null) {
        return .documentSymbolList([]);
      }

      final symbols = <DocumentSymbol>[];
      final lines = _splitLines(text);

      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        final trimmed = line.trim();

        // Detect function-like patterns
        if (trimmed.contains('(') &&
            trimmed.contains(')') &&
            (trimmed.contains('=') || trimmed.contains('=>'))) {
          final name = trimmed.split('(').first.trim();
          if (name.isNotEmpty && !_isComment(line)) {
            symbols.add(
              .new(
                name: name,
                detail: trimmed,
                kind: .function,
                range: .new(
                  start: .new(line: i, character: 0),
                  end: .new(line: i, character: line.length),
                ),
                selectionRange: .new(
                  start: .new(line: i, character: trimmed.indexOf(name)),
                  end: .new(
                    line: i,
                    character: trimmed.indexOf(name) + name.length,
                  ),
                ),
              ),
            );
          }
        }
      }

      return .documentSymbolList(symbols);
    });

    // -------------------------------------------------------------------------
    // workspace/symbol
    // -------------------------------------------------------------------------

    _server.workspace.onSymbol((params, context) async {
      logInfo('WorkspaceSymbol request: query="${params.query}"');

      final allSymbols = <SymbolInformation>[];
      for (final entry in _docService.documents.entries) {
        final uri = entry.key;
        final text = entry.value;
        final lines = _splitLines(text);

        for (var i = 0; i < lines.length; i++) {
          final line = lines[i];
          final trimmed = line.trim();

          if (trimmed.contains('(') &&
              trimmed.contains(')') &&
              (trimmed.contains('=') || trimmed.contains('=>'))) {
            final name = trimmed.split('(').first.trim();
            if (name.isNotEmpty &&
                !_isComment(line) &&
                name.toLowerCase().contains(params.query.toLowerCase())) {
              allSymbols.add(
                .new(
                  name: name,
                  kind: .function,
                  location: .new(
                    uri: uri,
                    range: .new(
                      start: .new(line: i, character: 0),
                      end: .new(line: i, character: line.length),
                    ),
                  ),
                ),
              );
            }
          }
        }
      }

      return .symbolInformationList(allSymbols);
    });

    // -------------------------------------------------------------------------
    // Workspace file operations
    // -------------------------------------------------------------------------

    _server.workspace.onWillCreateFiles((params, context) async {
      logInfo(
        'Files will be created: ${params.files.map((f) => f.uri).join(', ')}',
      );
      return const WorkspaceEdit();
    });

    _server.workspace.onWillRenameFiles((params, context) async {
      logInfo(
        'Files will be renamed: '
        '${params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ')}',
      );
      return const WorkspaceEdit();
    });

    _server.workspace.onWillDeleteFiles((params, context) async {
      logInfo(
        'Files will be deleted: ${params.files.map((f) => f.uri).join(', ')}',
      );
      return const WorkspaceEdit();
    });

    _server.workspace.onDidCreateFiles((params, context) async {
      logInfo(
        'Files created: ${params.files.map((f) => f.uri).join(', ')}',
      );
    });

    _server.workspace.onDidRenameFiles((params, context) async {
      logInfo(
        'Files renamed: '
        '${params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ')}',
      );
    });

    _server.workspace.onDidDeleteFiles((params, context) async {
      logInfo(
        'Files deleted: ${params.files.map((f) => f.uri).join(', ')}',
      );
    });
  }

  void _publishDiagnostics(String uri, String text) {
    final diagnostics = <Diagnostic>[];
    final lines = _splitLines(text);

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      // Check for `TODO comments`
      if (line.contains('TODO')) {
        final index = line.indexOf('TODO');
        diagnostics.add(
          Diagnostic(
            message: 'TODO: This needs to be implemented',
            range: Range(
              start: Position(line: i, character: index),
              end: Position(line: i, character: index + 4),
            ),
            severity: DiagnosticSeverity.warning,
            code: const DiagnosticCode.string('todo'),
            source: 'lsp-test-server',
          ),
        );
      }

      // Check for `FIXME comments`
      if (line.contains('FIXME')) {
        final index = line.indexOf('FIXME');
        diagnostics.add(
          Diagnostic(
            message: 'FIXME: This is a bug that needs to be fixed',
            range: Range(
              start: Position(line: i, character: index),
              end: Position(line: i, character: index + 5),
            ),
            severity: DiagnosticSeverity.error,
            code: const DiagnosticCode.string('fixme'),
            source: 'lsp-test-server',
          ),
        );
      }

      // Check for very long lines
      if (line.length > 120) {
        diagnostics.add(
          Diagnostic(
            message: 'Line is too long (${line.length} characters)',
            range: Range(
              start: Position(line: i, character: 120),
              end: Position(line: i, character: line.length),
            ),
            severity: DiagnosticSeverity.information,
            code: const DiagnosticCode.string('long-line'),
            source: 'lsp-test-server',
          ),
        );
      }
    }

    final version = _docService.getVersion(uri);

    _server.client.textDocument.publishDiagnostics(
      PublishDiagnosticsParams(
        uri: uri,
        diagnostics: diagnostics,
        version: version,
      ),
    );
  }

  void _clearDiagnostics(String uri) {
    final version = _docService.getVersion(uri);

    _server.client.textDocument.publishDiagnostics(
      PublishDiagnosticsParams(
        uri: uri,
        diagnostics: [],
        version: version,
      ),
    );
  }

  String? _extractWordAtPosition(String line, int character) {
    if (character >= line.length) {
      return null;
    }

    var start = character;
    var end = character;

    // Expand left
    while (start > 0 && _isWordCharacter(line[start - 1])) {
      start--;
    }

    // Expand right
    while (end < line.length && _isWordCharacter(line[end])) {
      end++;
    }

    if (start == character && !_isWordCharacter(line[character])) {
      return null;
    }

    return line.substring(start, end);
  }

  bool _isWordCharacter(String char) {
    if (char.isEmpty) {
      return false;
    }
    final code = char.codeUnitAt(0);
    return (code >= 97 && code <= 122) || // a-z
        (code >= 65 && code <= 90) || // A-Z
        (code >= 48 && code <= 57) || // 0-9
        code == 95; // _
  }

  bool _isComment(String line) {
    final trimmed = line.trim();
    return trimmed.startsWith('//') ||
        trimmed.startsWith('#') ||
        trimmed.startsWith('/*') ||
        trimmed.startsWith('*');
  }

  void logInfo(String message) {
    _server.client.window.logMessage(
      .new(type: .log, message: '[ServerRunner] $message'),
    );

    stdout.writeln('[ServerRunner] $message');
  }

  int _positionToOffset(String text, Position position) {
    var line = 0;
    var offset = 0;
    while (line < position.line && offset < text.length) {
      final nextNewline = text.indexOf('\n', offset);
      if (nextNewline == -1) {
        return text.length;
      }
      offset = nextNewline + 1;
      line++;
    }
    final lineEnd = text.indexOf('\n', offset);
    final maxChar = (lineEnd == -1 ? text.length : lineEnd) - offset;
    final char = position.character.clamp(0, maxChar);
    return offset + char;
  }

  List<String> _splitLines(String text) =>
      text.replaceAll('\r\n', '\n').split('\n');
}
