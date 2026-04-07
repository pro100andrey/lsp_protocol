import 'package:freezed_annotation/freezed_annotation.dart';

import 'resolved_type.dart';

part 'resolved_decl.freezed.dart';

/// Resolved IR declaration — a named top-level entity in the LSP model.
/// All [ResolvedType] fields are fully resolved (no string-name references).
sealed class ResolvedDecl {
  String get name;
  String? get documentation;
  String? get since;
  bool get proposed;
}

// ---------------------------------------------------------------------------
// Concrete declarations
// ---------------------------------------------------------------------------

/// A resolved structure or extracted inline literal.
///
/// Uses `@unfreezed` so that [properties], [extends$], and [mixins$] remain
/// mutable lists — required by the two-pass resolver.
@unfreezed
abstract class ResolvedClass with _$ResolvedClass implements ResolvedDecl {
  factory ResolvedClass({
    required String name,
    required List<ResolvedProperty> properties,
    @Default([]) List<ResolvedType> extends$,
    @Default([]) List<ResolvedType> mixins$,
    @Default(false) bool isAnonymous,
    String? documentation,
    String? since,
    @Default(false) bool proposed,
  }) = _ResolvedClass;
  ResolvedClass._();
}

/// A resolved enumeration.
@freezed
abstract class ResolvedEnum with _$ResolvedEnum implements ResolvedDecl {
  const factory ResolvedEnum({
    required String name,
    required List<ResolvedEnumMember> members,
    required String valueType,
    @Default(false) bool supportsCustomValues,
    String? documentation,
    String? since,
    @Default(false) bool proposed,
  }) = _ResolvedEnum;
}

/// A resolved type alias.
///
/// Uses `@unfreezed` so that [type] can be mutated in-place by the two-pass
/// resolver — all [AliasType] refs then automatically see the resolved type.
@unfreezed
abstract class ResolvedAlias with _$ResolvedAlias implements ResolvedDecl {
  factory ResolvedAlias({
    required String name,
    required ResolvedType type,
    String? documentation,
    String? since,
    @Default(false) bool proposed,
  }) = _ResolvedAlias;
  ResolvedAlias._();
}

// ---------------------------------------------------------------------------
// Sub-nodes
// ---------------------------------------------------------------------------

/// A property of a [ResolvedClass].
@freezed
abstract class ResolvedProperty with _$ResolvedProperty {
  const factory ResolvedProperty({
    required String name,
    required ResolvedType type,
    @Default(false) bool optional,
    String? documentation,
    String? since,
    String? deprecated,
  }) = _ResolvedProperty;
}

/// A member of a [ResolvedEnum].
@freezed
abstract class ResolvedEnumMember with _$ResolvedEnumMember {
  const factory ResolvedEnumMember({
    required String name,

    /// Raw value as a string (may be int or string depending on enum kind).
    required String value,
    String? documentation,
    String? since,
  }) = _ResolvedEnumMember;
}
