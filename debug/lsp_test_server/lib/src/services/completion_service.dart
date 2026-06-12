import 'package:pro_lsp/pro_lsp.dart';

class CompletionService {
  List<CompletionItem> getCompletions(CompletionParams params) => [
    CompletionItem(
      label: 'hello',
      kind: CompletionItemKind.keyword,
      detail: 'LSP test completion',
      documentation: CompletionItemDocumentation.markupContent(
        const MarkupContent(
          kind: MarkupKind.plainText,
          value: 'A test completion item from lsp_test_server',
        ),
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
