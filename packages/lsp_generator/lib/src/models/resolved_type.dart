import 'package:freezed_annotation/freezed_annotation.dart';

import 'resolved_decl.dart';

part 'resolved_type.freezed.dart';

/// Resolved IR type — all name-string references are replaced with object
/// references. Use a Dart 3 sealed switch for exhaustive dispatch.
@freezed
sealed class ResolvedType with _$ResolvedType {
  /// A Dart core / built-in type (String, int, bool, double, Uri, Null, etc.)
  ///
  /// [dartName] is the exact Dart type name, e.g. `'String'`, `'int'`,
  /// `'Object?'`.
  const factory ResolvedType.dartCore({required String dartName}) =
      DartCoreType;

  /// Reference to a named [ResolvedClass] (structure or extracted literal).
  const factory ResolvedType.classType({required ResolvedClass ref}) =
      ClassType;

  /// Reference to a named [ResolvedEnum].
  const factory ResolvedType.enumType({required ResolvedEnum ref}) = EnumType;

  /// Reference to a named [ResolvedAlias].
  const factory ResolvedType.aliasType({required ResolvedAlias ref}) =
      AliasType;

  /// `List<element>`
  const factory ResolvedType.listType({required ResolvedType element}) =
      ListType;

  /// `Map<key, value>`
  const factory ResolvedType.mapType({
    required ResolvedType key,
    required ResolvedType value,
  }) = MapType;

  /// `T?` — produced when `OrRef` contains exactly one non-null item and
  /// `null`.
  const factory ResolvedType.nullableType({required ResolvedType inner}) =
      NullableType;

  /// A union of two or more types that cannot be collapsed to [NullableType].
  /// Produced by `OrRef([A, B, C])` or `AndRef(...)`.
  const factory ResolvedType.unionType({required List<ResolvedType> items}) =
      UnionType;

  /// Positional tuple — `Tuple<[T0, T1, ...]>`.
  const factory ResolvedType.tupleType({required List<ResolvedType> items}) =
      TupleType;

  /// A literal string constant value (from `StringLiteralRef`).
  const factory ResolvedType.stringLiteralType({required String value}) =
      StringLiteralType;

  /// An inline anonymous record literal `({T1 field1, T2 field2})`.
  ///
  /// Produced by `LiteralRef` — no separate named class is generated.
  /// The record is serialized inline by json_serializable's `_$recordConvert`.
  const factory ResolvedType.inlineRecord({
    required List<ResolvedProperty> fields,
  }) = InlineRecord;
}
