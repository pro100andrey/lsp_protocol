import '../meta/protocol.dart';

final class StructsMap {
  final _structures = <MetaStructure>[];
  void processProtocol(MetaProtocol protocol) {}

  // Map<String, MetaProperty> _collectInheritedProperties(
  //   MetaStructure structure,
  // ) {
  //   final inheritedProperties = <String, MetaProperty>{};

  //   // Collect from extended structures first (bottom-up)
  //   for (final extendRef in structure.extends$) {
  //     // Use type resolver to get the name
  //     final extendedStructureName = extendRef.resolveType(_typeResolverVisitor);
  //     final extendedStructure = _structures[extendedStructureName];
  //     if (extendedStructure != null) {
  //       final parentProperties = _collectAllProperties(extendedStructure);
  //       inheritedProperties.addAll(parentProperties);
  //     }
  //   }

  //   // Collect from mixins
  //   for (final mixinRef in structure.mixins$) {
  //     // Use type resolver to get the name
  //     final mixinStructureName = mixinRef.resolveType(_typeResolverVisitor);
  //     final mixinStructure = _structures[mixinStructureName];
  //     if (mixinStructure != null) {
  //       final mixinProperties = _collectAllProperties(mixinStructure);
  //       inheritedProperties.addAll(mixinProperties);
  //     }
  //   }

  //   return inheritedProperties;
  // }
}
