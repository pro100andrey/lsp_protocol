import 'package:lsp_specification/lsp_specification.dart';

import '../common/base_action.dart';

/// Handles `textDocument/completion` — returns a fixed completion list.
final class CompletionAction extends BaseAction {
  CompletionAction(this.params);

  final CompletionParams params;

  @override
  AppState? reduce() => null; // completion is read-only, no state change

  List<CompletionItem> get result => [
    const CompletionItem(
      label: 'hello',
      kind: CompletionItemKind.keyword,
      detail: 'LSP test completion',
      documentation: MarkupContent(
        kind: MarkupKind.plainText,
        value: 'A test completion item from lsp_test_server',
      ),
    ),
    const CompletionItem(
      label: 'world',
      kind: CompletionItemKind.text,
      detail: 'LSP test completion',
    ),
    const CompletionItem(
      label: 'lsp_test_server',
      kind: CompletionItemKind.module,
      detail: 'This server package',
    ),
  ];
}
