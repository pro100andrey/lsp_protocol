import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';

import 'shared.dart';

/// Handles textDocument/hover requests.
final class HoverFeature extends LspFeature {
  HoverFeature({
    required TextDocumentManager docService,
  }) : _docService = docService;

  final TextDocumentManager _docService;
  final _logger = Logger('HoverFeature');

  @override
  void register(LspServer server) {
    server.textDocument.onHover((params, context) async {
      _logger.info(
        '${context.prefix} Hover request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      return _getHover(params);
    });
  }

  Hover _getHover(HoverParams params) {
    final doc = _docService.get(params.textDocument.uri);
    String? word;
    if (doc != null && params.position.line < doc.lines.length) {
      final line = doc.lines[params.position.line];
      word = extractWordAtPosition(line, params.position.character);
    }

    final filename = params.textDocument.uri.split('/').last;
    final cleanWord = word?.trim();

    String customDoc;
    if (cleanWord == 'TODO') {
      customDoc =
          '⚠️ **TODO Task Marker**\n\n'
          'Indicates an outstanding task that needs to be implemented.\n\n'
          '```dart\n'
          '// TODO: Implement this method\n'
          '```';
    } else if (cleanWord == 'FIXME') {
      customDoc =
          '🚨 **FIXME Bug Marker**\n\n'
          'Indicates a known bug or issue that must be fixed.\n\n'
          '```dart\n'
          '// FIXME: Fix the null pointer exception here\n'
          '```';
    } else if (const {
      'class',
      'void',
      'final',
      'const',
      'import',
      'var',
      'await',
      'async',
      'late',
      'required',
    }.contains(cleanWord)) {
      customDoc =
          '🔑 **Dart Keyword**\n\n'
          'The word `$cleanWord` is a reserved built-in keyword in Dart.';
    } else if (cleanWord != null && cleanWord.isNotEmpty) {
      customDoc =
          '📝 **Symbol Identifier: `$cleanWord`**\n\n'
          'This is a local identifier or token in the document.\n\n'
          '*Tip: Use F12 (Go to Definition) to find all matching '
          'occurrences in this file.*';
    } else {
      customDoc =
          'Empty position or whitespace.\n\n'
          'Hover over any word or token to view specialized documentation.';
    }

    return .new(
      contents: .markupContent(
        .new(
          kind: .markdown,
          value:
              '### 💡 LSP Symbol Hover\n\n'
              '**File:** `$filename`  \n'
              '**Position:** Line `${params.position.line + 1}`, '
              'Col `${params.position.character + 1}`  \n'
              '${cleanWord != null ? '**Target Word:** `$cleanWord`  \n' : ''}'
              '\n'
              '---\n\n'
              '$customDoc\n\n'
              '---\n'
              '*Powered by `pro_lsp_sdk`*',
        ),
      ),
    );
  }
}
