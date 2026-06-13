/// A recoverable exception for CLI tools.
///
/// Used for expected runtime errors that are not bugs: invalid arguments,
/// network failures, parsing errors, etc.
///
/// Unlike [Exception] or [StateError], this is caught in `run` and results
/// in returning an exit code rather than crashing.
class CliException implements Exception {
  /// Creates an exception with the given [message].
  ///
  /// [reason] is an optional additional error description.
  /// [code] is the process exit code.
  CliException(this.message, {this.reason, this.code});

  /// A short description of the error.
  final String message;

  /// An optional additional error description.
  final String? reason;

  /// The process exit code.
  final int? code;

  @override
  String toString() =>
      'CliException: $message${reason != null ? ' (Reason: $reason)' : ''}';
}
