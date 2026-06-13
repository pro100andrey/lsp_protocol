import 'package:meta/meta.dart';

import '../models/protocol.dart';
import '../models/resolved_decl.dart';

@immutable
class ResolvedState {
  const ResolvedState({
    required this.registry,
    required this.classes,
    required this.enumerations,
    required this.aliases,
    this.notifications = const [],
    this.requests = const [],
  });

  final Map<String, ResolvedDecl> registry;
  final List<ResolvedClass> classes;
  final List<ResolvedEnum> enumerations;
  final List<ResolvedAlias> aliases;
  final List<MetaNotification> notifications;
  final List<MetaRequest> requests;
}
