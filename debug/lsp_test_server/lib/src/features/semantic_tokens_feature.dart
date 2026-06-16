import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';

import 'shared.dart';

/// Handles textDocument/semanticTokens/full requests.
final class SemanticTokensFeature extends LspFeature {
  SemanticTokensFeature({
    required TextDocumentManager docService,
  }) : _docService = docService;

  final TextDocumentManager _docService;
  final _logger = Logger('SemanticTokensFeature');

  static const legendTypes = ['comment', 'function', 'variable', 'keyword'];
  static const legendModifiers = ['declaration', 'documentation'];

  @override
  void register(LspServer server) {
    server.textDocument.onSemanticTokensFull((params, context) async {
      _logger.info(
        '${context.prefix} SemanticTokens request: ${params.textDocument.uri}',
      );

      final doc = _docService.get(params.textDocument.uri);
      if (doc == null) {
        return null;
      }

      final builder = SemanticTokensBuilder(
        legendTypes: legendTypes,
        legendModifiers: legendModifiers,
      );

      final lines = doc.lines;
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];

        // 1. Highlight comments
        if (line.trim().startsWith('//')) {
          final startIdx = line.indexOf('//');
          builder.addNamed(
            line: i,
            char: startIdx,
            length: line.length - startIdx,
            type: 'comment',
          );
          continue; // skip other rules for comment lines
        }

        // 2. Highlight functions (patterns like "funcName(")
        final trimmed = line.trim();
        if (trimmed.contains('(') && trimmed.contains(')')) {
          final name = trimmed.split('(').first.trim();
          if (name.isNotEmpty && !isComment(line)) {
            final startIdx = line.indexOf(name);
            builder.addNamed(
              line: i,
              char: startIdx,
              length: name.length,
              type: 'function',
              modifiers: ['declaration'],
            );
          }
        }

        // 3. Highlight keywords (e.g., `TODO` or `FIXME`)
        if (line.contains('TODO')) {
          final startIdx = line.indexOf('TODO');
          builder.addNamed(line: i, char: startIdx, length: 4, type: 'keyword');
        }
        if (line.contains('FIXME')) {
          final startIdx = line.indexOf('FIXME');
          builder.addNamed(line: i, char: startIdx, length: 5, type: 'keyword');
        }
      }

      return .new(data: builder.build());
    });
  }
}
