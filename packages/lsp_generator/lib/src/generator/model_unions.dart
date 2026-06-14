part of 'model_generator.dart';

/// Extension providing union type generation capabilities for [ModelGenerator],
/// including sealed union and inline union extension types.
extension ModelGeneratorUnions on ModelGenerator {
  /// Builds an extension type for a [UnionType], including representation
  /// declaration, fromJson factory, variant constructors, toJson method,
  /// and type-check/getter methods for each variant.
  Spec _buildExtensionTypeUnion(
    String name,
    UnionType ut, {
    String? deprecated,
    List<String> docs = const [],
  }) => ExtensionType((b) {
    final hasNull = ut.items.any(
      (item) => item is DartCoreType && item.dartName == 'Null',
    );

    final representationType = hasNull ? refer('Object?') : refer('Object');

    _addExtensionTypeStructure(b, name, representationType, deprecated);
    _addExtensionTypeAnnotations(b, docs, deprecated);
    _addExtensionTypeFromJson(b, name, representationType, deprecated);
    _addExtensionTypeVariantConstructors(b, name, ut, deprecated);
    _addExtensionTypeToJson(b, representationType);
    _addExtensionTypeVariantGetters(b, name, ut, representationType);
  });

  /// Adds the extension type structure: name, constant flag, primary
  /// constructor name, and representation declaration with optional
  /// deprecation.
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
          r.annotations.add(
            refer('Deprecated').call([literalString(deprecated)]),
          );
        }
      },
    );

  /// Adds documentation and deprecation annotations to the extension type.
  void _addExtensionTypeAnnotations(
    ExtensionTypeBuilder b,
    List<String> docs,
    String? deprecated,
  ) {
    b.docs.addAll(docs);
    if (deprecated != null) {
      b.annotations.add(refer('Deprecated').call([literalString(deprecated)]));
    }
  }

  /// Adds a `fromJson` factory constructor that redirects to the private
  /// primary constructor.
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
          b.annotations.add(
            refer('Deprecated').call([literalString(deprecated)]),
          );
        }
      },
    ),
  );

  /// Adds variant constructors for each unique union member, handling both
  /// simple types and inline records.
  void _addExtensionTypeVariantConstructors(
    ExtensionTypeBuilder b,
    String name,
    UnionType ut,
    String? deprecated,
  ) {
    final uniqueItems = _getUniqueItems(ut, name);

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

  /// Builds a factory constructor for an inline record variant, creating
  /// named parameters from record fields and mapping them to a JSON map.
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
      b.annotations.add(refer('Deprecated').call([literalString(deprecated)]));
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

  /// Builds a factory constructor for a non-record union variant, handling
  /// both simple redirects and complex wire transformations.
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
        b.annotations.add(
          refer('Deprecated').call([literalString(deprecated)]),
        );
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

  /// Adds a `toJson` method that returns the underlying representation value.
  void _addExtensionTypeToJson(
    ExtensionTypeBuilder b,
    Reference representationType,
  ) => b.methods.add(
    .new(
      (b) => b
        ..name = 'toJson'
        ..returns = representationType
        ..lambda = true
        ..body = refer('value').code,
    ),
  );

  /// Adds type-check (`isXxx`) and cast (`asXxx`) getter methods for each
  /// union variant, using structural discriminators when available.
  void _addExtensionTypeVariantGetters(
    ExtensionTypeBuilder b,
    String name,
    UnionType ut,
    Reference representationType,
  ) {
    final uniqueItems = _getUniqueItems(ut, name);

    final structs = uniqueItems
        .where((t) => t is ClassType || t is InlineRecord)
        .toList(growable: false);

    final structChecks = _ctx.findStructDiscriminator(structs);

    for (final item in uniqueItems) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = capitalize(suffix);
      final typeRef = toRef(item);
      final checkExpr = item.checkExpression(
        refer('value'),
        _ctx,
        structChecks,
        ut,
      );
      final val = representationType.symbol == 'Object?'
          ? const CodeExpression(.new('value!'))
          : refer('value');
      final castExpr = item.castExpression(typeRef, capSuffix, val, _ctx);

      b.methods.add(
        .new(
          (b) => b
            ..name = 'is$capSuffix'
            ..returns = refer('bool')
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

  List<ResolvedType> _getUniqueItems(UnionType ut, String name) {
    final uniqueItems = <ResolvedType>[];
    final seenSuffixes = <String>{};
    for (final item in ut.items) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = capitalize(suffix);
      if (seenSuffixes.add(capSuffix)) {
        uniqueItems.add(item);
      }
    }
    return uniqueItems;
  }

  /// Returns a suffix for a union variant, used to construct constructor
  /// and getter names (e.g. `isInt`, `asInt`, `isStringList`, `asStringList`).
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
      ClassType(:final ref) => _stripAliasPrefix(ref.name, aliasName),
      AliasType(:final ref) => _stripAliasPrefix(ref.name, aliasName),
      EnumType(:final ref) => _stripAliasPrefix(ref.name, aliasName),
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

  /// Strips [aliasName] prefix from [name] when [name] starts with it.
  String _stripAliasPrefix(String name, String aliasName) =>
      name.startsWith(aliasName) && name.length > aliasName.length
      ? name.substring(aliasName.length)
      : name;
}
