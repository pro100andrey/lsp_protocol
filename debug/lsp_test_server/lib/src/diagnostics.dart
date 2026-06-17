import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

import 'feature_base.dart';

/// Manages publishing of document diagnostics with built-in debouncing and
/// redundant-publish suppression.
///
/// Two optimizations keep the client quiet:
/// * **Debouncing** — rapid [publish] calls for the same `uri` within
///   [debounceDuration] collapse into a single notification.
/// * **Stable diff** — if the diagnostics for a `uri` are unchanged since the
///   last publish, the notification is skipped entirely. Disable with
///   `suppressUnchanged: false` if your client relies on every publish.
final class DiagnosticsManager extends ServerBoundFeature {
  DiagnosticsManager({this.suppressUnchanged = true});

  /// Whether to skip publishing when a document's diagnostics are identical to
  /// the previously published set. Defaults to `true`.
  final bool suppressUnchanged;

  final _pendingDiagnostics = <String, List<Diagnostic>>{};
  final _timers = <String, Timer>{};
  final _lastPublished = <String, List<Diagnostic>>{};

  /// The duration to wait before publishing changes for a document.
  // ignore: omit_obvious_property_types
  Duration debounceDuration = const Duration(milliseconds: 250);

  /// Schedules diagnostics to be published to the client.
  ///
  /// Subsequent calls for the same [uri] before the [debounceDuration]
  /// elapsed will restart the timer. When [suppressUnchanged] is set and the
  /// resolved diagnostics match the last published set, no notification is
  /// sent.
  void publish(String uri, List<Diagnostic> diagnostics) {
    _timers[uri]?.cancel();
    _pendingDiagnostics[uri] = diagnostics;

    _timers[uri] = Timer(debounceDuration, () {
      _timers.remove(uri);
      final list = _pendingDiagnostics.remove(uri);
      if (list == null) {
        return;
      }

      if (suppressUnchanged && _sameAsLast(uri, list)) {
        return;
      }
      _lastPublished[uri] = list;

      server.client.textDocument.publishDiagnostics(
        .new(uri: uri, diagnostics: list),
      );
    });
  }

  /// Clears diagnostics for a document immediately (no debouncing).
  void clear(String uri) {
    _timers[uri]?.cancel();
    _timers.remove(uri);
    _pendingDiagnostics.remove(uri);

    // Record the cleared state so a later empty publish is suppressed, but
    // always send this explicit clear to the client.
    _lastPublished[uri] = const [];

    server.client.textDocument.publishDiagnostics(
      .new(uri: uri, diagnostics: const []),
    );
  }

  bool _sameAsLast(String uri, List<Diagnostic> next) {
    final previous = _lastPublished[uri];
    if (previous == null || previous.length != next.length) {
      return false;
    }
    for (var i = 0; i < next.length; i++) {
      if (previous[i] != next[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  FutureOr<void> dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _pendingDiagnostics.clear();
    _lastPublished.clear();
    return super.dispose();
  }
}
