// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';

import '../extensions/string.dart';
import '../generator_helper.dart';
import '../meta/protocol.dart';
import '../symbols/sealed_map.dart';
import '../symbols/symbol.dart';
import '../symbols/symbols.dart';
import '../utils.dart';
import 'type_resolver_visitor.dart';
import 'visitor.dart';

/// A concrete visitor that generates Dart code from MetaProtocol.
final class GeneratorVisitor implements MetaProtocolVisitor<Spec> {
  // Pass protocol for initial setup, but main logic is in visit methods
  GeneratorVisitor(MetaProtocol protocol)
    : _structures = Map.fromEntries(
        protocol.structures.map((s) => MapEntry(s.name, s)),
      ) {
    _sealedMap = SealedMap();
    _sealedMap.processProtocol(protocol);

    _typeResolverVisitor = TypeResolverVisitor(
      sealedMap: _sealedMap,
    );
  }

  final Map<String, MetaStructure> _structures;
  final _symbols = Symbols();

  late final TypeResolverVisitor _typeResolverVisitor;
  late final SealedMap _sealedMap;

  Reference get _stringRef => refer('String');

  // final _disallowUnrecognizedKeysRef = refer(
  //   'JsonSerializable(disallowUnrecognizedKeys: true)',
  //   // 'JsonSerializable(disallowUnrecognizedKeys: true, checked: true)',
  // );

  @override
  Library visitProtocol(MetaProtocol protocol) {
    _symbols.process(protocol);

    final lib = Library(
      (b) {
        b.docs.addAll(_docs());
        b.body.addAll(_generateFreezedHeader());
        b.body.add(visitMetaData(protocol.metaData));

        for (final typedef in _symbols.typedefs) {
          b.body.add(_generateTypedef(typedef));
        }

        for (final literal in _symbols.literals) {
          b.body.add(_generateLiteralTypeAlias(literal));
        }

        // Generate type aliases
        // for (final typeAlias in protocol.typeAliases) {
        //   b.body.add(visitTypeAlias(typeAlias));
        // }

        for (final ref in _symbols.sealed) {
          b.body.addAll(_generateBaseOrClass(ref));
        }

        for (final structure in _symbols.structures) {
          b.body.add(_generateStructure(structure));
        }

        // for (final structure in protocol.structures) {
        //   b.body.add(visitStructure(structure));
        // }

        for (final enumeration in protocol.enumerations) {
          b.body.add(visitEnumeration(enumeration));
        }

        b.body.add(_generateRequestMethodEnum(protocol.requests));
        b.body.add(_generateNotificationMethodEnum(protocol.notifications));
      },
    );

    return lib;
  }

  List<String> _docs() => [
    '/// Do not edit it manually.',
    '',
    '// ignore_for_file: doc_directive_unknown',
    '// ignore_for_file: always_put_required_named_parameters_first',
  ];

  List<Spec> _generateFreezedHeader() => const [
    Code('// Freezed header not implemented for generation\n'),
    Code("import 'package:freezed_annotation/freezed_annotation.dart';"),
    Code("part 'protocol.freezed.dart';"),
    Code("part 'protocol.g.dart';"),
  ];

  Spec _generateLiteralTypeAlias(LiteralSymbol symbol) {
    final def = TypeDef((b) {
      b
        ..name = symbol.type
        ..docs.addAll([
          '/// Represents a literal type for ${symbol.type}.',
        ])
        ..definition = refer(symbol.definition);
    });

    return def;
  }

  @override
  Spec visitTypeAlias(MetaTypeAlias typeAlias) {
    final definitionName = typeAlias.type.resolveType(_typeResolverVisitor);

    return TypeDef((b) {
      b
        ..docs.addAll(formatDocComment(typeAlias.documentation) ?? [])
        ..name = typeAlias.name
        ..definition = refer(definitionName);
    });
  }

  Spec _generateTypedef(TypedefSymbol symbol) => TypeDef((b) {
    b
      ..docs.addAll(formatDocComment(symbol.doc) ?? [])
      ..name = symbol.name
      ..definition = refer(symbol.type);
  });

