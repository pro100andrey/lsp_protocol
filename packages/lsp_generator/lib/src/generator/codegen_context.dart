part of 'codegen_type.dart';

/// Composition root for code generation: the lookup indices over the resolved
/// model, plus the [PropertyResolver] and [UnionClassifier] collaborators that
/// own property flattening and union-shape analysis respectively.
///
/// Callers receive a single `CodegenContext`; the heavy logic lives in the
/// focused helpers it delegates to.
final class CodegenContext {
  CodegenContext(this.state)
    : classNames = state.classes.map((c) => c.name).toSet(),
      classMap = {for (final c in state.classes) c.name: c} {
    // Sealed union names: aliases whose resolved type is a union (and that
    // aren't shadowed by a class of the same name).
    for (final alias in state.aliases) {
      if (classNames.contains(alias.name)) {
        continue;
      }
      if (alias.type case UnionType()) {
        sealedUnionNames.add(alias.name);
      }
    }
    // Scalar union names: the subset of sealed unions classified as scalar.
    for (final name in sealedUnionNames) {
      final alias = state.aliases.firstWhere((a) => a.name == name);
      if (alias.type case final UnionType ut
          when _unions.classifyUnion(ut) == .scalar) {
        scalarUnionNames.add(name);
      }
    }
  }

  final ResolveResult state;
  final Set<String> classNames;
  final Map<String, ResolvedClass> classMap;
  final Set<String> sealedUnionNames = {};
  final Set<String> scalarUnionNames = {};

  final _props = PropertyResolver();
  late final _unions = UnionClassifier(_props);

  /// All properties of [cls] including inherited ones — see
  /// [PropertyResolver.allProperties].
  List<ResolvedProperty> allProperties(ResolvedClass cls) =>
      _props.allProperties(cls);

  /// Classifies [u] — see [UnionClassifier.classifyUnion].
  CodegenUnionKind classifyUnion(UnionType u) => _unions.classifyUnion(u);

  /// A stable identity key for a struct-like union member — see
  /// [UnionClassifier.singleStructKey].
  String singleStructKey(ResolvedType t) => _unions.singleStructKey(t);

  /// Finds a structural discriminator for [variants] — see
  /// [UnionClassifier.findStructDiscriminator].
  List<CodegenUnionCheck>? findStructDiscriminator(
    List<ResolvedType> variants,
  ) => _unions.findStructDiscriminator(variants);
}
