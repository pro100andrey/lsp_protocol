// ignore_for_file: avoid_print

import '../../generator.dart';
import '../extensions/string.dart';
import 'symbol.dart';
import 'symbols_table.dart';
import 'type_resolver.dart';

final class Symbols {
  final structuresTable = StructuresTable();
  final typedefsTable = TypedefsTable();
  final enumSymbols = EnumsTable();

  void collect(MetaProtocol protocol) {
    _collectTypedefs(protocol);
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

  void _collectTypedefs(MetaProtocol protocol) {
    for (final typeAlias in protocol.typeAliases) {
      final definition = switch (typeAlias) {
        MetaTypeAlias(name: 'LSPAny') => 'Object?',
        _ => typeAlias.type.resolve(),
      };

      final symbol = TypedefSymbol(
        type: typeAlias.name,
        definition: definition,
        doc: typeAlias.documentation.asDoc(),
      );

      typedefsTable[typeAlias.name] = symbol;
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
      final properties = allProperties
          .map(
            (property) {
              final type = property.type.resolve();

              final isTypeDef = typedefsTable.containsKey(type);

              final converter = isTypeDef && type != 'LSPAny'
                  ? '${type}Converter'
                  : null;

              return PropertySymbol(
                type: type,
                name: property.name,
                optional: property.optional,
                doc: property.documentation.asDoc(width: 76),
                converter: converter,
              );
            },
          )
          .toList(growable: false);

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

    final sorted = resultMap.values.toList(growable: false)
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
