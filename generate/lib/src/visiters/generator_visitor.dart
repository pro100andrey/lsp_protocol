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

  late final TypeResolverVisitor _typeResolverVisitor;
  late final SealedMap _sealedMap;

  final _referencedJsonSerializable = refer(
    'JsonSerializable(disallowUnrecognizedKeys: true)',
  );

  @override
  Library visitProtocol(MetaProtocol protocol) => Library(
    (b) {
      b.body.addAll(_generateFreezedHeader());

      // Generate type aliases
      for (final typeAlias in protocol.typeAliases) {
        b.body.add(visitTypeAlias(typeAlias));
      }

      for (final ref in _sealedMap.refs) {
        b.body.add(_generateBaseOrClass(ref));
      }

      for (final structure in protocol.structures) {
        b.body.add(visitStructure(structure));
      }

      for (final enumeration in protocol.enumerations) {
        b.body.add(visitEnumeration(enumeration));
      }
    },
  );

  List<Spec> _generateFreezedHeader() => const [
    Code('// Freezed header not implemented for generation\n'),
    Code("import 'package:freezed_annotation/freezed_annotation.dart';"),
    Code("part 'protocol.freezed.dart';"),
    Code("part 'protocol.g.dart';"),
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
    final name = structure.name.replaceFirstLetterIfExists('_', 'T');
    final allPropertiesMap = _collectAllProperties(structure);
    final allFields = allPropertiesMap.values.toList(growable: false)
      ..sort((a, b) => a.optional ? 1 : 0);

    final inheritedPropertyNames = _collectInheritedProperties(
      structure,
    ).keys.toSet();

    final clazz = Class(
      (b) {
        b
          ..name = name
          ..annotations.add(refer('freezed'))
          // abstract class MetaProtocol extends BaseMeta with _$MetaProtocol {
          ..mixins.add(refer('_\$$name'))
          ..abstract = true;

        b.constructors.addAll(
          [
            Constructor(
              (b) => b
                ..annotations.add(_referencedJsonSerializable)
                ..factory = true
                ..constant = true
                ..redirect = refer('_$name')
                ..optionalParameters.addAll(
                  allFields.map(
                    (field) => Parameter(
                      (b) {
                        final type = field.type.resolveType(
                          _typeResolverVisitor,
                        );
                        b
                          ..name = field.name
                          ..type = refer(type)
                          ..named = true
                          ..required = true;
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

  @override
  Spec visitNotification(MetaNotification notification) => const CodeExpression(
    Code('// MetaNotification visitor not implemented for generation\n'),
  );

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

  Class _generateBaseOrClass(OrRef symbol) {
    //     @Freezed(unionKey: 'kind')
    // sealed class MetaReference extends BaseMeta with _$MetaReference {
    //   const MetaReference._();

    //   @JsonSerializable(disallowUnrecognizedKeys: true)
    //   @FreezedUnionValue('reference')
    //   const factory MetaReference.type({
    //     required TypeKind kind,
    //     required String name,
    //   }) = TypeRef;

    final baseName = _sealedMap.resolveOrRefType(symbol);
    final className = _sealedMap.resolveOrRefType(symbol, isBase: false);

    final constructors = <Constructor>[];

    for (final (i, o) in symbol.items.indexed) {
      final ownerType = o.resolveType(_typeResolverVisitor);

      if (ownerType == 'Null') {
        // Skip Null type
        continue;
      }

      final constructor = Constructor((cb) {
        cb
          ..constant = true
          ..factory = true
          ..name = 'from${i + 1}'
          ..redirect = refer('$className$i')
          ..optionalParameters.add(
            Parameter((pb) {
              pb
                ..type = refer(ownerType)
                ..required = true
                ..named = true
                ..name = 'value';
            }),
          );
      });

      constructors.add(constructor);
    }

    final clazz = Class(
      (b) {
        b
          ..docs.addAll([
            ..._sealedMap
                .ownerNamesForOrRef(symbol)
                .map((owner) => '/// Owned by: $owner'),
            '///',
            ..._sealedMap
                .typeNamesForOrRef(symbol)
                .map((type) => '/// Type: $type'),
          ])
          ..name = baseName
          ..annotations.add(refer('freezed'))
          // abstract class MetaProtocol extends BaseMeta with _$MetaProtocol {
          ..mixins.add(refer('_\$$baseName'))
          ..sealed = true;

        b.constructors.addAll(
          [
            ...constructors,
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
                ..body = Code('_\$${baseName}FromJson(json)'),
            ),
          ],
        );
      },
    );

    return clazz;
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
    final result = specToCode(library);

    return result;
  }
}
