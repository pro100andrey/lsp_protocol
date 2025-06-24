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

  bool get _isGenerateFields => true;
  bool get _isGenerateMethods => true;

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

  TypeDef _generateTypeAlias(MetaTypeAlias typeAlias) => TypeDef((b) {
    final typeName = resolveReferenceName(typeAlias.type);

    b
      ..name = typeAlias.name
      ..definition = refer(
        _resolveDartTypeName(
          typeName,
          isOptional: typeAlias.optional,
        ),
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
    final processedPropertyNames = <String>{};
    final allFields = <MetaProperty>[];

    // Add properties directly defined in the current structure
    for (final property in structure.properties) {
      allFields.add(property);
      processedPropertyNames.add(property.name);
    }

    // Properties from extended structures (implements/mixins implicitly often)
    // Add properties from extended structures
    final inheritedPropertyNames = <String>{};

    // Add properties from extended structures
    for (final extendRef in structure.extends$) {
      final extendedStructure = _structures[resolveReferenceName(extendRef)];

      if (extendedStructure != null) {
        for (final property in extendedStructure.properties) {
          if (!processedPropertyNames.contains(property.name)) {
            allFields.add(property);
            processedPropertyNames.add(property.name);
            inheritedPropertyNames.add(property.name);
          }
        }
      }
    }

    // Add properties from mixins
    for (final mixinRef in structure.mixins$) {
      final mixinStructure = _structures[resolveReferenceName(mixinRef)];
      if (mixinStructure != null) {
        for (final property in mixinStructure.properties) {
          if (!processedPropertyNames.contains(property.name)) {
            allFields.add(property);
            processedPropertyNames.add(property.name);
            inheritedPropertyNames.add(property.name);
          }
        }
      }
    }

    allFields.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    String resolveFieldType(MetaProperty property) {
      return 'Object';
      // final type = property.type;
      // if (type.name == null && type.kind == TypeKind.or) {
      //   final t1 = type.items!.first;

      //   return _resolveDartTypeName(t1.name!, isOptional: t1.optional ?? false);
      // }

      // if (type.kind == TypeKind.array) {
      //   final itemType = type.element;
      //   final dartType = _resolveDartTypeName(
      //     itemType.name!,
      //     isOptional: itemType.optional ?? false,
      //   );
      //   return 'List<$dartType>';
      // }

      // if (type.kind == TypeKind.map) {
      //   final keyType = type.key;
      //   final valueType = type.value;
      //   // final dartKeyType = _resolveDartTypeName(
      //   //   keyType.name!,
      //   //   isOptional: keyType.optional ?? false,
      //   // );
      //   // final dartValueType = _resolveDartTypeName(
      //   //   valueType.name!,
      //   //   isOptional: valueType.optional ?? false,
      //   // );
      //   return 'Map<String, String>';
      // }

      // return _resolveDartTypeName(
      //   property.type.name,
      //   isOptional: property.optional ?? false,
      // );
    }

    cb.fields.addAll(
      allFields.map(
        (property) {
          final propDocs =
              formatDocComment(property.documentation, maxLineLength: 76) ?? [];
          final propType = resolveFieldType(property);
          final propName = property.name;

          return Field(
            (fb) {
              fb
                ..docs.addAll(propDocs)
                ..modifier = FieldModifier.final$
                ..name = propName
                ..type = refer(propType);
              // Add @override annotation if the field is inherited
              if (inheritedPropertyNames.contains(propName)) {
                fb.annotations.add(refer('override'));
              }
            },
          );
        },
      ),
    );

    cb.constructors.add(
      Constructor((cb) {
        cb.optionalParameters.addAll(
          allFields.map(
            (property) => Parameter((pb) {
              pb
                ..name = property.name
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
            ..annotations.add(refer('override'))
            ..returns = refer('Map<String, dynamic>')
            ..body = const Code('return {};');
        },
      ),
    );
  }

  String resolveReferenceName(MetaReference reference) {
    final typeName = switch (reference) {
      TypeRef(name: final name) => name,
      ElementRef(element: TypeRef(name: final name)) => 'List<$name>',
      OrRef(items: final items) => 'Object',
      BaseRef(name: final name) => name,
      LiteralRef(value: final value) => 'Literal',
      MapRef(
        key: TypeRef(name: final keyName),
        value: final valueRef,
      ) =>
        'Map<${_resolveDartTypeName(keyName, isOptional: false)}, ${resolveReferenceName(valueRef)}>',
      _ => throw ArgumentError(
        'Unsupported reference type: ${reference.runtimeType}',
      ),
    };

    final isOptional = reference is ElementRef && reference.optional;

    if (typeName.isEmpty) {
      throw ArgumentError('Reference name cannot be empty');
    }

    return _resolveDartTypeName(typeName, isOptional: isOptional);
  }

  Class _generateClassFromStructure(MetaStructure structure) {
    if (structure.name.isEmpty) {
      throw ArgumentError('Structure name cannot be empty');
    }

    final toImplements = [
      toJsonClassRef,
      ...structure.extends$.map((e) => refer(resolveReferenceName(e))),
      ...structure.mixins$.map((m) => refer(resolveReferenceName(m))),
    ];

    final formattedDescription =
        formatDocComment(structure.documentation) ?? [];

    final clazz = Class((cb) {
      cb
        ..docs.addAll(formattedDescription)
        ..name = structure.name;

      cb.implements.addAll(toImplements);

      if (_isGenerateMethods) {
        _generateMethods(cb, structure);
      }

      if (_isGenerateFields) {
        _addStructFields(cb, structure);
      }
    });

    return clazz;
  }

  String _resolveDartTypeName(String typeName, {required bool isOptional}) {
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
    final type = switch (typeName) {
      'integer' || 'uinteger' => 'int',
      'decimal' => 'double',
      'string' => 'String',
      'boolean' => 'bool',
      'null' => 'String',
      'URI' || 'DocumentUri' => 'Uri',
      _ => typeName,
    };

    return isOptional ? '$type?' : type;
  }
}
