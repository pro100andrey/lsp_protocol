import 'package:freezed_annotation/freezed_annotation.dart';

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
    // _collectTypedefs(protocol);
    _collectStructures(protocol);
    // _collectEnums(protocol);
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
        ref: typeAlias.type,
      );

      typedefsTable[typeAlias.name] = symbol;
    }
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

  void _collectStructures(MetaProtocol protocol) {
    final structuresByName = <String, MetaStructure>{};

    for (final struct in protocol.structures) {
      assert(
        !structuresByName.containsKey(struct.name),
        'Duplicate structure name found: ${struct.name}',
      );

      structuresByName[struct.name] = struct;
    }

    for (final struct in structuresByName.values) {
      // Contains duplicated properties
      final properties = getAllProperties(struct, structuresByName)
          .map(
            (property) {
              final type = property.type.resolve();

              return PropertySymbol(
                type: type,
                name: property.name,
                optional: property.optional,
                doc: property.documentation.asDoc(width: 76),
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
    final mixinsList = struct.mixins$.cast<TypeRef>();
    final extendsList = struct.extends$.cast<TypeRef>();

    final extendsProperties = [
      for (final ref in extendsList) ...structsByName[ref.name]!.properties,
    ];

    final mixinsProperties = [
      for (final ref in mixinsList) ...structsByName[ref.name]!.properties,
    ];

    final structProperties = struct.properties;

    final result = <String, MetaProperty>{};

    for (final prop in extendsProperties) {
      if (result.containsKey(prop.name)) {
        throw Exception('Duplicate property name found: ${prop.name}');
      }
      result[prop.name] = prop;
    }

    for (final prop in mixinsProperties) {
      if (result.containsKey(prop.name)) {
        throw Exception('Duplicate property name found: ${prop.name}');
      }
      result[prop.name] = prop;
    }

    for (final prop in structProperties) {
      if (result.containsKey(prop.name)) {
        throw Exception('Duplicate property name found: ${prop.name}');
      }
      result[prop.name] = prop;
    }

    final sorted = result.values.toList(growable: false)
      ..sort((a, b) => a.name.compareTo(b.name));

    return sorted;
  }
}
