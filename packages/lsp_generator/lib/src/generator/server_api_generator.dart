import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../resolver/resolved_state.dart' show ResolvedState;
import 'api_generator.dart';
import 'generator_helpers.dart';

/// Generates the typed LSP server API from a fully resolved [ResolvedState].
final class ServerApiGenerator extends ApiGenerator {
  ServerApiGenerator(super.resolved);

  @override
  String get side => 'Server';

  @override
  String get otherSide => 'Client';

  @override
  String get proxyName => 'ServerToClientProxy';

  @override
  String get proxyExampleAccess => 'server.client';

  @override
  String get proxyExampleType => 'LspServer';

  @override
  String get proxyExampleDocsCall =>
      'server.client.window.logMessage(LogMessageParams(...));';

  @override
  MessageDirection get handlerDirection => .clientToServer;

  @override
  MessageDirection get senderDirection => .serverToClient;

  @override
  Reference handlerMethodReturns(bool isNotification) =>
      isNotification ? refer('void Function()') : tVoid;

  Library buildServerApi() => buildApi();
}
