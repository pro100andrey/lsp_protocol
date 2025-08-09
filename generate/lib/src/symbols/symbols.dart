// ignore_for_file: avoid_print

import 'package:collection/collection.dart';

import '../../generate.dart';
import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../generator_helper.dart';
import 'symbol.dart';

final class Symbols {
  final Map<String, StructureSymbol> _structureSymbols = {};
  final Map<String, TypedefSymbol> _typedefSymbols = {};
  final Map<String, LiteralSymbol> _literalSymbols = {};
  final Map<String, SealedSymbol> _sealedMap = {};
  final Map<String, TupleSymbol> _renamedSymbols = {};
  final Map<String, String> _displayNames = {};

  Iterable<LiteralSymbol> get literals => _literalSymbols.values;
  Iterable<StructureSymbol> get structures => _structureSymbols.values;
  Iterable<TypedefSymbol> get typedefs => _typedefSymbols.values;
  Iterable<SealedSymbol> get sealed => _sealedMap.values;

  void process(MetaProtocol protocol) {
    _collectTypedefs(protocol);
    _collectSealed(protocol);
    _collectTuples(protocol);

    _collectLiterals(protocol);
    _collectStructures(protocol);
  }

  var _tupleIdx = 1;
  void _setTupleDisplayType(String type) {
    if (_displayNames.containsKey(type)) {
      return; // Already set
    }

    _displayNames[type] = 'Tuple$_tupleIdx';
    _tupleIdx++;
  }

  var _sealedIdx = 1;
  void _setSealedDisplayType(String type) {
    if (_displayNames.containsKey(type)) {
      return;
    }

    _displayNames[type] = 'Sealed$_sealedIdx';
    _sealedIdx++;
  }

  var _literalIdx = 1;
  void _setLiteralDisplayType(String type) {
    if (_displayNames.containsKey(type)) {
      return;
    }

    final value = 'Literal$_literalIdx';

    _displayNames[type] = value;
    _literalIdx++;
  }

  String displayType(String type, {bool throwIfMissing = false}) {
    if (throwIfMissing && !_displayNames.containsKey(type)) {
      throw ArgumentError('Type not found: $type');
    }

    return _displayNames[type] ?? type;
  }

  void _collectTuples(MetaProtocol protocol) {
    void addTupleSymbol(TupleRef tupleRef) {
      final type = resolveType(tupleRef);
      _setTupleDisplayType(type);

      if (_renamedSymbols.containsKey(type)) {
        return;
      }

      final symbol = TupleSymbol(
        type: type,
        types: tupleRef.items.map(resolveType).toList(),
      );

      _renamedSymbols[type] = symbol;
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
      final type = resolveType(typeAlias.type);
      final symbol = TypedefSymbol(
        type: typeAlias.name,
        definition: type,
        doc: typeAlias.documentation,
      );

      _typedefSymbols[typeAlias.name] = symbol;
    }
  }

  void _collectSealed(MetaProtocol protocol) {
    void addSealedSymbol(OrRef orRef) {
      final type = resolveType(orRef);
      _setSealedDisplayType(type);

      if (_sealedMap.containsKey(type)) {
        return;
      }

      final types = orRef.items.map(resolveType).toList(growable: false);

      final symbol = SealedSymbol(
        type: type,
        types: types,
      );

      print('Added sealed symbol: ${symbol.type} -> ${displayType(type)}');

      _sealedMap[type] = symbol;
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
      final type = _resolveLiteralType(ref);
      _setLiteralDisplayType(type);

      if (_literalSymbols.containsKey(type)) {
        return;
      }

      String typeResolver(MetaReference ref) => ref.when(
        literalRef: (ref) {
          final literalType = _resolveLiteralType(ref);
          final display = displayType(literalType);

          return display;
        },
        orRef: (ref) {
          final type = resolveType(ref);

          final dType = displayType(type);

          return dType;
        },
        arrayRef: (ref) {
          final elementType = resolveType(ref.element);
          final dElementType = displayType(elementType);
          return 'List<$dElementType>';
        },
        orElse: resolveType,
      );

      final definition = literalToRecord(ref: ref, typeResolver: typeResolver);
      final symbol = LiteralSymbol(
        type: type,
        definition: definition,
        doc: 'Represents a literal type for $type.',
      );

      _literalSymbols[type] = symbol;

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
          final type = resolveType(property.type);
          final dType = displayType(type);

          return PropertySymbol(
            type: dType,
            name: property.name,
            optional: property.optional,
            documentation: property.documentation,
          );
        },
      ).toList();

      final structureSymbol = StructureSymbol(
        name: struct.name,
        properties: properties,
      );

      _structureSymbols[struct.name] = structureSymbol;
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

  String resolveType(MetaReference ref) {
    final result = ref.when(
      literalRef: _resolveLiteralType,
      typeRef: (ref) => ref.name,
      arrayRef: _resolveArrayType,
      baseRef: _resolveBaseType,
      orRef: _resolveOrRefName,
      andRef: (ref) => 'AndRef',
      mapRef: _resolveMapType,
      tupleRef: _resolveTupleType,
      stringLiteralRef: (ref) => 'StringLiteralRef',
    );

    return result;
  }

  String _resolveArrayType(ArrayRef ref) {
    final elementType = resolveType(ref.element);
    final dElementType = displayType(elementType);
    
    return 'List<$dElementType>';
  }

  String _resolveTupleType(TupleRef ref) {
    final parts = ref.items
        .map((item) => resolveType(item).upperFirstLetter())
        .toList(growable: false);

    final sorted = parts.sorted((a, b) => a.compareTo(b));
    final rawName = sorted.join();

    return rawName;
  }

  String _resolveMapType(MapRef ref) =>
      'Map<${resolveType(ref.key)}, ${resolveType(ref.value)}>';

  String _resolveBaseType(BaseRef ref) => switch (ref.name) {
    'integer' || 'uinteger' => 'int',
    'string' || 'DocumentUri' || 'URI' => 'String',
    'decimal' => 'double',
    'boolean' => 'bool',
    'null' => 'Null',
    _ => throw ArgumentError(
      'Unknown base type: ${ref.name}. '
      'Ensure it is a valid Dart base type.',
    ),
  };

  String _resolveOrRefName(OrRef orRef) {
    final parts = orRef.items.map(resolveType).toList(growable: false);
    final sortedParts = parts.sorted((a, b) => a.compareTo(b));
    final rawName = sortedParts.join('Or');

    return rawName;
  }

  String _resolveLiteralType(LiteralRef ref) {
    final parts = ref.value.properties
        .map(
          (item) => '${resolveType(item.type).upperFirstLetter()}_${item.name}',
        )
        .toList(growable: false);

    final sorted = parts.sorted((a, b) => a.compareTo(b));
    final rawName = sorted.join(r'$');

    return rawName;
  }
}
