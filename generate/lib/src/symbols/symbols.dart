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

  void process(MetaProtocol protocol) {
    final structsByName = _getStructuresByName(protocol);

    _collectLiterals(protocol);
    _collectStructures(structsByName);
  }

  void _collectLiterals(MetaProtocol protocol) {
    for (final struct in protocol.structures) {
      for (final property in struct.properties) {
        property.type.onLiteralRef((literalRef) {
          for (final prop in literalRef.value.properties) {
            prop.type.onLiteralRef((innerLiteralRef) {
              _addLiteralSymbol(
                name: prop.name.upperFirstLetter().postfix('Literal'),
                ref: innerLiteralRef,
                origin: prop.name,
              );
            });
          }

          _addLiteralSymbol(
            name: property.name.upperFirstLetter().postfix('Literal'),
            ref: literalRef,
            origin: property.name,
          );
        });
      }
    }
  }

  void _addLiteralSymbol({
    required String name,
    required LiteralRef ref,
    required String origin,
  }) {
    if (_literalSymbols.containsKey(name)) {
      throw ArgumentError(
        'Duplicate literal name found: $name in $origin',
      );
    }

    final record = literalToRecord(
      ref: ref,
      typeResolver: resolveType,
      forceOptional: true,
      
    );

    _literalSymbols[name] = LiteralSymbol(
      name: name,
      type: record,
      ref: ref,
    );
  }

  void _collectStructures(Map<String, MetaStructure> structuresByName) {
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

  String resolve({required LiteralRef ref}) {
    final type = literalToRecord(
      ref: ref,
      typeResolver: resolveType,
      forceOptional: true,
    );

    return type;
  }

  String _resolveLiteralName(LiteralRef ref) {
    final symbol = _literalSymbols.values.firstWhereOrNull(
      (symbol) => symbol.ref == ref,
    );

    if (symbol == null) {
      throw ArgumentError(
        'Literal symbol not found for reference: $ref',
      );
    }

    return symbol.name;
  }

  String resolveType(MetaReference ref) {
    final result = ref.when(
      literalRef: _resolveLiteralName,
      typeRef: (ref) => ref.name,
      arrayRef: (ref) => 'List<${resolveType(ref.element)}>',
      baseRef: (ref) => switch (ref.name) {
        'integer' => 'int',
        'uinteger' => 'int',
        'string' => 'String',
        'decimal' => 'double',
        'boolean' => 'bool',
        'null' => 'Null',
        'DocumentUri' => 'String',
        'URI' => 'String',
        _ => throw ArgumentError(
          'Unknown base type: ${ref.name}. '
          'Ensure it is a valid Dart base type.',
        ),
      },
      orRef: (ref) => 'OrRef',
      andRef: (ref) => 'AndRef',
      mapRef: (ref) => 'MapRef',
      tupleRef: (ref) => 'TupleRef',
      stringLiteralRef: (ref) => 'StringLiteralRef',
    );

    return result;
  }
}
