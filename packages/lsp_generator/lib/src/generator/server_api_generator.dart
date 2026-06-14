import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../resolver/resolved_state.dart' show ResolvedState;
import 'api_generator.dart';

/// Generates the typed LSP server API from a fully resolved [ResolvedState].
final class ServerApiGenerator extends ApiGenerator {
  ServerApiGenerator(super.resolved);

  /// Returns `'Server'`, identifying this as the server-side code generator.
  @override
  String get side => 'Server';

  /// Returns `'Client'`, the opposite side of the server-client communication.
  @override
  String get otherSide => 'Client';

  /// The name of the proxy class that represents the client-facing API
  /// accessible through the server.
  @override
  String get proxyName => 'ServerToClientProxy';

  /// The access path used in generated examples to reach the proxy
  /// (e.g. `server.client`).
  @override
  String get proxyExampleAccess => 'server.client';

  /// The type name used in generated examples for the proxy (e.g. `LspServer`).
  @override
  String get proxyExampleType => 'LspServer';

  /// A sample method call used in generated documentation to illustrate
  /// how a server would invoke a client-facing method.
  @override
  String get proxyExampleDocsCall =>
      'server.client.window.logMessage(LogMessageParams(...));';

  /// The direction of messages handled by this API side.
  ///
  /// For the server, the handler processes **client-to-server** messages
  /// (requests and notifications from clients).
  @override
  MessageDirection get handlerDirection => .clientToServer;

  /// The direction of messages sent by this API side.
  ///
  /// For the server, the sender sends **server-to-client** messages
  /// (responses and server-initiated requests/notifications).
  @override
  MessageDirection get senderDirection => .serverToClient;

  /// Returns the return type for handler methods.
  ///
  /// For notifications returns `void Function()`, for requests returns `void`.
  @override
  Reference handlerMethodReturns(bool isNotification) =>
      isNotification ? refer('void Function()') : refer('void');

  /// Builds the complete LSP server API library by delegating to [buildApi].
  Library buildServerApi() => buildApi();
}
