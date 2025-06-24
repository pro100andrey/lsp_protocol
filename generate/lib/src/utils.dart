// ignore_for_file: avoid_print

// import 'meta/protocol.dart';

// void printProtocol(MetaProtocol protocol, {bool docVerbose = false}) {
//   String? elementToString(Element? e) {
//     if (e == null) {
//       return null;
//     }

//     final parts = <String>[];

//     if (e.kind != null) {
//       parts.add('kind: ${e.kind}');
//     }

//     if (e.name != null) {
//       parts.add('name: ${e.name}');
//     }

//     if (e.element != null) {
//       parts.add('element: ${e.element}');
//     }

//     if (e.items != null) {
//       parts.add('items: [${e.items!.map(elementToString).join(' | ')}]');
//     }

//     if (e.type != null) {
//       parts.add('type: ${e.type}');
//     }

//     if (e.optional != null) {
//       parts.add('optional: ${e.optional}');
//     }

//     if (e.since != null) {
//       parts.add('since: ${e.since}');
//     }

//     if (e.proposed != null) {
//       parts.add('proposed: ${e.proposed}');
//     }

//     if (e.key != null) {
//       parts.add('key: ${e.key}');
//     }

//     if (e.value != null) {
//       parts.add('value: ${e.value}');
//     }

//     if (e.properties != null) {
//       parts.add(
//         'properties: [${e.properties!.map(elementToString).join(' | ')}]',
//       );
//     }

//     if (e.deprecated != null) {
//       parts.add('deprecated: ${e.deprecated}');
//     }

//     if (e.documentation != null && docVerbose) {
//       parts.add('documentation: ${e.documentation}');
//     }

//     return parts.join(', ');
//   }

//   for (final r in protocol.requests) {
//     print('Request: ${r.method} (${r.messageDirection.name})');

//     if (r.params != null) {
//       print('  params: ${elementToString(r.params)}');
//     }

//     if (r.result != null) {
//       print('  result: ${elementToString(r.result)}');
//     }

//     if (r.partialResult != null) {
//       print('  partialResult: ${elementToString(r.partialResult)}');
//     }

//     if (r.registrationOptions != null) {
//       print(
//         '  registrationOptions: ${elementToString(r.registrationOptions)}',
//       );
//     }

//     if (r.since != null) {
//       print('  since: ${r.since}');
//     }

//     if (r.proposed != null) {
//       print('  proposed: ${r.proposed}');
//     }

//     if (r.registrationMethod != null) {
//       print('  registrationMethod: ${r.registrationMethod}');
//     }

//     if (r.errorData != null) {
//       print('  errorData: ${elementToString(r.errorData)}');
//     }

//     if (r.documentation != null && docVerbose) {
//       print(
//         '  documentation: ${r.documentation!.replaceAll('\n', ' ')}',
//       );
//     }

//     print('\r\n');
//   }

//   for (final n in protocol.notifications) {
//     print('Notification: ${n.method} (${n.messageDirection.name})');

//     if (n.params != null) {
//       print('  params: ${elementToString(n.params)}');
//     }

//     if (n.registrationOptions != null) {
//       print(
//         '  registrationOptions: ${elementToString(n.registrationOptions)}',
//       );
//     }

//     if (n.since != null) {
//       print('  since: ${n.since}');
//     }

//     if (n.registrationMethod != null) {
//       print('  registrationMethod: ${n.registrationMethod}');
//     }

//     if (n.documentation != null && docVerbose) {
//       print(
//         '  documentation: ${n.documentation!.replaceAll('\n', ' ')}',
//       );
//     }

//     print('\r\n');
//   }

//   for (final s in protocol.structures) {
//     print('Structure: ${s.name}');

//     if (s.properties.isNotEmpty) {
//       print(
//         '  properties: [${s.properties.map(elementToString).join(' | ')}]',
//       );
//     }

//     if (s.extends$ != null && s.extends$!.isNotEmpty) {
//       print('  extends: [${s.extends$!.map(elementToString).join(' | ')}]');
//     }

//     if (s.mixins != null && s.mixins!.isNotEmpty) {
//       print('  mixins: [${s.mixins!.map(elementToString).join(' | ')}]');
//     }

//     if (s.since != null) {
//       print('  since: ${s.since}');
//     }

//     if (s.proposed != null) {
//       print('  proposed: ${s.proposed}');
//     }

//     if (s.documentation != null && docVerbose) {
//       print(
//         '  documentation: ${s.documentation!.replaceAll('\n', ' ')}',
//       );
//     }

//     print('\r\n');
//   }

//   for (final e in protocol.enumerations) {
//     print('Enumeration: ${e.name}');

//     print('  type: ${e.type}');

//     if (e.values.isNotEmpty) {
//       print('  values: [${e.values.map(elementToString).join(' | ')}]');
//     }

//     if (e.supportsCustomValues != null) {
//       print('  supportsCustomValues: ${e.supportsCustomValues}');
//     }

//     if (e.since != null) {
//       print('  since: ${e.since}');
//     }

//     if (e.proposed != null) {
//       print('  proposed: ${e.proposed}');
//     }

//     if (e.documentation != null && docVerbose) {
//       print(
//         '  documentation: ${e.documentation!.replaceAll('\n', ' ')}',
//       );
//     }

//     print('\r\n');
//   }

//   for (final t in protocol.typeAliases) {
//     print('Type Alias:');
//     print('  ${elementToString(t)}');

//     print('\r\n');
//   }
// }
