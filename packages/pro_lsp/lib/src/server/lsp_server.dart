import 'dart:async';
import 'dart:io';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_connection.dart';
import '../generated/models/methods.dart';
import '../generated/server/server_api.dart';
import '../transport/lsp_byte_stream_channel.dart';
import 'lsp_feature.dart';
import 'lsp_state.dart';
import 'middleware.dart';

export '../generated/server/server_api.dart';
export 'cancellation_token.dart';
export 'lsp_feature.dart';
export 'lsp_request.dart';
export 'lsp_state.dart';
export 'middleware.dart';

/// Top-level LSP server implementing the Language Server Protocol.
///
/// [LspServer] is the main entry point for building LSP servers in Dart.
/// It provides namespace-grouped handler registration for incoming messages
/// and a proxy for sending outgoing messages to the client.
///
/// ## Architecture
///
/// ```
/// Client ←→ [LspServer] ←→ [LspConnection] ←→ StreamChannel
///              │
///              ├─ general (initialize, shutdown, exit)
///              ├─ textDocument (completion, hover, diagnostics, ...)
///              ├─ workspace (symbol, executeCommand, ...)
///              ├─ callHierarchy, typeHierarchy, notebookDocument
///              ├─ completionItem, codeAction, codeLens, documentLink, ...
///              └─ client (proxy for server→client messages)
/// ```
///
/// ## Quick Start
///
/// **Stdio transport (standard LSP process):**
/// ```dart
/// void main() async {
///   final server = LspServer();
///
///   server.general.onInitialize((params, context) async {
///     return const InitializeResult(
///       capabilities: ServerCapabilities(
///         hoverProvider: .bool(true),
///       ),
///       serverInfo: (name: 'my-dart-lsp', version: '1.0.0'),
///     );
///   });
///
///   server.textDocument.onHover((params, context) async => Hover(
///         contents: MarkupContent(
///           kind: MarkupKind.markdown,
///           value: '**Hi**',
///         ),
///       ));
///
///   await server.listen();
/// }
/// ```
///
/// **Custom transport (testing, TCP, pipes):**
/// ```dart
/// final result = LspByteStreamChannel.fromByteChannel(myChannel);
/// final server = LspServer.fromChannel(result.channel);
/// try {
///   await server.listen();
/// } finally {
///   await result.cleanup();
/// }
/// ```
///
/// **Sending messages to the client:**
/// ```dart
/// server.client.window.logMessage(
///   LogMessageParams(type: MessageType.info, message: 'Ready'),
/// );
/// ```
///
/// **Using dependency injection:**
/// ```dart
/// server.register(MyService(config));
///
/// server.textDocument.onCompletion((params, context) async {
///   final service = context.resolve<MyService>();
///   return service.computeCompletion(params);
/// });
/// ```
///
/// **Using middleware:**
/// ```dart
/// server.addMiddleware(LoggingMiddleware());
/// server.addMiddleware(AuthMiddleware(token));
/// ```
///
/// **Using features:**
/// ```dart
/// server.registerFeature(MyCustomFeature());
/// ```
final class LspServer {
  /// Creates a server using stdin/stdout as the byte transport.
  LspServer() : this._(LspByteStreamChannel.fromStdio());

  /// Creates a server from an arbitrary byte [StreamChannel].
  LspServer.fromChannel(StreamChannel<List<int>> channel)
    : this._(LspByteStreamChannel.fromByteChannel(channel));

  LspServer._(LspByteStreamChannelResult result)
    : _connection = LspConnection(result.channel),
      _cleanup = result.cleanup;

  final LspConnection _connection;
  final FutureOr<void> Function()? _cleanup;
  var _isListening = false;

  /// Access to the underlying low-level [LspConnection].
  ///
  /// Provides direct access to the connection's service container,
  /// middleware list, and methods for sending outgoing messages.
  ///
  /// Prefer using the namespace handlers ([general], [textDocument], etc.)
  /// for typed access to LSP methods.
  LspConnection get connection => _connection;

  // Incoming handler namespaces

  /// Handlers for protocol-level methods: `initialize`, `shutdown`,
  /// `initialized`, `exit`, and `$/`.
  late final general = ServerGeneralHandlers(_connection);

  /// Handlers for `textDocument/*` requests and notifications.
  ///
  /// The largest namespace, covering most LSP functionality including
  /// completion, hover, diagnostics, formatting, references, definitions,
  /// signatures, and more.
  late final textDocument = ServerTextDocumentHandlers(_connection);

