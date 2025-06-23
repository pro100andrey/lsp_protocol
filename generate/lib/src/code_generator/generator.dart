import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/protocol.dart';
import 'utils.dart';

class ProtocolGenerator {
  ProtocolGenerator(this.protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ),
      _enumerations = Map.fromEntries(
        protocol.enumerations.map((e) => MapEntry(e.name, e)),
      );

  final MetaProtocol protocol;

  String generate() => _generateCode(protocol);

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  Reference get toJsonClassRef => refer('ToJson');

  bool get generateFields => false;
  bool get generateMethods => false;

  List<String> _header() => [
    '/// Do not edit it manually.',
    '///',
    '/// To regenerate, run `dart run lsp_meta:generate`.',
    '',
    '// ignore_for_file: prefer_expression_function_bodies',
    '// ignore_for_file: one_member_abstracts',
    '// ignore_for_file: unused_element',
    '// ignore_for_file: doc_directive_unknown',
  ];

  String _generateCode(MetaProtocol protocol) {
    final library = Library(
      (b) {
        b.docs.addAll(_header());

        for (final typeAlias in protocol.typeAliases) {
          b.body.add(_generateTypeAlias(typeAlias));
        }

        // Generate the base class for JSON serialization
        b.body.add(_generateToJsonClass());

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

  TypeDef _generateTypeAlias(Element typeAlias) => TypeDef((b) {
    b
      ..name = typeAlias.name
      ..definition = refer(
        _resolveTypeName(typeAlias.type!.name.toString()),
      );
  });

  Class _generateToJsonClass() {
    final clazz = Class((cb) {
      cb
        ..name = toJsonClassRef.symbol
        ..abstract = true;
      cb.methods.add(
        Method(
          (mb) {
            mb
              ..name = 'toJson'
              ..returns = refer('Map<String, dynamic>')
              ..body = const Code('throw UnimplementedError();');
          },
        ),
      );
    });

    return clazz;
  }

  void _addStructFields(ClassBuilder cb, MetaStructure structure) {
    final fields = structure.properties;

    cb.fields.addAll(
      fields.map(
        (property) {
          final propDocs =
              formatDocComment(property.documentation, maxLineLength: 76) ?? [];
          final propType = _resolveTypeName(property.type!.name.toString());
          final propName = property.name;

          return Field(
            (fb) {
              fb
                ..docs.addAll(propDocs)
                ..modifier = FieldModifier.final$
                ..name = propName
                ..type = refer(propType);
            },
          );
        },
      ),
    );

    cb.constructors.add(
      Constructor((cb) {
        cb.optionalParameters.addAll(
          fields.map(
            (property) => Parameter((pb) {
              pb
                ..name = property.name!
                ..named = true
                ..required = true
                ..toThis = true;
            }),
          ),
        );
      }),
    );
  }

  void _generateMethods(ClassBuilder cb, MetaStructure structure) {
    // Add methods to the class if needed
    // For example, you can add a method to convert the structure to JSON
    cb.methods.add(
      Method(
        (mb) {
          mb
            ..name = 'toJson'
            ..returns = refer('Map<String, dynamic>')
            ..body = const Code('return {};');
        },
      ),
    );
  }

  Class _generateClassFromStructure(MetaStructure structure) {
    if (structure.name.isEmpty) {
      throw ArgumentError('Structure name cannot be empty');
    }

    final formattedDescription =
        formatDocComment(structure.documentation) ?? [];

    final clazz = Class((cb) {
      cb
        ..docs.addAll(formattedDescription)
        ..name = structure.name
        ..extend = toJsonClassRef;

      if (generateMethods) {
        _generateMethods(cb, structure);
      }

      if (generateFields) {
        _addStructFields(cb, structure);
      }
    });

    return clazz;
  }

  String _resolveTypeName(String typeName) {
    final structure = _structures[typeName];

    if (structure != null) {
      // If the type is a structure, return its name
      return structure.name;
    }

    final enumeration = _enumerations[typeName];
    if (enumeration != null) {
      // If the type is an enumeration, return its name
      return 'Object?';
    }

    // Resolve type names to their Dart equivalents
    switch (typeName) {
      case 'integer' || 'uinteger':
        return 'int';
      case 'decimal':
        return 'double';
      case 'string':
        return 'String';
      case 'boolean':
        return 'bool';
      case 'null':
        return 'Object?';
      case 'URI' || 'DocumentUri':
        return 'Uri';
      default:
        return typeName; // Assume it's a custom type
    }
  }
}
