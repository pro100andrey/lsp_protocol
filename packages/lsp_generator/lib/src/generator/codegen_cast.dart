part of 'codegen_type.dart';

/// Code generation utilities for casting JSON values to resolved Dart types
/// during deserialization. Provides methods to generate type guards, casts,
/// and conversions for all supported type variants including core types,
/// classes, enums, aliases, lists, maps, inline records, and tuples.

/// Extension on [ResolvedType] to generate code for casting JSON values
/// to the appropriate Dart types during deserialization.
extension ResolvedTypeCodegenX on ResolvedType {
  static final _mapStringDynamic = TypeReference(
    (b) => b
      ..symbol = 'Map'
      ..types.addAll([refer('String'), refer('dynamic')]),
  );

  static TypeReference _listOf(Reference type) => TypeReference(
    (b) => b
      ..symbol = 'List'
      ..types.add(type),
  );

  /// Generates a cast expression that converts a JSON value to the target
  /// [ResolvedType], wrapped with an `is$capSuffix` guard.
  ///
  /// Returns a [Spec] containing the conditional cast logic.
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
        val,
        refer(ref.name),
        () => refer(ref.name).newInstanceNamed('fromJson', [
          val.bareAsA(_mapStringDynamic),
        ]),
        capSuffix,
      ),
      EnumType(:final ref) => _castUnion(
        val,
        refer(ref.name),
        () => refer(
          ref.name,
        ).property('decode').call([val.bareAsA(refer(ref.valueType))]),
        capSuffix,
      ),
      AliasType(:final ref) => _castAlias(val, ref, capSuffix, ctx),
      ListType(:final element) => _castList(val, element, capSuffix, ctx),
      MapType() => _castSimple(val, capSuffix, _mapStringDynamic),
      InlineRecord(:final fields) => _castInlineRecord(val, fields, capSuffix),
      TupleType(:final items) => _castTuple(val, items, capSuffix),
      _ => _castSimple(val, capSuffix, refer(typeName)),
    };
  }

  /// Generates a cast expression for core Dart types (int, String, bool, etc.)
  /// or null. Returns null when `is$capSuffix` is false.
  Expression _castDartCore(Expression val, String typeName, String capSuffix) {
    if (typeName == 'Null') {
      return literalNull;
    }

    final typeRef = refer(typeName);

    return refer('is$capSuffix').conditional(val.bareAsA(typeRef), literalNull);
  }

  /// Generates a cast expression for union types, checking if the value
  /// is an instance of the target type and either casting it or performing
  /// a conversion via [conversion].
  Expression _castUnion(
    Expression val,
    Reference ref,
    Expression Function() conversion,
    String capSuffix,
  ) => val
      .isA(ref)
      .conditional(
        val.bareAsA(ref),
        refer('is$capSuffix').conditional(conversion(), literalNull),
      );

  /// Generates a cast expression for alias types, delegating to [_castUnion]
  /// for sealed union or scalar union aliases, or to [_castSimple] otherwise.
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
        val,
        aliasRef,
        () => aliasRef.newInstanceNamed('fromJson', [val]),
        capSuffix,
      );
    }
    return _castSimple(val, capSuffix, aliasRef);
  }

  /// Generates a simple cast expression that checks `is$capSuffix` and casts
  /// [val] to [typeRef], returning null when the guard is false.
  Expression _castSimple(Expression val, String capSuffix, Reference typeRef) =>
      refer('is$capSuffix').conditional(val.bareAsA(typeRef), literalNull);

  /// Generates a cast expression for list types, handling class types,
  /// alias types (sealed union or scalar unions), and simple element types.
  /// Returns a conditional expression that maps over the list elements.
  Expression _castList(
    Expression val,
    ResolvedType element,
    String capSuffix,
    CodegenContext ctx,
  ) {
    final elActual = element.nonNull;
    final elName = dartTypeName(element);

    return switch (elActual) {
      ClassType(:final ref) => _castListBlock(
        val,
        refer(ref.name),
        (e) => _fromJsonExpr(e, refer(ref.name)),
        capSuffix,
      ),
      AliasType(:final ref)
          when ctx.sealedUnionNames.contains(ref.name) ||
              ctx.scalarUnionNames.contains(ref.name) =>
        _castListBlock(
          val,
          refer(ref.name),
          (e) => refer(ref.name).newInstanceNamed('fromJson', [
            e.bareAsA(refer('Object')),
          ]),
          capSuffix,
        ),
      _ => _castSimple(val, capSuffix, _listOf(refer(elName))),
    };
  }

  Expression _castListBlock(
    Expression val,
    Reference elRef,
    Expression Function(Expression e) convert,
    String capSuffix,
  ) {
    final mapExpr = _listMapExpr(val, convert);
    return _castBlock(val, _listOf(elRef), mapExpr, capSuffix);
  }

  /// Creates a `.map().toList()` expression on [val], applying [convert]
  /// to each element after casting to [List].
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

  /// Generates a cast expression for block types (class/alias list elements),
  /// checking if [val] is an instance of [typeRef] and casting it, or
  /// performing a map conversion via [mapExpr] when `is$capSuffix` is true.
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

  /// Generates a `ClassName.fromJson(value)` expression for [expr] using
  /// [classRef].
  Expression _fromJsonExpr(Expression expr, Reference classRef) =>
      classRef.newInstanceNamed('fromJson', [expr.bareAsA(_mapStringDynamic)]);

  /// Generates code to cast a JSON map to an inline record type by iterating
  /// over [fields], casting each field value appropriately, and returning
  /// a record literal. Returns a [Code] block with an `is$capSuffix` guard.
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

      final fieldExpr = switch (fActual) {
        ClassType(:final ref) => (() {
          final fClassRef = refer(ref.name);
          final fromJson = _fromJsonExpr(mapAccess, fClassRef);
          final castOrCreate = mapAccess
              .isA(fClassRef)
              .conditional(mapAccess.bareAsA(fClassRef), fromJson);
          return f.optional
              ? mapAccess
                    .notEqualTo(literalNull)
                    .conditional(castOrCreate, literalNull)
              : castOrCreate;
        })(),
        _ => (() {
          final isNullable = f.optional || f.type is NullableType;
          final fTypeName = '${dartTypeName(fActual)}${isNullable ? '?' : ''}';
          return mapAccess.bareAsA(refer(fTypeName));
        })(),
      };

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

  /// Generates code to cast a JSON list to a tuple type by iterating over
  /// [items], casting each element by its index, and returning a record
  /// literal. Returns a [Code] block with an `is$capSuffix` guard.
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

  /// Converts a [ResolvedType] to its Dart type name as a String.
  /// Handles all resolved type variants including core types, classes,
  /// enums, aliases, collections, unions, tuples, and inline records.
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
