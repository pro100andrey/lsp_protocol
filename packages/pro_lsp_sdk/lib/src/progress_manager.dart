import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Represents a work done progress session initiated by the server.
final class LspProgress {
  LspProgress(this._connection, this._token);

  final LspConnection _connection;
  final ProgressToken _token;

  /// Sends the initial begin notification to the client.
  Future<void> begin({
    required String title,
    String? message,
    int? percentage,
    bool? cancellable,
  }) async {
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
        value: LSPAny.fromJson(beginValue.toJson()),
      ).toJson(),
    );
  }

  /// Sends a report update notification to the client.
  void report({
    String? message,
    int? percentage,
    bool? cancellable,
  }) {
    final reportValue = WorkDoneProgressReport(
      message: message,
      percentage: percentage,
      cancellable: cancellable,
    );
    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(reportValue.toJson()),
      ).toJson(),
    );
  }

  /// Sends the final end notification to the client.
  void end({String? message}) {
    final endValue = WorkDoneProgressEnd(
      message: message,
    );
    _connection.sendNotification(
      NotificationMethod.progress,
      ProgressParams(
        token: _token,
        value: LSPAny.fromJson(endValue.toJson()),
      ).toJson(),
    );
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
