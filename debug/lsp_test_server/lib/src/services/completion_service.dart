import 'package:pro_lsp/pro_lsp.dart';

class CompletionService {
  List<CompletionItem> getCompletions(
    CompletionParams params, {
    String? documentText,
  }) {
    final completions = <CompletionItem>[];

    if (documentText != null && documentText.isNotEmpty) {
      final words = _extractWords(documentText);
      final uniqueWords = words.toSet().toList();

      for (final word in uniqueWords) {
        if (word.length < 2) {
          continue;
        }

        completions.add(
          CompletionItem(
            label: word,
            kind: CompletionItemKind.text,
            detail: 'Word from document',
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
