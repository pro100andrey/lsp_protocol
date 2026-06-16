import 'package:pro_lsp/pro_lsp.dart';

/// Extension to format the request/notification ID for clean logs.
extension LspRequestLogExtension on LspRequest {
  String get prefix => id != null ? '[id:$id]' : '[notification]';
}

/// Returns whether the character at [index] in [line] is inside a comment.
bool isCommented(String line, int index) {
  final before = line.substring(0, index);
  return before.contains('//') || before.contains('/*') || before.contains('#');
}

/// Extracts a word from [line] at the specified [character] position.
String? extractWordAtPosition(String line, int character) {
  if (character > line.length) {
    return null;
  }

  var start = character;
  var end = character;

  // Expand left
  while (start > 0 && isWordCharacter(line[start - 1])) {
    start--;
  }

  // Expand right
  while (end < line.length && isWordCharacter(line[end])) {
    end++;
  }

  if (start == character &&
      (character >= line.length || !isWordCharacter(line[character]))) {
    return null;
  }

  return line.substring(start, end);
}

/// Checks if [char] is a valid word character.
bool isWordCharacter(String char) {
  if (char.isEmpty) {
    return false;
  }
  final code = char.codeUnitAt(0);
  return (code >= 97 && code <= 122) || // a-z
      (code >= 65 && code <= 90) || // A-Z
      (code >= 48 && code <= 57) || // 0-9
      code == 95; // _
}

/// Checks if the entire [line] is a comment.
bool isComment(String line) {
  final trimmed = line.trim();
  return trimmed.startsWith('//') ||
      trimmed.startsWith('#') ||
      trimmed.startsWith('/*') ||
      trimmed.startsWith('*');
}
