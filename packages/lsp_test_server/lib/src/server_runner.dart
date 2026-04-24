import 'dart:io';

import 'package:dar/dar.dart';
import 'package:dar/log.dart';
import 'package:lsp_server/lsp_server.dart';
import 'package:lsp_specification/lsp_specification.dart';
import 'package:stream_channel/stream_channel.dart';

import 'redux/actions/completion_action.dart';
import 'redux/actions/hover_action.dart';
import 'redux/actions/initialize_action.dart';
import 'redux/actions/text_sync_actions.dart';
import 'redux/app_state.dart';

/// Wires [Store] and [LspServer]: registers all LSP handlers as Redux actions.
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
      _store = Store<AppState>(
        initialState: AppState.initial(),
        actionObservers: [Log()],
        globalErrorObserver: (store) => GlobalErrorObserverForDevelopment(),
      );

  /// Creates a server backed by an arbitrary byte [channel] (e.g. a TCP
  /// socket).
  ServerRunner.fromChannel(StreamChannel<List<int>> channel)
    : _server = LspServer.fromChannel(channel),
      _store = Store<AppState>(
        initialState: AppState.initial(),
        actionObservers: [Log()],
        globalErrorObserver: (store) => GlobalErrorObserverForDevelopment(),
      );

  final LspServer _server;
  final Store<AppState> _store;

  /// Registers all handlers and starts listening on stdio.
  Future<void> run() async {
    _store.setProp(_server);
    _registerHandlers();
    await _server.listen();
  }

  void _registerHandlers() {
    // -------------------------------------------------------------------------
    // General
    // -------------------------------------------------------------------------
    _server.general.onInitialize((params) async {
      logInfo('Received initialize request');

      final action = InitializeAction(params);
      await _store.dispatchAndWait(action);

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
            workspaceFolders: .new(
              supported: true,
              changeNotifications: true
            ),
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

      await _store.dispatchAndWait(
        DidOpenAction(
          uri: params.textDocument.uri,
          text: params.textDocument.text,
        ),
      );
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
        await _store.dispatchAndWait(
          DidChangeAction(uri: params.textDocument.uri, text: text),
        );
      }
    });

    _server.textDocument.onDidClose((params) async {
      logInfo('Document closed: ${params.textDocument.uri}');

      await _store.dispatchAndWait(
        DidCloseAction(uri: params.textDocument.uri),
      );
    });

    // -------------------------------------------------------------------------
    // textDocument/hover
    // -------------------------------------------------------------------------

    _server.textDocument.onHover((params) async {
      logInfo(
        'Hover request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      final action = HoverAction(params);
      await _store.dispatchAndWait(action);
      return action.result;
    });

    // -------------------------------------------------------------------------
    // textDocument/completion
    // -------------------------------------------------------------------------

    _server.textDocument.onCompletion((params) async {
      logInfo('Completion request: ${params.textDocument.uri}');

      final action = CompletionAction(params);
      await _store.dispatchAndWait(action);

      return action.result;
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
