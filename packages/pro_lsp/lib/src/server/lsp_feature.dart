import 'dart:async';
import 'lsp_server.dart';

/// Represents a pluggable feature or module with a lifecycle.
abstract class LspFeature {
  const LspFeature();

  /// Binds this feature to the [server], registering handlers or resources.
  void register(LspServer server);

  /// Disposes of any resources held by this feature.
  FutureOr<void> dispose() {}
}
