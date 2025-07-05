// ignore_for_file: avoid_print

import '../meta/protocol.dart';

void printLiteral(LiteralRef ref) {
  final value = ref.value;

  final properties = value.properties.map(
    (e) => '  ${metaReferenceDescription(e.type)} ${e.name}',
  );

  print(properties.join('\r\n'));
}

String metaReferenceDescription(MetaReference ref) {
  switch (ref) {
    case TypeRef(name: final typeName):
      return typeName;
    case BaseRef(name: final typeName):
      return typeName;
    case LiteralRef(:final value):
      return 'Literal(${value.properties.map((e) => '${metaReferenceDescription(e.type)} ${e.name}').join(', ')})';
    case ArrayRef(element: final element):
      return 'List<${metaReferenceDescription(element)}>';
    case OrRef(:final items):
      return '[${items.map(metaReferenceDescription).join('|')}]';
    case MapRef(key: final key, value: final value):
      return 'Map<$key, $value>';

    default:
      return 'Unknown MetaReference type';
  }
}
