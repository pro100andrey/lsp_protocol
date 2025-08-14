import 'package:collection/collection.dart';

import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../meta/protocol.dart';
import '../utils.dart';
import 'symbols_table.dart';

String resolveType(MetaReference ref) {
  final result = ref.when(
    literalRef: resolveLiteralType,
    typeRef: (ref) => ref.name,
    arrayRef: resolveArrayType,
    baseRef: resolveBaseType,
    orRef: resolveOrRefName,
    andRef: (ref) => 'AndRef',
    mapRef: resolveMapType,
    tupleRef: resolveTupleType,
    stringLiteralRef: (ref) => 'StringLiteralRef',
  );

  return result;
}

String resolveTypeLabel(MetaReference ref) {
  final result = ref.when(
    arrayRef: (ref) => '${ref.element.resolve()}s',
    orElse: (ref) {
      final resolved = ref.resolve();
      final result = indexedType(resolved);

      return result.upperFirstLetter();
    },
  );

  return result;
}

String resolveArrayType(ArrayRef ref) {
  final elementType = resolveType(ref.element);
  final dElementType = indexedType(elementType);

  return 'List<$dElementType>';
}

String resolveTupleType(TupleRef ref) {
  final parts = ref.items
      .map((item) => resolveType(item).upperFirstLetter())
      .toList(growable: false);

  final sorted = parts.sorted((a, b) => a.compareTo(b));
  final rawName = sorted.join();

  return rawName;
}

String resolveMapType(MapRef ref) =>
    'Map<${resolveType(ref.key)}, ${resolveType(ref.value)}>';

String resolveBaseType(BaseRef ref) => switch (ref.name) {
  'integer' || 'uinteger' => 'int',
  'string' || 'DocumentUri' || 'URI' => 'String',
  'decimal' => 'double',
  'boolean' => 'bool',
  'null' => 'Null',
  _ => throw ArgumentError(
    'Unknown base type: ${ref.name}. '
    'Ensure it is a valid Dart base type.',
  ),
};

String resolveOrRefName(OrRef orRef) {
  final parts = orRef.items.map(resolveType).toList(growable: false);
  final sortedParts = parts.sorted((a, b) => a.compareTo(b));
  final rawName = sortedParts.join(',');

  return 'Or${parts.length}<$rawName>';
}

String resolveLiteralType(LiteralRef ref) {

  final buffer = StringBuffer();

  for (final prop in ref.value.properties) {
    final type = prop.type.resolve().optional(optional: prop.optional);

    prop.documentation.asDoc().forEach(buffer.writeln);

    final isLast = prop == ref.value.properties.last;
    buffer.write('$type ${prop.name}${isLast ? '' : ', '}');
  }

  final rawCode = buffer.toString();
  final code = rawCode.isEmpty ? '()' : '({$rawCode})';

  return code;
}

extension MetaReferencesTypeResolver on MetaReference {
  String resolve() => resolveType(this);

  String resolveLabel() => resolveTypeLabel(this);
}
