part of 'model_generator.dart';

extension ModelGeneratorUnions on ModelGenerator {
  Spec _buildExtensionTypeUnion(
    String name,
    UnionType ut, {
    String? deprecated,
    List<String> docs = const [],
  }) => ExtensionType((b) {
    final hasNull = ut.items.any(
      (item) => item is DartCoreType && item.dartName == 'Null',
    );

    final representationType = hasNull ? tObjectNullable : tObject;

    _addExtensionTypeStructure(b, name, representationType, deprecated);
    _addExtensionTypeAnnotations(b, docs, deprecated);
    _addExtensionTypeFromJson(b, name, representationType, deprecated);
    _addExtensionTypeVariantConstructors(b, name, ut, deprecated);
    _addExtensionTypeToJson(b, representationType);
    _addExtensionTypeVariantGetters(b, name, ut, representationType);
  });

  void _addExtensionTypeStructure(
    ExtensionTypeBuilder b,
    String name,
    Reference representationType,
    String? deprecated,
  ) => b
    ..name = name
    ..constant = true
    ..primaryConstructorName = '_'
    ..representationDeclaration = .new(
      (r) {
        r
          ..name = 'value'
          ..declaredRepresentationType = representationType;
        if (deprecated != null) {
          r.annotations.add(tDeprecated.call([literalString(deprecated)]));
        }
      },
    );

  void _addExtensionTypeAnnotations(
    ExtensionTypeBuilder b,
    List<String> docs,
    String? deprecated,
  ) {
    b.docs.addAll(docs);
    if (deprecated != null) {
      b.annotations.add(tDeprecated.call([literalString(deprecated)]));
    }
  }

  void _addExtensionTypeFromJson(
    ExtensionTypeBuilder b,
    String name,
    Reference representationType,
    String? deprecated,
  ) => b.constructors.add(
    .new(
      (b) {
        b
          ..factory = true
          ..constant = true
          ..name = 'fromJson'
          ..requiredParameters.add(
            .new(
              (b) => b
                ..name = 'json'
                ..type = representationType,
            ),
          )
          ..redirect = refer('$name._');

        if (deprecated != null) {
          b.annotations.add(tDeprecated.call([literalString(deprecated)]));
        }
      },
    ),
  );

  void _addExtensionTypeVariantConstructors(
    ExtensionTypeBuilder b,
    String name,
    UnionType ut,
    String? deprecated,
  ) {
    final uniqueItems = <ResolvedType>[];
    final seenSuffixes = <String>{};
    for (final item in ut.items) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = capitalize(suffix);
      if (seenSuffixes.add(capSuffix)) {
        uniqueItems.add(item);
      }
    }

