import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_kit/pro_lsp_kit.dart';

import 'shared.dart';

/// Handles textDocument/documentSymbol and workspace/symbol requests.
final class SymbolsFeature extends LspFeature {
  SymbolsFeature({
    required TextDocumentManager docService,
  }) : _docService = docService;

  final TextDocumentManager _docService;
  final _logger = Logger('SymbolsFeature');

  @override
  void register(LspServer server) {
    // textDocument/documentSymbol
    server.textDocument.onDocumentSymbol((params, context) async {
      _logger.info(
        '${context.prefix} DocumentSymbol request: ${params.textDocument.uri}',
      );

      final doc = _docService.get(params.textDocument.uri);
      if (doc == null) {
        return .documentSymbolList([]);
      }

      final symbols = <DocumentSymbol>[];
      final lines = doc.lines;

      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        final trimmed = line.trim();

        // Detect function-like patterns
        if (trimmed.contains('(') &&
            trimmed.contains(')') &&
            (trimmed.contains('=') || trimmed.contains('=>'))) {
          final name = trimmed.split('(').first.trim();
          if (name.isNotEmpty && !isComment(line)) {
            symbols.add(
              .new(
                name: name,
                detail: trimmed,
                kind: .function,
                range: .new(
                  start: .new(line: i, character: 0),
                  end: .new(line: i, character: line.length),
                ),
                selectionRange: .new(
                  start: .new(
                    line: i,
                    character: trimmed.indexOf(name),
                  ),
                  end: .new(
                    line: i,
                    character: trimmed.indexOf(name) + name.length,
                  ),
                ),
              ),
            );
          }
        }
      }

      return .documentSymbolList(symbols);
    });

    // workspace/symbol
    server.workspace.onSymbol((params, context) async {
      _logger.info(
        '${context.prefix} WorkspaceSymbol request: query="${params.query}"',
      );

      final allSymbols = <SymbolInformation>[];
      for (final doc in _docService.all) {
        final uri = doc.uri;
        final lines = doc.lines;

        for (var i = 0; i < lines.length; i++) {
          final line = lines[i];
          final trimmed = line.trim();

          if (trimmed.contains('(') &&
              trimmed.contains(')') &&
              (trimmed.contains('=') || trimmed.contains('=>'))) {
            final name = trimmed.split('(').first.trim();
            if (name.isNotEmpty &&
                !isComment(line) &&
                name.toLowerCase().contains(params.query.toLowerCase())) {
              allSymbols.add(
                .new(
                  name: name,
                  kind: .function,
                  location: .new(
                    uri: uri,
                    range: .new(
                      start: .new(line: i, character: 0),
                      end: .new(line: i, character: line.length),
                    ),
                  ),
                ),
              );
            }
          }
        }
      }

      return .symbolInformationList(allSymbols);
    });
  }
}
