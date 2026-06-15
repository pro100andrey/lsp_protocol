import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';
import 'package:stream_channel/stream_channel.dart';

import 'services/completion_service.dart';
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
      _docService = TextDocumentManager(),
      _completionService = CompletionService(),
      _hoverService = HoverService() {
    _initManagers();
  }

  /// Creates a server backed by an arbitrary byte [channel] (e.g. a TCP
  /// socket).
  ServerRunner.fromChannel(StreamChannel<List<int>> channel)
    : _server = LspServer.fromChannel(channel),
      _docService = TextDocumentManager(),
      _completionService = CompletionService(),
      _hoverService = HoverService() {
    _initManagers();
  }

  static const legendTypes = ['comment', 'function', 'variable', 'keyword'];
  static const legendModifiers = ['declaration', 'documentation'];

  final LspServer _server;
  final TextDocumentManager _docService;
  final CompletionService _completionService;
  final HoverService _hoverService;

  late final ClientLoggingFeature _clientLogging;
  late final FileLoggingFeature _fileLogger;
  late final DiagnosticsManager _diagnosticsManager;
  late final LspConfigurationManager _configManager;
  late final WorkspaceFoldersManager _workspaceFoldersManager;
  late final WatchedFilesManager _watchedFilesManager;
  late final WorkDoneProgressManager _progressManager;
  late final LspDialogHelper _dialogHelper;

  final _logger = Logger('ServerRunner');

  void _initManagers() {
    _clientLogging = ClientLoggingFeature();
    _fileLogger = FileLoggingFeature(logFile: File('.lsp_server.log'));
    _diagnosticsManager = DiagnosticsManager();
    _configManager = LspConfigurationManager();
    _workspaceFoldersManager = WorkspaceFoldersManager();
    _watchedFilesManager = WatchedFilesManager(_server);
    _progressManager = WorkDoneProgressManager();
    _dialogHelper = LspDialogHelper();

    // Register LspFeatures on the server so they get automated register/dispose lifecycle
    _server
      ..registerFeature(_clientLogging)
      ..registerFeature(_fileLogger)
      ..registerFeature(_diagnosticsManager)
      ..registerFeature(_configManager)
      ..registerFeature(_workspaceFoldersManager)
      ..registerFeature(_progressManager)
      ..registerFeature(_dialogHelper)
      ..registerFeature(_docService);
  }

  /// Registers all handlers and starts listening on stdio.
  Future<void> run() async {
    // Configure standard logger to print to stderr for debugging
    // (stdout is reserved for LSP JSON-RPC messages)
    Logger.root.level = .ALL;
    final stderrSubscription = Logger.root.onRecord.listen((record) {
      stderr.writeln(
        '[${record.level.name}] [${record.loggerName}] ${record.message}',
      );
    });

    try {
      _registerHandlers();
      await _server.listen();
    } finally {
      // Clean up resources immediately when connection ends
      await stderrSubscription.cancel();
    }
  }

  void _registerHandlers() {

    // Listen to document changes to publish diagnostics
    _docService.onDidChange.listen((doc) {
      _logger.info('Document changed: ${doc.uri}');
      unawaited(_publishDiagnostics(doc));
    });

    _docService.onDidClose.listen((doc) {
      _logger.info('Document closed: ${doc.uri}');
      _diagnosticsManager.clear(doc.uri);
    });

    _docService.onDidOpen.listen((doc) {
      _logger.info('Document opened: ${doc.uri}');
      unawaited(_publishDiagnostics(doc));
    });

    // Listen to configuration changes to recompute diagnostics
    _configManager.onChange.listen((_) {
      _logger.info(
        'Configuration changed, recomputing diagnostics for all documents...',
      );
      for (final doc in _docService.all) {
        unawaited(_publishDiagnostics(doc));
      }
    });

    // Listen to workspace folder changes
    _workspaceFoldersManager.onChange.listen((folders) {
      _logger.info(
        'Workspace folders changed. Current folders: '
        '${folders.map((f) => f.name).join(', ')}',
      );
    });

    // General
    _server.general.onInitialize((params, context) async {
      _logger.info('Received initialize request');

      // Set initial workspace folders in the manager
      _workspaceFoldersManager.setInitialFolders(params.workspaceFolders);

      // Register initialize params so WatchedFilesManager can resolve it later
      _server.connection.register(params);

      // Infer capabilities from registered handlers
      final inferred = _server.inferCapabilities(
        completionTriggerCharacters: ['.', ':', '_'],
      );

      // Customize capabilities with manual sync and semantic tokens
      final customized = inferred.copyWith(
        textDocumentSync: .textDocumentSyncOptions(
          const .new(
            change: .full,
            openClose: true,
          ),
        ),
        semanticTokensProvider: .semanticTokensOptions(
          const SemanticTokensOptions(
            legend: SemanticTokensLegend(
              tokenTypes: legendTypes,
              tokenModifiers: legendModifiers,
            ),
            full: .bool(true),
          ),
        ),
      );

      return InitializeResult(
        capabilities: customized,
        serverInfo: (name: 'lsp-test-server', version: '0.2.0'),
      );
    });

    _server.general.onInitialized((_, context) async {
      _logger.info('Received initialized notification');

      // Send a welcome dialog message to the user via LspDialogHelper
      _dialogHelper.showMessage(
        type: MessageType.info,
        message: 'Welcome to LSP Test Server powered by pro_lsp_sdk!',
      );

      // Register file watching dynamically if supported
      try {
        if (_watchedFilesManager.isSupported) {
          final registrationId = await _watchedFilesManager.register(
            watchers: [
              const FileSystemWatcher(
                globPattern: GlobPattern.pattern('**/*.txt'),
                kind: WatchKind(7),
              ),
            ],
          );
          _logger.info(
            'Dynamically registered file watcher with ID: $registrationId',
          );
        } else {
          _logger.warning(
            'Client does not support dynamic registration of watched files.',
          );
        }
      } on Object catch (e, st) {
        _logger.severe(
          'Failed to dynamically register watched files capability',
          e,
          st,
        );
      }
    });

    _server.general.onShutdown((context) async {
      _logger.info('Received shutdown request');
    });

    _server.general.onExit((context) async {
      _logger.info('Received exit notification');
    });

    // textDocument/hover
    _server.textDocument.onHover((params, context) async {
      _logger.info(
        'Hover request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      return _hoverService.getHover(params);
    });

    // textDocument/completion
    _server.textDocument.onCompletion((params, context) async {
      _logger.info('Completion request: ${params.textDocument.uri}');
      final doc = _docService.get(params.textDocument.uri);
      final items = _completionService.getCompletions(
        params,
        documentText: doc?.text,
      );

      return .completionItemList(items);
    });

    // textDocument/definition
    _server.textDocument.onDefinition((params, context) async {
      _logger.info(
        'Definition request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      // Start progress indicator using WorkDoneProgressManager
      final progress = await _progressManager.create(
        title: 'Finding definition',
        message: 'Searching...',
      );

      try {
        // Simulate a small delay to make the progress indicator visible
        await Future.delayed(const Duration(milliseconds: 150));

        final doc = _docService.get(params.textDocument.uri);
        if (doc == null) {
          return .nullValue();
        }

        final lines = doc.lines;
        if (params.position.line >= lines.length) {
          return .nullValue();
        }

        final line = lines[params.position.line];
        final word = _extractWordAtPosition(line, params.position.character);

        if (word == null || word.isEmpty) {
          return .nullValue();
        }

        progress.report(message: 'Analyzing symbol "$word"...', percentage: 50);

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

        progress.report(message: 'Done.', percentage: 100);

        if (locations.length == 1) {
          return DefinitionResult.definition(
            Definition.location(locations.first),
          );
        }
        return DefinitionResult.definition(Definition.locationList(locations));
      } finally {
        progress.end(message: 'Finished definition search.');
      }
    });

    // textDocument/references
    _server.textDocument.onReferences((params, context) async {
      _logger.info(
        'References request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      // Start progress indicator using WorkDoneProgressManager
      final progress = await _progressManager.create(
        title: 'Finding references',
        message: 'Searching...',
      );

      try {
        // Simulate a small delay to make the progress indicator visible
        await Future.delayed(const Duration(milliseconds: 150));

        final doc = _docService.get(params.textDocument.uri);
        if (doc == null) {
          return [];
        }

        final lines = doc.lines;
        if (params.position.line >= lines.length) {
          return [];
        }

        final line = lines[params.position.line];
        final word = _extractWordAtPosition(line, params.position.character);

        if (word == null || word.isEmpty) {
          return [];
        }

        progress.report(
          message: 'Finding references for "$word"...',
          percentage: 50,
        );

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

        progress.report(message: 'Done.', percentage: 100);
        return locations;
      } finally {
        progress.end(message: 'Finished references search.');
      }
    });

    // textDocument/documentSymbol
    _server.textDocument.onDocumentSymbol((params, context) async {
      _logger.info('DocumentSymbol request: ${params.textDocument.uri}');

      final doc = _docService.get(params.textDocument.uri);
      if (doc == null) {
        return .documentSymbolList([]);
      }

      final symbols = <DocumentSymbol>[];
      final lines = doc.lines;

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

    // workspace/symbol
    _server.workspace.onSymbol((params, context) async {
      _logger.info('WorkspaceSymbol request: query="${params.query}"');

      final allSymbols = <SymbolInformation>[];
      for (final doc in _docService.all) {
        final uri = doc.uri;
        final lines = doc.lines;

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

    // textDocument/semanticTokens/full
    _server.textDocument.onSemanticTokensFull((params, context) async {
      _logger.info('SemanticTokens request: ${params.textDocument.uri}');

      final doc = _docService.get(params.textDocument.uri);
      if (doc == null) {
        return null;
      }

      final builder = SemanticTokensBuilder(
        legendTypes: legendTypes,
        legendModifiers: legendModifiers,
      );

      final lines = doc.lines;
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];

        // 1. Highlight comments
        if (line.trim().startsWith('//')) {
          final startIdx = line.indexOf('//');
          builder.addNamed(
            line: i,
            char: startIdx,
            length: line.length - startIdx,
            type: 'comment',
          );
          continue; // skip other rules for comment lines
        }

        // 2. Highlight functions (patterns like "funcName(")
        final trimmed = line.trim();
        if (trimmed.contains('(') && trimmed.contains(')')) {
          final name = trimmed.split('(').first.trim();
          if (name.isNotEmpty && !_isComment(line)) {
            final startIdx = line.indexOf(name);
            builder.addNamed(
              line: i,
              char: startIdx,
              length: name.length,
              type: 'function',
              modifiers: ['declaration'],
            );
          }
        }

        // 3. Highlight keywords (e.g., `TODO` or `FIXME`)
        if (line.contains('TODO')) {
          final startIdx = line.indexOf('TODO');
          builder.addNamed(line: i, char: startIdx, length: 4, type: 'keyword');
        }
        if (line.contains('FIXME')) {
          final startIdx = line.indexOf('FIXME');
          builder.addNamed(line: i, char: startIdx, length: 5, type: 'keyword');
        }
      }

      return SemanticTokens(data: builder.build());
    });

    // Workspace file operations
    _server.workspace.onWillCreateFiles((params, context) async {
      _logger.info(
        'Files will be created: ${params.files.map((f) => f.uri).join(', ')}',
      );
      return const WorkspaceEdit();
    });

    _server.workspace.onWillRenameFiles((params, context) async {
      _logger.info(
        'Files will be renamed: '
        '${params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ')}',
      );
      return const WorkspaceEdit();
    });

    _server.workspace.onWillDeleteFiles((params, context) async {
      _logger.info(
        'Files will be deleted: ${params.files.map((f) => f.uri).join(', ')}',
      );
      return const WorkspaceEdit();
    });

    _server.workspace.onDidCreateFiles((params, context) async {
      _logger.info(
        'Files created: ${params.files.map((f) => f.uri).join(', ')}',
      );
    });

    _server.workspace.onDidRenameFiles((params, context) async {
      _logger.info(
        'Files renamed: '
        '${params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ')}',
      );
    });

    _server.workspace.onDidDeleteFiles((params, context) async {
      _logger.info(
        'Files deleted: ${params.files.map((f) => f.uri).join(', ')}',
      );
    });
  }

  Future<void> _publishDiagnostics(LspDocument doc) async {
    final diagnostics = <Diagnostic>[];
    final lines = doc.lines;

    // Read maxLineLength dynamically from configuration manager
    final maxLineLength =
        await _configManager.getSection<int>('lspTester.maxLineLength') ??
            120;

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
      if (line.length > maxLineLength) {
        diagnostics.add(
          Diagnostic(
            message:
                'Line is too long (${line.length} characters, '
                'limit is $maxLineLength)',
            range: Range(
              start: Position(line: i, character: maxLineLength),
              end: Position(line: i, character: line.length),
            ),
            severity: DiagnosticSeverity.information,
            code: const DiagnosticCode.string('long-line'),
            source: 'lsp-test-server',
          ),
        );
      }
    }

    _diagnosticsManager.publish(doc.uri, diagnostics);
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
}
