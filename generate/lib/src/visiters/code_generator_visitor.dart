// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';

import '../extensions/string.dart';
import '../generator_helper.dart';
import '../meta/protocol.dart';
import '../symbols/sealed_map.dart';
import '../utils.dart';
import 'type_resolver_visitor.dart';
import 'visitor.dart';

/// A concrete visitor that generates Dart code from MetaProtocol.
final class DartCodeGeneratorVisitor implements MetaProtocolVisitor<Spec> {
  // Pass protocol for initial setup, but main logic is in visit methods
  DartCodeGeneratorVisitor(MetaProtocol protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ),
      _enumerations = Map.fromEntries(
        protocol.enumerations.map((e) => MapEntry(e.name, e)),
      ) {
    _sealedMap = SealedMap();
    _sealedMap.processProtocol(protocol);

    _typeResolverVisitor = TypeResolverVisitor(
      sealedMap: _sealedMap,
    );
  }

  final Map<String, MetaStructure> _structures;
  final Map<String, MetaEnumeration> _enumerations;

  late final TypeResolverVisitor _typeResolverVisitor;
  late final SealedMap _sealedMap;

  Reference get _toJsonRef => refer('ToJson');
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

      // Generate the base class for JSON serialization
      b.body.add(_generateToJsonClass());

      // Generate type aliases
      for (final typeAlias in protocol.typeAliases) {
        b.body.add(visitTypeAlias(typeAlias));
      }

      // Generate the OrRef class
      b.body.add(_generateBaseOrClass());

      for (final ref in _sealedMap.refs) {
        b.body.add(generateBaseOrClass(ref));
        b.body.addAll(generateSubclassesForOrClass(ref));
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

      b.body.add(_generateRequestMethodEnum(protocol.requests));

      b.body.add(_generateNotificationMethodEnum(protocol.notifications));
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
    '// ignore_for_file: avoid_positional_boolean_parameters',
  ];

