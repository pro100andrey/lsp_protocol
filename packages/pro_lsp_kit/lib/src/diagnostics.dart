import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Manages publishing of document diagnostics with built-in debouncing.
final class DiagnosticsManager extends LspFeature {
  DiagnosticsManager([this._server]);

  LspServer? _server;

  final _pendingDiagnostics = <String, List<Diagnostic>>{};
  final _timers = <String, Timer>{};

  /// The duration to wait before publishing changes for a document.
  // ignore: omit_obvious_property_types
  Duration debounceDuration = const Duration(milliseconds: 250);

  @override
  void register(LspServer server) {
    _server = server;
  }

  /// Schedules diagnostics to be published to the client.
  ///
  /// Subsequent calls for the same [uri] before the [debounceDuration]
  /// elapsed will restart the timer.
  void publish(String uri, List<Diagnostic> diagnostics) {
    final server = _server;
    if (server == null) {
      throw StateError('DiagnosticsManager is not registered on any server.');
    }

    _timers[uri]?.cancel();
    _pendingDiagnostics[uri] = diagnostics;

    _timers[uri] = Timer(debounceDuration, () {
      _timers.remove(uri);
      final list = _pendingDiagnostics.remove(uri);
      if (list != null) {
        server.client.textDocument.publishDiagnostics(
          .new(uri: uri, diagnostics: list),
        );
      }
    });
  }

  /// Clears diagnostics for a document immediately (no debouncing).
  void clear(String uri) {
    final server = _server;
    if (server == null) {
      throw StateError('DiagnosticsManager is not registered on any server.');
    }
    _timers[uri]?.cancel();
    _timers.remove(uri);
    _pendingDiagnostics.remove(uri);

    server.client.textDocument.publishDiagnostics(
      .new(uri: uri, diagnostics: const []),
    );
  }

  @override
  FutureOr<void> dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _pendingDiagnostics.clear();
  }
}
