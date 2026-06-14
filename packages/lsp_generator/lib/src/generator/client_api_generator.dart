import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../resolver/resolved_state.dart' show ResolvedState;
import 'api_generator.dart';

/// Generates the typed LSP client API (`LspClient`, `LspClientExtensions`,
/// etc.) from a fully resolved [ResolvedState].
///
/// The client API exposes:
///  * `LspClient` — the main entry point for sending requests, notifications,
///    and attaching handlers for server-to-client messages.
///  * `LspClientExtensions` — extension methods for workspace/progress
///    capabilities.
///  * `ClientToServerProxy` — a typed proxy that mirrors the server-facing
///    side of the protocol so that code samples and documentation can
///    reference `client.server.*` naturally.
final class ClientApiGenerator extends ApiGenerator {
  /// Creates a generator that will produce the client-side LSP API from
  /// the given [resolved] protocol state.
  ClientApiGenerator(super.resolved);

  /// Returns `'Client'`, identifying this as the client-side code generator.
  @override
  String get side => 'Client';

  /// Returns `'Server'`, the opposite side of the client-server communication.
  @override
  String get otherSide => 'Server';

  /// The name of the proxy class that represents the server-facing API
  /// accessible through the client.
  @override
  String get proxyName => 'ClientToServerProxy';

  /// The access path used in generated examples to reach the proxy
  /// (e.g. `client.server`).
  @override
  String get proxyExampleAccess => 'client.server';

  /// The type name used in generated examples for the proxy (e.g. `LspClient`).
  @override
  String get proxyExampleType => 'LspClient';

  /// A sample method call used in generated documentation to illustrate
  /// how a client would invoke a server-facing method.
  @override
  String get proxyExampleDocsCall =>
      'client.server.workspace.didChangeConfiguration(...);';

  /// The direction of messages handled by this API side.
  ///
  /// For the client, the handler processes **server-to-client** messages
  /// (responses and server-initiated requests/notifications).
  @override
  MessageDirection get handlerDirection => .serverToClient;

  /// The direction of messages sent by this API side.
  ///
  /// For the client, the sender sends **client-to-server** messages
  /// (requests and notifications).
  @override
  MessageDirection get senderDirection => .clientToServer;

  /// Builds and returns the complete client-side API library.
  ///
  /// The generated library includes:
  ///  * `LspClient` — the primary client class.
  ///  * `LspClientExtensions` — capability extensions.
  ///  * `ClientToServerProxy` — typed server-facing proxy.
  ///  * All request/notification model classes and related types.
  Library buildClientApi() => buildApi();
}