  @override
  TypeDef visitTypeAlias(MetaTypeAlias typeAlias) {
    final definitionName = typeAlias.type.resolveType(_typeResolverVisitor);

    return TypeDef((b) {
      b
        ..docs.addAll(formatDocComment(typeAlias.documentation) ?? [])
        ..name = typeAlias.name
        ..definition = refer(definitionName);
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

  Spec _generateRequestMethodEnum(List<MetaRequest> requests) => Enum((eb) {
    eb
      ..name = 'RequestMethod'
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
      final method = _getMethodName(request.method);
      final methodPath = request.method;
      final doc = [
        '/// Method: $methodPath',
        '///',
        ...?formatDocComment(request.documentation),
      ];

      eb.values.add(
        EnumValue((evb) {
          evb.name = method;
          evb.arguments.add(literalString(methodPath));
          evb.docs.addAll(doc);
        }),
      );
    }
  });

  Spec _generateNotificationMethodEnum(List<MetaNotification> notifications) =>
      Enum((eb) {
        eb
          ..name = 'NotificationMethod'
          ..docs.add(
            '/// This class contains methods for handling notifications.',
          )
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

        for (final notification in notifications) {
          final method = _getMethodName(notification.method);
          final methodPath = notification.method;

          final doc = [
            '/// Method: $methodPath',
            '///',
            ...?formatDocComment(notification.documentation),
          ];

          eb.values.add(
            EnumValue((evb) {
              evb.name = method;

              evb.arguments.add(
                literalString(methodPath, raw: methodPath.startsWith(r'$/')),
              );
              evb.docs.addAll(doc);
            }),
          );
        }
      });

  String _getMethodName(String method) {
    final parts = method
        .replaceAll(r'$/', '')
        .split('/')
        .map((part) => part.upperFirstLetter())
        .join();

    return parts.lowerFirstLetter();
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
              evb.name = '${m.name.lowerFirstLetter()}Value';
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
        refer('${enumeration.name}.${m.name.lowerFirstLetter()}Value'),
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

  Class _generateBaseOrClass() => Class((cb) {
    cb
      ..name = 'BaseOr'
      ..types.add(
        TypeReference((p0) {
          p0
            ..symbol = 'T'
            ..isNullable = false;
        }),
      )
      ..abstract = true
      ..docs.add(
        '/// Represents a base class for OrRef types.',
      )
      ..sealed = true;

    cb.methods.add(
      Method((mb) {
        mb
          ..name = 'value'
          ..returns = refer('T')
          ..type = MethodType.getter;
      }),
    );

    cb.constructors.add(
      Constructor((cb) {
        cb.constant = true;
      }),
    );

    //  final body = BlockBuilder()
    // ..addExpression(
    //   refer('value').property(_toJsonMethodRef.symbol!).call([]),
    // );

    // cb.methods.add(
    //   Method((mb) {
    //     mb
    //       ..name = _toJsonMethodRef.symbol
    //       ..annotations.add(_overrideRef)
    //       ..returns = _mapJsonRef;
    //     // ..lambda = true;
    //     // ..body = refer('value').property('toJson').call([]).code;
    //   }),
    // );
  });

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
              ..returns = _mapJsonRef
              ..body = const Code('throw UnimplementedError();');
          },
        ),
      );
  });

  List<Spec> generateSubclassesForOrClass(OrRef symbol) {
    final baseClassName = _sealedMap.resolveOrRefType(symbol, isBase: false);
    final baseClassWithPostfix = _sealedMap.resolveOrRefType(symbol);

    final result = <Spec>[];
    for (final (i, o) in symbol.items.indexed) {
      final ownerType = o.resolveType(_typeResolverVisitor);

      if (ownerType == 'Null') {
        // Skip Null type
        continue;
      }

      const simpleType = 'Unknown';

      final field = Field((fb) {
        fb
          ..annotations.add(_overrideRef)
          ..name = 'value'
          ..modifier = FieldModifier.final$
          ..type = refer(ownerType);
      });

      final constructor = Constructor((cb) {
        cb
          ..constant = true
          ..requiredParameters.add(
            Parameter((pb) {
              pb
                ..name = 'value'
                ..toThis = true;
            }),
          );
      });

      // final toJsonMethod = Method((mb) {
      //   mb
      //     ..name = _toJsonMethodRef.symbol
      //     ..annotations.add(_overrideRef)
      //     ..returns = _mapJsonRef
      //     ..body = () {
      //       final builder = BlockBuilder()
      //         ..addExpression(
      //           declareFinal('json').assign(
      //             literalMap({}, _stringRef, refer('Object?')),
      //           ),
      //         )
      //         ..addExpression(_jsonRef.returned);

      //       return builder.build();
      //     }();
      // });

      final clazz = Class((cb) {
        cb
          ..docs.addAll([
            '/// Represents a subclass of $baseClassName.',
            '/// Type: $simpleType',
          ])
          ..name = '${baseClassName}V${i + 1}'
          ..extend = refer(baseClassWithPostfix)
          // ..implements.add(_toJsonRef)
          ..fields.add(field)
          ..constructors.add(constructor);
        // ..methods.add(toJsonMethod);
      });

      result.add(clazz);
    }

    return result.toList(growable: false);
  }

  Class generateBaseOrClass(OrRef symbol) {
    final typeName = _sealedMap.resolveOrRefType(symbol);

    return Class((cb) {
      cb
        ..name = typeName
        ..extend = refer('BaseOr')
        ..docs.addAll([
          ..._sealedMap
              .ownerNamesForOrRef(symbol)
              .map((owner) => '/// Owned by: $owner'),
          '///',
          ..._sealedMap
              .typeNamesForOrRef(symbol)
              .map((type) => '/// Type: $type'),
        ])
        ..sealed = true
        ..constructors.add(
          Constructor((cb) {
            cb.constant = true;
          }),
        );
    });
  }

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

  void _generateFields({
    required ClassBuilder cb,
    required List<MetaProperty> allFields,
    Set<String> inheritedPropertyNames = const {},
  }) {
    for (final field in allFields) {
      final fr = Field((fb) {
        final doc = [
          if (field.type is OrRef) '/// Represents a union type.',
          ...?formatDocComment(field.documentation, maxLineLength: 76),
        ];

        // Use the type resolver for property types
        final propType = field.type
            .resolveType(_typeResolverVisitor)
            .optional(optional: field.optional);

        final propName = field.name;

        fb
          ..docs.addAll(doc)
          ..modifier = FieldModifier.final$
          ..name = propName
          ..type = refer(propType);
        if (inheritedPropertyNames.contains(propName)) {
          fb.annotations.add(_overrideRef);
        }
      });

      cb.fields.add(fr);
    }

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
      final fieldName = field.name;
      final propertyType = field.type;
      final isOptional = field.optional;
      final type = propertyType
          .resolveType(_typeResolverVisitor)
          .optional(optional: isOptional);

      // Add to constructor arguments list
      constructorNamedArgs[fieldName] = refer(fieldName);

      final mapTypeRef = refer(
        _mapJsonRef.symbol!.optional(optional: isOptional),
      );

      final varJsonName = '${fieldName}Json';

      final key = literalString(fieldName);
      final mapAsPart = isOptional
          ? _jsonRef.index(key)
          : _jsonRef.index(key).nullChecked;

      final finalJson = declareFinal(varJsonName).assign(mapAsPart);
      fromJsonBody.addExpression(finalJson);

      final isEnum = _enumerations.containsKey(type);

      if (isEnum) {
        fromJsonBody.statements.add(const Code('// Handle enum type'));

        final encodeEnumRef = refer(
          r'$enumDecode',
          '../utils/enum_helpers.dart',
        );
        //$enumDecode(_$TypeKindEnumMap, json['kind']),
        final enumMapRef = refer('_\$${type}EnumMap');

        final fieldAssignment = declareFinal(fieldName).assign(
          encodeEnumRef.call([enumMapRef, refer(varJsonName)]),
        );

        fromJsonBody.addExpression(fieldAssignment);

        continue;
      }

      final isComplexType = _structures.containsKey(type);

      if (isComplexType) {
        // If the type is complex, we need to call its fromJson method
        final fromJsonCall = refer(type).property(_fromJsonMethodRef.symbol!);

        final fromJsonCallExpr = fromJsonCall.call([
          refer(varJsonName).asA(mapTypeRef),
        ]);

        final fieldAssignment = declareFinal(
          fieldName,
        ).assign(fromJsonCallExpr);

        fromJsonBody.addExpression(fieldAssignment);
      } else {
        // For simple types, we can directly assign
        final value = refer(varJsonName).asA(refer(type));
        final fieldAssignment = declareFinal(fieldName).assign(value);

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

  @override
  Class visitLiteral(MetaLiteral literal) => throw UnimplementedError();
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
    final result = specToCode(library);

    return result;
  }
}
