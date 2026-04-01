// See https://microsoft.github.io/language-server-protocol/specifications/lsp/3.18/specification/#messageType for levels and values
import 'dart:io';

import '../generated/connection.dart';
import '../generated/models.dart';

/// Ask the client to log a message in its output console or log system.
/// Interface for [window/logMessage](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.18/specification/#window_logMessage).
class Console {
  Console(LspConnection connection) : _connection = connection;

  final LspConnection _connection;

  /// Ask the client to log an error message.
  void error(String message) => _send(MessageType.error, message);

  /// Ask the client to log a warning message.
  void warn(String message) => _send(MessageType.warning, message);

  /// Ask the client to log an information message.
  void info(String message) => _send(MessageType.info, message);

  /// Ask the client to log a message.
  void log(String message) => _send(MessageType.log, message);

  /// Ask the client to log a debug message. Available since version 3.18.0 of
  /// the LSP specification.
  void debug(String message) => _send(MessageType.debug, message);

  void _send(MessageType type, String message) {
    try {
      _connection.sendWindowLogMessageNotification(
        LogMessageParams(type: type, message: message),
      );
    } on Object catch (e) {
      stderr.writeln('[lsp] Failed to send log message: $e');
    }
  }
}