  /// Handlers for `workspace/*` requests and notifications.
  ///
  /// Covers workspace-wide operations such as symbol search, execution,
  /// configuration changes, folding ranges, and code actions.
  late final workspace = ServerWorkspaceHandlers(_connection);

  /// Handlers for `callHierarchy/*` requests.
  late final callHierarchy = ServerCallHierarchyHandlers(_connection);

  /// Handlers for `typeHierarchy/*` requests.
  late final typeHierarchy = ServerTypeHierarchyHandlers(_connection);

  /// Handlers for `notebookDocument/*` notifications.
  late final notebookDocument = ServerNotebookDocumentHandlers(_connection);

  /// Handlers for `completionItem/resolve` — called to resolve additional
  /// data for a selected completion item.
  late final completionItem = ServerCompletionItemHandlers(_connection);

  /// Handlers for `codeAction/resolve` — called to resolve additional
  /// data for a selected code action.
  late final codeAction = ServerCodeActionHandlers(_connection);

  /// Handlers for `codeLens/resolve` — called to resolve additional
  /// data for a selected code lens.
  late final codeLens = ServerCodeLensHandlers(_connection);

  /// Handlers for `documentLink/resolve` — called to resolve additional
  /// data for a selected document link.
  late final documentLink = ServerDocumentLinkHandlers(_connection);

  /// Handlers for `inlayHint/resolve` — called to resolve additional
  /// data for a selected inlay hint.
  late final inlayHint = ServerInlayHintHandlers(_connection);

  /// Handlers for `workspaceSymbol/resolve` — called to resolve additional
  /// data for a selected workspace symbol.
  late final workspaceSymbol = ServerWorkspaceSymbolHandlers(_connection);

  /// Handlers for `window/*` client→server notifications.
  ///
  /// Covers window-related notifications such as log messages,
  /// progress reports, and telemetry events.
  late final window = ServerWindowHandlers(_connection);

  // Outgoing (server → client)

  /// Proxy for all outgoing (server → client) messages.
  ///
  /// Use this to send notifications and requests to the LSP client,
  /// such as log messages, progress reports, or telemetry events.
  late final client = ServerToClientProxy(_connection);

  // Dependency Injection (Service Locator)

  /// Registers a service in the server's connection context.
  ///
  /// Services are available to all handlers and middleware via
  /// the request context's `resolve` or `tryResolve` methods.
  ///
  /// Register services before starting the server:
  /// ```dart
  /// server.register(MyDatabaseClient(connectionStr));
  /// server.register(MyConfigLoader());
  /// ```
  ///
  /// This is a minimal type-keyed container, not a full DI framework. Be aware:
  ///
  /// - Services are keyed by the **static** type argument [T]. `register(impl)`
  ///   keys by the variable's static type, so to resolve by an interface you
  ///   must register explicitly: `server.register<MyApi>(impl)`.
  /// - Registering the same [T] twice silently overwrites the previous service.
  /// - There is no unregister; services live until the connection closes.
  void register<T extends Object>(T service) =>
      _connection.register<T>(service);

  /// Resolves a registered service from the server's connection context.
  ///
  /// Throws [StateError] if no service of type [T] is registered.
  /// Prefer [tryResolve] when the service may not be present.
  T resolve<T extends Object>() => _connection.resolve<T>();

  /// Tries to resolve a registered service, returns `null` if not found.
  T? tryResolve<T extends Object>() => _connection.tryResolve<T>();

  // Core properties

  /// Registered middleware list for request/notification interception.
  ///
  /// Middlewares are executed in order for every incoming request or
  /// notification. Add them before starting the server.
  List<LspMiddleware> get middlewares => _connection.middlewares;

  /// Adds a middleware to this server.
  ///
  /// Middlewares are executed in the order they are added. Each middleware
  /// can inspect, modify, or short-circuit the request/response cycle.
  ///
  /// Example:
  /// ```dart
  /// server.addMiddleware(LoggingMiddleware());
  /// server.addMiddleware(TimingMiddleware());
  /// ```
  void addMiddleware(LspMiddleware middleware) =>
      _connection.addMiddleware(middleware);

  /// Gets the current lifecycle state of the LSP server.
  LspState get state => _connection.state;

