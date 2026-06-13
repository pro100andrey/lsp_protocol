import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Represents a work done progress session initiated by the server.
final class LspProgress {
  LspProgress(this._connection, this._token);

  final LspConnection _connection;
  final ProgressToken _token;

  var _isStarted = false;
  var _isCompleted = false;

  /// Whether the progress session has started.
  bool get isStarted => _isStarted;

  /// Whether the progress session has ended.
  bool get isCompleted => _isCompleted;

  /// Sends the initial begin notification to the client.
  Future<void> begin({
    required String title,
    String? message,
    int? percentage,
    bool? cancellable,
  }) async {
    if (_isCompleted) {
      throw StateError(
        'Cannot begin a progress session that has already ended.',
      );
    }
    if (_isStarted) {
      throw StateError('Progress session has already started.');
    }
    _isStarted = true;

    final beginValue = WorkDoneProgressBegin(
      title: title,
      message: message,
      percentage: percentage,
      cancellable: cancellable,
    );
    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(beginValue),
      ).toJson(),
    );
  }

  /// Sends a report update notification to the client.
  void report({
    String? message,
    int? percentage,
    bool? cancellable,
  }) {
    if (!_isStarted) {
      throw StateError('Cannot report progress before calling begin().');
    }
    if (_isCompleted) {
      throw StateError(
        'Cannot report progress on a session that has already ended.',
      );
    }

    final reportValue = WorkDoneProgressReport(
      message: message,
      percentage: percentage,
      cancellable: cancellable,
    );
    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(reportValue),
      ).toJson(),
    );
  }

  /// Sends the final end notification to the client.
  void end({String? message}) {
    if (!_isStarted) {
      throw StateError('Cannot end progress before calling begin().');
    }
    if (_isCompleted) {
      return;
    }
    _isCompleted = true;

    final endValue = WorkDoneProgressEnd(
      message: message,
    );
    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(endValue),
      ).toJson(),
    );
  }

  /// Cancels the progress session, guaranteeing it is ended.
  void cancel() {
    if (!_isStarted || _isCompleted) {
      return;
    }
    end(message: 'Cancelled');
  }
}

/// Manages LSP work done progress sessions.
final class WorkDoneProgressManager {
  WorkDoneProgressManager(this._connection);

  final LspConnection _connection;
  var _nextProgressId = 0;

  /// Creates a new progress session, requests the client to create a token,
  /// and returns an [LspProgress] instance.
  Future<LspProgress> create({
    required String title,
    String? message,
    int? percentage,
    bool? cancellable,
  }) async {
    final token = ProgressToken.string('progress-${_nextProgressId++}');

    await _connection.sendRequest(
      RequestMethod.create,
      WorkDoneProgressCreateParams(token: token).toJson(),
    );

    final progress = LspProgress(_connection, token);
    await progress.begin(
      title: title,
      message: message,
      percentage: percentage,
      cancellable: cancellable,
    );
    return progress;
  }
}
