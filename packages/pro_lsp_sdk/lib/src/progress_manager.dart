import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Represents a work done progress session initiated by the server.
final class LspProgress {
  LspProgress(this._connection, this._token, this._onEnd);

  final LspConnection _connection;
  final ProgressToken _token;
  final void Function() _onEnd;

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

    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(
          WorkDoneProgressBegin(
            title: title,
            message: message,
            percentage: percentage,
            cancellable: cancellable,
          ),
        ),
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

    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(
          WorkDoneProgressReport(
            message: message,
            percentage: percentage,
            cancellable: cancellable,
          ),
        ),
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
    _onEnd();

    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(
          WorkDoneProgressEnd(message: message),
        ),
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
final class WorkDoneProgressManager extends LspFeature {
  WorkDoneProgressManager([LspConnection? connection])
    : _connection = connection;

  LspConnection? _connection;
  var _nextProgressId = 0;
  final Set<LspProgress> _progresses = {};

  @override
  void register(LspServer server) {
    _connection = server.connection;
  }

  /// Creates a new progress session, requests the client to create a token,
  /// and returns an [LspProgress] instance.
  Future<LspProgress> create({
    required String title,
    String? message,
    int? percentage,
    bool? cancellable,
  }) async {
    final connection = _connection;
    if (connection == null) {
      throw StateError(
        'WorkDoneProgressManager is not registered on any server.',
      );
    }

    final token = ProgressToken.string('progress-${_nextProgressId++}');

    await connection.sendRequest(
      RequestMethod.create,
      WorkDoneProgressCreateParams(token: token).toJson(),
    );

    late final LspProgress progress;
    progress = LspProgress(
      connection,
      token,
      () => _progresses.remove(progress),
    );

    _progresses.add(progress);

    await progress.begin(
      title: title,
      message: message,
      percentage: percentage,
      cancellable: cancellable,
    );

    return progress;
  }

  /// Cancels all active progress sessions.
  void cancelAll() {
    final toCancel = _progresses.toList(growable: false);
    for (final progress in toCancel) {
      progress.cancel();
    }
  }

  /// Returns the number of active progress sessions.
  int get activeCount => _progresses.length;

  @override
  FutureOr<void> dispose() {
    cancelAll();
    _connection = null;
  }
}
