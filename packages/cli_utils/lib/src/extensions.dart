import 'string_style.dart';

/// Extension methods for common string operations in CLI context.
extension StringCliExtensions on String {
  /// Truncates the string to the specified length and adds ellipsis if needed.
  ///
  /// Example:
  /// ```dart
  /// 'Very long string'.truncate(10); // 'Very lon...'
  /// ```
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (maxLength <= 20) {
      return this;
    }

    final maxVisibleLength = maxLength - ellipsis.length;
    final len = length;
    var visibleLength = 0;
    var truncateIndex = length;
    var inAnsiCode = false;
    var hasAnsi = false;

    for (var i = 0; i < len; i++) {
      final unit = codeUnitAt(i);

      if (unit == 0x1B) {
        // ESC
        inAnsiCode = true;
        hasAnsi = true;
        continue;
      }

      if (inAnsiCode) {
        if (unit == 0x6D) {
          // 'm'
          inAnsiCode = false;
        }
        continue;
      }

      if (visibleLength >= maxVisibleLength) {
        truncateIndex = i;
        break;
      }

      visibleLength++;
    }

    if (visibleLength <= maxVisibleLength && truncateIndex == len) {
      return this;
    }

    final truncated = substring(0, truncateIndex);
    return '$truncated$ellipsis${hasAnsi ? '\x1B[0m' : ''}';
  }

  /// Wraps the string to the specified [width], respecting word boundaries
  /// and ignoring the length of ANSI escape codes.
  ///
  /// This ensures that the visible width of each line does not exceed the
  /// limit.
  String wrap(int width) {
    int calculateVisibleLength(String text) {
      var visibleLength = 0;
      var inAnsiCode = false;

      for (var i = 0; i < text.length; i++) {
        final unit = text.codeUnitAt(i);

        if (unit == 0x1B) {
          // ESC (Start of ANSI code)
          inAnsiCode = true;
          continue;
        }

        if (inAnsiCode) {
          if (unit == 0x6D) {
            // 'm' (End of standard SGR code)
            inAnsiCode = false;
          }
          continue;
        }

        visibleLength++;
      }
      return visibleLength;
    }

    if (calculateVisibleLength(this) <= width) {
      return this;
    }

    final buffer = StringBuffer();
    var currentLine = '';

    // Split the string by spaces. We assume ANSI codes, if present, are
    // entirely contained within these "words" or are standalone.
    final words = split(' ');

    for (final word in words) {
      final wordVisibleLength = calculateVisibleLength(word);
      final currentLineVisibleLength = calculateVisibleLength(currentLine);

      if (currentLine.isEmpty) {
        // Start of the line
        currentLine = word;
      } else if ((currentLineVisibleLength + wordVisibleLength + 1) <= width) {
        // Current line + space + word fits within the visible width
        currentLine += ' $word';
      } else {
        // It doesn't fit, move current line to buffer and start new line with
        //the word
        buffer.writeln(currentLine);
        currentLine = word;
      }
    }

    if (currentLine.isNotEmpty) {
      buffer.write(currentLine);
    }

    return buffer.toString();
  }

  /// Creates a box around the string using ASCII characters.
  ///
  /// Example:
  /// ```dart
  /// 'Hello'.box();
  /// // ┌───────┐
  /// // │ Hello │
  /// // └───────┘
  /// ```
  String box({int padding = 1, BoxBorderStyle style = .unicode}) {
    final lines = split('\n');
    final maxLength = lines
        .map((l) => l.plain.length)
        .reduce((a, b) => a > b ? a : b);

    final width = maxLength + (padding * 2);

    final buffer = StringBuffer()
      ..writeln('${style.tl}${style.h * width}${style.tr}');

    for (final line in lines) {
      final paddedLine = line.padRight(maxLength);
      buffer.writeln(
        '${style.v}'
        '${' ' * padding}$paddedLine${' ' * padding}'
        '${style.v}',
      );
    }

    buffer.write('${style.bl}${style.h * width}${style.br}');
    return buffer.toString();
  }
}

enum BoxBorderStyle { ascii, unicode }

extension BoxBorderStyleExt on BoxBorderStyle {
  String get tl {
    switch (this) {
      case .ascii:
        return '+';
      case .unicode:
        return '┌';
    }
  }

  String get tr {
    switch (this) {
      case .ascii:
        return '+';
      case .unicode:
        return '┐';
    }
  }

  String get bl {
    switch (this) {
      case .ascii:
        return '+';
      case .unicode:
        return '└';
    }
  }

  String get br {
    switch (this) {
      case .ascii:
        return '+';
      case .unicode:
        return '┘';
    }
  }

  String get h {
    switch (this) {
      case .ascii:
        return '-';
      case .unicode:
        return '─';
    }
  }

  String get v {
    switch (this) {
      case .ascii:
        return '|';
      case .unicode:
        return '│';
    }
  }
}
