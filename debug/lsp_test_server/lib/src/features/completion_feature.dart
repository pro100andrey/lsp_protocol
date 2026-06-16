import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_sdk/pro_lsp_sdk.dart';

import 'shared.dart';

/// Handles textDocument/completion requests.
final class CompletionFeature extends LspFeature {
  CompletionFeature({
    required TextDocumentManager docService,
  }) : _docService = docService;

  final TextDocumentManager _docService;
  final _logger = Logger('CompletionFeature');

  @override
  void register(LspServer server) {
    server.textDocument.onCompletion((params, context) async {
      _logger.info(
        '${context.prefix} Completion request: ${params.textDocument.uri}',
      );
      final doc = _docService.get(params.textDocument.uri);
      final items = _getCompletions(
        params,
        documentText: doc?.text,
      );

      return .completionItemList(items);
    });
  }

  List<CompletionItem> _getCompletions(
    CompletionParams params, {
    String? documentText,
  }) {
    // 1. Start with high-quality preset completions and snippets for demo
    final completions = <CompletionItem>[
      // Snippet: Create LSP Server
      .new(
        label: 'lsp_server_create',
        kind: .snippet,
        insertText:
            'final server = LspServer();\n'
            'server.registerFeature(\${1:feature});\n'
            'await server.listen();',
        insertTextFormat: .snippet,
        detail: 'Create LspServer instance',
        documentation: .markupContent(
          const .new(
            kind: .markdown,
            value:
                '### Create LSP Server\n\n'
                'Inserts the standard boilerplate for creating and starting '
                'a new `LspServer` instance.\n\n'
                '```dart\n'
                'final server = LspServer();\n'
                'server.registerFeature(myFeature);\n'
                'await server.listen();\n'
                '```',
          ),
        ),
      ),
      // Snippet: LspFeature class template
      .new(
        label: 'lsp_feature_class',
        kind: .snippet,
        insertText:
            'class \${1:MyFeature} extends LspFeature {\n'
            '  @override\n'
            '  void register(LspServer server) {\n'
            '    \${2:// Register handlers here}\n'
            '  }\n'
            '}',
        insertTextFormat: .snippet,
        detail: 'LspFeature class template',
        documentation: .markupContent(
          const .new(
            kind: .markdown,
            value:
                '### Custom LSP Feature\n\n'
                'Creates a template subclass extending `LspFeature` with '
                'the `register` method overridden.\n\n'
                '```dart\n'
                'class MyFeature extends LspFeature {\n'
                '  @override\n'
                '  void register(LspServer server) {\n'
                '    // logic\n'
                '  }\n'
                '}\n'
                '```',
          ),
        ),
      ),
      // Linter Markers
      const .new(
        label: 'TODO',
        kind: .keyword,
        detail: 'Linter Task Marker',
        documentation: .string(
          'Adds a linter warning for an outstanding task to be implemented.',
        ),
      ),
      const CompletionItem(
        label: 'FIXME',
        kind: .keyword,
        detail: 'Linter Bug Marker',
        documentation: .string(
          'Adds a linter error for a known bug that needs to be fixed.',
        ),
      ),
      // Standard Dart types
      for (final type in [
        'String',
        'int',
        'double',
        'bool',
        'List',
        'Map',
        'Set',
        'Future',
        'Stream',
      ])
        .new(
          label: type,
          kind: .class$,
          detail: 'Dart Built-in Class',
          documentation: .string(
            'Refers to the built-in Dart class `$type`.',
          ),
        ),
    ];

    // 2. Extract words from the current document to offer context completions
    if (documentText != null && documentText.isNotEmpty) {
      final words = _extractWords(documentText);
      final uniqueWords = words.toSet().toList(growable: false);

      for (final word in uniqueWords) {
        // Skip short words or words already covered by our presets
        if (word.length < 2 ||
            word == 'TODO' ||
            word == 'FIXME' ||
            completions.any((item) => item.label == word)) {
          continue;
        }

        completions.add(
          .new(
            label: word,
            kind: .text,
            detail: 'Word from document',
            documentation: const .string(
              'A textual token found in this document.',
            ),
          ),
        );
      }
    }

    return completions;
  }

  Set<String> _extractWords(String text) {
    final words = <String>{};
    final regex = RegExp('[a-zA-Z_][a-zA-Z0-9_]*');
    final matches = regex.allMatches(text);

    for (final match in matches) {
      words.add(match.group(0)!);
    }

    return words;
  }
}
