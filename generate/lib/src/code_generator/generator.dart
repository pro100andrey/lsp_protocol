import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/protocol.dart';

String generateCode(MetaProtocol protocol) {
  final library = Library(
    (b) {
      b
        ..docs.addAll([
          '/// Do not edit it manually.',
          '///',
          '/// To regenerate, run `dart run lsp_meta:generate`.',
          '',
          '// ignore_for_file: prefer_expression_function_bodies',
          '// ignore_for_file: lines_longer_than_80_chars',
          '// ignore_for_file: one_member_abstracts',
        ])
        ..body.add(_generateBaseJsonClass());
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

  final dartCode = library.accept(emitter).toString();

  final result = formatter.format(dartCode);

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
  final docs = [...?structure.documentation?.split('\n').map((e) => '/// $e')];

  final clazz = Class((b) {
    b
      ..docs.addAll(docs)
      ..name = structure.name
      ..extend = refer('BaseJson')
      ..methods.add(
        Method(
          (mb) {
            mb
              ..annotations.add(refer('override'))
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
