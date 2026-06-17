/// Helper to construct the flat delta-encoded integer list required by the
/// LSP semantic tokens protocol.
final class SemanticTokensBuilder {
  /// Creates a builder.
  ///
  /// [legendTypes] represents the list of token types supported by the server.
  /// [legendModifiers] represents the list of token modifiers supported by the
  /// server.
  /// [sourceText], when supplied, enables the offset-based [addAtOffset] /
  /// [addNamedAtOffset] methods — convenient for servers whose analyzer reports
  /// token positions as absolute character offsets rather than line/character.
  SemanticTokensBuilder({
    this.legendTypes = const [],
    this.legendModifiers = const [],
    String? sourceText,
  }) : _lineStarts = sourceText == null ? null : _computeLineStarts(sourceText);

  final List<String> legendTypes;
  final List<String> legendModifiers;
  final List<int>? _lineStarts;
  final List<_AbsoluteToken> _tokens = [];

  /// Adds a semantic token at absolute line and character coordinates.
  ///
  /// [line] is 0-indexed line number.
  /// [char] is 0-indexed character offset within that line.
  /// [length] is length of the token in characters.
  /// [tokenTypeIndex] is index of the token type in the client's type array.
  /// [tokenModifiersBitmask] is bitmask of token modifiers.
  void add({
    required int line,
    required int char,
    required int length,
    required int tokenTypeIndex,
    int tokenModifiersBitmask = 0,
  }) {
    _tokens.add(
      _AbsoluteToken(
        line: line,
        char: char,
        length: length,
        type: tokenTypeIndex,
        modifiers: tokenModifiersBitmask,
      ),
    );
  }

  /// Adds a semantic token by its type name and modifier names.
  ///
  /// Maps the [type] name and [modifiers] names to their respective indices
  /// based on the legend arrays provided in the constructor.
  /// Throws [ArgumentError] if the type or any modifier is not found in the
  /// legend.
  void addNamed({
    required int line,
    required int char,
    required int length,
    required String type,
    List<String> modifiers = const [],
  }) {
    final typeIndex = legendTypes.indexOf(type);
    if (typeIndex == -1) {
      throw ArgumentError(
        'Token type "$type" is not defined in legendTypes: $legendTypes',
      );
    }

    var modifiersBitmask = 0;
    for (final mod in modifiers) {
      final modIndex = legendModifiers.indexOf(mod);
      if (modIndex == -1) {
        throw ArgumentError(
          'Token modifier "$mod" is not defined in '
          'legendModifiers: $legendModifiers',
        );
      }
      modifiersBitmask |= 1 << modIndex;
    }

    add(
      line: line,
      char: char,
      length: length,
      tokenTypeIndex: typeIndex,
      tokenModifiersBitmask: modifiersBitmask,
    );
  }

  /// Adds a semantic token located at an absolute character [offset] in the
  /// source.
  ///
  /// Requires the builder to have been constructed with `sourceText`; otherwise
  /// throws [StateError]. [length] is the token length in characters.
  void addAtOffset({
    required int offset,
    required int length,
    required int tokenTypeIndex,
    int tokenModifiersBitmask = 0,
  }) {
    final (line, char) = _positionAt(offset);
    add(
      line: line,
      char: char,
      length: length,
      tokenTypeIndex: tokenTypeIndex,
      tokenModifiersBitmask: tokenModifiersBitmask,
    );
  }

  /// Adds a semantic token at an absolute character [offset], resolving the
  /// [type] and [modifiers] names against the legend.
  ///
  /// Requires the builder to have been constructed with `sourceText`. Throws
  /// [ArgumentError] if the type or any modifier is not found in the legend.
  void addNamedAtOffset({
    required int offset,
    required int length,
    required String type,
    List<String> modifiers = const [],
  }) {
    final (line, char) = _positionAt(offset);
    addNamed(
      line: line,
      char: char,
      length: length,
      type: type,
      modifiers: modifiers,
    );
  }

  /// Resolves an absolute character [offset] to a 0-based (line, character)
  /// pair via binary search over the cached line starts.
  (int, int) _positionAt(int offset) {
    final starts =
        _lineStarts ??
        (throw StateError(
          'SemanticTokensBuilder was created without sourceText; use '
          'add()/addNamed() with explicit line/character, or pass sourceText '
          'to enable offset-based tokens.',
        ));

    var lo = 0;
    var hi = starts.length - 1;
    while (lo < hi) {
      final mid = (lo + hi + 1) >> 1;
      if (starts[mid] <= offset) {
        lo = mid;
      } else {
        hi = mid - 1;
      }
    }
    return (lo, offset - starts[lo]);
  }

  /// Builds the delta-encoded list of integers ready to be returned to the
  /// client.
  List<int> build() {
    // Sort tokens: first by line, then by start character.
    _tokens.sort((a, b) {
      if (a.line != b.line) {
        return a.line.compareTo(b.line);
      }

      return a.char.compareTo(b.char);
    });

    final data = <int>[];
    var lastLine = 0;
    var lastChar = 0;

    for (final token in _tokens) {
      final deltaLine = token.line - lastLine;
      final deltaChar = deltaLine == 0 ? token.char - lastChar : token.char;

      data
        ..add(deltaLine)
        ..add(deltaChar)
        ..add(token.length)
        ..add(token.type)
        ..add(token.modifiers);

      lastLine = token.line;
      lastChar = token.char;
    }

    return data;
  }
}

final class _AbsoluteToken {
  const _AbsoluteToken({
    required this.line,
    required this.char,
    required this.length,
    required this.type,
    required this.modifiers,
  });

  final int line;
  final int char;
  final int length;
  final int type;
  final int modifiers;
}

/// Computes the character offset at which each line begins. Treats `\n`, `\r\n`
/// and a lone `\r` as line breaks, matching LSP line numbering.
List<int> _computeLineStarts(String text) {
  final starts = [0];
  for (var i = 0; i < text.length; i++) {
    final unit = text.codeUnitAt(i);
    if (unit == 0x0A) {
      // \n
      starts.add(i + 1);
    } else if (unit == 0x0D) {
      // \r or \r\n
      if (i + 1 < text.length && text.codeUnitAt(i + 1) == 0x0A) {
        i++;
      }
      starts.add(i + 1);
    }
  }
  return starts;
}
