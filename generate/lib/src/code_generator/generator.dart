import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/protocol.dart';

String generateCode(MetaProtocol protocol) {
  final library = Library(
    (b) {
      // Generate classes from structures
      for (final structure in protocol.structures) {
        b.body.add(_generateClassFromStructure(structure));
      }
    },
  );

  final emitter = DartEmitter(allocator: Allocator.simplePrefixing());
  final formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
    pageWidth: DartFormatter.defaultPageWidth,
  );

  final result = formatter.format('${library.accept(emitter)}');

  return result;
}

Class _generateClassFromStructure(MetaStructure structure) {
  final clazz = Class((b) {
    b.name = structure.name;

    // Add factory constructor for fromJson
    b.constructors.add(
      Constructor((cb) {
        cb
          ..factory = true
          ..name = 'fromJson'
          ..requiredParameters.add(
            Parameter(
              (pb) => pb
                ..name = 'json'
                ..type = refer('Map<String, dynamic>'),
            ),
          )
          ..body = Code('return _\$${structure.name}FromJson(json);');
      }),
    );
  });

  return clazz;
}
