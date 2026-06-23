import '../models/resolved_decl.dart';

/// Flattens the full property set of a [ResolvedClass], pulling in inherited
/// properties from `extends` and `mixins`. The class's own properties win on a
/// name clash. Results are memoized per class name.
///
/// Extracted from `CodegenContext` so the inheritance-flattening logic can be
/// reasoned about and unit-tested on its own.
final class PropertyResolver {
  final Map<String, List<ResolvedProperty>> _cache = {};

  /// All properties of [cls] including inherited ones, de-duplicated by name
  /// with the class's own properties taking precedence. Cached per class.
  List<ResolvedProperty> allProperties(ResolvedClass cls) {
    final cached = _cache[cls.name];
    if (cached != null) {
      return cached;
    }

    final visited = <String>{};
    List<ResolvedProperty> collect(ResolvedClass c) {
      if (!visited.add(c.name)) {
        return const [];
      }

      final inherited = <ResolvedProperty>[];
      for (final ext in c.extends$) {
        inherited.addAll(collect(ext.ref));
      }
      for (final mix in c.mixins$) {
        inherited.addAll(collect(mix.ref));
      }

      final ownNames = c.properties.map((p) => p.name).toSet();
      return [
        ...inherited.where((p) => !ownNames.contains(p.name)),
        ...c.properties,
      ];
    }

    return _cache[cls.name] = collect(cls);
  }
}
