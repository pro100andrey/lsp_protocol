import 'resolved_type.dart';

/// Resolved IR declaration — a named top-level entity in the LSP model.
/// All [ResolvedType] fields are fully resolved (no string-name references).
sealed class ResolvedDecl {
  const ResolvedDecl({
    required this.name,
    this.documentation,
    this.since,
    this.proposed = false,
  });

  final String name;
  final String? documentation;
  final String? since;
  final bool proposed;
}

/// A resolved structure or extracted inline literal.
final class ResolvedClass extends ResolvedDecl {
  ResolvedClass({
    required super.name,
    required this.properties,
    this.extends$ = const [],
    this.mixins$ = const [],
    this.isAnonymous = false,
    super.documentation,
    super.since,
    super.proposed,
  });

  final List<ResolvedProperty> properties;

  /// Resolved `extends` chain (already [ResolvedType], not strings).
  final List<ResolvedType> extends$;

  /// Resolved `mixins` chain.
  final List<ResolvedType> mixins$;

  /// `true` for classes extracted from an inline `LiteralRef`.
  final bool isAnonymous;

  @override
  String toString() => 'ResolvedClass($name)';
}

/// A resolved enumeration.
final class ResolvedEnum extends ResolvedDecl {
  const ResolvedEnum({
    required super.name,
    required this.members,
    required this.valueType,
    this.supportsCustomValues = false,
    super.documentation,
    super.since,
    super.proposed,
  });

  final List<ResolvedEnumMember> members;

  /// The underlying value type: `String` or `int`.
  final String valueType;

  final bool supportsCustomValues;

  @override
  String toString() => 'ResolvedEnum($name)';
}

/// A resolved type alias.
final class ResolvedAlias extends ResolvedDecl {
  ResolvedAlias({
    required super.name,
    required this.type,
    super.documentation,
    super.since,
    super.proposed,
  });

  /// Mutable so pass-2 can update in-place; all [AliasType] refs auto-update.
  ResolvedType type;

  @override
  String toString() => 'ResolvedAlias($name)';
}

// ---------------------------------------------------------------------------
// Sub-nodes
// ---------------------------------------------------------------------------

/// A property of a [ResolvedClass].
final class ResolvedProperty {
  const ResolvedProperty({
    required this.name,
    required this.type,
    this.optional = false,
    this.documentation,
    this.since,
    this.deprecated,
  });

  final String name;
  final ResolvedType type;
  final bool optional;
  final String? documentation;
  final String? since;
  final String? deprecated;

  @override
  String toString() => 'ResolvedProperty($name: $type)';
}

/// A member of a [ResolvedEnum].
final class ResolvedEnumMember {
  const ResolvedEnumMember({
    required this.name,
    required this.value,
    this.documentation,
    this.since,
  });

  final String name;

  /// Raw value as a string (may be int or string depending on enum kind).
  final String value;
  final String? documentation;
  final String? since;

  @override
  String toString() => 'ResolvedEnumMember($name = $value)';
}
