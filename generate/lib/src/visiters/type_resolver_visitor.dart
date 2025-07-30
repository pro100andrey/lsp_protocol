import '../generator_helper.dart';
import '../meta/protocol.dart';
import '../symbols/sealed_map.dart';
import 'visitor.dart';

/// A concrete visitor that resolves MetaReference types to their Dart String
/// representations.
class TypeResolverVisitor implements MetaReferenceVisitor<String> {
  TypeResolverVisitor({
    // required Map<String, OrMapReference> orMapReferences,
    required SealedMap sealedMap,
  }) : _sealedMap = sealedMap;

  final SealedMap _sealedMap;

  @override
  String visitTypeRef(TypeRef ref) => ref.name;

  @override
  String visitArrayRef(ArrayRef ref) {
    // Recursively resolve the element type
    final elementType = ref.element.resolveType(this);
    return 'List<$elementType>';
  }

  @override
  String visitBaseRef(BaseRef ref) => switch (ref.name) {
    'integer' => 'int',
    'uinteger' => 'int',
    'string' => 'String',
    'decimal' => 'double',
    'boolean' => 'bool',
    'null' => 'Null',
    'DocumentUri' => 'String',
    'URI' => 'String',
    _ => throw ArgumentError(
      'Unknown base type: ${ref.name}. '
      'Ensure it is a valid Dart base type.',
    ),
  };

  @override
  String visitOrRef(OrRef ref) {
    // return 'Object'; 

    final orName = _sealedMap.resolveOrRefType(ref);

    // final orMapReference = _orMapReferences.values.firstWhereOrNull(
    //   (orMap) => orMap.orRef == ref,
    // );

    // if (orMapReference != null) {
    //   return orMapReference.name;
    // }

    return orName;
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
  String visitLiteralRef(LiteralRef ref) {
    final result = literalToRecord(ref, this);

    return result;
  }

  @override
  String visitStringLiteralRef(StringLiteralRef ref) => 'String';

  @override
  String visitTupleRef(TupleRef ref) => tupleToRecord(ref, this);
}
