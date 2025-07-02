import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import '../meta/protocol.dart';
import '../utils.dart';
import 'type_resolver_visitor.dart';
import 'visitor.dart';

/// A concrete visitor that generates Dart code from MetaProtocol.
class DartCodeGeneratorVisitor implements MetaProtocolVisitor<Spec> {
  // Pass protocol for initial setup, but main logic is in visit methods
  DartCodeGeneratorVisitor(MetaProtocol protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ),
      _enumerations = Map.fromEntries(
        protocol.enumerations.map((e) => MapEntry(e.name, e)),
      ),
      _literals = {} {
    // Collect all properties from structures and literals
    for (final structure in protocol.structures) {
      for (final property in structure.properties) {
        _collectLiterals(property, structure.name);
      }
    }

    _typeResolverVisitor = TypeResolverVisitor(
      _structures,
      _enumerations,
      _literals,
    );
  }

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;
  final Map<LiteralRef, MetaLiteralDefinition> _literals;

  late final TypeResolverVisitor _typeResolverVisitor;

  Reference get _toJsonRef => refer('ToJson');
  Reference get _orRefTypeRef => refer('OrRefType');
  Reference get _jsonRef => refer('json');
  Reference get _fromJsonMethodRef => refer('fromJson');
  Reference get _toJsonMethodRef => refer('toJson');
  Reference get _overrideRef => refer('override');
  Reference get _stringRef => refer('String');
  Reference get _mapJsonRef => refer('Map<String, Object?>');

