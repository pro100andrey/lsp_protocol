import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/resolved_decl.dart';

part 'resolved_state.freezed.dart';

@freezed
abstract class ResolvedState with _$ResolvedState {
  const factory ResolvedState({
    /// Symbol table: declaration name → resolved declaration.
    required Map<String, ResolvedDecl> registry,
    required List<ResolvedClass> classes,
    required List<ResolvedEnum> enumerations,
    required List<ResolvedAlias> aliases,
  }) = _ResolvedState;
}
