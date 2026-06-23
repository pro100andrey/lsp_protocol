part of 'codegen_type.dart';

/// Code generation utilities for checking JSON values against resolved Dart
/// types during deserialization. Provides methods to generate type guards,
/// wire conversion expressions, and structural validation checks.
extension ResolvedTypeCheckX on ResolvedType {
  /// Returns true if this type has a `toJson()` method for serialization,
  /// including classes, aliases pointing to known types or custom enum values,
  /// and enums with custom value support.
  bool hasToJson(CodegenContext ctx) => switch (nonNull) {
    ClassType() => true,

    AliasType(:final ref) =>
      ref.name == 'LSPAny' ||
          ctx.classNames.contains(ref.name) ||
          ctx.sealedUnionNames.contains(ref.name) ||
          ctx.scalarUnionNames.contains(ref.name) ||
          ctx.state.enumerations.any(
            (e) => e.name == ref.name && e.supportsCustomValues,
          ),

    EnumType(:final ref) => ref.supportsCustomValues,
    _ => false,
  };

  /// Returns true if this type represents a closed enum (without custom values)
  bool isClosedEnum(CodegenContext ctx) => switch (nonNull) {
    EnumType(:final ref) => !ref.supportsCustomValues,

    AliasType(:final ref) => ctx.state.enumerations.any(
      (e) => e.name == ref.name && !e.supportsCustomValues,
    ),

    _ => false,
  };

  /// Generates an expression to convert a value to its wire (JSON)
  /// representation, calling `toJson()` on classes, `.value` on closed enums,
  /// and recursively processing tuples and lists with custom types.
  Expression toWireExpression(Expression expr, CodegenContext ctx) {
    final isNullable = this is NullableType;
    final actual = nonNull;

    if (actual.hasToJson(ctx)) {
      return isNullable
          ? expr.nullSafeProperty('toJson').call([])
          : expr.property('toJson').call([]);
    }

    if (actual.isClosedEnum(ctx)) {
      return isNullable
          ? expr.nullSafeProperty('value')
          : expr.property('value');
    }

    return switch (actual) {
      ListType(:final element) => (() {
        if (element.nonNull.hasToJson(ctx) ||
            element.nonNull.isClosedEnum(ctx)) {
          final closure = element.nonNull.hasToJson(ctx)
              ? refer('(e) => e.toJson()')
              : refer('(e) => e.value');

          final mapCall = isNullable
              ? expr.nullSafeProperty('map')
              : expr.property('map');

          return mapCall.call([closure]).property('toList').call([]);
        }
        return expr;
      })(),
      TupleType(:final items) => (() {
        final listExprs = <Expression>[];
        for (var i = 0; i < items.length; i++) {
          final member = expr.property('\$${i + 1}');
          listExprs.add(items[i].toWireExpression(member, ctx));
        }
        return literalList(listExprs);
      })(),
      NullableType(:final inner) => inner.toWireExpression(expr, ctx),
      _ => expr,
    };
  }

  /// Generates a boolean expression that checks if [val] is valid for this
  /// type, including type checks, structural checks for classes/inline records,
  /// union member validation, and list/tuple element verification.
  Expression checkExpression(
    Expression val,
    CodegenContext ctx, [
    List<CodegenUnionCheck>? structChecks,
    UnionType? parentUnion,
  ]) => switch (nonNull) {
    DartCoreType(dartName: 'Object?') => literalTrue,

    DartCoreType(dartName: 'Null') => val.equalTo(literalNull),

    DartCoreType(:final dartName) => val.isA(refer(dartName)),

    ClassType(:final ref) =>
      val
          .isA(refer(ref.name))
          .or(
            _buildStructCheck(
              nonNull,
              structChecks,
              val,
              val.isA(refer('Map<String, dynamic>')),
              ctx,
              parentUnion,
            ),
          ),

    EnumType(:final ref) =>
      val.isA(refer(ref.name)).or(val.isA(refer(ref.valueType))),

    AliasType(:final ref) =>
      ctx.state.aliases
          .firstWhere((a) => a.name == ref.name)
          .type
          .checkExpression(val, ctx, structChecks, parentUnion),

    UnionType(:final items) =>
      items
          .skip(1)
          .fold(
            items.first.checkExpression(val, ctx, structChecks, parentUnion),
            (cond, item) => cond.or(
              item.checkExpression(val, ctx, structChecks, parentUnion),
            ),
          ),

    ListType(:final element) => _checkListType(
      val,
      element,
      structChecks,
      parentUnion,
      ctx,
    ),
    MapType() => val.isA(refer('Map<String, dynamic>')),

    InlineRecord() => _buildStructCheck(
      nonNull,
      structChecks,
      val,
      val.isA(refer('Map<String, dynamic>')),
      ctx,
      parentUnion,
    ),

    TupleType(:final items) =>
      val
          .isA(refer('List'))
          .and(
            _nullSafeCast(
              val,
              refer('List'),
              parentUnion,
            ).property('length').equalTo(literalNum(items.length)),
          ),

    StringLiteralType() => val.isA(refer('String')),
    _ => val.isA(refer('Object')),
  };

