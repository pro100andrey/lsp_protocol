import '../protocol.dart';
import 'visiter.dart';

/// A concrete visitor that resolves MetaReference types to their Dart String
/// representations.
class TypeResolverVisitor implements MetaReferenceVisitor<String> {
  TypeResolverVisitor(this._structures, this._enumerations);
  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  /// Resolves primitive meta-types (like 'integer', 'string') to Dart types.
  String _resolveDartPrimitiveType(String typeName) => switch (typeName) {
    'integer' || 'uinteger' => 'int',
    'decimal' => 'double',
    'string' => 'String',
    'boolean' => 'bool',
    'null' =>
      'String', // Consider `dynamic` or a dedicated `Null` type if needed
    'URI' || 'DocumentUri' => 'Uri',
    _ =>
      typeName, // Return as is if not a known primitive (e.g., custom structures/enums)
  };

  /// Appends '?' if the type is optional.
  String _applyOptional(String type, bool isOptional) =>
      isOptional ? '$type?' : type;

  @override
  String visitTypeRef(TypeRef ref) {
    final structure = _structures[ref.name];

    if (structure != null) {
      return _applyOptional(structure.name, ref.optional);
    }

    final enumeration = _enumerations[ref.name];
    if (enumeration != null) {
      // Enums are generated as Dart enums, so their name is the Dart type.
      return _applyOptional(enumeration.name, ref.optional);
    }

    return _applyOptional(_resolveDartPrimitiveType(ref.name), ref.optional);
  }

  @override
  String visitArrayRef(ArrayRef ref) {
    // Recursively resolve the element type
    final elementType = ref.element.resolveType(this);
    return _applyOptional('List<$elementType>', ref.optional);
  }

  @override
  String visitBaseRef(BaseRef ref) =>
      _applyOptional(_resolveDartPrimitiveType(ref.name), ref.optional);

  @override
  // ignore: prefer_expression_function_bodies
  String visitOrRef(OrRef ref) {
    // For 'or' types, a common approach is 'Object' or dynamic.
    // More complex handling might involve generating a Dart union type
    // (if supported) or a base interface with fromJson/toJson methods. For
    //simplicity, we use Object.
    return _applyOptional('Object', ref.optional);
  }

  @override
  // ignore: prefer_expression_function_bodies
  String visitAndRef(AndRef ref) {
    // 'and' types represent intersection. Dart doesn't have direct intersection
    // types. Common workarounds include extending a common base class or using
    // Object.
    return _applyOptional('Object', ref.optional);
  }

  @override
  String visitMapRef(MapRef ref) {
    // Recursively resolve key and value types
    final keyType = ref.key.resolveType(this);
    final valueType = ref.value.resolveType(this);
    return _applyOptional('Map<$keyType, $valueType>', ref.optional);
  }

  @override
  // ignore: prefer_expression_function_bodies
  String visitLiteralRef(LiteralRef ref) {
    // When a LiteralRef is encountered, it implies an anonymous inline object.
    // The DartCodeGeneratorVisitor will assign a unique name to it during
    // generation. For resolution purposes, we might just return 'Object' or a
    // placeholder.
    // In our generator, we assign a specific name like
    // 'ParentStructurePropertyName'.
    // So, this visitor needs context or a way to infer the name.
    // For now, let's assume 'Object', and the generator will handle specific
    //class names.
    return _applyOptional('Object', ref.optional);
  }

  @override
  String visitStringLiteralRef(StringLiteralRef ref) =>
      _applyOptional('String', ref.optional);

  @override
  // ignore: prefer_expression_function_bodies
  String visitTupleRef(TupleRef ref) {
    // Tuples are often represented as List<Object> or a specific data class.
    return _applyOptional('Object', ref.optional);
  }
}
