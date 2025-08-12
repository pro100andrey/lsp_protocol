// ignore_for_file: avoid_print

import '../../generate.dart';
import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../generator_helper.dart';
import '../utils.dart';
import 'symbol.dart';
import 'symbols_table.dart';
import 'type_resolver.dart';

final class Symbols {
  final structuresTable = StructuresTable();
  final typedefsTable = TypedefsTable();
  final literalsTable = LiteralsTable();
  final sealedTable = SealedTable();
  final tuplesTable = TupleTable();
  final enumSymbols = EnumsTable();

  void collect(MetaProtocol protocol) {
    _collectTypedefs(protocol);
    _collectSealed(protocol);
    _collectTuples(protocol);
    _collectLiterals(protocol);
    _collectStructures(protocol);
    _collectEnums(protocol);
  }

  void _collectEnums(MetaProtocol protocol) {
    for (final enumeration in protocol.enumerations) {
      final values = enumeration.values
          .map(
            (value) {
              final rawName = value.name.lowerFirstLetter();

              final keywords = {
                'null',
                'class',
                'enum',
                'value',
                'interface',
                'operator',
                'static',
                'abstract',
                'async',
                'macro',
              };

              final name = keywords.contains(rawName) ? '${rawName}_' : rawName;
              final argument = switch (value.value) {
                EnumRawValueInteger(:final raw) => raw,
                EnumRawValueString(:final raw) => "'$raw'",
              };

              return EnumFieldSymbol(
                name: name,
                argument: argument,
                doc: value.documentation.asDoc(width: 70),
              );
            },
          )
          .toList(growable: false);

      final symbol = EnumSymbol(
        valueType: enumeration.type.resolve(),
        values: values,
        name: enumeration.name,
        doc: enumeration.documentation.asDoc(),
      );

      enumSymbols[enumeration.name] = symbol;
    }
  }

  void _collectTuples(MetaProtocol protocol) {
    void addTupleSymbol(TupleRef tupleRef) {
      final type = tupleRef.resolve();

      final symbol = TupleSymbol(
        type: type,
        types: tupleRef.items.map((item) => item.resolve()).toList(),
      );

      tuplesTable[type] = symbol;
    }

    for (final structure in protocol.structures) {
      for (final property in structure.properties) {
        property.type.onOrRef(
          (orRef) => orRef.forEachItem(
            (item) => item.onTupleRef(addTupleSymbol),
          ),
        );
      }
    }
  }

  void _collectTypedefs(MetaProtocol protocol) {
    for (final typeAlias in protocol.typeAliases) {
      final type = typeAlias.type.resolve();
      final symbol = TypedefSymbol(
        type: typeAlias.name,
        definition: type,
        doc: typeAlias.documentation.asDoc(),
      );

      typedefsTable[typeAlias.name] = symbol;
    }
  }

  void _collectSealed(MetaProtocol protocol) {
    void addSealedSymbol(OrRef orRef) {
      final type = orRef.resolve();

      final types = orRef.items
          .map((item) => item.resolve())
          .toList(growable: false);

      final symbol = SealedSymbol(
        type: type,
        types: types,
      );

      sealedTable[type] = symbol;

      final displayType = indexedType(type);

      print('Added sealed symbol: ${symbol.type} -> $displayType');
    }

    for (final typeAlias in protocol.typeAliases) {
      typeAlias.type.onOrRef(addSealedSymbol);
    }

    for (final structure in protocol.structures) {
      for (final property in structure.properties) {
        property.type.onLiteralRef((literalRef) {
          literalRef.forEachProperty((prop) {
            prop.type.onOrRef((orRef) {
              addSealedSymbol(orRef);

              orRef.forEachItem(
                (item) => item.onLiteralRef(
                  (literalRef1) => literalRef1.forEachProperty(
                    (prop1) => prop1.type.onOrRef(addSealedSymbol),
                  ),
                ),
              );
            });
          });
        });

        property.type.onMapRef((mapRef) {
          mapRef.value.onOrRef(addSealedSymbol);
        });

        property.type.onOrRef((orRef) {
          orRef.onOrRef(addSealedSymbol);
        });

        property.type.onArrayRef((arrayRef) {
          arrayRef.element.onOrRef(addSealedSymbol);
        });
      }
    }
  }

