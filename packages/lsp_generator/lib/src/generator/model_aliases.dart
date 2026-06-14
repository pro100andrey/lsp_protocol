part of 'model_generator.dart';

/// Extension providing alias generation capabilities for [ModelGenerator].
extension ModelGeneratorAliases on ModelGenerator {
  /// Generates a type definition for [alias], including its name, underlying
  /// type, deprecation annotation, and documentation.
  Spec _buildAlias(ResolvedAlias alias) => TypeDef(
    (b) {
      b
        ..name = alias.name
        ..definition = toTypeRef(alias.type);
      if (alias.deprecated != null) {
        b.annotations.add(
          refer('Deprecated').call([literalString(alias.deprecated!)]),
        );
      }
      b.docs.addAll(
        _docLines(
          alias.documentation,
          since: alias.since,
          proposed: alias.proposed,
        ),
      );
    },
  );
}
