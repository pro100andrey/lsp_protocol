// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/converters/int_or_string_converter.dart';
import '../meta/protocol.dart';
import 'utils.dart';

typedef LiteralDefinition = ({String name, List<MetaProperty> properties});

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

        final literals = <LiteralDefinition>[];

        // Generate classes from structures
        for (final structure in protocol.structures) {
          final allPropertiesMap = _collectAllProperties(structure);
          final allFields = allPropertiesMap.values.toList(growable: false);

          for (final property in allFields) {
            if (property.type case LiteralRef(:final value)) {
              final typeName = '${structure.name}${capitalize(property.name)}';

              literals.add((name: typeName, properties: value.properties));
            }
          }

          final inheritedPropertyNames = <String>{};
          // Get property names directly defined in the current structure
          final directPropertyNames = structure.properties
              .map((p) => p.name)
              .toSet();

          for (final propertyName in allPropertiesMap.keys) {
            // If a property is in the *final* list of all properties but not
            // directly  defined by 'this' structure, it must be inherited.
            if (!directPropertyNames.contains(propertyName)) {
              inheritedPropertyNames.add(propertyName);
            }
          }

          final clazz = _generateClassFromStructure(
            structure: structure,
            allFields: allFields,
            inheritedPropertyNames: inheritedPropertyNames,
          );

          b.body.add(clazz);
        }

        for (final enumeration in protocol.enumerations) {
          b.body.add(_generateEnumFromEnumeration(enumeration));
        }

        for (final literal in literals) {
          b.body.add(_generateLiteralClass(literal));
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

  Class _generateLiteralClass(LiteralDefinition literal) => Class((b) {
    b
      ..name = literal.name
      ..fields.addAll(
        literal.properties.map(
          (p) => Field((b) {
            b
              ..name = p.name
              ..type = refer(_resolveReferenceName(p.type));
          }),
        ),
      );
  });

  TypeDef _generateTypeAlias(MetaTypeAlias typeAlias) => TypeDef((b) {
    final typeName = _resolveReferenceName(typeAlias.type);

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

  /// Recursively collects all properties for a given structure,
  /// including those inherited from extended structures and mixins.
  /// Returns a map where keys are property names and values are MetaProperty
  /// objects.
  Map<String, MetaProperty> _collectAllProperties(MetaStructure structure) {
    final collectedProperties = <String, MetaProperty>{};

    // Start with properties from extended structures/mixins (bottom-up approach)
    // This ensures properties defined higher in the hierarchy are considered
    // first so that more specific definitions (lower in hierarchy) can override
    // them.

    // Collect from extended structures
    for (final extendRef in structure.extends$) {
      final extendedStructure = _structures[_resolveReferenceName(extendRef)];
      if (extendedStructure != null) {
        // Recursively get properties from the extended structure
        final parentProperties = _collectAllProperties(extendedStructure);
        collectedProperties.addAll(parentProperties);
      }
    }

    // Collect from mixins
    for (final mixinRef in structure.mixins$) {
      // Assuming mixins$ is correct
      final mixinStructure = _structures[_resolveReferenceName(mixinRef)];
      if (mixinStructure != null) {
        // Recursively get properties from the mixin
        final mixinProperties = _collectAllProperties(mixinStructure);
        collectedProperties.addAll(mixinProperties);
      }
    }

    // Add properties directly defined in the current structure.
    // These will override any properties with the same name from parents/mixins.
    for (final property in structure.properties) {
      collectedProperties[property.name] = property;
    }

    return collectedProperties;
  }

  void _addStructFields({
    required ClassBuilder cb,
    required MetaStructure structure,
    required List<MetaProperty> allFields,
    required Set<String> inheritedPropertyNames,
  }) {
    // Determine which fields are inherited for the @override annotation

    allFields.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    cb.fields.addAll(
      allFields.map(
        (property) {
          final propDocs =
              formatDocComment(property.documentation, maxLineLength: 76) ?? [];

          final propType = _resolveReferenceName(property.type);
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

  Class _generateClassFromStructure({
    required MetaStructure structure,
    required List<MetaProperty> allFields,
    required Set<String> inheritedPropertyNames,
  }) {
    final isInherited =
        structure.extends$.isNotEmpty || structure.mixins$.isNotEmpty;

    final toImplements = [
      if (!isInherited) toJsonClassRef,

      ...structure.extends$.map((e) => refer(_resolveReferenceName(e))),
      ...structure.mixins$.map((m) => refer(_resolveReferenceName(m))),
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
        _addStructFields(
          cb: cb,
          structure: structure,
          allFields: allFields,
          inheritedPropertyNames: inheritedPropertyNames,
        );
      }
    });

    return clazz;
  }

  Enum _generateEnumFromEnumeration(MetaEnumeration enumeration) {
    final formattedDescription =
        formatDocComment(enumeration.documentation) ?? [];
    final typeName = _resolveDartTypeName(enumeration.type.name);

    return Enum((eb) {
      eb
        ..docs.addAll(formattedDescription)
        ..name = enumeration.name
        ..constructors.add(
          Constructor(
            (ecb) {
              ecb
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (pb) {
                      pb
                        ..name = 'value'
                        ..named = true
                        ..toThis = true;
                    },
                  ),
                )
                ..docs.add('// The list of all values in this enumeration.');
            },
          ),
        );

      eb.fields.add(
        Field(
          (fb) {
            fb
              ..name = 'value'
              ..modifier = FieldModifier.final$
              ..type = refer(typeName)
              ..docs.add('// The type of this enumeration.');
          },
        ),
      );

      for (final value in enumeration.values) {
        eb.values.add(
          EnumValue(
            (evb) {
              final argumentValue = switch (value.value) {
                IsInt(:final value) => '$value',
                IsString(:final value) => "'$value'",
              };

              evb.arguments.add(
                refer(
                  argumentValue,
                ),
              );
              evb.name = '${uncapitalize(value.name)}Value';
            },
          ),
        );
      }
    });
  }

  String _resolveReferenceName(MetaReference reference) {
    final typeName = switch (reference) {
      TypeRef(name: final name) => name,
      ArrayRef(element: TypeRef(name: final name)) => 'List<$name>',
      ArrayRef(element: BaseRef(name: final name)) =>
        'List<${_resolveDartTypeName(name)}>',
      ArrayRef(element: OrRef()) => 'List<Object>',
      ArrayRef(element: LiteralRef()) => 'List<Literal>',
      StringLiteralRef() => 'String',
      OrRef(items: final items) => 'Object',
      BaseRef(name: final name) => name,
      LiteralRef(value: final value) => 'Object?',
      MapRef(
        key: TypeRef(name: final keyName),
        value: final valueRef,
      ) =>
        'Map<${_resolveDartTypeName(keyName)}, ${_resolveReferenceName(valueRef)}>',

      _ => throw ArgumentError(
        'Unsupported reference type: ${reference.runtimeType}',
      ),
    };

    final isOptional = reference.optional;

    if (typeName.isEmpty) {
      throw ArgumentError('Reference name cannot be empty');
    }

    return _resolveDartTypeName(typeName, isOptional: isOptional);
  }

  String _resolveDartTypeName(String typeName, {bool isOptional = false}) {
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

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String uncapitalize(String s) => s[0].toLowerCase() + s.substring(1);
