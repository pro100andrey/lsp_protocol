import '../../../visiter/resolver_visitor.dart';
import '../../app_state.dart';
import '../../common/base_action.dart';
import '../resolved_state.dart';

final class ResolveModelAction extends BaseAction {
  @override
  AppState reduce() {
    final visitor = ResolverVisitor()..resolve(select.protocol);

    final resolved = ResolvedState(
      registry: visitor.registry,
      classes: visitor.classes,
      enumerations: visitor.enumerations,
      aliases: visitor.aliases,
      notifications: select.protocol.notifications,
    );

    return state.copyWith(resolved: resolved);
  }
}
