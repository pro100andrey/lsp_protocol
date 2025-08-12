
extension StringExtension on String? {
  /// Converts a string to a valid Dart identifier.
  List<String> asDoc({int width = 80}) {
    final doc = _formatDocComment(this, width: width) ?? [];
    return doc;
  }
}

List<String>? _formatDocComment(String? input, {int width = 80}) {
  if (input == null || input.trim().isEmpty) {
    return null;
  }

  const prefix = '/// ';
  final maxContentLength = width - prefix.length;

  // Normalize newlines
  final normalized = input.replaceAll('\r\n', '\n').replaceAll('\r', '\n');

  // Split by paragraph blocks (empty lines)
  final paragraphs = normalized.split(RegExp(r'\n\s*\n'));

  final lines = <String>[];

  for (final raw in paragraphs) {
    final paragraph = raw.trim();

    if (paragraph.isEmpty) {
      lines.add('///');
      continue;
    }

    final singleLine = paragraph.replaceAll('\n', ' ');
    if ((prefix.length + singleLine.length) <= width) {
      lines.add('$prefix$singleLine');
      continue;
    }

    final words = paragraph.split(RegExp(r'\s+'));

    var line = StringBuffer();
    for (final word in words) {
      if ((line.length + word.length + 1) > maxContentLength) {
        lines.add('$prefix${line.toString().trimRight()}');
        line = StringBuffer()
          ..write(word)
          ..write(' ');
      } else {
        line
          ..write(word)
          ..write(' ');
      }
    }
    if (line.isNotEmpty) {
      lines.add('$prefix${line.toString().trimRight()}');
    }
  }

  return lines;
}
