// ignore_for_file: avoid_print

import 'package:collection/collection.dart';

import '../../generate.dart';
import '../extensions/meta_reference.dart';
import '../extensions/string.dart';
import '../generator_helper.dart';
import 'rename_map.dart';
import 'symbol.dart';

final class Symbols {
  final Map<String, StructureSymbol> _structureSymbols = {};
  final Map<String, TypedefSymbol> _typedefSymbols = {};
  final Map<String, LiteralSymbol> _literalSymbols = {};
  final Map<String, SealedSymbol> _sealedMap = {};

  Iterable<LiteralSymbol> get literals => _literalSymbols.values;

  Iterable<StructureSymbol> get structures => _structureSymbols.values;

  Iterable<TypedefSymbol> get typedefs => _typedefSymbols.values;

  Iterable<SealedSymbol> get sealed => _sealedMap.values;

  void process(MetaProtocol protocol) {
    _collectTypedefs(protocol);
    _collectLiterals(protocol);
    _collectStructures(protocol);
    _collectSealed(protocol);
  }

  void _collectTypedefs(MetaProtocol protocol) {
    for (final typeAlias in protocol.typeAliases) {
      final type = resolveType(typeAlias.type);
      final symbol = TypedefSymbol(
        name: typeAlias.name,
        type: type,
        doc: typeAlias.documentation,
      );

      _typedefSymbols[typeAlias.name] = symbol;
    }
  }

  void _collectSealed(MetaProtocol protocol) {
    for (final typeAlias in protocol.typeAliases) {
      typeAlias.type.onOrRef(_addSealedSymbol);
    }

    for (final structure in protocol.structures) {
      for (final property in structure.properties) {
        property.type.onLiteralRef((literalRef) {
          for (final prop in literalRef.value.properties) {
            prop.type.onOrRef(_addSealedSymbol);
          }
        });

        property.type.onMapRef((mapRef) {
          mapRef.value.onOrRef(_addSealedSymbol);
        });

        property.type.onOrRef((orRef) {
          orRef.onOrRef(_addSealedSymbol);
        });

        property.type.onArrayRef((arrayRef) {
          arrayRef.element.onOrRef(_addSealedSymbol);
        });
      }
    }
  }

  void _addSealedSymbol(OrRef orRef) {
    final name = resolveType(orRef);
    if (_sealedMap.containsKey(name)) {
      return;
    }

    final types = orRef.items.map(resolveType).toList(growable: false);

    final symbol = SealedSymbol(
      name: name,
      types: types,
    );

    print('Added sealed symbol: ${symbol.displayName}');

    _sealedMap[name] = symbol;
  }

  void _collectLiterals(MetaProtocol protocol) {
    for (final def in protocol.typeAliases) {
      def.type.onOrRef((orRef) {
        for (final prop in orRef.items) {
          prop.onLiteralRef((literalRef) {
            _addLiteralSymbol(ref: literalRef, origin: def.name);
          });
        }
      });
    }

    for (final struct in protocol.structures) {
      for (final property in struct.properties) {
        property.type.onLiteralRef((literalRef) {
          for (final prop in literalRef.value.properties) {
            prop.type.onLiteralRef((innerLiteralRef) {
              _addLiteralSymbol(ref: innerLiteralRef, origin: prop.name);
            });

            prop.type.onArrayRef((arrayRef) {
              arrayRef.element.onLiteralRef((innerLiteralRef) {
                _addLiteralSymbol(ref: innerLiteralRef, origin: prop.name);
              });
            });
          }

          _addLiteralSymbol(ref: literalRef, origin: property.name);
        });
      }
    }
  }

  void _addLiteralSymbol({
    required LiteralRef ref,
    required String origin,
  }) {
    final name = _resolveLiteralName(ref);
    if (_literalSymbols.containsKey(name)) {
      return;
    }

    String typeResolver(MetaReference ref) => ref.when(
      literalRef: _resolveLiteralDisplayName,
      arrayRef: (ref) => 'List<${typeResolver(ref.element)}>',
      orElse: resolveType,
    );

    final record = literalToRecord(
      ref: ref,
      typeResolver: typeResolver,
    );

    final symbol = LiteralSymbol(name: name, type: record, ref: ref);

    _literalSymbols[name] = symbol;

    print('Added literal symbol: ${symbol.displayName}');
  }

