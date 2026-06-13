part of 'codegen_type.dart';

class CodegenContext {
  CodegenContext(this.state)
    : classNames = state.classes.map((c) => c.name).toSet(),
      classMap = {for (final c in state.classes) c.name: c},
      sealedUnionNames = <String>{},
      scalarUnionNames = <String>{} {
    // 1. sealed union names
    for (final alias in state.aliases) {
      if (classNames.contains(alias.name)) {
        continue;
      }

      if (alias.type is UnionType) {
        sealedUnionNames.add(alias.name);
      }
    }
    // 2. scalar union names
    for (final name in sealedUnionNames) {
      final alias = state.aliases.firstWhere((a) => a.name == name);
      if (classifyUnion(alias.type as UnionType) == .scalar) {
        scalarUnionNames.add(name);
      }
    }
  }

  final ResolvedState state;
  final Set<String> classNames;
  final Set<String> sealedUnionNames;
  final Set<String> scalarUnionNames;
  final Map<String, List<ResolvedProperty>> _allPropertiesCache = {};
  final Map<String, ResolvedClass> classMap;

  List<ResolvedProperty> allProperties(ResolvedClass cls) {
    if (_allPropertiesCache.containsKey(cls.name)) {
      return _allPropertiesCache[cls.name]!;
    }
    final visited = <String>{};
    List<ResolvedProperty> helper(ResolvedClass c) {
      if (!visited.add(c.name)) {
        return [];
      }

      final inherited = <ResolvedProperty>[];
      for (final ext in c.extends$) {
        if (ext is ClassType) {
          inherited.addAll(helper(ext.ref));
        }
      }

      for (final mix in c.mixins$) {
        if (mix is ClassType) {
          inherited.addAll(helper(mix.ref));
        }
      }

      final ownNames = c.properties.map((p) => p.name).toSet();

      return [
        ...inherited.where((p) => !ownNames.contains(p.name)),
        ...c.properties,
      ];
    }

    return _allPropertiesCache[cls.name] = helper(cls);
  }

  CodegenUnionKind classifyUnion(UnionType u) {
    final scalars = u.items.where((t) => t is DartCoreType || t is TupleType);
    final structs = u.items.where((t) => t is ClassType || t is InlineRecord);
    final lists = u.items.whereType<ListType>();
    final others = u.items.where(
      (t) =>
          t is! DartCoreType &&
          t is! TupleType &&
          t is! ClassType &&
          t is! InlineRecord &&
          t is! ListType,
    );

    if (others.isNotEmpty) {
      return .mixed;
    }

    final structList = structs.toList(growable: false);
    final listList = lists.toList(growable: false);

    if (structList.isEmpty && listList.isEmpty) {
      return .scalar;
    }

    if (listList.isEmpty && scalars.isNotEmpty && structList.isNotEmpty) {
      return _classifyScalarStruct(structList);
    }

    if (scalars.isEmpty && listList.isNotEmpty && structList.isNotEmpty) {
      return .structList;
    }

    if (scalars.isEmpty && listList.isEmpty && structList.length >= 2) {
      return _classifyStructStruct(structList);
    }

    return .mixed;
  }

  CodegenUnionKind _classifyScalarStruct(List<ResolvedType> structs) {
    final uniqueStructs = structs.map(singleStructKey).toSet();

    return uniqueStructs.length == 1 ? .scalarStruct : .mixed;
  }

  CodegenUnionKind _classifyStructStruct(List<ResolvedType> structs) {
    final uniqueStructs = structs.map(singleStructKey).toSet();

    return uniqueStructs.length >= 2 ? .structStruct : .mixed;
  }

  String singleStructKey(ResolvedType t) => switch (t) {
    ClassType(:final ref) => ref.name,
    InlineRecord(:final fields) =>
      'Record(${fields.map((f) => f.name).join(',')})',
    _ => t.toString(),
  };

  List<CodegenUnionCheck>? findStructDiscriminator(
    List<ResolvedType> variants,
  ) {
    final seen = <String>{};
    final unique = variants
        .where((t) {
          final key = singleStructKey(t);
          return seen.add(key);
        })
        .toList(growable: false);

    if (unique.length < 2) {
      return null;
    }

    final propMaps = unique.map(_variantPropertiesMap).toList(growable: false);
    final requiredSets = [
      for (final m in propMaps)
        {
          for (final e in m.entries)
            if (!e.value.optional) e.key,
        },
    ];

    final commonRequired = requiredSets.reduce((a, b) => a.intersection(b));

    for (final propName in commonRequired) {
      final literals = <String>[];
      var valid = true;
      for (final m in propMaps) {
        final t = m[propName]?.type;
        if (t case StringLiteralType(:final value)) {
          literals.add(value);
        } else {
          valid = false;
          break;
        }
      }

      if (valid && literals.toSet().length == unique.length) {
        return [
          for (var i = 0; i < unique.length; i++)
            (
              variant: unique[i],
              fieldName: propName,
              literalValue: literals[i],
            ),
        ];
      }
    }

    final checks = <CodegenUnionCheck>[];
    ResolvedType? elseVariant;
    for (var i = 0; i < unique.length; i++) {
      final otherRequired = <String>{};
      for (var j = 0; j < unique.length; j++) {
        if (j != i) {
          otherRequired.addAll(requiredSets[j]);
        }
      }

      final uniqueProps = requiredSets[i].difference(otherRequired);
      if (uniqueProps.isEmpty) {
        if (elseVariant != null) {
          return null;
        }
        elseVariant = unique[i];
      } else {
        checks.add((
          variant: unique[i],
          fieldName: uniqueProps.first,
          literalValue: null,
        ));
      }
    }
    checks.add((
      variant: elseVariant ?? unique.last,
      fieldName: '',
      literalValue: null,
    ));

    return checks;
  }

  Map<String, ResolvedProperty> _variantPropertiesMap(ResolvedType variant) =>
      switch (variant) {
        ClassType(:final ref) => {
          for (final p in allProperties(ref)) p.name: p,
        },
        InlineRecord(:final fields) => {for (final f in fields) f.name: f},
        _ => {},
      };
}

enum CodegenUnionKind { scalar, scalarStruct, structList, structStruct, mixed }

typedef CodegenUnionCheck = ({
  ResolvedType variant,
  String fieldName,
  String? literalValue,
});
