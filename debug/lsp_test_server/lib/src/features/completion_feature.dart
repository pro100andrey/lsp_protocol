import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';

import '../services/completion_service.dart';
import 'shared.dart';

/// Handles textDocument/completion requests.
final class CompletionFeature extends LspFeature {
  CompletionFeature({
    required TextDocumentManager docService,
    required CompletionService completionService,
  }) : _docService = docService,
       _completionService = completionService;

  final TextDocumentManager _docService;
  final CompletionService _completionService;
  final _logger = Logger('CompletionFeature');

  @override
  void register(LspServer server) {
    server.textDocument.onCompletion((params, context) async {
      _logger.info(
        '${context.prefix} Completion request: ${params.textDocument.uri}',
      );
      final doc = _docService.get(params.textDocument.uri);
      final items = _completionService.getCompletions(
        params,
        documentText: doc?.text,
      );

      return .completionItemList(items);
    });
  }
}
