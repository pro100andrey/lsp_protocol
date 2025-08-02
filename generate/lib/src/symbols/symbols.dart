import '../../generate.dart';
import 'symbol.dart';

final class Symbols {
  final Map<String, StructureSymbol> structures = {};

  void process(MetaProtocol protocol) {
    final structsByName = getStructuresByName(protocol);

    for (final struct in protocol.structures) {
      final fields = <TypeReferenceSymbol>[];

      final allProperties = getAllProperties(struct, structsByName);

      structures[struct.name] = StructureSymbol(
        name: struct.name,
        fields: fields,
      );
    }
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
    final extendsRefs = (struct.extends$ + struct.mixins$).cast<TypeRef>();
    final extendStructs = extendsRefs.map((ref) => structsByName[ref.name]!);
    final extendProperties = extendStructs.expand((s) => s.properties);

    final result = [...struct.properties, ...extendProperties]
      ..sort((a, b) => a.name.compareTo(b.name));
    
    // Throw if duplicate properties are found
    final seenNames = <String>{};
    for (final property in result) {
      if (seenNames.contains(property.name)) {
        throw Exception('Duplicate property name found: ${property.name}');
      }
      seenNames.add(property.name);
    }

    return result;
  }
}