  @override
  Library visitProtocol(MetaProtocol protocol) => Library(
    (b) {
      // Generate default header comments
      b.docs.addAll(_header());

      b.body.add(_generateMethodEnum(protocol.requests));
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
        b.body.add(visitStructure(structure));
      }
      // Generate enums
      for (final enumeration in protocol.enumerations) {
        b.body.add(visitEnumeration(enumeration));
        b.body.add(_generateEnumMap(enumeration));
      }
      // Generate literal classes
      for (final literal in _literals.values) {
        b.body.add(visitLiteralDefinition(literal));
      }
      // Generate notifications

      // for (final notification in protocol.notifications) {
      //   b.body.add(visitNotification(notification));
      // }
    },
  );

  List<String> _header() => [
    '/// Do not edit it manually.',
    '',
    '// ignore_for_file: one_member_abstracts',
    '// ignore_for_file: doc_directive_unknown',
    '// ignore_for_file: unnecessary_parenthesis',
    '// ignore_for_file: lines_longer_than_80_chars',
    '// ignore_for_file: unused_element',
  ];

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
        ..docs.addAll(['/// Literal'] + formattedDescription)
        ..name = literalDefinition.name
        ..implements.add(_toJsonRef);

      _generateFields(
        cb: cb,
        allFields: literalDefinition.properties,
        inheritedPropertyNames: {},
      );

      _generateFromJsonFactory(cb: cb, allFields: literalDefinition.properties);

      _generateToJson(cb: cb, allFields: literalDefinition.properties);
    });
  }

  @override
  Class visitStructure(MetaStructure structure) {
    final allPropertiesMap = _collectAllProperties(structure);
    final allFields = allPropertiesMap.values.toList(growable: false)
      ..sort((a, b) => a.optional ? 1 : 0);

    final inheritedPropertyNames = _collectInheritedProperties(
      structure,
    ).keys.toSet();

    final isInherited =
        structure.extends$.isNotEmpty || structure.mixins$.isNotEmpty;

    final toImplements = [
      if (!isInherited) _toJsonRef,
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
        ..docs.addAll(['/// Struct'] + formattedDescription)
        ..name = structure.name
        ..implements.addAll(toImplements);

      _generateFields(
        cb: cb,
        allFields: allFields,
        inheritedPropertyNames: inheritedPropertyNames,
      );

      _generateFromJsonFactory(cb: cb, allFields: allFields);

      _generateToJson(cb: cb, allFields: allFields);
    });
  }

  void _collectLiterals(MetaProperty property, String prefix) {
    // remove first letter from prefix if equal to '_'
    final fixedPrefix = prefix.startsWith('_') ? prefix.substring(1) : prefix;

    if (property.type is ArrayRef) {
      final ref = property.type as ArrayRef;

      if (ref.element is LiteralRef) {
        final literalRef = ref.element as LiteralRef;
        _processLiteralRef(literalRef, property, fixedPrefix);
      }
    }

    if (property.type is LiteralRef) {
      final ref = property.type as LiteralRef;
      _processLiteralRef(ref, property, fixedPrefix);
    }
  }

  void _processLiteralRef(
    LiteralRef literalRef,
    MetaProperty containingProperty,
    String parentTypeName,
  ) {
    if (_literals.containsKey(literalRef)) {
      return;
    }

    final typeName =
        '$parentTypeName${upperFirstLetter(containingProperty.name)}';

    // Store the literal definition
    _literals[literalRef] = (
      name: typeName,
      properties: literalRef.value.properties,
      documentation: containingProperty.documentation,
    );

    // Recursively collect nested literals within this new literal's properties
    for (final subProperty in literalRef.value.properties) {
      _collectLiterals(subProperty, typeName);
    }
  }

  Spec _generateMethodEnum(List<MetaRequest> requests) => Enum((eb) {
    eb
      ..name = 'Method'
      ..docs.add('/// This class contains methods for handling requests.')
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
              ..docs.add('// The list of all methods in this enumeration.');
          },
        ),
      )
      ..fields.add(
        Field(
          (fb) {
            fb
              ..name = 'value'
              ..modifier = FieldModifier.final$
              ..type = _stringRef
              ..docs.add('// The type of this enumeration.');
          },
        ),
      );

    for (final request in requests) {
      final method = _getMethodName(request);
      final methodPath = request.method;

      eb.values.add(
        EnumValue((evb) {
          evb.name = method;
          evb.arguments.add(literalString(methodPath));
          evb.docs.add('/// Method: $methodPath');
        }),
      );
    }
  });

  String _getMethodName(MetaRequest request) {
    final parts = request.method.split('/').map(upperFirstLetter).join();

    return lowerFirstLetter(parts);
  }

  @override
  Enum visitEnumeration(MetaEnumeration enumeration) {
    final formattedDescription =
        formatDocComment(enumeration.documentation) ?? [];
    // Use resolveType for the enumeration's base type
    final typeName = enumeration.type.resolveType(_typeResolverVisitor);

    final result = Enum((eb) {
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

      for (final m in enumeration.values) {
        eb.values.add(
          EnumValue(
            (evb) {
              evb.arguments.add(refer(m.value.literal));
              evb.name = '${lowerFirstLetter(m.name)}Value';
            },
          ),
        );
      }
    });

    return result;
  }

  /// Generate enumeration helper function.
  Spec _generateEnumMap(MetaEnumeration enumeration) {
    final refName = '_\$${enumeration.name}EnumMap';

    final entries = enumeration.values.map(
      (m) => MapEntry(
        refer('${enumeration.name}.${lowerFirstLetter(m.name)}Value'),
        refer(m.value.literal),
      ),
    );

    final map = Map.fromEntries(entries);
    final mapLiteral = literalConstMap(map);

    return declareConst(refName).assign(mapLiteral).statement;
  }

  @override
  Spec visitNotification(MetaNotification notification) => const CodeExpression(
    Code('// MetaNotification visitor not implemented for generation\n'),
  );

  // --- MetaProtocolVisitor stub implementations
  // (not used for direct generation here) ---
  @override
  Spec visitMetaData(MetaData metaData) => const CodeExpression(
    Code('// MetaData visitor not implemented for generation'),
  );

  @override
  Spec visitRequest(MetaRequest request) {
    throw UnimplementedError(
      'MetaRequest visitor not implemented for generation: ${request.method}',
    );
  }

  @override
  Spec visitProperty(MetaProperty property) => const CodeExpression(
    Code('// MetaProperty visitor not implemented for generation\n'),
  );

  @override
  Spec visitEnumMember(MetaEnumMember enumMember) => const CodeExpression(
    Code('// MetaEnumMember visitor not implemented for generation\n'),
  );

  /// Generates the base ToJson class.
  Class _generateToJsonClass() => Class((cb) {
    cb
      ..name = _toJsonRef.symbol
      ..abstract = true
      ..methods.add(
        Method(
          (mb) {
            mb
              ..name = _toJsonMethodRef.symbol
              ..docs.add(
                '/// Converts this object to a JSON map.',
              )
              ..returns = refer('Map<String, dynamic>')
              ..body = const Code('throw UnimplementedError();');
          },
        ),
      );
  });

  /// Generate Or Ref class.
  Class _generateOrRefClass() => Class((cb) {
    cb
      ..docs.add(
        '/// Represents a reference type that can be one of multiple types.',
      )
      ..name = _orRefTypeRef.symbol
      ..sealed = true;
  });

  Map<String, MetaProperty> _collectInheritedProperties(
    MetaStructure structure,
  ) {
    final inheritedProperties = <String, MetaProperty>{};

    // Collect from extended structures first (bottom-up)
    for (final extendRef in structure.extends$) {
      // Use type resolver to get the name
      final extendedStructureName = extendRef.resolveType(_typeResolverVisitor);
      final extendedStructure = _structures[extendedStructureName];
      if (extendedStructure != null) {
        final parentProperties = _collectAllProperties(extendedStructure);
        inheritedProperties.addAll(parentProperties);
      }
    }

    // Collect from mixins
    for (final mixinRef in structure.mixins$) {
      // Use type resolver to get the name
      final mixinStructureName = mixinRef.resolveType(_typeResolverVisitor);
      final mixinStructure = _structures[mixinStructureName];
      if (mixinStructure != null) {
        final mixinProperties = _collectAllProperties(mixinStructure);
        inheritedProperties.addAll(mixinProperties);
      }
    }

    return inheritedProperties;
  }

  /// Recursively collects all properties for a given structure,
  /// including those inherited from extended structures and mixins.
  /// Returns a map where keys are property names and values are MetaProperty
  /// objects.
  Map<String, MetaProperty> _collectAllProperties(MetaStructure structure) {
    final collectedProperties = <String, MetaProperty>{};
    final inheritedProperties = _collectInheritedProperties(structure);

    collectedProperties.addAll(inheritedProperties);

    // Add properties directly defined in the current structure
    // (override parents/mixins)
    for (final property in structure.properties) {
      collectedProperties[property.name] = property;
    }

    return collectedProperties;
  }

  /// Appends '?' if the type is optional.
  String _applyOptional(String type, bool isOptional) =>
      isOptional ? '$type?' : type;

  void _generateFields({
    required ClassBuilder cb,
    required List<MetaProperty> allFields,
    Set<String> inheritedPropertyNames = const {},
  }) {
    cb.fields.addAll(
      allFields.map(
        (property) {
          final propDocs =
              formatDocComment(property.documentation, maxLineLength: 76) ?? [];

          // Use the type resolver for property types
          final propType = _applyOptional(
            property.type.resolveType(_typeResolverVisitor),
            property.optional,
          );

          final propName = property.name;

          return Field(
            (fb) {
              fb
                ..docs.addAll(propDocs)
                ..modifier = FieldModifier.final$
                ..name = propName
                ..type = refer(propType);
              if (inheritedPropertyNames.contains(propName)) {
                fb.annotations.add(_overrideRef);
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
                ..required = !property.optional
                ..toThis = true;
            }),
          ),
        );
      }),
    );
  }

  void _generateFromJsonFactory({
    required ClassBuilder cb,
    required List<MetaProperty> allFields,
  }) {
    final fromJsonBody = BlockBuilder();
    final constructorNamedArgs = <String, Expression>{};

    for (final field in allFields) {
      final propertyName = field.name;
      final propertyType = field.type;
      final isOptional = field.optional;
      final dartType = _applyOptional(
        propertyType.resolveType(_typeResolverVisitor),
        isOptional,
      );

      // Add to constructor arguments list
      constructorNamedArgs[propertyName] = refer(propertyName);

      final mapTypeRef = refer(
        _applyOptional(_mapJsonRef.symbol!, isOptional),
      );
      final varJsonName = '${propertyName}Json';

      final key = literalString(propertyName);
      final mapAsPart = isOptional
          ? _jsonRef.index(key)
          : _jsonRef.index(key).nullChecked;

      final finalJson = declareFinal(varJsonName).assign(mapAsPart);
      fromJsonBody.addExpression(finalJson);

      final isEnum = _enumerations.containsKey(dartType);

      if (isEnum) {
        fromJsonBody.statements.add(const Code('// Handle enum type'));

        final encodeEnumRef = refer(
          r'$enumDecode',
          '../utils/enum_helpers.dart',
        );
        //$enumDecode(_$TypeKindEnumMap, json['kind']),
        final enumMapRef = refer('_\$${dartType}EnumMap');

        final fieldAssignment = declareFinal(propertyName).assign(
          encodeEnumRef.call([
            enumMapRef,
            refer(varJsonName),
          ]),
        );

        fromJsonBody.addExpression(fieldAssignment);

        continue;
      }

      final isComplexType = _structures.containsKey(dartType);

      if (isComplexType) {
        // If the type is complex, we need to call its fromJson method
        final fromJsonCall = refer(
          dartType,
        ).property(_fromJsonMethodRef.symbol!);

        final fromJsonCallExpr = fromJsonCall.call([
          refer(varJsonName).asA(mapTypeRef),
        ]);

        final fieldAssignment = declareFinal(
          propertyName,
        ).assign(fromJsonCallExpr);

        fromJsonBody.addExpression(fieldAssignment);
      } else {
        // For simple types, we can directly assign
        final value = refer(varJsonName).asA(refer(dartType));
        final fieldAssignment = declareFinal(propertyName).assign(value);

        fromJsonBody.addExpression(fieldAssignment);
      }
    }

    final constructorInvocation = InvokeExpression.newOf(
      refer(cb.name!),
      [],
      constructorNamedArgs,
    );

    if (allFields.isEmpty) {
      fromJsonBody.statements.add(const Code('// No fields to parse'));
      fromJsonBody.addExpression(declareFinal('_').assign(refer('json')));
    }

    fromJsonBody.statements.add(const Code('\n'));
    fromJsonBody.addExpression(constructorInvocation.returned);

    final constructor = Constructor((cb) {
      cb
        ..name = _fromJsonMethodRef.symbol
        ..factory = true
        ..requiredParameters.add(
          Parameter((pb) {
            pb
              ..name = _jsonRef.symbol!
              ..type = _mapJsonRef;
          }),
        )
        ..body = fromJsonBody.build();
    });

    cb.constructors.add(constructor);
  }

  void _generateToJson({
    required ClassBuilder cb,
    required List<MetaProperty> allFields,
  }) {
    final toJsonBody = BlockBuilder();
    final map = literalMap({}, _stringRef, refer('Object?'));
    final jsonMap = declareFinal('json').assign(map);

    toJsonBody.addExpression(jsonMap);

    for (final field in allFields) {
      final propertyName = field.name;
      final propertyType = field.type;
      final dartType = propertyType.resolveType(_typeResolverVisitor);

      // Add to json map
      final key = literalString(propertyName);
      final valueRef = refer(propertyName);

      if (_enumerations.containsKey(dartType)) {
        final value = field.optional
            ? valueRef.nullSafeProperty('value')
            : valueRef.property('value');

        // Handle enum type
        toJsonBody.addExpression(
          _jsonRef.index(key).assign(value),
        );

        continue;
      }

      if (_structures.containsKey(dartType)) {
        // If the type is complex, we need to call its toJson method
        final toJsonCall = field.optional
            ? valueRef.nullSafeProperty(_toJsonMethodRef.symbol!)
            : valueRef.property(_toJsonMethodRef.symbol!);

        final toJsonCallExpr = toJsonCall.call([]);
        toJsonBody.addExpression(
          _jsonRef.index(key).assign(toJsonCallExpr),
        );
      } else {
        // For simple types, we can directly assign
        toJsonBody.addExpression(_jsonRef.index(key).assign(valueRef));
      }
    }

    toJsonBody.statements.add(const Code('\n'));

    // return json;
    toJsonBody.addExpression(_jsonRef.returned);

    cb.methods.add(
      Method((mb) {
        mb
          ..name = _toJsonMethodRef.symbol
          ..annotations.add(_overrideRef)
          ..returns = _mapJsonRef
          ..body = toJsonBody.build();
      }),
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
    final result = _specToCode(library);

    return result;
  }
}

String _specToCode(Spec spec) {
  final emitter = DartEmitter(
    allocator: Allocator.simplePrefixing(),
    useNullSafetySyntax: true,
    orderDirectives: true,
  );

  final formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
    pageWidth: DartFormatter.defaultPageWidth,
    trailingCommas: TrailingCommas.automate,
  );

  final dartCode = spec.accept(emitter).toString();
  final result = formatter.format(dartCode);

  return result;
}

// Utility functions (assuming they are in 'utils.dart' or can be placed here)
String upperFirstLetter(String s) => s[0].toUpperCase() + s.substring(1);

String lowerFirstLetter(String s) => s[0].toLowerCase() + s.substring(1);