  void _collectStructures(MetaProtocol protocol) {
    final structuresByName = _getStructuresByName(protocol);
    for (final struct in structuresByName.values) {
      // Contains duplicated properties
      final allProperties = getAllProperties(struct, structuresByName);
      final properties = allProperties
          .map(
            (property) => PropertySymbol(
              type: resolveType(property.type),
              name: property.name,
              optional: property.optional,
              documentation: property.documentation,
            ),
          )
          .toList();

      final structureSymbol = StructureSymbol(
        name: struct.name,
        properties: properties,
      );

      _structureSymbols[struct.name] = structureSymbol;
    }
  }

  Map<String, MetaStructure> _getStructuresByName(MetaProtocol protocol) {
    final structsByName = <String, MetaStructure>{};

    for (final struct in protocol.structures) {
      structsByName[struct.name] = struct;
    }

    return structsByName;
  }

  Map<String, MetaStructure> getStructuresByName(MetaProtocol protocol) {
    final structsByName = <String, MetaStructure>{};

    for (final struct in protocol.structures) {
      structsByName[struct.name] = struct;
    }

    return structsByName;
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
      literalRef: _resolveLiteralName,
      typeRef: (ref) => ref.name,
      arrayRef: (ref) => 'List<${resolveType(ref.element)}>',
      baseRef: (ref) => switch (ref.name) {
        'integer' || 'uinteger' => 'int',
        'string' || 'DocumentUri' || 'URI' => 'String',
        'decimal' => 'double',
        'boolean' => 'bool',
        'null' => 'Null',
        _ => throw ArgumentError(
          'Unknown base type: ${ref.name}. '
          'Ensure it is a valid Dart base type.',
        ),
      },
      orRef: _resolveOrRefDisplayName,
      andRef: (ref) => 'AndRef',
      mapRef: (ref) =>
          'Map<${resolveType(ref.key)}, ${resolveType(ref.value)}>',
      tupleRef: (ref) => 'TupleRef',
      stringLiteralRef: (ref) => 'StringLiteralRef',
    );

    return result;
  }

  String resolveDisplayName(MetaReference ref) {
    final result = ref.when(
      literalRef: _resolveLiteralName,
      arrayRef: (ref) => '${resolveType(ref.element)}s',
      orRef: _resolveOrRefName,
      orElse: (ref) => null,
    );

    if (result != null) {
      return result;
    }

    return resolveType(ref);
  }

  String _resolveOrRefName(OrRef orRef) {
    final parts = orRef.items
        .map((item) => resolveDisplayName(item).upperFirstLetter())
        .toList(growable: false);

    final sortedParts = parts.sorted((a, b) => a.compareTo(b));
    final rawName = sortedParts.join('Or');

    return rawName;
  }

  String _resolveOrRefDisplayName(OrRef orRef) {
    final rawName = _resolveOrRefName(orRef);
    final resultName = renameSealedMap[rawName] ?? rawName;

    return resultName;
  }

  String _resolveLiteralName(LiteralRef ref) {
    final parts = ref.value.properties
        .map(
          (item) =>
              '${resolveDisplayName(item.type).upperFirstLetter()}'
              '${item.name.upperFirstLetter()}',
        )
        .toList(growable: false);

    final sorted = parts.sorted((a, b) => a.compareTo(b));
    final rawName = sorted.join();

    return rawName;
  }

  String _resolveLiteralDisplayName(LiteralRef ref) {
    final rawName = _resolveLiteralName(ref);
    final resultName = renameLiteralMap[rawName] ?? rawName;

    if (resultName == rawName) {
      print('need rename for literal: $rawName');
    }

    return resultName;
  }
}