    for (final item in uniqueItems) {
      final suffix = _variantSuffix(item, name);
      var constructorName = toLowerCamelCase(suffix);
      if (reservedDartKeywords.contains(constructorName)) {
        constructorName = '${constructorName}Value';
      }

      final isNullType = item is DartCoreType && item.dartName == 'Null';

      if (item case InlineRecord(:final fields)) {
        b.constructors.add(
          _buildInlineRecordConstructor(
            b,
            name,
            fields,
            constructorName,
            deprecated,
          ),
        );
      } else {
        b.constructors.add(
          _buildVariantConstructor(
            b,
            name,
            item,
            constructorName,
            isNullType,
            deprecated,
          ),
        );
      }
    }
  }

  Constructor _buildInlineRecordConstructor(
    ExtensionTypeBuilder b,
    String name,
    List<ResolvedProperty> fields,
    String constructorName,
    String? deprecated,
  ) => Constructor((b) {
    b
      ..factory = true
      ..name = constructorName;
    if (deprecated != null) {
      b.annotations.add(tDeprecated.call([literalString(deprecated)]));
    }

    // Add named parameters: required first, then optional.
    final sortedFields = [
      ...fields.where((f) => !f.optional),
      ...fields.where((f) => f.optional),
    ];
    for (final f in sortedFields) {
      b.optionalParameters.add(
        .new(
          (p) => p
            ..name = f.name
            ..type = toRef(f.type, nullable: f.optional)
            ..named = true
            ..required = !f.optional,
        ),
      );
    }

    final mapEntries = <String>[];
    for (final f in fields) {
      final wireExpr = f.type
          .toWireExpression(refer(f.name), _ctx)
          .accept(DartEmitter())
          .toString();
      if (f.optional) {
        mapEntries.add("'${f.name}': ?$wireExpr");
      } else {
        mapEntries.add("'${f.name}': $wireExpr");
      }
    }

    final constructorPrefix = fields.isEmpty ? 'const $name._' : '$name._';
    b
      ..lambda = true
      ..body = Code("$constructorPrefix({\n${mapEntries.join(',\n')}\n})");
  });

  Constructor _buildVariantConstructor(
    ExtensionTypeBuilder b,
    String name,
    ResolvedType item,
    String constructorName,
    bool isNullType,
    String? deprecated,
  ) {
    final wireExpr = isNullType
        ? null
        : item.toWireExpression(refer('value'), _ctx);
    final isSimpleRedirect =
        !isNullType && wireExpr is Reference && wireExpr.symbol == 'value';

    return .new((b) {
      b
        ..factory = true
        ..name = constructorName;
      if (deprecated != null) {
        b.annotations.add(tDeprecated.call([literalString(deprecated)]));
      }

      if (!isNullType) {
        b.requiredParameters.add(
          .new(
            (p) => p
              ..name = 'value'
              ..type = toRef(item),
          ),
        );
      }

      if (isSimpleRedirect) {
        b
          ..constant = true
          ..redirect = refer('$name._');
      } else {
        final arg = isNullType ? literalNull : wireExpr!;
        final constructorRefer = isNullType
            ? refer('const $name._')
            : refer('$name._');
        b
          ..lambda = true
          ..body = constructorRefer.call([arg]).code;
      }
    });
  }

  void _addExtensionTypeToJson(
    ExtensionTypeBuilder b,
    Reference representationType,
  ) => b.methods.add(
    .new(
      (b) => b
        ..name = 'toJson'
        ..returns = representationType
        ..lambda = true
        ..body = eValue.code,
    ),
  );

  void _addExtensionTypeVariantGetters(
    ExtensionTypeBuilder b,
    String name,
    UnionType ut,
    Reference representationType,
  ) {
    final uniqueItems = <ResolvedType>[];
    final seenSuffixes = <String>{};
    for (final item in ut.items) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = capitalize(suffix);
      if (seenSuffixes.add(capSuffix)) {
        uniqueItems.add(item);
      }
    }

    final structs = uniqueItems
        .where((t) => t is ClassType || t is InlineRecord)
        .toList(growable: false);

    final structChecks = _ctx.findStructDiscriminator(structs);

    for (final item in uniqueItems) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = capitalize(suffix);
      final typeRef = toRef(item);
      final checkExpr = item.checkExpression(eValue, _ctx, structChecks, ut);
      final val = representationType.symbol == 'Object?'
          ? const CodeExpression(.new('value!'))
          : refer('value');
      final castExpr = item.castExpression(typeRef, capSuffix, val, _ctx);

      b.methods.add(
        .new(
          (b) => b
            ..name = 'is$capSuffix'
            ..returns = tBool
            ..type = .getter
            ..lambda = true
            ..body = checkExpr.code,
        ),
      );

      final isNullType = typeRef.symbol == 'Null';
      final nullableTypeRef = isNullType
          ? refer('Object?')
          : (typeRef is TypeReference
                ? typeRef.rebuild((b) => b.isNullable = true)
                : (typeRef is RecordType
                      ? typeRef.rebuild((b) => b.isNullable = true)
                      : typeRef));

      b.methods.add(
        .new(
          (b) => b
            ..name = 'as$capSuffix'
            ..returns = nullableTypeRef
            ..type = .getter
            ..lambda = castExpr is Expression
            ..body = castExpr is Expression ? castExpr.code : castExpr as Code,
        ),
      );
    }
  }

  String _variantSuffix(ResolvedType item, String aliasName) {
    final actual = item.nonNull;

    return switch (actual) {
      DartCoreType(:final dartName) => switch (dartName) {
        'int' => 'Int',
        'String' => 'String',
        'bool' => 'Bool',
        'double' => 'Double',
        _ => dartName,
      },
      ClassType(:final ref) =>
        ref.name.startsWith(aliasName) && ref.name.length > aliasName.length
            ? ref.name.substring(aliasName.length)
            : ref.name,
      AliasType(:final ref) =>
        ref.name.startsWith(aliasName) && ref.name.length > aliasName.length
            ? ref.name.substring(aliasName.length)
            : ref.name,
      EnumType(:final ref) =>
        ref.name.startsWith(aliasName) && ref.name.length > aliasName.length
            ? ref.name.substring(aliasName.length)
            : ref.name,
      ListType(:final element) => '${_variantSuffix(element, aliasName)}List',
      MapType() => 'Map',
      InlineRecord(:final fields) =>
        fields.isEmpty
            ? 'Empty'
            : fields
                  .map((f) => f.name[0].toUpperCase() + f.name.substring(1))
                  .join(),
      TupleType() => 'Tuple',
      _ => 'Unknown',
    };
  }
}
