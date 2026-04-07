import 'resolved_decl.dart';

/// Resolved IR type — all name-string references are replaced with object
/// references. Use a Dart 3 sealed switch for exhaustive dispatch.
sealed class ResolvedType {
  const ResolvedType();
}

/// A Dart core / built-in type (String, int, bool, double, Uri, Null, etc.)
final class DartCoreType extends ResolvedType {
  const DartCoreType(this.dartName);

  /// The exact Dart type name, e.g. `'String'`, `'int'`, `'Object?'`.
  final String dartName;

  @override
  String toString() => 'DartCoreType($dartName)';
}

/// Reference to a named [ResolvedClass] (structure or extracted literal).
final class ClassType extends ResolvedType {
  const ClassType(this.ref);

  final ResolvedClass ref;

  @override
  String toString() => 'ClassType(${ref.name})';
}

/// Reference to a named [ResolvedEnum].
final class EnumType extends ResolvedType {
  const EnumType(this.ref);

  final ResolvedEnum ref;

  @override
  String toString() => 'EnumType(${ref.name})';
}

/// Reference to a named [ResolvedAlias].
final class AliasType extends ResolvedType {
  const AliasType(this.ref);

  final ResolvedAlias ref;

  @override
  String toString() => 'AliasType(${ref.name})';
}

/// `List<element>`
final class ListType extends ResolvedType {
  const ListType(this.element);

  final ResolvedType element;

  @override
  String toString() => 'ListType($element)';
}

/// `Map<key, value>`
final class MapType extends ResolvedType {
  const MapType(this.key, this.value);

  final ResolvedType key;
  final ResolvedType value;

  @override
  String toString() => 'MapType($key, $value)';
}

/// `T?` — produced when `OrRef` contains exactly one non-null item and `null`.
final class NullableType extends ResolvedType {
  const NullableType(this.inner);

  final ResolvedType inner;

  @override
  String toString() => 'NullableType($inner)';
}

/// A union of two or more types that cannot be collapsed to [NullableType].
/// Produced by `OrRef([A, B, C])` or `AndRef(...)`.
final class UnionType extends ResolvedType {
  const UnionType(this.items);

  final List<ResolvedType> items;

  @override
  String toString() => 'UnionType($items)';
}

/// Positional tuple — `Tuple<[T0, T1, ...]>`.
final class TupleType extends ResolvedType {
  const TupleType(this.items);

  final List<ResolvedType> items;

  @override
  String toString() => 'TupleType($items)';
}

/// A literal string constant value (from `StringLiteralRef`).
final class StringLiteralType extends ResolvedType {
  const StringLiteralType(this.value);

  final String value;

  @override
  String toString() => "StringLiteralType('$value')";
}
