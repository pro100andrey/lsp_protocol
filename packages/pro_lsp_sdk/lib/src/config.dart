import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Manages and caches configuration settings retrieved from the client.
final class LspConfigurationManager {
  LspConfigurationManager(this._server);

  final LspServer _server;

  final Map<String, Object?> _cache = {};
  var _cacheEpoch = 0;
  final _changeListeners = StreamController<void>.broadcast();
  final Map<String, DateTime> _failedCooldowns = {};
  void Function()? _registration;

  /// A stream that fires whenever the client's configuration changes.
  Stream<void> get onChange => _changeListeners.stream;

  /// Binds configuration change listener to the server's workspace
  /// notifications.
  void bind() {
    if (_registration != null) {
      return;
    }
    _registration =
        _server.workspace.onDidChangeConfiguration((params, context) async {
      // Configuration changed on the client: invalidate cache, clear cooldowns,
      // and notify listeners
      _cacheEpoch++;
      _cache.clear();
      _failedCooldowns.clear();
      _changeListeners.add(null);
    });
  }

  /// Unbinds the configuration change listener.
  void unbind() {
    _registration?.call();
    _registration = null;
  }

  /// Retrieves the value of the specified [section] from the client,
  /// caching the result.
  ///
  /// Specify the return type [T] expected for the section.
  Future<T?> getSection<T>(String section) async {
    if (_cache.containsKey(section)) {
      return _cache[section] as T?;
    }

    // Check if request for this section is on cooldown due to a recent failure
    final now = DateTime.now();
    final cooldown = _failedCooldowns[section];
    if (cooldown != null && now.isBefore(cooldown)) {
      return null;
    }

    final startEpoch = _cacheEpoch;

    try {
      final results = await _server.client.workspace.configuration(
        ConfigurationParams(
          items: [ConfigurationItem(section: section)],
        ),
      );

      // Verify that the epoch hasn't changed (e.g., config wasn't cleared)
      // during the asynchronous network call before caching.
      _failedCooldowns.remove(section);
      if (_cacheEpoch == startEpoch) {
        final val = results.isNotEmpty ? results.first as T? : null;
        _cache[section] = val;
        return val;
      }
    } on Object catch (_) {
      // Apply a cooldown of 5 seconds before allowing a retry for this section
      _failedCooldowns[section] = DateTime.now().add(
        const Duration(seconds: 5),
      );
    }

    return null;
  }

  /// Closes change streams and unbinds listeners.
  void close() {
    unbind();
    unawaited(_changeListeners.close());
  }
}
