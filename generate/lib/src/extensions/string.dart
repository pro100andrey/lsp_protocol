extension StringExtensions on String {
  // Utility functions (assuming they are in 'utils.dart' or can be placed here)
  String upperFirstLetter() =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);

  String lowerFirstLetter() =>
      isEmpty ? this : this[0].toLowerCase() + substring(1);

  List<String> splitCamelCase() {
    final regex = RegExp('[A-Z][a-z]*|[A-Z]+(?![a-z])');
    return regex.allMatches(this).map((m) => m.group(0)!).toList();
  }
}