  /// Generates a check expression for list types, with special handling for
  /// union types containing multiple lists to disambiguate by first element.
  Expression _checkListType(
    Expression val,
    ResolvedType element,
    List<CodegenUnionCheck>? structChecks,
    UnionType? parentUnion,
    CodegenContext ctx,
  ) {
    if (parentUnion != null) {
      ResolvedType resolveAlias(ResolvedType t) => switch (t.nonNull) {
        AliasType(:final ref) =>
          ctx.state.aliases.firstWhereOrNull((a) => a.name == ref.name)?.type ??
              t.nonNull,
        _ => t.nonNull,
      };

      final hasMultipleLists =
          parentUnion.items.where((t) => resolveAlias(t) is ListType).length >
          1;

      if (hasMultipleLists) {
        final isList = val.isA(refer('List'));
        final isEmpty = _nullSafeCast(
          val,
          refer('List'),
          parentUnion,
        ).property('isEmpty');
        final firstItem = _nullSafeCast(
          val,
          refer('List'),
          parentUnion,
        ).property('first');
        final elementCheck = element.checkExpression(
          firstItem,
          ctx,
          structChecks,
          parentUnion,
        );

        return isList.and(isEmpty.or(elementCheck));
      }
    }

    return val.isA(refer('List'));
  }

  /// Generates a structural check for classes and inline records, validating
  /// against [structChecks] for discriminated unions or falling back to
  /// required property checks.
  Expression _buildStructCheck(
    ResolvedType actual,
    List<CodegenUnionCheck>? structChecks,
    Expression val,
    Expression fallback,
    CodegenContext ctx,
    UnionType? parentUnion,
  ) {
    if (structChecks != null) {
      final key = ctx.singleStructKey(actual);
      final check = structChecks.firstWhereOrNull(
        (c) => ctx.singleStructKey(c.variant) == key,
      );
      if (check != null) {
        final mapRef = refer('Map<String, dynamic>');
        final isMap = val.isA(mapRef);

        if (check.fieldName.isNotEmpty) {
          final mapVal = _nullSafeCast(val, mapRef, parentUnion);
          if (check.literalValue != null) {
            final hasLiteral = mapVal
                .index(literalString(check.fieldName))
                .equalTo(literalString(check.literalValue!));

            return isMap.and(hasLiteral);
          } else {
            final hasKey = mapVal.property('containsKey').call([
              literalString(check.fieldName),
            ]);

            return isMap.and(hasKey);
          }
        } else {
          var cond = isMap;

          for (final other in structChecks) {
            if (other != check && other.fieldName.isNotEmpty) {
              final mapVal = _nullSafeCast(val, mapRef, parentUnion);
              final hasKey = mapVal.property('containsKey').call([
                literalString(other.fieldName),
              ]);

              cond = cond.and(hasKey.negate());
            }
          }

          return cond;
        }
      }
    }
    return _buildRequiredPropertiesCheck(actual, val, ctx, parentUnion);
  }

  /// Generates a check expression that validates all required (non-optional)
  /// properties exist as keys in the JSON map.
  Expression _buildRequiredPropertiesCheck(
    ResolvedType type,
    Expression val,
    CodegenContext ctx,
    UnionType? parentUnion,
  ) {
    final actual = type.nonNull;

    final reqs = switch (actual) {
      ClassType(:final ref) =>
        ctx.classMap[ref.name]?.properties
                .where((p) => !p.optional)
                .map((p) => p.name)
                .toList() ??
            [],

      InlineRecord(:final fields) =>
        fields.where((f) => !f.optional).map((f) => f.name).toList(),
      _ => <String>[],
    };

    final mapRef = refer('Map<String, dynamic>');

    if (reqs.isEmpty) {
      return val.isA(mapRef);
    }

    var cond = val.isA(mapRef);
    final mapVal = _nullSafeCast(val, mapRef, parentUnion);

    for (final req in reqs) {
      cond = cond.and(
        mapVal.property('containsKey').call([literalString(req)]),
      );
    }

    return cond;
  }

  Expression _nullSafeCast(
    Expression val,
    Reference typeRef,
    UnionType? parentUnion,
  ) {
    final hasNull = parentUnion?.containsNull ?? false;

    final isValueRef = val is Reference && val.symbol == 'value';

    if (isValueRef && !hasNull) {
      return val.asA(typeRef);
    }

    return val.nullChecked.asA(typeRef);
  }
}