  /// Gets the error callback triggered on unhandled exceptions in handlers.
  ///
  /// When a *request* handler throws a non-`LspException`, the error is sent to
  /// the client as a JSON-RPC `internalError` response *and* forwarded here (if
  /// set). When a *notification* handler throws, there is no response to send,
  /// so the error is only forwarded here — if this is unset, notification
  /// errors are silently swallowed. Feature-disposal errors during [close] are
  /// also routed here. Set this early in setup so nothing goes unnoticed.
  void Function(Object error, StackTrace stackTrace)? get onError =>
      _connection.onError;

  /// Sets the error callback triggered on unhandled exceptions in handlers.
  ///
  /// Configure this early in your server setup to handle unexpected errors:
  /// ```dart
  /// server.onError = (error, stackTrace) {
  ///   logger.error('Handler error: $error', stackTrace);
  /// };
  /// ```
  set onError(void Function(Object error, StackTrace stackTrace)? value) =>
      _connection.onError = value;

  // Feature Lifecycle

  final List<LspFeature> _features = [];

  /// Registers a feature plugin with the server and binds its lifecycle.
  ///
  /// Features encapsulate related handler registration and cleanup logic,
  /// keeping the server code organized. They are ideal for:
  ///
  /// - Custom protocol extensions
  /// - Third-party LSP capabilities
  /// - Feature flags and optional modules
  ///
  /// Features must be registered before the server starts [listen]ing.
  /// If [LspFeature.register] throws, the feature is automatically removed
  /// and the exception propagates to the caller.
  ///
  /// Example:
  /// ```dart
  /// server.registerFeature(MyCustomFeature());
  /// server.registerFeature(ThirdPartyLspExtension());
  /// ```
  void registerFeature(LspFeature feature) {
    if (_isListening) {
      throw StateError(
        'Cannot register features after the server has started listening.',
      );
    }
    _features.add(feature);
    try {
      feature.register(this);
    } on Object catch (_) {
      _features.remove(feature);
      rethrow;
    }
  }

  // Lifecycle

  /// Starts processing incoming messages.
  ///
  /// This method blocks until the underlying channel closes, which happens
  /// when the LSP client exits (sends an `exit` notification).
  ///
  /// ## Lifecycle
  ///
  /// 1. Marks the server as listening to prevent further feature registration.
  /// 2. Starts the connection message loop.
  /// 3. When the channel closes, calls [close] to dispose all features.
  ///
  /// ## Error Handling
  ///
  /// Connection-level errors are handled by [LspConnection]. Handler-level
  /// errors are routed through the [onError] callback.
  ///
  /// ## Example
  ///
  /// ```dart
  /// void main() async {
  ///   final server = LspServer();
  ///   // ... configure handlers, middleware, features ...
  ///   await server.listen(); // Blocks until client exits
  ///   print('Server shut down');
  /// }
  /// ```
  Future<void> listen() async {
    if (_isListening) {
      throw StateError('Server has already started listening.');
    }
    _isListening = true;
    _ensureLifecycleDefaults();
    try {
      await _connection.listen();
    } finally {
      await close();
    }
  }

  /// Registers spec-compliant default `shutdown` and `exit` handlers when the
  /// user has not supplied their own.
  ///
  /// The default `shutdown` simply succeeds (returns `null`); the connection
  /// transitions to [LspState.shuttingDown] on its own. The default `exit`
  /// closes the connection. Register [general]'s `onShutdown`/`onExit` before
  /// [listen] to override either — your handler then runs instead and you stay
  /// responsible for the expected behavior (e.g. closing on `exit`).
  void _ensureLifecycleDefaults() {
    final registered = _connection.registeredMethods;
    if (!registered.contains(RequestMethod.shutdown)) {
      general.onShutdown((context) async {});
    }
    if (!registered.contains(NotificationMethod.exit)) {
      general.onExit((context) async {});
    }
  }

  /// Closes the connection and stops processing.
  ///
  /// Disposes all registered features in the order they were added, then
  /// closes the underlying connection.
  ///
  /// Feature disposal errors are routed through [onError] if configured,
  /// otherwise written to stderr.
  Future<void> close() async {
    for (final feature in _features) {
      try {
        await feature.dispose();
      } on Object catch (e, stackTrace) {
        final errorHandler = onError;
        if (errorHandler != null) {
          errorHandler(e, stackTrace);
        } else {
          // Fall back to stderr, never stdout: on the stdio transport stdout
          // is the JSON-RPC channel, so writing there corrupts the protocol.
          stderr.writeln('Error disposing feature $feature: $e\n$stackTrace');
        }
      }
    }
    _features.clear();

    await _connection.close();
    await _cleanup?.call();
  }
}
