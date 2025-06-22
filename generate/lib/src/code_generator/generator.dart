import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/protocol.dart';

String generateCode(MetaProtocol protocol) {
  final library = Library(
    (b) {
      b.body.add(_generateBaseJsonClass());
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

Class _generateBaseJsonClass() {
  final clazz = Class((b) {
    b
      ..name = 'BaseJson'
      ..abstract = true;
    b.methods.add(
      Method(
        (mb) {
          mb
            ..name = 'toJson'
            ..returns = refer('Map<String, dynamic>');
        },
      ),
    );
  });

  return clazz;
}

Class _generateClassFromStructure(MetaStructure structure) {
  final clazz = Class((b) {
    b
      ..name = structure.name
      ..extend = refer('BaseJson')
      ..methods.add(
        Method(
          (mb) {
            mb
              ..name = 'toJson'
              ..returns = refer('Map<String, dynamic>')
              ..body = const Code('''
                return {};
              ''');
          },
        ),
      );
  });

  return clazz;
}
