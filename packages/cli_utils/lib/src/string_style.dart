import 'package:io/ansi.dart' as ansi;

/// Regular expression to match ANSI escape codes.
final _ansiRegex = RegExp(r'\x1B\[[0-9;]*[A-Za-z]');

/// Extension that adds styling capabilities to String objects using ANSI codes.
///
/// Example usage:
/// ```dart
/// print('Hello World'.white.bold.underlined);
/// print('Error message'.red.bold);
/// ```
extension StringStyleExt on String {
  // Apply red foreground color.
  String get red => ansi.red.wrap(this)!;

  /// Apply light red foreground color.
  String get lightRed => ansi.lightRed.wrap(this)!;

  /// Apply green foreground color.
  String get green => ansi.green.wrap(this)!;

  /// Apply light green foreground color.
  String get lightGreen => ansi.lightGreen.wrap(this)!;

  /// Apply blue foreground color.
  String get blue => ansi.blue.wrap(this)!;

  /// Apply light blue foreground color.
  String get lightBlue => ansi.lightBlue.wrap(this)!;

  /// Apply yellow foreground color.
  String get yellow => ansi.yellow.wrap(this)!;

  /// Apply light yellow foreground color.
  String get lightYellow => ansi.lightYellow.wrap(this)!;

  /// Apply cyan foreground color.
  String get cyan => ansi.cyan.wrap(this)!;

  /// Apply light cyan foreground color.
  String get lightCyan => ansi.lightCyan.wrap(this)!;

  /// Apply magenta foreground color.
  String get magenta => ansi.magenta.wrap(this)!;

  /// Apply light magenta foreground color.
  String get lightMagenta => ansi.lightMagenta.wrap(this)!;

  /// Apply black foreground color.
  String get black => ansi.black.wrap(this)!;

  /// Apply white foreground color.
  String get white => ansi.lightGray.wrap(this)!;

  /// Apply gray foreground color.
  String get gray => ansi.darkGray.wrap(this)!;

  /// Apply light gray foreground color.
  String get lightGray => ansi.lightGray.wrap(this)!;

  // Background colors with "on" prefix
  /// Apply red background color.
  String get onRed => ansi.backgroundRed.wrap(this)!;

  /// Apply light red background color.
  String get onLightRed => ansi.backgroundLightRed.wrap(this)!;

  /// Apply green background color.
  String get onGreen => ansi.backgroundGreen.wrap(this)!;

  /// Apply light green background color.
  String get onLightGreen => ansi.backgroundLightGreen.wrap(this)!;

  /// Apply blue background color.
  String get onBlue => ansi.backgroundBlue.wrap(this)!;

  /// Apply light blue background color.
  String get onLightBlue => ansi.backgroundLightBlue.wrap(this)!;

  /// Apply yellow background color.
  String get onYellow => ansi.backgroundYellow.wrap(this)!;

  /// Apply light yellow background color.
  String get onLightYellow => ansi.backgroundLightYellow.wrap(this)!;

  /// Apply cyan background color.
  String get onCyan => ansi.backgroundCyan.wrap(this)!;

  /// Apply light cyan background color.
  String get onLightCyan => ansi.backgroundLightCyan.wrap(this)!;

  /// Apply magenta background color.
  String get onMagenta => ansi.backgroundMagenta.wrap(this)!;

  /// Apply light magenta background color.
  String get onLightMagenta => ansi.backgroundLightMagenta.wrap(this)!;

  /// Apply black background color.
  String get onBlack => ansi.backgroundBlack.wrap(this)!;

  /// Apply white background color.
  String get onWhite => ansi.backgroundLightGray.wrap(this)!;

  // Direct style methods
  /// Apply bold text style.
  String get bold => ansi.styleBold.wrap(this)!;

  /// Apply dim (faint) text style.
  String get dim => ansi.styleDim.wrap(this)!;

  /// Apply italic text style.
  String get italic => ansi.styleItalic.wrap(this)!;

  /// Apply underlined text style.
  String get underlined => ansi.styleUnderlined.wrap(this)!;

  /// Apply crossed out text style.
  String get crossedOut => ansi.styleCrossedOut.wrap(this)!;

  /// Apply blinking text style.
  String get blink => ansi.styleBlink.wrap(this)!;

  /// Remove all ANSI styles from the string.
  String get plain => replaceAll(_ansiRegex, '');

  /// Check if the string has no ANSI styles applied.
  bool get isPlain => !_ansiRegex.hasMatch(this);
}
