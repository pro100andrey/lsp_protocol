import 'package:lsp_specification/lsp_specification.dart';

class CompletionService {
  List<CompletionItem> getCompletions(CompletionParams params) => [
    const CompletionItem(
      label: 'hello',
      kind: .keyword,
      detail: 'LSP test completion',
      documentation: .markupContent(
        value: .new(
          kind: .plainText,
          value: 'A test completion item from lsp_test_server',
        ),
      ),
    ),
    const CompletionItem(
      label: 'world',
      kind: .text,
      detail: 'LSP test completion',
    ),
    const CompletionItem(
      label: 'lsp_test_server',
      kind: .module,
      detail: 'This server package',
    ),
  ];
}
