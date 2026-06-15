import 'dart:async';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_connection.dart';
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
///   server.general.onInitialize((params) async {
///     return InitializeResult(
///       capabilities: server.inferCapabilities(
///         completionTriggerCharacters: ['.', ':'],
///       ),
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
  ///
  /// This is the standard LSP process communication model. The server
  /// reads from stdin and writes to stdout, which is how most LSP clients
  /// communicate with language servers.
  LspServer() : _connection = LspConnection(LspByteStreamChannel.fromStdio());

  /// Creates a server from an arbitrary byte [StreamChannel].
  ///
  /// Useful for testing or alternative transports such as TCP sockets,
  /// named pipes, or in-memory channels.
  ///
  /// Example with an in-memory channel for testing:
  /// ```dart
  /// final channel = StreamChannel.withFixedCapacity();
  /// final server = LspServer.fromChannel(channel.outer);
  /// // ... configure server ...
  /// ```
  LspServer.fromChannel(StreamChannel<List<int>> channel)
    : _connection = LspConnection(
        LspByteStreamChannel.fromByteChannel(channel).channel,
      );

  final LspConnection _connection;
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
  /// When a handler throws an exception that is not an LSP protocol exception,
  /// this callback is invoked with the error and stack trace. If not set,
  /// errors are logged to stdout.
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
    try {
      await _connection.listen();
    } finally {
      await close();
    }
  }

  /// Closes the connection and stops processing.
  ///
  /// Disposes all registered features in the order they were added, then
  /// closes the underlying connection.
  ///
  /// Feature disposal errors are routed through [onError] if configured,
  /// otherwise logged to stdout.
  Future<void> close() async {
    for (final feature in _features) {
      try {
        await feature.dispose();
      } on Object catch (e, stackTrace) {
        final errorHandler = onError;
        if (errorHandler != null) {
          errorHandler(e, stackTrace);
        } else {
          // Fallback to print when no custom onError handler is configured.
          // ignore: avoid_print
          print('Error disposing feature $feature: $e\n$stackTrace');
        }
      }
    }
    _features.clear();

    await _connection.close();
  }
}
