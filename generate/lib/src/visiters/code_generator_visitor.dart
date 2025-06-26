// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/protocol.dart';
import '../utils.dart';
import 'type_resolver_visitor.dart';
import 'visitor.dart';

/// A concrete visitor that generates Dart code from MetaProtocol.
class DartCodeGeneratorVisitor implements MetaProtocolVisitor<Spec> {
  // Pass protocol for initial setup, but main logic is in visit methods
  DartCodeGeneratorVisitor(this.protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ),
      _enumerations = Map.fromEntries(
        protocol.enumerations.map((e) => MapEntry(e.name, e)),
      ),
      _literals = {} {
    // Initialize the type resolver with the known structures and enumerations

    _typeResolverVisitor = TypeResolverVisitor(
      _structures,
      _enumerations,
      _literals,
    );

    void collectLiterals(MetaProperty property, String prefix) {
      if (property.type is LiteralRef) {
        final ref = property.type as LiteralRef;

        // Check if the literal is already collected
        if (_literals.containsKey(ref)) {
          return; // Already collected, skip
        }

        final typeName = '$prefix${capitalize(property.name)}';

        _literals[ref] = (
          name: typeName,
          properties: ref.value.properties,
          documentation: property.documentation,
        );

        if (ref.value.properties.isNotEmpty) {
          // Recursively collect properties of the literal
          for (final subProperty in ref.value.properties) {
            collectLiterals(subProperty, typeName);
          }
        }
      }
    }

    for (final structure in protocol.structures) {
      for (final property in structure.properties) {
        collectLiterals(property, structure.name);
      }
    }
  }

  final MetaProtocol protocol;

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;
  final Map<LiteralRef, MetaLiteralDefinition> _literals;

  late final TypeResolverVisitor _typeResolverVisitor;

  final Map<String, Map<String, MetaProperty>> _collectedPropertiesCache = {};

  Reference get toJsonClassRef => refer('ToJson');

  @override
  Library visitProtocol(MetaProtocol protocol) => Library(
    (b) {
      b.docs.addAll(_header());

      // Generate the base class for JSON serialization
      b.body.add(_generateToJsonClass());

      // Generate the OrRef class
      b.body.add(_generateOrRefClass());

      // Generate type aliases
      for (final typeAlias in protocol.typeAliases) {
        b.body.add(visitTypeAlias(typeAlias));
      }

      // Generate classes from structures
      for (final structure in protocol.structures) {
        // Collect literals embedded in structures
        b.body.add(visitStructure(structure));
      }

      // Generate enums
      for (final enumeration in protocol.enumerations) {
        b.body.add(visitEnumeration(enumeration));
      }

      // Generate literal classes (after collecting them from structures)
      for (final literal in _literals.values) {
        // Create a MetaLiteralDefinition from the collected data
        b.body.add(visitLiteralDefinition(literal));
      }

      for (final request in protocol.requests) {
        // Use the visitor to generate the class for the request
        b.body.add(visitRequest(request));
      }

      for (final notification in protocol.notifications) {
        // Use the visitor to generate the class for the notification
        b.body.add(visitNotification(notification));
      }
    },
  );

  @override
  TypeDef visitTypeAlias(MetaTypeAlias typeAlias) {
    final typeName = typeAlias.type.resolveType(_typeResolverVisitor);

    return TypeDef((b) {
      b
        ..docs.addAll(formatDocComment(typeAlias.documentation) ?? [])
        ..name = typeAlias.name
        ..definition = refer(typeName);
    });
  }

  @override
  Class visitLiteralDefinition(MetaLiteralDefinition literalDefinition) {
    final formattedDescription =
        formatDocComment(literalDefinition.documentation) ?? [];
    return Class((cb) {
      cb
        ..docs.addAll(formattedDescription)
        ..name = literalDefinition.name;

      _addStructFields(
        cb: cb,
        allFields: literalDefinition.properties,
        inheritedPropertyNames: {},
      );

      _generateMethods(cb);
    });
  }

  @override
  Class visitStructure(MetaStructure structure) {
    final allPropertiesMap = _collectAllProperties(structure);
    final allFields = allPropertiesMap.values.toList(growable: false)
      ..sort((a, b) => a.name.compareTo(b.name));

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
    Code('// MetaRequest visitor not implemented for generation\n'),
  );

  @override
  Spec visitNotification(MetaNotification notification) => const CodeExpression(
    Code('// MetaNotification visitor not implemented for generation\n'),
  );

  @override
  Spec visitProperty(MetaProperty property) => const CodeExpression(
    Code('// MetaProperty visitor not implemented for generation\n'),
  );

  @override
  Spec visitEnumMember(MetaEnumMember enumMember) => const CodeExpression(
    Code('// MetaEnumMember visitor not implemented for generation\n'),
  );

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

  /// Generate Or Ref class.
  Class _generateOrRefClass() => Class((cb) {
    cb
      ..name = 'OrRefType'
      ..sealed = true;
  });

  /// Recursively collects all properties for a given structure,
  /// including those inherited from extended structures and mixins.
  /// Returns a map where keys are property names and values are MetaProperty
  /// objects.
  Map<String, MetaProperty> _collectAllProperties(MetaStructure structure) {
    if (_collectedPropertiesCache.containsKey(structure.name)) {
      return _collectedPropertiesCache[structure.name]!;
    }

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

    _collectedPropertiesCache[structure.name] = collectedProperties;

    return collectedProperties;
  }

  void _addStructFields({
    required ClassBuilder cb,
    required List<MetaProperty> allFields,
    required Set<String> inheritedPropertyNames,
  }) {
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
  Class visitLiteral(MetaLiteral literal) => throw UnimplementedError();

  @override
  Spec visitAndRef(AndRef ref) => throw UnimplementedError();

  @override
  Spec visitArrayRef(ArrayRef ref) => throw UnimplementedError();

  @override
  Spec visitBaseRef(BaseRef ref) => throw UnimplementedError();

  @override
  Spec visitLiteralRef(LiteralRef ref) => throw UnimplementedError();

  @override
  Spec visitMapRef(MapRef ref) => throw UnimplementedError();

  @override
  Spec visitOrRef(OrRef ref) => throw UnimplementedError();

  @override
  Spec visitStringLiteralRef(StringLiteralRef ref) =>
      throw UnimplementedError();

  @override
  Spec visitTupleRef(TupleRef ref) => throw UnimplementedError();

  @override
  Spec visitTypeRef(TypeRef ref) => throw UnimplementedError();
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
