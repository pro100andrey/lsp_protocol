import 'package:collection/collection.dart';

import '../meta/protocol.dart';
import 'visitor.dart';

/// A concrete visitor that resolves MetaReference types to their Dart String
/// representations.
class TypeResolverVisitor implements MetaReferenceVisitor<String> {
  TypeResolverVisitor(
    Map<String, MetaStructure> structures,
    Map<String, MetaEnumeration> enumerations,
    Map<LiteralRef, MetaLiteralDefinition> literals,
    Map<String, OrMapReference> orMapReferences,
  ) : _structures = structures,
      _enumerations = enumerations,
      _literals = literals,
      _orMapReferences = orMapReferences;

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;
  final Map<LiteralRef, MetaLiteralDefinition> _literals;
  final Map<String, OrMapReference> _orMapReferences;

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
    final literal = _literals[ref];

    if (literal == null) {
      throw ArgumentError('LiteralRef not found: $ref');
    }

    return literal.name;
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
