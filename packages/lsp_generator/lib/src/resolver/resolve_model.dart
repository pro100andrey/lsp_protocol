import '../models/protocol.dart';
import '../visitor/resolver_visitor.dart';
import 'resolved_state.dart';

ResolvedState resolveModel(MetaProtocol protocol) {
  final visitor = ResolverVisitor()..resolve(protocol);

  return ResolvedState(
    registry: visitor.registry,
    classes: visitor.classes,
    enumerations: visitor.enumerations,
    aliases: visitor.aliases,
    notifications: protocol.notifications,
    requests: protocol.requests,
  );
}
