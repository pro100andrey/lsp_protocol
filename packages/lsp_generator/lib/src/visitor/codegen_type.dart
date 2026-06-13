import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import '../resolver/resolved_state.dart';
import 'emitter_helpers.dart';
import 'type_reference.dart';

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
      if (classifyUnion(alias.type as UnionType) == CodegenUnionKind.scalar) {
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
      return CodegenUnionKind.mixed;
    }

    final structList = structs.toList(growable: false);
    final listList = lists.toList(growable: false);

    if (structList.isEmpty && listList.isEmpty) {
      return CodegenUnionKind.scalar;
    }

    if (listList.isEmpty && scalars.isNotEmpty && structList.isNotEmpty) {
      return _classifyScalarStruct(structList);
    }

    if (scalars.isEmpty && listList.isNotEmpty && structList.isNotEmpty) {
      return CodegenUnionKind.structList;
    }

    if (scalars.isEmpty && listList.isEmpty && structList.length >= 2) {
      return _classifyStructStruct(structList);
    }

    return CodegenUnionKind.mixed;
  }

  CodegenUnionKind _classifyScalarStruct(List<ResolvedType> structs) {
    final uniqueStructs = structs.map(singleStructKey).toSet();
    return uniqueStructs.length == 1
        ? CodegenUnionKind.scalarStruct
        : CodegenUnionKind.mixed;
  }

  CodegenUnionKind _classifyStructStruct(List<ResolvedType> structs) {
    final uniqueStructs = structs.map(singleStructKey).toSet();
    return uniqueStructs.length >= 2
        ? CodegenUnionKind.structStruct
        : CodegenUnionKind.mixed;
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
    final unique = variants.where((t) {
      final key = singleStructKey(t);
      return seen.add(key);
    }).toList();

    if (unique.length < 2) {
      return null;
    }

    final propMaps = unique.map(_variantPropertiesMap).toList();
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

extension ResolvedTypeCodegenX on ResolvedType {
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
    AliasType(:final ref) => ctx.state.aliases
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

  Spec castExpression(
    Reference typeRef,
    String capSuffix,
    Expression val,
    CodegenContext ctx,
  ) {
    final actual = nonNull;
    final typeName = dartTypeName(actual);

    return switch (actual) {
      DartCoreType() => _castDartCore(val, typeName, capSuffix),
      ClassType(:final ref) => _castUnion(
        refer(ref.name),
        () => refer(ref.name).newInstanceNamed('fromJson', [
          val.bareAsA(tMapSD),
        ]),
        capSuffix,
      ),
      EnumType(:final ref) => _castUnion(
        refer(ref.name),
        () => refer(
          ref.name,
        ).property('decode').call([val.bareAsA(refer(ref.valueType))]),
        capSuffix,
      ),
      AliasType(:final ref) => _castAlias(val, ref, capSuffix, ctx),
      ListType(:final element) => _castList(val, element, capSuffix, ctx),
      MapType() => _castSimple(val, capSuffix, tMapSD),
      InlineRecord(:final fields) => _castInlineRecord(val, fields, capSuffix),
      TupleType(:final items) => _castTuple(val, items, capSuffix),
      _ => _castSimple(val, capSuffix, refer(typeName)),
    };
  }

  Expression _castDartCore(Expression val, String typeName, String capSuffix) {
    if (typeName == 'Null') {
      return literalNull;
    }

    final typeRef = refer(typeName);
    return refer('is$capSuffix').conditional(val.bareAsA(typeRef), literalNull);
  }

  Expression _castUnion(
    Reference ref,
    Expression Function() conversion,
    String capSuffix,
  ) {
    final val = refer('value');
    return val
        .isA(ref)
        .conditional(
          val.bareAsA(ref),
          refer('is$capSuffix').conditional(conversion(), literalNull),
        );
  }

  Expression _castAlias(
    Expression val,
    ResolvedAlias ref,
    String capSuffix,
    CodegenContext ctx,
  ) {
    final aliasRef = refer(ref.name);
    if (ctx.sealedUnionNames.contains(ref.name) ||
        ctx.scalarUnionNames.contains(ref.name)) {
      return _castUnion(
        aliasRef,
        () => aliasRef.newInstanceNamed('fromJson', [val]),
        capSuffix,
      );
    }
    return _castSimple(val, capSuffix, aliasRef);
  }

  Expression _castSimple(Expression val, String capSuffix, Reference typeRef) =>
      refer('is$capSuffix').conditional(val.bareAsA(typeRef), literalNull);

  Expression _castList(
    Expression val,
    ResolvedType element,
    String capSuffix,
    CodegenContext ctx,
  ) {
    final elActual = element.nonNull;
    final elName = dartTypeName(element);

    if (elActual is ClassType) {
      final elClassRef = refer(elActual.ref.name);
      final listClass = TypeReference(
        (b) => b
          ..symbol = 'List'
          ..types.add(elClassRef),
      );
      final mapExpr = _listMapExpr(val, (e) => _fromJsonExpr(e, elClassRef));
      return _castBlock(val, listClass, mapExpr, capSuffix);
    }

    if (elActual is AliasType &&
        (ctx.sealedUnionNames.contains(elActual.ref.name) ||
            ctx.scalarUnionNames.contains(elActual.ref.name))) {
      final elAliasRef = refer(elActual.ref.name);
      final listAlias = TypeReference(
        (b) => b
          ..symbol = 'List'
          ..types.add(elAliasRef),
      );
      final mapExpr = _listMapExpr(
        val,
        (e) => elAliasRef.newInstanceNamed('fromJson', [
          e.bareAsA(refer('Object')),
        ]),
      );
      return _castBlock(val, listAlias, mapExpr, capSuffix);
    }

    return _castSimple(
      val,
      capSuffix,
      TypeReference(
        (b) => b
          ..symbol = 'List'
          ..types.add(refer(elName)),
      ),
    );
  }

  Expression _listMapExpr(
    Expression val,
    Expression Function(Expression e) convert,
  ) => val
      .asA(refer('List'))
      .property('map')
      .call([
        Method(
          (m) => m
            ..lambda = true
            ..requiredParameters.add(Parameter((p) => p..name = 'e'))
            ..body = convert(refer('e')).code,
        ).closure,
      ])
      .property('toList')
      .call([]);

  Expression _castBlock(
    Expression val,
    Reference typeRef,
    Expression mapExpr,
    String capSuffix,
  ) => val
      .isA(typeRef)
      .conditional(
        val.bareAsA(typeRef),
        refer('is$capSuffix').conditional(mapExpr, literalNull),
      );

  Expression _fromJsonExpr(Expression expr, Reference classRef) =>
      classRef.newInstanceNamed('fromJson', [
        expr.bareAsA(tMapSD),
      ]);

  Code _castInlineRecord(
    Expression val,
    List<ResolvedProperty> fields,
    String capSuffix,
  ) {
    final emitter = DartEmitter();
    final mapVar = refer('map');
    final mapDecl = fields.isNotEmpty
        ? declareFinal(
            'map',
          ).assign(val.bareAsA(refer('Map<String, dynamic>'))).statement
        : null;

    final fieldExprs = <String>[];
    for (final f in fields) {
      final fActual = f.type.nonNull;
      final mapAccess = mapVar.index(literalString(f.name));

      final Expression fieldExpr;
      if (fActual is ClassType) {
        final fClassRef = refer(fActual.ref.name);
        final fromJson = _fromJsonExpr(mapAccess, fClassRef);
        final castOrCreate = mapAccess
            .isA(fClassRef)
            .conditional(mapAccess.bareAsA(fClassRef), fromJson);
        fieldExpr = f.optional
            ? mapAccess
                  .notEqualTo(literalNull)
                  .conditional(castOrCreate, literalNull)
            : castOrCreate;
      } else {
        final fTypeName = f.optional || f.type is NullableType
            ? '${dartTypeName(fActual)}?'
            : dartTypeName(fActual);
        fieldExpr = mapAccess.bareAsA(refer(fTypeName));
      }

      fieldExprs.add('${f.name}: ${fieldExpr.accept(emitter)}');
    }

    final recordCode = Code('return (${fieldExprs.join(', ')});');
    return Block.of([
      ifStatement(
        refer('is$capSuffix'),
        Block.of([?mapDecl, recordCode]),
      ),
      literalNull.returned.statement,
    ]);
  }

  Code _castTuple(Expression val, List<ResolvedType> items, String capSuffix) {
    final listVar = refer('list');
    final listDecl = declareFinal(
      'list',
    ).assign(val.bareAsA(refer('List'))).statement;
    final emitter = DartEmitter();

    final positionalExprs = <String>[];
    for (var i = 0; i < items.length; i++) {
      final typeName = dartTypeName(items[i]);
      final expr = listVar.index(literalNum(i)).bareAsA(refer(typeName));
      positionalExprs.add(expr.accept(emitter).toString());
    }

    final recordCode = Code('return (${positionalExprs.join(', ')});');
    return Block.of([
      ifStatement(refer('is$capSuffix'), Block.of([listDecl, recordCode])),
      literalNull.returned.statement,
    ]);
  }

  static String dartTypeName(ResolvedType type) => switch (type) {
    DartCoreType(:final dartName) => dartName,
    ClassType(:final ref) => ref.name,
    EnumType(:final ref) => ref.name,
    AliasType(:final ref) => ref.name,
    ListType(:final element) => 'List<${dartTypeName(element)}>',
    MapType(:final key, :final value) =>
      'Map<${dartTypeName(key)}, ${dartTypeName(value)}>',
    NullableType(:final inner) => '${dartTypeName(inner)}?',
    UnionType() => 'Object',
    TupleType(:final items) => '(${items.map(dartTypeName).join(', ')})',
    StringLiteralType() => 'String',
    InlineRecord() => 'Object',
  };
}
