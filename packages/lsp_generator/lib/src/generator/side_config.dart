import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';

/// Side-specific configuration for `ApiGenerator` — the naming, proxy, and
/// message-direction details that differ between the client and server APIs.
///
/// Replaces the former `ClientApiGenerator` / `ServerApiGenerator` subclasses:
/// the two sides differ only in data, so a value object expresses that more
/// directly than inheritance and makes a hypothetical third side cheap.
final class SideConfig {
  const SideConfig({
    required this.side,
    required this.otherSide,
    required this.proxyName,
    required this.proxyExampleAccess,
    required this.proxyExampleType,
    required this.proxyExampleDocsCall,
    required this.handlerDirection,
    required this.senderDirection,
    required this.handlerMethodReturns,
  });

  /// The side this generator targets, e.g. `"Client"` or `"Server"`.
  final String side;

  /// The opposite side, used for human-readable docs and strings.
  final String otherSide;

  /// The name of the proxy extension type (e.g. `"ClientToServerProxy"`).
  final String proxyName;

  /// The access pattern for the proxy example in docs (e.g. `"client.server"`).
  final String proxyExampleAccess;

  /// The type name of the example used in proxy docs (e.g. `"LspClient"`).
  final String proxyExampleType;

  /// The full documentation call expression shown in proxy docs.
  final String proxyExampleDocsCall;

  /// The message direction for handler methods.
  final MessageDirection handlerDirection;

  /// The message direction for sender methods.
  final MessageDirection senderDirection;

  /// The return type for a handler method, given whether it handles a
  /// notification.
  final Reference Function(bool isNotification) handlerMethodReturns;

  /// Client side: handles server→client messages, sends client→server.
  static const client = SideConfig(
    side: 'Client',
    otherSide: 'Server',
    proxyName: 'ClientToServerProxy',
    proxyExampleAccess: 'client.server',
    proxyExampleType: 'LspClient',
    proxyExampleDocsCall:
        'client.server.workspace.didChangeConfiguration(...);',
    handlerDirection: MessageDirection.serverToClient,
    senderDirection: MessageDirection.clientToServer,
    handlerMethodReturns: _voidReturn,
  );

  /// Server side: handles client→server messages, sends server→client.
  static const server = SideConfig(
    side: 'Server',
    otherSide: 'Client',
    proxyName: 'ServerToClientProxy',
    proxyExampleAccess: 'server.client',
    proxyExampleType: 'LspServer',
    proxyExampleDocsCall:
        'server.client.window.logMessage(LogMessageParams(...));',
    handlerDirection: MessageDirection.clientToServer,
    senderDirection: MessageDirection.serverToClient,
    handlerMethodReturns: _serverHandlerReturns,
  );
}

/// Handlers always return `void` (the default for the client side).
Reference _voidReturn(bool isNotification) => refer('void');

/// Server handlers return `void Function()` for notifications, `void` for
/// requests.
Reference _serverHandlerReturns(bool isNotification) =>
    isNotification ? refer('void Function()') : refer('void');
