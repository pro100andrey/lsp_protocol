// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../converters/int_or_string_converter.dart';
import '../protocol.dart';
import 'type_resolver_visitor.dart'; // Import the new type resolver

typedef LiteralDefinition = ({String name, List<MetaProperty> properties});

/// A concrete visitor that generates Dart code from MetaProtocol.
class DartCodeGeneratorVisitor implements MetaProtocolVisitor<Spec> {
  // Pass protocol for initial setup, but main logic is in visit methods
  DartCodeGeneratorVisitor(this.protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ),
      _enumerations = Map.fromEntries(
        protocol.enumerations.map((e) => MapEntry(e.name, e)),
      ) {
    // Initialize the type resolver with the known structures and enumerations
    _typeResolverVisitor = TypeResolverVisitor(_structures, _enumerations);
  }

  final MetaProtocol protocol;

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  late final TypeResolverVisitor _typeResolverVisitor;
  final List<LiteralDefinition> _literalsToGenerate = [];

  Reference get toJsonClassRef => refer('ToJson');

  @override
  Library visitProtocol(MetaProtocol protocol) => Library(
    (b) {
      b.docs.addAll(_header());

      // Generate the base class for JSON serialization
      b.body.add(_generateToJsonClass());

      // Generate type aliases
      for (final typeAlias in protocol.typeAliases) {
        b.body.add(visitTypeAlias(typeAlias));
      }

      // Generate classes from structures
      for (final structure in protocol.structures) {
        // Collect literals embedded in structures
        final allPropertiesMap = _collectAllProperties(structure);
        for (final property in allPropertiesMap.values) {
          if (property.type case LiteralRef(:final value)) {
            final typeName = '${structure.name}${capitalize(property.name)}';
            _literalsToGenerate.add((
              name: typeName,
              properties: value.properties,
            ));
          }
        }
        b.body.add(visitStructure(structure));
      }

      // Generate enums
      for (final enumeration in protocol.enumerations) {
        b.body.add(visitEnumeration(enumeration));
      }

      // Generate literal classes (after collecting them from structures)
      for (final literal in _literalsToGenerate) {
        // We need to wrap the generated class within a ClassBuilder to assign
        // a name
        final generatedLiteralClass = _generateLiteralClass(literal);
        b.body.add(generatedLiteralClass);
      }
    },
  );

  @override
  Class visitLiteral(MetaLiteral literal) => Class((b) {
    // Name will be assigned when adding to library body from
    // _literalsToGenerate
    b.fields.addAll(
      literal.properties.map(
        (p) => Field((fb) {
          fb
            ..name = p.name
            ..type = refer(
              p.type.resolveType(_typeResolverVisitor),
            ); // Use resolveType
        }),
      ),
    );
  });

  @override
  TypeDef visitTypeAlias(MetaTypeAlias typeAlias) {
    final typeName = typeAlias.type.resolveType(
      _typeResolverVisitor,
    ); // Use resolveType
    return TypeDef((b) {
      b
        ..name = typeAlias.name
        ..definition = refer(typeName); // typeName already includes optionality
    });
  }

  @override
  Class visitStructure(MetaStructure structure) {
    final allPropertiesMap = _collectAllProperties(structure);
    final allFields = allPropertiesMap.values.toList(growable: false);

    final inheritedPropertyNames = <String>{};
    final directPropertyNames = structure.properties.map((p) => p.name).toSet();

    for (final propertyName in allPropertiesMap.keys) {
      if (!directPropertyNames.contains(propertyName)) {
        inheritedPropertyNames.add(propertyName);
      }
    }

    final isInherited =
        structure.extends$.isNotEmpty || structure.mixins$.isNotEmpty;

    final toImplements = [
      if (!isInherited) toJsonClassRef,
      // Use resolveType for extends and mixins references
      ...structure.extends$.map(
        (e) => refer(e.resolveType(_typeResolverVisitor)),
      ),
      ...structure.mixins$.map(
        (m) => refer(m.resolveType(_typeResolverVisitor)),
      ),
    ];

    final formattedDescription =
        formatDocComment(structure.documentation) ?? [];

    return Class((cb) {
      cb
        ..docs.addAll(formattedDescription)
        ..name = structure.name
        ..implements.addAll(toImplements);

      _addStructFields(
        cb: cb,
        allFields: allFields,
        inheritedPropertyNames: inheritedPropertyNames,
      );
      _generateMethods(cb);
    });
  }

