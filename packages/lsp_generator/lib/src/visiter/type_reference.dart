import 'package:code_builder/code_builder.dart';

import '../redux/models/resolved_type.dart';

/// Converts a [ResolvedType] from the IR into a code_builder [TypeReference]
/// suitable for use in generated Dart code.
TypeReference toTypeRef(ResolvedType type) => switch (type) {
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
  NullableType(:final inner) => toTypeRef(inner).rebuild(
    (b) => b.isNullable = true,
  ),
  UnionType() => TypeReference((b) => b..symbol = 'Object'),
  TupleType() => TypeReference(
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
  StringLiteralType() => TypeReference((b) => b..symbol = 'String'),
};

/// Parses a [DartCoreType.dartName] which may be a plain name or a generic
/// like `'Map<String, Object?>'` (used only for LSPObject/LSPArray mappings).
TypeReference _dartCore(String name) => switch (name) {
  'String' => TypeReference((b) => b..symbol = 'String'),
  'int' => TypeReference((b) => b..symbol = 'int'),
  'double' => TypeReference((b) => b..symbol = 'double'),
  'bool' => TypeReference((b) => b..symbol = 'bool'),
  'Null' => TypeReference((b) => b..symbol = 'Null'),
  'Uri' => TypeReference((b) => b..symbol = 'Uri'),
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