  Spec _generateStructure(StructureSymbol symbol) {
    final name = symbol.name.replaceFirstLetterIfExists('_', 'T');
    final structDocs = formatDocComment(symbol.doc, maxLineLength: 70) ?? [];

    final clazz = Class(
      (b) {
        b
          ..docs.addAll(structDocs)
          ..name = name
          ..annotations.add(refer('freezed'))
          // abstract class MetaProtocol extends BaseMeta with _$MetaProtocol {
          ..mixins.add(refer('_\$$name'))
          ..abstract = true;

        b.constructors.addAll(
          [
            Constructor(
              (b) => b
                // ..annotations.add(_disallowUnrecognizedKeysRef)
                ..factory = true
                ..constant = true
                ..redirect = refer('_$name')
                ..optionalParameters.addAll(
                  symbol.properties.map(
                    (field) => Parameter(
                      (b) {
                        final fieldDocs =
                            formatDocComment(
                              field.documentation,
                              maxLineLength: 76,
                            ) ??
                            [];

                        b
                          ..docs.addAll(fieldDocs)
                          ..name = field.type
                          ..type = refer(
                            field.type.optional(optional: field.optional),
                          )
                          ..named = true
                          ..required = !field.optional;
                      },
                    ),
                  ),
                ),
            ),
            //   factory MetaProtocol.fromJson(Map<String, Object?> json) =>
            //       _$MetaProtocolFromJson(json);
            Constructor(
              (b) => b
                ..factory = true
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = refer('Map<String, dynamic>'),
                  ),
                )
                ..lambda = true
                ..body = Code('_\$${name}FromJson(json)'),
            ),
          ],
        );
      },
    );

    return clazz;
  }

  @override
  Class visitStructure(MetaStructure structure) {
    final name = structure.name.replaceFirstLetterIfExists('_', 'T');
    final allPropertiesMap = _collectAllProperties(structure);
    final allFields = allPropertiesMap.values.toList(growable: false)
      ..sort((a, b) => a.optional ? 1 : 0);

    final structDocs =
        formatDocComment(
          structure.documentation,
          maxLineLength: 70,
        ) ??
        [];

    final _ = _collectInheritedProperties(
      structure,
    ).keys.toSet();

    final clazz = Class(
      (b) {
        b
          ..docs.addAll(structDocs)
          ..name = name
          ..annotations.add(refer('freezed'))
          // abstract class MetaProtocol extends BaseMeta with _$MetaProtocol {
          ..mixins.add(refer('_\$$name'))
          ..abstract = true;

        b.constructors.addAll(
          [
            Constructor(
              (b) => b
                // ..annotations.add(_disallowUnrecognizedKeysRef)
                ..factory = true
                ..constant = true
                ..redirect = refer('_$name')
                ..optionalParameters.addAll(
                  allFields.map(
                    (field) => Parameter(
                      (b) {
                        final fieldDocs =
                            formatDocComment(
                              field.documentation,
                              maxLineLength: 76,
                            ) ??
                            [];
                        final type = field.type.resolveType(
                          _typeResolverVisitor,
                        );
                        b
                          ..docs.addAll(fieldDocs)
                          ..name = field.name
                          ..type = refer(
                            type.optional(optional: field.optional),
                          )
                          ..named = true
                          ..required = !field.optional;
                      },
                    ),
                  ),
                ),
            ),
            //   factory MetaProtocol.fromJson(Map<String, Object?> json) =>
            //       _$MetaProtocolFromJson(json);
            Constructor(
              (b) => b
                ..factory = true
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = refer('Map<String, dynamic>'),
                  ),
                )
                ..lambda = true
                ..body = Code('_\$${name}FromJson(json)'),
            ),
          ],
        );
      },
    );

    return clazz;
  }

  @override
  Enum visitEnumeration(MetaEnumeration enumeration) {
    final formattedDescription =
        formatDocComment(enumeration.documentation) ?? [];
    // Use resolveType for the enumeration's base type
    final typeName = enumeration.type.resolveType(_typeResolverVisitor);

    final result = Enum((eb) {
      eb
        ..annotations.add(refer("JsonEnum(valueField: 'value')"))
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
              final docs =
                  formatDocComment(m.documentation, maxLineLength: 70) ?? [];
              evb.docs.addAll(docs);
              evb.arguments.add(refer(m.value.literal));
              evb.name = _addPostfixIfKeyword(m.name.lowerFirstLetter());
            },
          ),
        );
      }
    });

    return result;
  }

  String _addPostfixIfKeyword(String name) {
    if (_isKeyword(name)) {
      return '${name}_';
    }
    return name;
  }

  bool _isKeyword(String name) => {
    'null',
    'class',
    'enum',
    'value',
    'interface',
    'operator',
    'static',
    'deprecated',
    'abstract',
    'async',
    'macro',
  }.contains(name);

  @override
  Spec visitNotification(MetaNotification notification) => const CodeExpression(
    Code('// MetaNotification visitor not implemented for generation\n'),
  );

  @override
  Spec visitMetaData(MetaData metaData) => declareConst(
    'kLSPVersion',
    type: refer('String'),
  ).assign(literalString(metaData.version)).statement;

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

  List<Spec> _generateBaseOrClass(SealedSymbol symbol) {
    final baseClass = Class(
      (b) {
        b
          ..name = symbol.type
          ..sealed = true;

        b.constructors.addAll(
          [
            Constructor((b) => b..constant = true),
          ],
        );
      },
    );

    return [baseClass];
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
        ...?formatDocComment(request.documentation, maxLineLength: 70),
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

  String _getMethodName(String method) {
    final parts = method
        .replaceAll(r'$/', '')
        .split('/')
        .map((part) => part.upperFirstLetter())
        .join();

    return parts.lowerFirstLetter();
  }

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
            ...?formatDocComment(notification.documentation, maxLineLength: 70),
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
}

/// The main entry point for the protocol generation.
/// Orchestrates the visitation process.
class ProtocolGenerator {
  ProtocolGenerator(this.protocol);

  final MetaProtocol protocol;

  String generate() {
    final generatorVisitor = GeneratorVisitor(protocol);
    // Start the visitation process from the root MetaProtocol object
    final library = protocol.accept(generatorVisitor) as Library;
    final result = specToCode(library, format: false);

    return result;
  }
}
