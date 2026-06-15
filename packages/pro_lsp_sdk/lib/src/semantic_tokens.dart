/// Helper to construct the flat delta-encoded integer list required by the
/// LSP semantic tokens protocol.
final class SemanticTokensBuilder {
  /// Creates a builder.
  ///
  /// [legendTypes] represents the list of token types supported by the server.
  /// [legendModifiers] represents the list of token modifiers supported by the
  /// server.
  SemanticTokensBuilder({
    this.legendTypes = const [],
    this.legendModifiers = const [],
  });

  final List<String> legendTypes;
  final List<String> legendModifiers;
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
