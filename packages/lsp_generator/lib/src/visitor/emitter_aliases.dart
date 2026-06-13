part of 'emitter_visitor.dart';

extension EmitterVisitorAliases on EmitterVisitor {
  Spec _buildAlias(ResolvedAlias alias) => TypeDef(
    (b) {
      b
        ..name = alias.name
        ..definition = toTypeRef(alias.type);
      if (alias.deprecated != null) {
        b.annotations.add(
          tDeprecated.call([literalString(alias.deprecated!)]),
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
