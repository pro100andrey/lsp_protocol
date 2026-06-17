import 'dart:async';

import 'package:meta/meta.dart';
import 'package:pro_lsp/pro_lsp.dart';

/// Base class for [LspFeature]s that need a reference to the [LspServer] they
/// are registered on.
///
/// Centralizes the "registered yet?" check so concrete features don't each
/// repeat a nullable field plus a `StateError` guard in every method. Access
/// [server] from anywhere after registration; it throws a clear [StateError]
/// if used before the feature is registered.
///
/// Subclasses that override [register]/[dispose] must call `super` (enforced by
/// [mustCallSuper]) so the server reference is wired up and released correctly.
abstract base class ServerBoundFeature extends LspFeature {
  LspServer? _server;

  /// The server this feature is registered on.
  ///
  /// Throws [StateError] if accessed before the feature has been registered
  /// via `server.registerFeature(...)`.
  LspServer get server =>
      _server ??
      (throw StateError(
        '$runtimeType is not registered on any server yet. '
        'Pass it to server.registerFeature(...) before using it.',
      ));

  /// Whether this feature has been registered on a server.
  bool get isRegistered => _server != null;

  @override
  @mustCallSuper
  void register(LspServer server) {
    _server = server;
  }

  @override
  @mustCallSuper
  FutureOr<void> dispose() {
    _server = null;
  }
}
