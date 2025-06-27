import '../meta/protocol.dart';
import 'visitor.dart';

/// A concrete visitor that resolves MetaReference types to their Dart String
/// representations.
class TypeResolverVisitor implements MetaReferenceVisitor<String> {
  TypeResolverVisitor(this._structures, this._enumerations, this._literals);
  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;
  final Map<LiteralRef, MetaLiteralDefinition> _literals;

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
  String visitOrRef(OrRef ref) => _applyOptional('OrRefType', ref.optional);

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
    final literal = _literals[ref];

    if (literal == null) {
      throw ArgumentError('LiteralRef not found: $ref');
    }

    return _applyOptional(literal.name, ref.optional);
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
