import 'dart:async';

import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import '../lsp_support.dart';

import 'shared.dart';

/// Handles textDocument/references requests.
final class ReferencesFeature extends LspFeature {
  ReferencesFeature({
    required TextDocumentManager docService,
    required WorkDoneProgressManager progressManager,
  }) : _docService = docService,
       _progressManager = progressManager;

  final TextDocumentManager _docService;
  final WorkDoneProgressManager _progressManager;
  final _logger = Logger('ReferencesFeature');

  @override
  void register(LspServer server) {
    server.textDocument.onReferences((params, context) async {
      _logger.info(
        '${context.prefix} References request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      // Start progress indicator using WorkDoneProgressManager
      final progress = await _progressManager.create(
        title: 'Finding references',
        message: 'Searching...',
      );

      try {
        // Simulate a small delay to make the progress indicator visible
        await Future.delayed(const Duration(milliseconds: 150));

        final doc = _docService.get(params.textDocument.uri);
        if (doc == null) {
          return [];
        }

        final lines = doc.lines;
        if (params.position.line >= lines.length) {
          return [];
        }

        final line = lines[params.position.line];
        final word = extractWordAtPosition(
          line,
          params.position.character,
        );

        if (word == null || word.isEmpty) {
          return [];
        }

        progress.report(
          message: 'Finding references for "$word"...',
          percentage: 50,
        );

        final locations = <Location>[];
        for (var i = 0; i < lines.length; i++) {
          final lineText = lines[i];
          var startIndex = 0;
          while (true) {
            final index = lineText.indexOf(word, startIndex);
            if (index == -1) {
              break;
            }
            locations.add(
              .new(
                uri: params.textDocument.uri,
                range: .new(
                  start: .new(line: i, character: index),
                  end: .new(line: i, character: index + word.length),
                ),
              ),
            );
            startIndex = index + 1;
          }
        }

        progress.report(message: 'Done.', percentage: 100);
        return locations;
      } finally {
        progress.end(message: 'Finished references search.');
      }
    });
  }
}
