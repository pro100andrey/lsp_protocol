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
      final allProperties = _getAllProperties(struct, structuresByName);
      final properties = allProperties
          .map(
            (property) => PropertySymbol(
              type: resolveType(property.type),
              isOptional: property.optional,
              doc: property.documentation,
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

  Iterable<MetaProperty> _getAllProperties(
    MetaStructure struct,
    Map<String, MetaStructure> structsByName,
  ) {
    final extendsRefs = (struct.extends$ + struct.mixins$).cast<TypeRef>();
    final extendStructs = extendsRefs.map((ref) => structsByName[ref.name]!);
    final extendProperties = extendStructs.expand((s) => s.properties);

    final result = [...struct.properties, ...extendProperties]
      ..sort((a, b) => a.name.compareTo(b.name));

    // Throw if duplicate properties are found
    final seenNames = <String>{};
    for (final property in result) {
      if (seenNames.contains(property.name)) {
        print('Duplicate property name found: ${property.name} ');
      }
      seenNames.add(property.name);
    }

    return result;
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
