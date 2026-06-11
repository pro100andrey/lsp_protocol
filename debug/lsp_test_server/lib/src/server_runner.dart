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

      return const InitializeResult(
        capabilities: ServerCapabilities(
          positionEncoding: PositionEncodingKind.uTF16,
          hoverProvider: ServerCapabilitiesHoverProvider(true),
          completionProvider: CompletionOptions(
            triggerCharacters: ['.', ':'],
          ),
          textDocumentSync: ServerCapabilitiesTextDocumentSync(
            TextDocumentSyncOptions(
              change: TextDocumentSyncKind.full,
              openClose: true,
            ),
          ),
          workspace: (
            workspaceFolders: WorkspaceFoldersServerCapabilities(
              supported: true,
              changeNotifications:
                  WorkspaceFoldersServerCapabilitiesChangeNotifications(
                    true,
                  ),
            ),
            fileOperations: FileOperationOptions(
              willCreate: FileOperationRegistrationOptions(
                filters: [
                  FileOperationFilter(
                    pattern: FileOperationPattern(
                      glob: '**/*.txt',
                      matches: FileOperationPatternKind.file,
                    ),
                  ),
                ],
              ),
              willRename: FileOperationRegistrationOptions(
                filters: [
                  FileOperationFilter(
                    pattern: FileOperationPattern(
                      glob: '**/*.txt',
                      matches: FileOperationPatternKind.file,
                    ),
                  ),
                ],
              ),
              willDelete: FileOperationRegistrationOptions(
                filters: [
                  FileOperationFilter(
                    pattern: FileOperationPattern(
                      glob: '**/*.txt',
                      matches: FileOperationPatternKind.file,
                    ),
                  ),
                ],
              ),
              didCreate: FileOperationRegistrationOptions(
                filters: [
                  FileOperationFilter(
                    pattern: FileOperationPattern(
                      glob: '**/*.txt',
                      matches: FileOperationPatternKind.file,
                    ),
                  ),
                ],
              ),
              didRename: FileOperationRegistrationOptions(
                filters: [
                  FileOperationFilter(
                    pattern: FileOperationPattern(
                      glob: '**/*.txt',
                      matches: FileOperationPatternKind.file,
                    ),
                  ),
                ],
              ),
              didDelete: FileOperationRegistrationOptions(
                filters: [
                  FileOperationFilter(
                    pattern: FileOperationPattern(
                      glob: '**/*.txt',
                      matches: FileOperationPatternKind.file,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        serverInfo: (name: 'lsp-test-server', version: '0.1.0'),
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
    // Text Document Sync
    // -------------------------------------------------------------------------

    _server.textDocument.onDidOpen((params, context) async {
      logInfo('Document opened: ${params.textDocument.uri}');
      _docService.open(params.textDocument.uri, params.textDocument.text);
    });

    _server.textDocument.onDidChange((params, context) async {
      logInfo('Document changed: ${params.textDocument.uri}');

      final lastChange = params.contentChanges.lastOrNull;
      final text =
          lastChange?.asText?.text ?? lastChange?.asRangeRangeLengthText?.text;

      if (text != null) {
        _docService.update(params.textDocument.uri, text);
      }
    });

    _server.textDocument.onDidClose((params, context) async {
      logInfo('Document closed: ${params.textDocument.uri}');
      _docService.close(params.textDocument.uri);
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
      return _completionService.getCompletions(params);
    });

    // -------------------------------------------------------------------------
    // Workspace file operations
    // -------------------------------------------------------------------------

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
  }

  void logInfo(String message) {
    _server.client.window.logMessage(
      LogMessageParams(
        type: MessageType.log,
        message: '[ServerRunner] $message',
      ),
    );

    stdout.writeln('[ServerRunner] $message');
  }
}
