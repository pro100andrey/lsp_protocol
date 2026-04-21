import 'package:dar/dar.dart';
import 'package:lsp_server/lsp_server.dart';
import 'package:lsp_specification/lsp_specification.dart';

import 'redux/actions/completion_action.dart';
import 'redux/actions/hover_action.dart';
import 'redux/actions/initialize_action.dart';
import 'redux/actions/text_sync_actions.dart';
import 'redux/app_state.dart';

/// Wires [Store] and [LspServer]: registers all LSP handlers as Redux actions.
///
/// Usage:
/// ```dart
/// final runner = ServerRunner();
/// await runner.run();
/// ```
final class ServerRunner {
  ServerRunner()
    : _server = LspServer(),
      _store = Store<AppState>(
        initialState: AppState.initial(),
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
      final action = InitializeAction(params);
      await _store.dispatchAndWait(action);
      return action.result;
    });

    _server.general.onInitialized((_) async {});

    _server.general.onShutdown(() async {});

    _server.general.onExit(() async {});

    // -------------------------------------------------------------------------
    // Text Document Sync
    // -------------------------------------------------------------------------

    _server.textDocument.onDidOpen((params) async {
      await _store.dispatchAndWait(
        DidOpenAction(
          uri: params.textDocument.uri,
          text: params.textDocument.text,
        ),
      );
    });

    _server.textDocument.onDidChange((params) async {
      // TextDocumentContentChangeEvent is a union: $Text (full) or
      // $RangeRangeLengthText (incremental). We only declared fullSync so we
      // always expect $Text here.
      final text = params.contentChanges.lastOrNull?.map(
        rangeRangeLengthText: (e) => e.value.text,
        text: (e) => e.value.text,
      );
      if (text != null) {
        await _store.dispatchAndWait(
          DidChangeAction(uri: params.textDocument.uri, text: text),
        );
      }
    });

    _server.textDocument.onDidClose((params) async {
      await _store.dispatchAndWait(
        DidCloseAction(uri: params.textDocument.uri),
      );
    });

    // -------------------------------------------------------------------------
    // textDocument/hover
    // -------------------------------------------------------------------------

    _server.textDocument.onHover((params) async {
      final action = HoverAction(params);
      await _store.dispatchAndWait(action);
      return action.result;
    });

    // -------------------------------------------------------------------------
    // textDocument/completion
    // -------------------------------------------------------------------------

    _server.textDocument.onCompletion((params) async {
      final action = CompletionAction(params);
      await _store.dispatchAndWait(action);
      return action.result;
    });
  }
}
