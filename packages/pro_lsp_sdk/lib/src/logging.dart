import 'dart:async';

import 'package:logging/logging.dart' as log;
import 'package:pro_lsp/pro_lsp.dart';

/// Adapts the standard Dart `package:logging` framework to forward log events
/// directly to the LSP client via `window/logMessage`.
final class LspLoggingAdapter {
  LspLoggingAdapter(this._server);

  final LspServer _server;
  StreamSubscription<log.LogRecord>? _subscription;

  /// Binds the logger adapter to the global logger stream or a specific logger.
  ///
  /// [logger] allows specifying a target Logger instance to listen to. Defaults
  ///  to `Logger.root`.[level] defines the minimum severity level to forward.
  /// Defaults to [log.Level.ALL].
  void bind({log.Logger? logger, log.Level level = .ALL}) {
    if (_subscription != null) {
      return;
    }

    final targetLogger = logger ?? log.Logger.root;
    _subscription = targetLogger.onRecord.listen((record) {
      if (record.level < level) {
        return;
      }

      // Avoid infinite logging loop from transport or connection loggers
      final nameLower = record.loggerName.toLowerCase();
      if (nameLower.contains('lsp.transport') ||
          nameLower.contains('connection') ||
          nameLower.contains('channel')) {
        return;
      }

      final lspType = _mapLevelToMessageType(record.level);
      final message = _formatMessage(record);

      _server.client.window.logMessage(
        LogMessageParams(
          type: lspType,
          message: message,
        ),
      );
    });
  }

  /// Unbinds this adapter from the logger stream.
  void unbind() {
    unawaited(_subscription?.cancel());
    _subscription = null;
  }

  /// Closes the adapter.
  void close() {
    unbind();
  }

  MessageType _mapLevelToMessageType(log.Level level) {
    if (level >= .SEVERE) {
      return MessageType.error;
    } else if (level >= .WARNING) {
      return MessageType.warning;
    } else if (level >= .INFO) {
      return MessageType.info;
    } else {
      return MessageType.log;
    }
  }

  String _formatMessage(log.LogRecord record) {
    final buffer = StringBuffer();
    if (record.loggerName.isNotEmpty) {
      buffer.write('[${record.loggerName}] ');
    }
    buffer.write(record.message);
    if (record.error != null) {
      buffer.write('\nError: ${record.error}');
    }
    if (record.stackTrace != null) {
      buffer.write('\nStack Trace:\n${record.stackTrace}');
    }
    
    return buffer.toString();
  }
}
