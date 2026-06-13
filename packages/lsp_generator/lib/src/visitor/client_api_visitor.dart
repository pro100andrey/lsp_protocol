import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../resolver/resolved_state.dart' show ResolvedState;
import 'api_visitor.dart';

/// Generates the typed LSP client API from a fully resolved [ResolvedState].
final class ClientApiVisitor extends ApiVisitor {
  ClientApiVisitor(super.resolved);

  @override
  String get side => 'Client';

  @override
  String get otherSide => 'Server';

  @override
  String get proxyName => 'ClientToServerProxy';

  @override
  String get proxyExampleAccess => 'client.server';

  @override
  String get proxyExampleType => 'LspClient';

  @override
  String get proxyExampleDocsCall =>
      'client.server.workspace.didChangeConfiguration(...);';

  @override
  MessageDirection get handlerDirection => MessageDirection.serverToClient;

  @override
  MessageDirection get senderDirection => MessageDirection.clientToServer;

  Library buildClientApi() => buildApi();
}
