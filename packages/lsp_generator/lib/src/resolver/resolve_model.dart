import '../generator/resolver.dart';
import '../models/protocol.dart';
import 'resolved_state.dart';

ResolvedState resolveModel(MetaProtocol protocol) {
  final visitor = ModelResolver()..resolve(protocol);

  return ResolvedState(
    registry: visitor.registry,
    classes: visitor.classes,
    enumerations: visitor.enumerations,
    aliases: visitor.aliases,
    notifications: protocol.notifications,
    requests: protocol.requests,
  );
}
