import 'dart:async';

import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_kit/pro_lsp_kit.dart';

import 'shared.dart';

/// Handles textDocument/definition requests.
final class DefinitionFeature extends LspFeature {
  DefinitionFeature({
    required TextDocumentManager docService,
    required WorkDoneProgressManager progressManager,
  }) : _docService = docService,
       _progressManager = progressManager;

  final TextDocumentManager _docService;
  final WorkDoneProgressManager _progressManager;
  final _logger = Logger('DefinitionFeature');

  @override
  void register(LspServer server) {
    server.textDocument.onDefinition((params, context) async {
      _logger.info(
        '${context.prefix} Definition request: ${params.textDocument.uri}, '
        'position ${params.position.line}:${params.position.character}',
      );

      // Start progress indicator using WorkDoneProgressManager
      final progress = await _progressManager.create(
        title: 'Finding definition',
        message: 'Searching...',
      );

      try {
        // Simulate a small delay to make the progress indicator visible
        await Future.delayed(const Duration(milliseconds: 150));

        final doc = _docService.get(params.textDocument.uri);
        if (doc == null) {
          return .nullValue();
        }

        final lines = doc.lines;
        if (params.position.line >= lines.length) {
          return .nullValue();
        }

        final line = lines[params.position.line];
        final word = extractWordAtPosition(
          line,
          params.position.character,
        );

        if (word == null || word.isEmpty) {
          return .nullValue();
        }

        progress.report(message: 'Analyzing symbol "$word"...', percentage: 50);

        // Find all occurrences of the word in the document
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

        if (locations.length == 1) {
          return .definition(
            .location(locations.first),
          );
        }
        return .definition(.locationList(locations));
      } finally {
        progress.end(message: 'Finished definition search.');
      }
    });
  }
}