  void _collectLiterals(MetaProtocol protocol) {
    void addLiteralSymbol(LiteralRef ref) {
      final type = ref.resolve();

      if (literalsTable.containsKey(type)) {
        return;
      }

      String typeResolver(MetaReference ref) => ref.when(
        literalRef: (ref) {
          final literalType = ref.resolve();
          final display = indexedType(literalType);

          return display;
        },
        orRef: (ref) {
          final type = ref.resolve();
          final dType = indexedType(type);

          return dType;
        },
        arrayRef: (ref) {
          final elementType = ref.element.resolve();
          final dElementType = indexedType(elementType);

          return 'List<$dElementType>';
        },
        orElse: (ref) => ref.resolve(),
      );

      final definition = literalToRecord(ref: ref, typeResolver: typeResolver);
      final symbol = LiteralSymbol(
        type: type,
        definition: definition,
        doc: 'Represents a literal type for $type.',
      );

      literalsTable[type] = symbol;

      print('Added literal symbol: ${symbol.type}');
    }

    for (final def in protocol.typeAliases) {
      def.type.onOrRef(
        (v1) => v1.forEachItem(
          (v2) => v2.onLiteralRef(addLiteralSymbol),
        ),
      );
    }

    for (final struct in protocol.structures) {
      for (final property in struct.properties) {
        property.type.onLiteralRef((literalRef) {
          for (final prop in literalRef.value.properties) {
            prop.type.onLiteralRef((innerRef) {
              final ref = innerRef;

              addLiteralSymbol(ref);
            });

            prop.type.onOrRef(
              (orRef) => orRef.forEachItem(
                (item) => item.onLiteralRef(addLiteralSymbol),
              ),
            );

            prop.type.onArrayRef((arrayRef) {
              arrayRef.element.onLiteralRef((ref) {
                final r = ref;
                addLiteralSymbol(r);
              });
            });
          }

          addLiteralSymbol(literalRef);
        });

        property.type.onOrRef((orRef) {
          orRef.forEachItem(
            (v1) => v1.onLiteralRef(addLiteralSymbol),
          );
        });
      }
    }
  }

  void _collectStructures(MetaProtocol protocol) {
    final structuresByName = <String, MetaStructure>{};

    for (final struct in protocol.structures) {
      structuresByName[struct.name] = struct;
    }

    for (final struct in structuresByName.values) {
      // Contains duplicated properties
      final allProperties = getAllProperties(struct, structuresByName);
      final properties = allProperties.map(
        (property) {
          final type = property.type.resolve();
          final dType = indexedType(type);

          return PropertySymbol(
            type: dType,
            name: property.name,
            optional: property.optional,
            doc: property.documentation.asDoc(width: 76),
          );
        },
      ).toList();

      final structureSymbol = StructureSymbol(
        name: struct.name,
        properties: properties,
        doc: struct.documentation.asDoc(width: 70),
      );

      structuresTable[struct.name] = structureSymbol;
    }
  }

  Iterable<MetaProperty> getAllProperties(
    MetaStructure struct,
    Map<String, MetaStructure> structsByName,
  ) {
    final inheritedProps = [
      for (final ref in [...struct.extends$, ...struct.mixins$].cast<TypeRef>())
        ...structsByName[ref.name]!.properties,
    ];

    final resultMap = {
      for (final prop in inheritedProps) prop.name: prop,
      for (final prop in struct.properties) prop.name: prop, // overrides
    };

    final sorted = resultMap.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    final seen = <String>{};
    for (final prop in sorted) {
      if (!seen.add(prop.name)) {
        throw Exception('Duplicate property name found: ${prop.name}');
      }
    }

    return sorted;
  }
}
