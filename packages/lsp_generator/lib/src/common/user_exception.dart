class UserException implements Exception {

  UserException(this.message, {this.reason, this.code});
  final String message;
  final String? reason;
  final int? code;

  @override
  String toString() {
    var result = 'UserException: $message';
    if (reason != null) {
      result += ' (Reason: $reason)';
    }
    return result;
  }
}
