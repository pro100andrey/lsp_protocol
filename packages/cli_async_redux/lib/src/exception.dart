/// Exception thrown by Redux actions.
///
/// Provides structured error handling with optional exit codes, error codes,
/// and descriptive messages suitable for CLI applications.
///
/// Named constructors map to standard exit codes based on common error
/// scenarios (user errors, system errors, network issues, etc.).
class ReduxException implements Exception {
  /// Creates a [ReduxException] with optional details.
  ///
  /// - [message]: User-facing error message
  /// - [reason]: Optional internal reason for debugging
  /// - [code]: Optional error code (e.g., HTTP status code)
  /// - [exitCode]: Optional exit code for CLI applications
  const ReduxException({this.message, this.reason, this.code, this.exitCode});

  /// Generic, unspecified error.
  ///
  /// Use this when no other code fits or for unexpected exceptions.
  /// Typically indicates a bug or unforeseen condition.
  ///
  /// Exit code: **EX_GENERAL = 1**
  ReduxException.generic({required this.message, this.reason, this.code})
    : exitCode = exGeneric;

  /// User aborted the operation.
  ///
  /// Use this when the user cancels an operation or declines a prompt.
  ///
  /// Exit code: **EX_USER_ABORTED = 2**
  ReduxException.userAborted({required this.message, this.reason, this.code})
    : exitCode = exUserAborted;

  /// Command line usage error.
  ///
  /// Use this when required CLI arguments are missing, invalid, or unsupported.
  /// Example: user did not provide mandatory flags or options.
  ///
  /// Exit code: **EX_USAGE = 64**
  ReduxException.usage({required this.message, this.reason, this.code})
    : exitCode = exUsage;

  /// Data format or type error.
  ///
  /// Use this when input data exists but is invalid, corrupted, or malformed.
  /// Example: JSON/YAML parsing failure, unexpected value type.
  ///
  /// Exit code: **EX_DATAERR = 65**
  ReduxException.data({required this.message, this.reason, this.code})
    : exitCode = exData;

  /// Input file missing or cannot be opened.
  ///
  /// Use this when a required file does not exist or is inaccessible.
  ///
  /// Exit code: **EX_NOINPUT = 66**
  ReduxException.noInput({required this.message, this.reason, this.code})
    : exitCode = exNoInput;

  /// Remote host not found or unreachable.
  ///
  /// Use this for DNS resolution errors, unreachable servers, or connection
  /// failures.
  ///
  /// Exit code: **EX_NOHOST = 68**
  ReduxException.noHost({required this.message, this.reason, this.code})
    : exitCode = exNoHost;

  /// Service or dependency unavailable.
  ///
  /// Use this when a remote API, database, or other dependency is down
  /// or temporarily not responding (e.g., HTTP 503, API outage).
  ///
  /// Exit code: **EX_UNAVAILABLE = 69**
  ReduxException.unavailable({required this.message, this.reason, this.code})
    : exitCode = exUnavailable;

  /// Internal software error.
  ///
  /// Use this for unexpected exceptions, logic errors, or internal bugs.
  ///
  /// Exit code: **EX_SOFTWARE = 70**
  ReduxException.software({required this.message, this.reason, this.code})
    : exitCode = exSoftware;

  /// I/O failure during read or write operation.
  ///
  /// Use this when reading/writing to disk, stdin/stdout, or network streams
  /// fails unexpectedly.
  ///
  /// Exit code: **EX_IOERR = 74**
  ReduxException.io({required this.message, this.reason, this.code})
    : exitCode = exIO;

  /// Temporary failure where retry may succeed.
  ///
  /// Use this for transient errors like network timeouts, rate limiting,
  /// or when a resource is temporarily locked.
  ///
  /// Exit code: **EX_TEMPFAIL = 75**
  ReduxException.temp({required this.message, this.reason, this.code})
    : exitCode = exTempFail;

