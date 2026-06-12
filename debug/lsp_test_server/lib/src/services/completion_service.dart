import 'package:pro_lsp/pro_lsp.dart';

class CompletionService {
  List<CompletionItem> getCompletions(CompletionParams params) => [
    .new(
      label: 'hello',
      kind: .keyword,
      detail: 'LSP test completion',
      documentation: .markupContent(
        const .new(
          kind: .plainText,
          value: 'A test completion item from lsp_test_server',
        ),
      ),
    ),
    const .new(
      label: 'world',
      kind: .text,
      detail: 'LSP test completion',
    ),
    const .new(
      label: 'lsp_test_server',
      kind: .module,
      detail: 'This server package',
    ),
  ];
}
