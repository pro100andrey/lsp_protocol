import 'package:collection/collection.dart';

import '../meta/protocol.dart';
import '../symbols/literals_map.dart';
import 'visitor.dart';

/// A concrete visitor that resolves MetaReference types to their Dart String
/// representations.
class TypeResolverVisitor implements MetaReferenceVisitor<String> {
  TypeResolverVisitor({
    required Map<String, MetaStructure> structures,
    required Map<String, MetaEnumeration> enumerations,

    required Map<String, OrMapReference> orMapReferences,
    required LiteralsMap literalsMap,
  }) : _structures = structures,
       _enumerations = enumerations,

       _orMapReferences = orMapReferences,
       _literalsMap = literalsMap;

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  final Map<String, OrMapReference> _orMapReferences;
  final LiteralsMap _literalsMap;

  /// Resolves primitive meta-types (like 'integer', 'string') to Dart types.
  String _resolveDartPrimitiveType(String typeName) => switch (typeName) {
    'integer' || 'uinteger' => 'int',
    'decimal' => 'double',
    'string' => 'String',
    'boolean' => 'bool',
    // Consider `dynamic` or a dedicated `Null` type if needed
    'null' => 'String',
    'URI' || 'DocumentUri' => 'Uri',

    // Return as is if not a known primitive (e.g., custom structures/enums)
    _ => typeName,
  };

  @override
  String visitTypeRef(TypeRef ref) {
    final structure = _structures[ref.name];

    if (structure != null) {
      return structure.name;
    }

    final enumeration = _enumerations[ref.name];
    if (enumeration != null) {
      // Enums are generated as Dart enums, so their name is the Dart type.
      return enumeration.name;
    }

    return _resolveDartPrimitiveType(ref.name);
  }

  @override
  String visitArrayRef(ArrayRef ref) {
    // Recursively resolve the element type
    final elementType = ref.element.resolveType(this);
    return 'List<$elementType>';
  }

  @override
  String visitBaseRef(BaseRef ref) => _resolveDartPrimitiveType(ref.name);

  @override
  String visitOrRef(OrRef ref) {
    final orMapReference = _orMapReferences.values.firstWhereOrNull(
      (orMap) => orMap.orRef == ref,
    );

    if (orMapReference != null) {
      return orMapReference.name;
    }

    return 'Object';
  }

  @override
  // ignore: prefer_expression_function_bodies
  String visitAndRef(AndRef ref) {
    // 'and' types represent intersection. Dart doesn't have direct intersection
    // types. Common workarounds include extending a common base class or using
    // Object.
    throw UnimplementedError(
      'Intersection types are not directly supported in Dart. '
      'Consider using a common base class or Object.',
    );
  }

  @override
  String visitMapRef(MapRef ref) {
    // Recursively resolve key and value types
    final keyType = ref.key.resolveType(this);
    final valueType = ref.value.resolveType(this);

    return 'Map<$keyType, $valueType>';
  }

  @override
  // ignore: prefer_expression_function_bodies
  String visitLiteralRef(LiteralRef ref) {
    return _literalsMap.getLiteralName(ref);
  }

  @override
  String visitStringLiteralRef(StringLiteralRef ref) => 'String';

  @override
  // ignore: prefer_expression_function_bodies
  String visitTupleRef(TupleRef ref) {
    // Tuples are often represented as List<Object> or a specific data class.
    return 'Object';
  }
}
