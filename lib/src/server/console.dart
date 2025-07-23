// See https://microsoft.github.io/language-server-protocol/specifications/lsp/3.18/specification/#messageType for levels and values
import 'connection.dart';

enum _MessageType {
  error(1),
  warn(2),
  info(3),
  log(4),
  debug(5);

  /// Creates a new [_MessageType] with the given numeric value.
  const _MessageType(this.value);

  /// The numeric value of the message type.
  final int value;
}

/// Ask the client to log a message in its output console or log system.
/// Interface for [window/logMessage](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.18/specification/#window_logMessage).
class Console {
  Console(Connection connection) : _connection = connection;

  final Connection _connection;

  /// Ask the client to log an error message.
  void error(String message) => _send(_MessageType.error.value, message);

  /// Ask the client to log a warning message.
  void warn(String message) => _send(_MessageType.warn.value, message);

  /// Ask the client to log an information message.
  void info(String message) => _send(_MessageType.info.value, message);

  /// Ask the client to log a message.
  void log(String message) => _send(_MessageType.log.value, message);

  /// Ask the client to log a debug message. Available since version 3.18.0 of
  /// the LSP specification.
  void debug(String message) => _send(_MessageType.debug.value, message);

  void _send(int type, String message) {
    try {
      _connection.sendNotification('window/logMessage', {
        'type': type,
        'message': message,
      });
    } on Object catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
