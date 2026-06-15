import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Manages and caches configuration settings retrieved from the client.
final class LspConfigurationManager extends LspFeature {
  LspConfigurationManager([this._server]);

  LspServer? _server;

  var _cacheEpoch = 0;
  void Function()? _registration;
  final _cache = <String, Object?>{};
  final _changeListeners = StreamController<void>.broadcast();
  final _failedCooldowns = <String, DateTime>{};
  final _inFlight = <String, Future<Object?>>{};

  /// A stream that fires whenever the client's configuration changes.
  Stream<void> get onChange => _changeListeners.stream;

  @override
  void register(LspServer server) {
    _server = server;

    if (_registration != null) {
      return;
    }

    _registration = server.workspace.onDidChangeConfiguration((
      params,
      context,
    ) async {
      // Configuration changed on the client: invalidate cache, clear cooldowns,
      // in-flight requests, and notify listeners
      _cacheEpoch++;
      _cache.clear();
      _failedCooldowns.clear();
      _inFlight.clear();
      _changeListeners.add(null);
    });
  }

  /// Retrieves the value of the specified [section] from the client,
  /// optionally scoped to a resource [scopeUri], caching the result.
  ///
  /// Specify the return type [T] expected for the section.
  Future<T?> getSection<T>(String section, {String? scopeUri}) async {
    final server = _server;
    if (server == null) {
      throw StateError(
        'LspConfigurationManager is not registered on any server.',
      );
    }

    final cacheKey = scopeUri != null ? '$scopeUri#$section' : section;

    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey] as T?;
    }

    // Check if request for this section is on cooldown due to a recent failure
    final now = DateTime.now();
    final cooldown = _failedCooldowns[cacheKey];
    if (cooldown != null && now.isBefore(cooldown)) {
      return null;
    }

    // De-duplicate in-flight configuration queries
    if (_inFlight.containsKey(cacheKey)) {
      try {
        final result = await _inFlight[cacheKey];
        return result as T?;
      } on Object catch (_) {
        return null;
      }
    }

    final startEpoch = _cacheEpoch;
    final future = _fetchSection(
      server,
      section,
      scopeUri,
      startEpoch,
      cacheKey,
    );

    _inFlight[cacheKey] = future;

    try {
      final result = await future;
      return result as T?;
    } on Object catch (_) {
      return null;
    } finally {
      // Evict from in-flight requests map regardless of outcome
      _inFlight.remove(cacheKey)?.ignore();
    }
  }

  Future<Object?> _fetchSection(
    LspServer server,
    String section,
    String? scopeUri,
    int startEpoch,
    String cacheKey,
  ) async {
    try {
      final results = await server.client.workspace.configuration(
        .new(
          items: [.new(section: section, scopeUri: scopeUri)],
        ),
      );

      _failedCooldowns.remove(cacheKey);
      if (_cacheEpoch == startEpoch) {
        final val = results.isNotEmpty ? results.first : null;
        _cache[cacheKey] = val;
        return val;
      }
    } on Object catch (_) {
      // Apply a cooldown of 5 seconds before allowing a retry for this section
      _failedCooldowns[cacheKey] = .now().add(const .new(seconds: 5));

      rethrow;
    }

    return null;
  }

  @override
  FutureOr<void> dispose() async {
    _registration?.call();
    _registration = null;
    _inFlight.clear();
    await _changeListeners.close();
  }
}
