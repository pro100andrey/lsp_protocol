part of 'codegen_type.dart';

extension ResolvedTypeCheckX on ResolvedType {
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

  bool isClosedEnum(CodegenContext ctx) => switch (nonNull) {
    EnumType(:final ref) => !ref.supportsCustomValues,
    AliasType(:final ref) => ctx.state.enumerations.any(
      (e) => e.name == ref.name && !e.supportsCustomValues,
    ),
    _ => false,
  };

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
      DartCoreType() => expr,
      StringLiteralType() => expr,
      ClassType() || AliasType() || EnumType() || UnionType() => expr,
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

      MapType() => expr,
      TupleType(:final items) => (() {
        final listExprs = <Expression>[];
        for (var i = 0; i < items.length; i++) {
          final member = expr.property('\$${i + 1}');
          listExprs.add(items[i].toWireExpression(member, ctx));
        }
        return literalList(listExprs);
      })(),

      InlineRecord() => expr,
      NullableType(:final inner) => inner.toWireExpression(expr, ctx),
    };
  }

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
              val.isA(tMapStringDynamic),
              ctx,
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
    MapType() => val.isA(tMapStringDynamic),
    InlineRecord() => _buildStructCheck(
      nonNull,
      structChecks,
      val,
      val.isA(tMapStringDynamic),
      ctx,
    ),
    TupleType(:final items) =>
      val
          .isA(tList)
          .and(
            val.asA(tList).property('length').equalTo(literalNum(items.length)),
          ),
    StringLiteralType() => val.isA(tString),
    _ => val.isA(tObject),
  };

  Expression _checkListType(
    Expression val,
    ResolvedType element,
    List<CodegenUnionCheck>? structChecks,
    UnionType? parentUnion,
    CodegenContext ctx,
  ) {
    if (parentUnion != null) {
      final hasMultipleLists =
          parentUnion.items.where((t) {
            final resolved = switch (t.nonNull) {
              AliasType(:final ref) =>
                ctx.state.aliases
                    .firstWhereOrNull((a) => a.name == ref.name)
                    ?.type,
              _ => t.nonNull,
            };
            return resolved is ListType;
          }).length >
          1;

      if (hasMultipleLists) {
        final isList = val.isA(tList);
        final isEmpty = val.asA(tList).property('isEmpty');
        final firstItem = val.asA(tList).property('first');
        final elementCheck = element.checkExpression(
          firstItem,
          ctx,
          structChecks,
          parentUnion,
        );
        return isList.and(isEmpty.or(elementCheck));
      }
    }
    return val.isA(tList);
  }

  Expression _buildStructCheck(
    ResolvedType actual,
    List<CodegenUnionCheck>? structChecks,
    Expression val,
    Expression fallback,
    CodegenContext ctx,
  ) {
    if (structChecks != null) {
      final key = ctx.singleStructKey(actual);
      final check = structChecks.firstWhereOrNull(
        (c) => ctx.singleStructKey(c.variant) == key,
      );
      if (check != null) {
        final mapRef = tMapStringDynamic;
        final isMap = val.isA(mapRef);

        if (check.fieldName.isNotEmpty) {
          final mapVal = val.asA(mapRef);
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
              final mapVal = val.asA(mapRef);
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
    return _buildRequiredPropertiesCheck(actual, val, ctx);
  }

  Expression _buildRequiredPropertiesCheck(
    ResolvedType type,
    Expression val,
    CodegenContext ctx,
  ) {
    final actual = type.nonNull;
    final List<String> reqs;

    if (actual is ClassType) {
      final cls = ctx.classMap[actual.ref.name];
      reqs = cls != null
          ? [
              for (final p in cls.properties)
                if (!p.optional) p.name,
            ]
          : [];
    } else if (actual is InlineRecord) {
      reqs = [
        for (final f in actual.fields)
          if (!f.optional) f.name,
      ];
    } else {
      reqs = [];
    }

    if (reqs.isEmpty) {
      return val.isA(refer('Map<String, dynamic>'));
    }

    final mapRef = refer('Map<String, dynamic>');
    var cond = val.isA(mapRef);
    final mapVal = val.asA(mapRef);

    for (final req in reqs) {
      cond = cond.and(
        mapVal.property('containsKey').call([literalString(req)]),
      );
    }
    return cond;
  }
}
