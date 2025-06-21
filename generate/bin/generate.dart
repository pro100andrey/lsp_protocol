// ignore_for_file: avoid_print

import 'package:args/args.dart';
import 'package:generate/src/lsp_source.dart';
import 'package:generate/src/meta/protocol.dart';

Future<void> main(List<String> args) async {
  final parser = _argParser();
  final argsResult = parser.parse(args);
  final help = argsResult['help'] as bool;

  if (help) {
    print(parser.usage);
    return;
  }

  await downloadLSPSpecAndLicense();

  final meta = await loadLSPMeta();

  final protocol = MetaProtocol.fromJson(meta);

  for (final r in protocol.requests) {
    print('Request: ${r.method} (${r.messageDirection.name})');

    if (r.params != null) {
      print('  params: ${_elementToString(r.params)}');
    }

    if (r.result != null) {
      print('  result: ${_elementToString(r.result)}');
    }

    if (r.partialResult != null) {
      print('  partialResult: ${_elementToString(r.partialResult)}');
    }

    if (r.registrationOptions != null) {
      print(
        '  registrationOptions: ${_elementToString(r.registrationOptions)}',
      );
    }

    if (r.since != null) {
      print('  since: ${r.since}');
    }

    if (r.proposed != null) {
      print('  proposed: ${r.proposed}');
    }

    if (r.registrationMethod != null) {
      print('  registrationMethod: ${r.registrationMethod}');
    }

    if (r.errorData != null) {
      print('  errorData: ${_elementToString(r.errorData)}');
    }

    if (r.documentation != null) {
      print(
        '  documentation: ${r.documentation!.replaceAll('\n', ' ')}',
      );
    }

    print('\r\n');
  }

  for (final n in protocol.notifications) {
    print('Notification: ${n.method} (${n.messageDirection.name})');

    if (n.params != null) {
      print('  params: ${_elementToString(n.params)}');
    }

    if (n.registrationOptions != null) {
      print(
        '  registrationOptions: ${_elementToString(n.registrationOptions)}',
      );
    }

    if (n.since != null) {
      print('  since: ${n.since}');
    }

    if (n.registrationMethod != null) {
      print('  registrationMethod: ${n.registrationMethod}');
    }

    if (n.documentation != null) {
      print(
        '  documentation: ${n.documentation!.replaceAll('\n', ' ')}',
      );
    }

    print('\r\n');
  }

  for (final s in protocol.structures) {
    print('Structure: ${s.name}');

    if (s.properties.isNotEmpty) {
      print(
        '  properties: [${s.properties.map(_elementToString).join(' | ')}]',
      );
    }

    if (s.extends$ != null && s.extends$!.isNotEmpty) {
      print('  extends: [${s.extends$!.map(_elementToString).join(' | ')}]');
    }

    if (s.mixins != null && s.mixins!.isNotEmpty) {
      print('  mixins: [${s.mixins!.map(_elementToString).join(' | ')}]');
    }

    if (s.since != null) {
      print('  since: ${s.since}');
    }

    if (s.proposed != null) {
      print('  proposed: ${s.proposed}');
    }

    if (s.documentation != null) {
      print(
        '  documentation: ${s.documentation!.replaceAll('\n', ' ')}',
      );
    }

    print('\r\n');
  }

  //   final String name;
  // final Element type;
  // final List<Element> values;
  // final bool? supportsCustomValues;
  // final String? documentation;
  // final String? since;
  // final bool? proposed;

  for (final e in protocol.enumerations) {
    print('Enumeration: ${e.name}');

    print('  type: ${e.type}');

    if (e.values.isNotEmpty) {
      print('  values: [${e.values.map(_elementToString).join(' | ')}]');
    }

    if (e.supportsCustomValues != null) {
      print('  supportsCustomValues: ${e.supportsCustomValues}');
    }

    if (e.since != null) {
      print('  since: ${e.since}');
    }

    if (e.proposed != null) {
      print('  proposed: ${e.proposed}');
    }

    if (e.documentation != null) {
      print(
        '  documentation: ${e.documentation!.replaceAll('\n', ' ')}',
      );
    }

    print('\r\n');
  }

  for (final t in protocol.typeAliases) {
    print('Type Alias:');
    print('  ${_elementToString(t)}');

    print('\r\n');
  }

  // await cleanUp(version);
}

ArgParser _argParser() {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', help: 'Show this help message');

  return parser;
}

String? _elementToString(Element? e) {
  if (e == null) {
    return null;
  }

  final parts = <String>[];

  if (e.kind != null) {
    parts.add('kind: ${e.kind}');
  }

  if (e.name != null) {
    parts.add('name: ${e.name}');
  }

  if (e.element != null) {
    parts.add('element: ${e.element}');
  }

  if (e.items != null) {
    parts.add('items: [${e.items!.map(_elementToString).join(' | ')}]');
  }

  if (e.type != null) {
    parts.add('type: ${e.type}');
  }

  if (e.documentation != null) {
    parts.add('documentation: ${e.documentation}');
  }

  if (e.optional != null) {
    parts.add('optional: ${e.optional}');
  }

  if (e.since != null) {
    parts.add('since: ${e.since}');
  }

  if (e.proposed != null) {
    parts.add('proposed: ${e.proposed}');
  }

  if (e.key != null) {
    parts.add('key: ${e.key}');
  }

  if (e.value != null) {
    parts.add('value: ${e.value}');
  }

  if (e.properties != null) {
    parts.add(
      'properties: [${e.properties!.map(_elementToString).join(' | ')}]',
    );
  }

  if (e.deprecated != null) {
    parts.add('deprecated: ${e.deprecated}');
  }

  return parts.join(', ');
}
