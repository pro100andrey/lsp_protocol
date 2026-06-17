import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';

/// Adapts the standard Dart `package:logging` framework to forward log events
/// directly to the LSP client via `window/logMessage`.
final class ClientLoggingFeature extends LspFeature {
  ClientLoggingFeature();

  Logger? logger;
  Level level = .ALL;
  StreamSubscription<LogRecord>? _subscription;

  @override
  void register(LspServer server) {
    if (_subscription != null) {
      return;
    }

    final targetLogger = logger ?? .root;
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

      server.client.window.logMessage(
        .new(type: lspType, message: message),
      );
    });
  }

  @override
  FutureOr<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  MessageType _mapLevelToMessageType(Level level) => switch (level) {
    >= .SEVERE => .error,
    >= .WARNING => .warning,
    >= .INFO => .info,
    _ => .log,
  };

  String _formatMessage(LogRecord record) {
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

/// Captures server logs and writes them to a local file.
final class FileLoggingFeature extends LspFeature {
  FileLoggingFeature({
    required this.logFile,
    this.logger,
    this.level = .ALL,
  });

  /// The local file where logs will be appended.
  final File logFile;

  /// Optional specific logger to listen to (defaults to root logger).
  final Logger? logger;

  /// Minimum severity level to log.
  final Level level;

  IOSink? _sink;
  StreamSubscription<LogRecord>? _subscription;

  @override
  void register(LspServer server) {
    _bind();
  }

  void _bind() {
    if (_subscription != null) {
      return;
    }

    try {
      // Ensure the parent directory exists
      logFile.parent.createSync(recursive: true);
      _sink = logFile.openWrite(mode: FileMode.writeOnlyAppend);
    } on Object catch (e) {
      // Fallback to writing error to stderr if opening the file fails
      stderr.writeln('Failed to open log file ${logFile.path}: $e');
      return;
    }

    final targetLogger = logger ?? .root;
    _subscription = targetLogger.onRecord.listen((record) {
      if (record.level < level) {
        return;
      }

      final time = DateTime.now().toIso8601String();
      final message = _formatMessage(record);
      _sink?.writeln(
        '[$time] [${record.level.name}] [${record.loggerName}] $message',
      );
    });
  }

  String _formatMessage(LogRecord record) {
    final buffer = StringBuffer()..write(record.message);
    if (record.error != null) {
      buffer.write('\nError: ${record.error}');
    }

    if (record.stackTrace != null) {
      buffer.write('\nStack Trace:\n${record.stackTrace}');
    }

    return buffer.toString();
  }

  @override
  FutureOr<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    await _sink?.flush();
    await _sink?.close();
    _sink = null;
  }
}