  /// Permission denied or authentication failure.
  ///
  /// Use this when the user lacks necessary permissions or authentication
  /// fails.
  ///
  /// Exit code: **EX_NOPERM = 77**
  ReduxException.permission({required this.message, this.reason, this.code})
    : exitCode = exNoPerm;

  /// Configuration error.
  ///
  /// Use this when configuration files are missing, invalid, or contain
  /// unsupported options.
  ///
  /// Exit code: **EX_CONFIG = 78**
  ReduxException.config({required this.message, this.reason, this.code})
    : exitCode = exConfig;

  /// Returns a [ReduxException] corresponding to an HTTP status code.
  ///
  /// Maps HTTP responses to exit codes for CLI usage:
  /// - 400 → usage error (EX_USAGE)
  /// - 401, 403 → permission denied (EX_NOPERM)
  /// - 404 → service unavailable (EX_UNAVAILABLE)
  /// - 408, 429 → temporary failure (EX_TEMPFAIL)
  /// - 500–599 → service unavailable (EX_UNAVAILABLE)
  /// - otherwise → internal software error (EX_SOFTWARE)
  factory ReduxException.fromHttpStatus(
    int statusCode, {
    String? message,
    String? details,
  }) {
    message ??= 'HTTP request failed with status $statusCode';

    if (statusCode >= 500 && statusCode < 600) {
      return ReduxException.unavailable(message: message, reason: details);
    }

    switch (statusCode) {
      case 400: // Bad Request - invalid request syntax
        return ReduxException.usage(message: message, reason: details);
      case 401: // Unauthorized - authentication required
      case 403: // Forbidden - access denied
        return ReduxException.permission(message: message, reason: details);
      case 404: // Not Found - resource unavailable
        return ReduxException.unavailable(message: message, reason: details);
      case 408: // Request Timeout - temporary network issue
      case 429: // Too Many Requests - rate limiting
        return ReduxException.temp(message: message, reason: details);
      default: // Unhandled status codes
        return ReduxException.software(message: message, reason: details);
    }
  }

  /// Generic error
  static const int exGeneric = 1;

  /// User aborted the operation.
  static const int exUserAborted = 2;

  /// CLI usage error.
  static const int exUsage = 64;

  /// Invalid data format/type.
  static const int exData = 65;

  /// Input file missing or unreadable.
  static const int exNoInput = 66;

  /// Host not found or unreachable.
  static const int exNoHost = 68;

  /// Service unavailable (e.g., 503, timeout).
  static const int exUnavailable = 69;

  /// Internal software error.
  static const int exSoftware = 70;

  /// I/O failure during read/write operations.
  static const int exIO = 74;

  /// Temporary failure (retry might succeed).
  static const int exTempFail = 75;

  /// Permission denied (e.g., authentication failure).
  static const int exNoPerm = 77;

  /// Configuration file missing or invalid.
  static const int exConfig = 78;

  /// Some message shown to the user.
  final String? message;

  /// An optional reason for the error (e.g. for debugging).
  final String? reason;

  /// An optional exit code (e.g. for CLI apps).
  final int? exitCode;

  /// An optional error code (e.g. HTTP status code).
  final int? code;

  /// Returns a new instance with some fields replaced by new values.
  ///
  /// Allows updating individual fields while preserving others.
  /// Note: [code] field cannot be updated via this method.
  ReduxException copyWith({String? message, int? exitCode, String? reason}) =>
      ReduxException(
        message: message ?? this.message,
        exitCode: exitCode ?? this.exitCode,
        reason: reason ?? this.reason,
        code: code,
      );

  @override
  String toString() {
    final fields = {
      'message': ?message,
      'exitCode': ?exitCode,
      'reason': ?reason,
    }.entries.map((e) => ' - ${e.key}: ${e.value}');

    return 'ReduxException\n${fields.join('\n')}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReduxException &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          reason == other.reason &&
          exitCode == other.exitCode;

  @override
  int get hashCode => Object.hash(runtimeType, message, reason, exitCode);
}
