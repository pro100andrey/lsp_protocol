extension StringExtensions on String {
  // Utility functions (assuming they are in 'utils.dart' or can be placed here)
  String upperFirstLetter() => this[0].toUpperCase() + substring(1);

  String lowerFirstLetter() => this[0].toLowerCase() + substring(1);
}
