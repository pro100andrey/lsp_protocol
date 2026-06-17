import 'dart:async';

import 'lsp_server.dart';

/// Base class for pluggable LSP features with a managed lifecycle.
///
/// Features encapsulate related handler registration and cleanup logic,
/// keeping the server code organized. Each feature is bound to an [LspServer]
/// via [register] and cleaned up via [dispose].
///
/// ## Usage
///
/// Create a feature by extending [LspFeature] and implementing [register]:
///
/// ```dart
/// class CompletionFeature extends LspFeature {
///   final List<StreamSubscription> _subscriptions = [];
///
///   @override
///   void register(LspServer server) {
///     // Group related spec handlers behind one feature.
///     server.textDocument.onCompletion((params, context) async {
///       return CompletionList(items: []);
///     });
///     server.completionItem.onResolve((item, context) async => item);
///   }
///
///   @override
///   Future<void> dispose() async {
///     for (final sub in _subscriptions) {
///       await sub.cancel();
///     }
///     _subscriptions.clear();
///   }
/// }
/// ```
///
/// Handlers are keyed by the generated `RequestMethod`/`NotificationMethod`
/// enums, so a feature registers handlers for *spec* methods only — there is
/// no supported path for registering arbitrary, non-spec method strings.
///
/// Register the feature before the server starts listening:
///
/// ```dart
/// final server = LspServer();
/// server.registerFeature(MyCustomFeature());
/// await server.listen();
/// ```
///
/// ## Lifecycle
///
/// 1. **Registration** — [register] is called by [LspServer.registerFeature]
///    during server setup, before [LspServer.listen].
/// 2. **Active** — The feature's handlers are active and processing requests.
/// 3. **Disposal** — [dispose] is called when the server closes, after all
///    message processing has stopped.
///
/// ## Error Handling
///
/// If [register] throws, the feature is automatically removed from the
/// server's feature list and the exception propagates to the caller.
/// Errors during [dispose] are routed through the server's [LspServer.onError]
/// callback, or written to stderr if no callback is configured.
abstract class LspFeature {
  const LspFeature();

  /// Binds this feature to the [server], registering handlers or resources.
  ///
  /// This method is called automatically by [LspServer.registerFeature]
  /// during server setup. Use it to register request/notification handlers
  /// via the server's handler namespaces or the underlying connection.
  ///
  /// If this method throws, the feature is automatically unregistered and
  /// the exception propagates to the caller of [LspServer.registerFeature].
  void register(LspServer server);

  /// Disposes of any resources held by this feature.
  ///
  /// Called when the server is closing, after all message processing has
  /// stopped. Override this method to cancel subscriptions, close streams,
  /// or perform any other cleanup.
  ///
  /// The default implementation returns immediately. Subclasses should
  /// ensure this method is safe to call multiple times and that it
  /// awaits any pending asynchronous operations.
  FutureOr<void> dispose() {}
}
