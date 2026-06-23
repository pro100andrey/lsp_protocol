import 'package:collection/collection.dart';

import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import 'property_resolver.dart';

/// Categories for classifying union types based on their member types.
enum CodegenUnionKind {
  /// Union containing only scalar types (primitives, tuples of scalars).
  scalar,

  /// Union containing scalars and structs with a shared discriminator key.
  scalarStruct,

  /// Union containing lists and structs.
  structList,

  /// Union containing multiple structs with distinct discriminator keys.
  structStruct,

  /// Union with mixed or ambiguous member types.
  mixed,
}

/// A check for distinguishing between union variants, containing a variant
/// type, an optional field name discriminator, and an optional literal
/// value to match against.
typedef CodegenUnionCheck = ({
  ResolvedType variant,
  String fieldName,
  String? literalValue,
});

/// Classifies [UnionType]s into [CodegenUnionKind]s and computes structural
/// discriminators for distinguishing their variants.
///
/// Extracted from `CodegenContext` so the union-shape analysis — the most
/// intricate decision logic in code-gen — lives in one cohesive, testable
/// unit. Depends on a [PropertyResolver] to flatten variant properties.
final class UnionClassifier {
  UnionClassifier(this._props);

  final PropertyResolver _props;

  /// Classifies a [UnionType] into one of the [CodegenUnionKind] categories
  /// based on its member types (scalar, struct, list, or mixed).
  CodegenUnionKind classifyUnion(UnionType u) {
    final scalars = u.items.where((t) => t is DartCoreType || t is TupleType);
    final structs = u.items.where((t) => t is ClassType || t is InlineRecord);
    final lists = u.items.whereType<ListType>();
    final others = u.items.whereNot(
      (t) =>
          t is DartCoreType ||
          t is TupleType ||
          t is ClassType ||
          t is InlineRecord ||
          t is ListType,
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

  /// Classifies a union containing scalars and structs as either
  /// [CodegenUnionKind.scalarStruct] or [CodegenUnionKind.mixed] based on
  /// whether all structs share the same discriminator key.
  CodegenUnionKind _classifyScalarStruct(List<ResolvedType> structs) {
    final uniqueStructs = structs.map(singleStructKey).toSet();
    return uniqueStructs.length == 1
        ? .scalarStruct
        : .mixed;
  }

  /// Classifies a union containing multiple structs as either
  /// [CodegenUnionKind.structStruct] or [CodegenUnionKind.mixed] based on
  /// whether structs have distinct discriminator keys.
  CodegenUnionKind _classifyStructStruct(List<ResolvedType> structs) {
    final uniqueStructs = structs.map(singleStructKey).toSet();
    return uniqueStructs.length >= 2
        ? .structStruct
        : .mixed;
  }

  /// A stable identity key for a struct-like union member, used to dedupe
  /// variants and detect shared/distinct discriminators.
  String singleStructKey(ResolvedType t) => switch (t) {
    ClassType(:final ref) => ref.name,
    InlineRecord(:final fields) =>
      'Record(${fields.map((f) => f.name).join(',')})',
    _ => t.toString(),
  };

  /// Finds a structural discriminator for a list of [variants], returning
  /// [CodegenUnionCheck] objects that can be used to distinguish between
  /// union members via field names or literal values. Returns null if no
  /// discriminator can be determined.
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

  /// Returns a map of property names to [ResolvedProperty] objects for a
  /// [variant], including inherited properties for classes.
  Map<String, ResolvedProperty> _variantPropertiesMap(ResolvedType variant) =>
      switch (variant) {
        ClassType(:final ref) => {
          for (final p in _props.allProperties(ref)) p.name: p,
        },
        InlineRecord(:final fields) => {for (final f in fields) f.name: f},
        _ => {},
      };
}
