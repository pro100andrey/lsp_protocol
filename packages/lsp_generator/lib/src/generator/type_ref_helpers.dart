import 'package:code_builder/code_builder.dart';

import '../models/resolved_decl.dart' show ResolvedProperty;
import '../models/resolved_type.dart';

/// Converts a [ResolvedType] from the IR into a code_builder [Reference].
///
/// For most types this returns a [TypeReference]. For [InlineRecord] types use
/// [toRef] which returns the appropriate `RecordType` from code_builder.
Reference toRef(ResolvedType type, {bool nullable = false}) {
  final isNull = nullable || type is NullableType;
  final actualType = type is NullableType ? type.inner : type;

  final ref = switch (actualType) {
    InlineRecord(:final fields) =>
      fields.isEmpty
          ? TypeReference((b) => b..symbol = 'Object')
          : _buildRecordRef(fields),
    _ => toTypeRef(actualType),
  };

  return isNull ? ref.asNullable : ref;
}

/// Builds a code_builder [RecordType] from a list of [ResolvedProperty] fields.
RecordType _buildRecordRef(
  List<ResolvedProperty> fields, {
  bool nullable = false,
}) => .new(
  (b) {
    b.isNullable = nullable;
    for (final f in fields) {
      b.namedFieldTypes[f.name] = toRef(f.type, nullable: f.optional);
    }
  },
);

/// Converts a [ResolvedType] to a [Reference].
///
/// [InlineRecord] maps to `Object` as a fallback — callers that actually need
/// the record syntax should use [toRef] instead.
Reference toTypeRef(ResolvedType type) => switch (type) {
  DartCoreType(:final dartName) => _dartCore(dartName),
  ClassType(:final ref) => TypeReference((b) => b..symbol = ref.name),
  EnumType(:final ref) => TypeReference((b) => b..symbol = ref.name),
  AliasType(:final ref) => TypeReference((b) => b..symbol = ref.name),
  ListType(:final element) => TypeReference(
    (b) => b
      ..symbol = 'List'
      ..types.add(toTypeRef(element)),
  ),
  MapType(:final key, :final value) => TypeReference(
    (b) => b
      ..symbol = 'Map'
      ..types.addAll([toTypeRef(key), toTypeRef(value)]),
  ),
  NullableType(:final inner) => toTypeRef(inner).asNullable,
  UnionType() => TypeReference((b) => b..symbol = 'Object'),
  TupleType(:final items) => RecordType(
    (b) {
      for (final item in items) {
        b.positionalFieldTypes.add(toTypeRef(item));
      }
    },
  ),
  StringLiteralType() => TypeReference((b) => b..symbol = 'String'),
  // InlineRecord is handled by toRef(); toTypeRef() falls back to Object.
  InlineRecord() => TypeReference((b) => b..symbol = 'Object'),
};

/// Parses a [DartCoreType.dartName] which may be a plain name or a generic
/// like `'Map<String, Object?>'` (used only for LSPObject/LSPArray mappings).
TypeReference _dartCore(String name) => switch (name) {
  'String' => TypeReference((b) => b..symbol = 'String'),
  'int' => TypeReference((b) => b..symbol = 'int'),
  'double' => TypeReference((b) => b..symbol = 'double'),
  'bool' => TypeReference((b) => b..symbol = 'bool'),
  'Null' => TypeReference((b) => b..symbol = 'Null'),
  'Object?' => TypeReference(
    (b) => b
      ..symbol = 'Object'
      ..isNullable = true,
  ),
  'Map<String, Object?>' => TypeReference(
    (b) => b
      ..symbol = 'Map'
      ..types.addAll([
        TypeReference((b) => b..symbol = 'String'),
        TypeReference(
          (b) => b
            ..symbol = 'Object'
            ..isNullable = true,
        ),
      ]),
  ),
  'List<Object?>' => TypeReference(
    (b) => b
      ..symbol = 'List'
      ..types.add(
        TypeReference(
          (b) => b
            ..symbol = 'Object'
            ..isNullable = true,
        ),
      ),
  ),
  _ => TypeReference((b) => b..symbol = name),
};

extension _ReferenceExt on Reference {
  Reference get asNullable => switch (this) {
    final TypeReference r => r.rebuild((b) => b.isNullable = true),
    final RecordType r => r.rebuild((b) => b.isNullable = true),
    _ => this,
  };
}

/// Unwraps one layer of [NullableType].
extension ResolvedTypeX on ResolvedType {
  ResolvedType get nonNull =>
      this is NullableType ? (this as NullableType).inner : this;
}