  @override
  Enum visitEnumeration(MetaEnumeration enumeration) {
    final formattedDescription =
        formatDocComment(enumeration.documentation) ?? [];
    // Use resolveType for the enumeration's base type
    final typeName = enumeration.type.resolveType(_typeResolverVisitor);

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

  // --- MetaProtocolVisitor stub implementations
  // (not used for direct generation here) ---
  @override
  Spec visitMetaData(MetaData metaData) => const CodeExpression(
    Code('// MetaData visitor not implemented for generation'),
  );

  @override
  Spec visitRequest(MetaRequest request) => const CodeExpression(
    Code('// MetaRequest visitor not implemented for generation'),
  );

  @override
  Spec visitNotification(MetaNotification notification) => const CodeExpression(
    Code('// MetaNotification visitor not implemented for generation'),
  );

  @override
  Spec visitProperty(MetaProperty property) => const CodeExpression(
    Code('// MetaProperty visitor not implemented for generation'),
  );

  @override
  Spec visitEnumMember(MetaEnumMember enumMember) => const CodeExpression(
    Code('// MetaEnumMember visitor not implemented for generation'),
  );

  // --- Helper Methods (moved from old ProtocolGenerator) ---

  Class _generateLiteralClass(LiteralDefinition literal) => Class((b) {
    b
      ..name = literal.name
      ..fields.addAll(
        literal.properties.map(
          (p) => Field((b) {
            b
              ..name = p.name
              ..type = refer(
                p.type.resolveType(_typeResolverVisitor),
              ); // Use resolveType
          }),
        ),
      );
  });

  List<String> _header() => [
    '/// Do not edit it manually.',
    '///',
    '/// To regenerate, run `dart run lsp_meta:generate`.',
    '',
    '// ignore_for_file: prefer_expression_function_bodies',
    '// ignore_for_file: one_member_abstracts',
    '// ignore_for_file: unused_element',
    '// ignore_for_file: doc_directive_unknown',
    '// ignore_for_file: directives_ordering', // Added for better formatting
  ];

  /// Generates the base ToJson class.
  Class _generateToJsonClass() => Class((cb) {
    cb
      ..name = toJsonClassRef.symbol
      ..abstract = true
      ..methods.add(
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

  /// Recursively collects all properties for a given structure,
  /// including those inherited from extended structures and mixins.
  /// Returns a map where keys are property names and values are MetaProperty
  /// objects.
  Map<String, MetaProperty> _collectAllProperties(MetaStructure structure) {
    final collectedProperties = <String, MetaProperty>{};

    // Collect from extended structures first (bottom-up)
    for (final extendRef in structure.extends$) {
      // Use type resolver to get the name
      final extendedStructureName = extendRef.resolveType(_typeResolverVisitor);
      final extendedStructure = _structures[extendedStructureName];
      if (extendedStructure != null) {
        final parentProperties = _collectAllProperties(extendedStructure);
        collectedProperties.addAll(parentProperties);
      }
    }

    // Collect from mixins
    for (final mixinRef in structure.mixins$) {
      // Use type resolver to get the name
      final mixinStructureName = mixinRef.resolveType(_typeResolverVisitor);
      final mixinStructure = _structures[mixinStructureName];
      if (mixinStructure != null) {
        final mixinProperties = _collectAllProperties(mixinStructure);
        collectedProperties.addAll(mixinProperties);
      }
    }

    // Add properties directly defined in the current structure (override parents/mixins)
    for (final property in structure.properties) {
      collectedProperties[property.name] = property;
    }

    return collectedProperties;
  }

  void _addStructFields({
    required ClassBuilder cb,
    required List<MetaProperty> allFields,
    required Set<String> inheritedPropertyNames,
  }) {
    allFields.sort((a, b) => a.name.compareTo(b.name));

    cb.fields.addAll(
      allFields.map(
        (property) {
          final propDocs =
              formatDocComment(property.documentation, maxLineLength: 76) ?? [];

          // Use the type resolver for property types
          final propType = property.type.resolveType(_typeResolverVisitor);
          final propName = property.name;

          return Field(
            (fb) {
              fb
                ..docs.addAll(propDocs)
                ..modifier = FieldModifier.final$
                ..name = propName
                ..type = refer(propType);
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

  void _generateMethods(ClassBuilder cb) {
    cb.methods.add(
      Method(
        (mb) {
          // TODO: implement visitTypeRef
          mb
            ..name = 'toJson'
            ..annotations.add(refer('override'))
            ..returns = refer('Map<String, dynamic>')
            ..body = const Code('return {};'); // Implement toJson logic here
        },
      ),
    );
  }

  @override
  Spec visitAndRef(AndRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitArrayRef(ArrayRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitBaseRef(BaseRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitLiteralRef(LiteralRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitMapRef(MapRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitOrRef(OrRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitStringLiteralRef(StringLiteralRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitTupleRef(TupleRef ref) {
    throw UnimplementedError();
  }

  @override
  Spec visitTypeRef(TypeRef ref) {
    throw UnimplementedError();
  }
}

/// The main entry point for the protocol generation.
/// Orchestrates the visitation process.
class ProtocolGenerator {
  ProtocolGenerator(this.protocol);

  final MetaProtocol protocol;

  String generate() {
    final generatorVisitor = DartCodeGeneratorVisitor(protocol);
    // Start the visitation process from the root MetaProtocol object
    final library = protocol.accept(generatorVisitor) as Library;

    final emitter = DartEmitter(allocator: Allocator.simplePrefixing());
    final formatter = DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
      pageWidth: DartFormatter.defaultPageWidth,
    );

    final dartCode = library.accept(emitter).toString();
    final result = formatter.format(dartCode);

    return result;
  }
}

// Utility functions (assuming they are in 'utils.dart' or can be placed here)
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String uncapitalize(String s) => s[0].toLowerCase() + s.substring(1);

List<String>? formatDocComment(
  String? documentation, {
  int maxLineLength = 80,
}) {
  if (documentation == null || documentation.trim().isEmpty) {
    return null;
  }

  final lines = <String>[];
  final words = documentation.split(' ');
  var currentLine = StringBuffer('///');

  for (final word in words) {
    if ((currentLine.length + word.length + 1) > maxLineLength) {
      lines.add(currentLine.toString().trimRight());
      currentLine = StringBuffer('/// $word');
    } else {
      currentLine.write(' $word');
    }
  }
  lines.add(currentLine.toString().trimRight());

  return lines;
}
