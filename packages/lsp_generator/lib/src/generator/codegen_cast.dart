part of 'codegen_type.dart';

extension ResolvedTypeCodegenX on ResolvedType {
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
            ..requiredParameters.add(.new((p) => p..name = 'e'))
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
        .of([?mapDecl, recordCode]),
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
      ifStatement(refer('is$capSuffix'), .of([listDecl, recordCode])),
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
