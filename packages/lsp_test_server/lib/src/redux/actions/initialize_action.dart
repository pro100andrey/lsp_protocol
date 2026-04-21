import 'package:lsp_specification/lsp_specification.dart';

import '../common/base_action.dart';

/// Handles `initialize` — returns server capabilities and marks state as initialized.
final class InitializeAction extends BaseAction {
  InitializeAction(this.params);

  final InitializeParams params;

  @override
  AppState reduce() => state.copyWith(initialized: true);

  InitializeResult get result => const InitializeResult(
    capabilities: ServerCapabilities(
      hoverProvider: true,
      completionProvider: CompletionOptions(triggerCharacters: ['.', ':']),
      textDocumentSync: TextDocumentSyncKind.full,
    ),
    serverInfo: (name: 'lsp-test-server', version: '0.1.0'),
  );
}
