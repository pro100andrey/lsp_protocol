import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Manages publishing of document diagnostics with built-in debouncing.
final class DiagnosticsManager {
  DiagnosticsManager(
    this._server, {
    this.debounceDuration = const Duration(milliseconds: 250),
  });

  final LspServer _server;

  final Map<String, List<Diagnostic>> _pendingDiagnostics = {};
  final Map<String, Timer> _timers = {};

  /// The duration to wait before publishing changes for a document.
  Duration debounceDuration;

  /// Schedules diagnostics to be published to the client.
  ///
  /// Subsequent calls for the same [uri] before the [debounceDuration]
  /// elapsed will restart the timer.
  void publish(String uri, List<Diagnostic> diagnostics) {
    _timers[uri]?.cancel();
    _pendingDiagnostics[uri] = diagnostics;

    _timers[uri] = Timer(debounceDuration, () {
      _timers.remove(uri);
      final list = _pendingDiagnostics.remove(uri);
      if (list != null) {
        _server.client.textDocument.publishDiagnostics(
          PublishDiagnosticsParams(
            uri: uri,
            diagnostics: list,
          ),
        );
      }
    });
  }

  /// Clears diagnostics for a document immediately (no debouncing).
  void clear(String uri) {
    _timers[uri]?.cancel();
    _timers.remove(uri);
    _pendingDiagnostics.remove(uri);

    _server.client.textDocument.publishDiagnostics(
      PublishDiagnosticsParams(
        uri: uri,
        diagnostics: const [],
      ),
    );
  }

  /// Closes all active timers.
  void close() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _pendingDiagnostics.clear();
  }
}
