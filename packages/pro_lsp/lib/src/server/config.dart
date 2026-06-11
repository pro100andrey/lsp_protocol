import 'dart:async';

import '../generated/models/structures.dart';
import 'lsp_server.dart';

/// Manages and caches configuration settings retrieved from the client.
final class LspConfigurationManager {
  LspConfigurationManager(this._server);

  final LspServer _server;

  final Map<String, Object?> _cache = {};
  final _changeListeners = StreamController<void>.broadcast();

  /// A stream that fires whenever the client's configuration changes.
  Stream<void> get onChange => _changeListeners.stream;

  /// Binds configuration change listener to the server's workspace
  /// notifications.
  void bind() {
    _server.workspace.onDidChangeConfiguration((params, context) async {
      // Configuration changed on the client: invalidate cache and notify
      // listeners
      _cache.clear();
      _changeListeners.add(null);
    });
  }

  /// Retrieves the value of the specified [section] from the client,
  /// caching the result.
  ///
  /// Specify the return type [T] expected for the section.
  Future<T?> getSection<T>(String section) async {
    if (_cache.containsKey(section)) {
      return _cache[section] as T?;
    }

    try {
      final results = await _server.client.workspace.configuration(
        ConfigurationParams(
          items: [ConfigurationItem(section: section)],
        ),
      );

      if (results.isNotEmpty) {
        final val = results.first as T?;
        _cache[section] = val;
        return val;
      }
    } on Object catch (_) {
      // Return null if configuration request fails (e.g. client doesn't support
      // configuration)
    }

    return null;
  }

  /// Closes change streams.
  void close() => _changeListeners.close();
}
