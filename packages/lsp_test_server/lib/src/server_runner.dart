import 'dart:io';

import 'package:lsp_server/lsp_server.dart';
import 'package:lsp_specification/lsp_specification.dart';
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
    _server.general.onInitialize((params) async {
      logInfo('Received initialize request');

      return const .new(
        capabilities: .new(
          positionEncoding: 'utf-16',
          hoverProvider: true,
          completionProvider: .new(triggerCharacters: ['.', ':']),
          textDocumentSync: TextDocumentSyncOptions(
            change: .full,
            openClose: true,
          ),
          workspace: (
            workspaceFolders: .new(supported: true, changeNotifications: true),
            fileOperations: .new(
              willCreate: .new(
                filters: [
                  .new(
                    pattern: .new(glob: '**/*.txt', matches: .file),
                  ),
                ],
              ),
              willRename: .new(
                filters: [
                  .new(
                    pattern: .new(glob: '**/*.txt', matches: .file),
                  ),
                ],
              ),
              willDelete: .new(
                filters: [
                  .new(
                    pattern: .new(glob: '**/*.txt', matches: .file),
                  ),
                ],
              ),
              didCreate: .new(
                filters: [
                  .new(
                    pattern: .new(glob: '**/*.txt', matches: .file),
                  ),
                ],
              ),
              didRename: .new(
                filters: [
                  .new(
                    pattern: .new(glob: '**/*.txt', matches: .file),
                  ),
                ],
              ),
              didDelete: .new(
                filters: [
                  .new(
                    pattern: .new(glob: '**/*.txt', matches: .file),
                  ),
                ],
              ),
            ),
          ),
        ),
        serverInfo: (name: 'lsp-test-server', version: '0.1.0'),
      );
    });

    _server.general.onInitialized((_) async {
      logInfo('Received initialized notification');
    });

    _server.general.onShutdown(() async {
      logInfo('Received shutdown request');
    });

    _server.general.onExit(() async {
      logInfo('Received exit notification');
    });

    // -------------------------------------------------------------------------
    // Text Document Sync
    // -------------------------------------------------------------------------

    _server.textDocument.onDidOpen((params) async {
      logInfo('Document opened: ${params.textDocument.uri}');
      _docService.open(params.textDocument.uri, params.textDocument.text);
    });

    _server.textDocument.onDidChange((params) async {
      logInfo('Document changed: ${params.textDocument.uri}');

      final text = switch (params.contentChanges.lastOrNull) {
        TextDocumentContentChangeEvent$Text(:final value) => value.text,
        TextDocumentContentChangeEvent$RangeRangeLengthText(:final value) =>
          value.text,
        null => null,
      };

      if (text != null) {
        _docService.update(params.textDocument.uri, text);
      }
    });

    _server.textDocument.onDidClose((params) async {
      logInfo('Document closed: ${params.textDocument.uri}');
      _docService.close(params.textDocument.uri);
    });

    // -------------------------------------------------------------------------
    // textDocument/hover
    // -------------------------------------------------------------------------

    _server.textDocument.onHover((params) async {
      logInfo(
        'Hover request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );
      return _hoverService.getHover(params);
    });

    // -------------------------------------------------------------------------
    // textDocument/completion
    // -------------------------------------------------------------------------

    _server.textDocument.onCompletion((params) async {
      logInfo('Completion request: ${params.textDocument.uri}');
      return _completionService.getCompletions(params);
    });

    // -------------------------------------------------------------------------
    // Workspace file operations
    // -------------------------------------------------------------------------

    _server.workspace.onDidCreateFiles((params) async {
      logInfo(
        'Files created: ${params.files.map((f) => f.uri).join(', ')}',
      );
    });

    _server.workspace.onDidRenameFiles((params) async {
      logInfo(
        'Files renamed: '
        '${params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ')}',
      );
    });
  }

  void logInfo(String message) {
    _server.client.window.logMessage(
      .new(type: .log, message: '[ServerRunner] $message'),
    );

    stdout.writeln('[ServerRunner] $message');
  }
}
