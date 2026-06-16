import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';

import '../services/hover_service.dart';
import 'shared.dart';

/// Handles textDocument/hover requests.
final class HoverFeature extends LspFeature {
  HoverFeature({
    required HoverService hoverService,
  }) : _hoverService = hoverService;

  final HoverService _hoverService;
  final _logger = Logger('HoverFeature');

  @override
  void register(LspServer server) {
    server.textDocument.onHover((params, context) async {
      _logger.info(
        '${context.prefix} Hover request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      return _hoverService.getHover(params);
    });
  }
}
