extension StringExtensions on String {
  // Uppercases the first letter of the string.
  String upperFirstLetter() =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);

  /// Lowercases the first letter of the string.
  String lowerFirstLetter() =>
      isEmpty ? this : this[0].toLowerCase() + substring(1);

  /// Removes the first letter of the string if it exists.
  String removeFirstLetter(String letter) {
    if (isEmpty || this[0] != letter) {
      return this;
    }

    return substring(1);
  }

  /// Splits the string into a list of words based on camel case.
  List<String> splitCamelCase() {
    final regex = RegExp('[A-Z][a-z]*|[A-Z]+(?![a-z])');
    return regex.allMatches(this).map((m) => m.group(0)!).toList();
  }
}
