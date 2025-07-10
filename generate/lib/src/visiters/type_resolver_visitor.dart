import 'package:code_builder/code_builder.dart';

import '../meta/protocol.dart';
import '../symbols/sealed_map.dart';
import '../utils.dart';
import 'visitor.dart';

/// A concrete visitor that resolves MetaReference types to their Dart String
/// representations.
class TypeResolverVisitor implements MetaReferenceVisitor<String> {
  TypeResolverVisitor({
    required Map<String, MetaStructure> structures,
    required Map<String, MetaEnumeration> enumerations,

    // required Map<String, OrMapReference> orMapReferences,
    required SealedMap sealedMap,
  }) : _structures = structures,
       _enumerations = enumerations,

       //  _orMapReferences = orMapReferences,
       _sealedMap = sealedMap;

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  // final Map<String, OrMapReference> _orMapReferences;

  final SealedMap _sealedMap;

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

    switch (ref.name) {
      case 'LSPObject':
        return 'Object';
      case 'LSPArray':
        return 'List<Object>';
    }

    return ref.name;

    // throw ArgumentError(
    //   'Unknown type reference: ${ref.name}. '
    //   'Ensure it is defined in the protocol.',
    // );
  }

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
    final orName = _sealedMap.typeNameForOrRef(ref);

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
    final record = RecordType(
      (rb) {
        final entries = <MapEntry<String, Reference>>[];
        for (final prop in ref.value.properties) {
          final propType = prop.type.resolveType(this);
          final propName = prop.name;

          entries.add(MapEntry(propName, refer(propType)));

          rb.namedFieldTypes.addEntries(entries);
        }
      },
    );

    final result = specToCode(record, format: false);

    return result;
  }

  @override
  String visitStringLiteralRef(StringLiteralRef ref) => 'String';

  @override
  String visitTupleRef(TupleRef ref) => 'Tuple';
}
