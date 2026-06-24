part of 'model_generator.dart';

/// Extension providing class generation capabilities for [ModelGenerator].
extension ModelGeneratorClasses on ModelGenerator {
  /// Generates a freezed class for [cls], collecting all inherited properties
  /// and creating redirecting factory + fromJson constructors.
  /// For underscore-prefixed anonymous structs, generates a plain
  /// @JsonSerializable class instead.
  Spec _buildClass(ResolvedClass cls) {
    // For underscore-prefixed anonymous structs (e.g.
    // `_InitializeParamsClientInfo`), use plain @JsonSerializable instead
    // of @freezed. When the abstract class name
    // starts with `_`, freezed generates a top-level `_$XxxFromJson` wrapper
    // AND json_serializable also generates `_$XxxFromJson` for the private
    // concrete class — they collide. Plain @JsonSerializable avoids this
    // entirely.
    if (cls.name.startsWith('_')) {
      return _buildPrivateJsonClass(cls);
    }

    // LSP extends/mixins are structural (not Dart inheritance) — flatten all
    // inherited properties into the class so it stands alone.
    final allProps = _allProperties(cls);

    return Class((b) {
      b
        ..name = cls.name
        ..abstract = true
        ..annotations.add(refer('freezed'));

      b.mixins.add(refer('_\$${cls.name}'));

      b.docs.addAll(
        _docLines(
          cls.documentation,
          since: cls.since,
          sinceTags: cls.sinceTags,
          proposed: cls.proposed,
        ),
      );

      // Redirecting factory — freezed generates getters, copyWith, ==,
      // hashCode.
      b.constructors.add(
        _buildRedirectingFactory(cls.name, allProps),
      );

      // Standard json_serializable fromJson factory — freezed generates toJson
      // in its mixin.
      b.constructors.add(_fromJsonFactory(cls.name));
    });
  }

  /// Collects all properties for [cls] by recursively flattening its
  /// extends/mixins chain. Own properties take precedence (deduplicated by name).
  List<ResolvedProperty> _allProperties(ResolvedClass cls) =>
      _ctx.allProperties(cls);

  /// Builds a plain `@JsonSerializable` class for underscore-prefixed anonymous
  /// structs. These avoid the naming conflict that arises when `@freezed` is
  /// used with a leading-underscore class name (freezed and json_serializable
  /// both generate `_$XxxFromJson` with incompatible signatures).
  Class _buildPrivateJsonClass(ResolvedClass cls) {
    final allProps = _allProperties(cls);
    // json_serializable strips ALL leading underscores when naming helpers:
    // `_Foo` → `_$FooFromJson`, `__Foo` → `_$FooFromJson`.
    final baseName = cls.name.replaceFirst(RegExp('^_+'), '');

    return .new((b) {
      b.name = cls.name;
      b.annotations.add(refer('JsonSerializable').call([]));
      b.docs.addAll(
        _docLines(
          cls.documentation,
          since: cls.since,
          sinceTags: cls.sinceTags,
          proposed: cls.proposed,
        ),
      );

      // Final fields (plain class — no freezed mixin).
      for (final p in allProps) {
        b.fields.add(
          .new((b) {
            b
              ..modifier = .final$
              ..name = p.name
              ..type = _propertyTypeRef(cls.name, p);

            if (p.deprecated != null) {
              b.annotations.add(
                refer('Deprecated').call([literalString(p.deprecated!)]),
              );
            }

            b.docs.addAll(_docLines(p.documentation, indent: 2));
          }),
        );
      }

      // Const constructor — parameters mirror the fields.
      b.constructors.add(
        .new(
          (b) => b
            ..constant = true
            ..optionalParameters.addAll(
              sortByRequired(allProps, (p) => !p.optional).map(
                (p) => .new(
                  (b) => b
                    ..name = p.name
                    ..toThis = true
                    ..named = true
                    ..required = !p.optional,
                ),
              ),
            ),
        ),
      );

      // fromJson factory delegating to json_serializable's generated function.
      b.constructors.add(
        .new(
          (b) => b
            ..factory = true
            ..name = 'fromJson'
            ..requiredParameters.add(
              .new(
                (p) => p
                  ..name = 'json'
                  ..type = jsonMapRef,
              ),
            )
            ..body = refer('_\$${baseName}FromJson').call([refer('json')]).code,
        ),
      );

      // toJson method delegating to json_serializable's generated function.
      b.methods.add(
        .new(
          (b) => b
            ..name = 'toJson'
            ..returns = jsonMapRef
            ..body = refer('_\$${baseName}ToJson').call([refer('this')]).code,
        ),
      );
    });
  }

  /// Redirecting factory constructor: `const factory Foo({...}) = _Foo;`
  /// Freezed reads these to generate the concrete `_Foo` class with fields,
  /// getters, `copyWith`, `==`, `hashCode`, and `toString`.
  ///
  /// For private classes (`_Foo`), the redirect target is `__Foo` (double
  /// underscore), keeping the implementation library-private while the freezed
  /// mixin is named `_$Foo` (no leading underscore on the suffix).
  Constructor _buildRedirectingFactory(
    String className,
    List<ResolvedProperty> props,
  ) => .new(
    (b) => b
      ..constant = true
      ..factory = true
      // Prepend `_` to className: for `Foo` → `_Foo`; for `_Foo` → `__Foo`.
      ..redirect = refer('_$className')
      ..optionalParameters.addAll(
        sortByRequired(
          props,
          (p) => !p.optional && p.type.nonNull is! StringLiteralType,
        ).map((p) {
          final typeRef = _propertyTypeRef(className, p);

          return .new((b) {
            final innerType = p.type.nonNull;
            b
              ..name = p.name
              ..type = typeRef
              ..named = true
              ..required = !p.optional && innerType is! StringLiteralType;

            if (p.deprecated != null) {
              b.annotations.add(
                refer('Deprecated').call([literalString(p.deprecated!)]),
              );
            }

            if (innerType is StringLiteralType) {
              b.annotations.add(
                refer('Default').call([literalString(innerType.value)]),
              );
            }

            b.docs.addAll(
              _docLines(
                p.documentation,
                indent: 4,
                extra: _inlineUnionNote(p.type),
              ),
            );
          });
        }),
      ),
  );

  /// Generates a `fromJson` factory constructor for [className].
  Constructor _fromJsonFactory(String className) => .new(
    (b) => b
      ..factory = true
      ..name = 'fromJson'
      ..requiredParameters.add(
        .new(
          (p) => p
            ..name = 'json'
            ..type = jsonMapRef,
        ),
      )
      ..body = refer('_\$${className}FromJson').call([refer('json')]).code,
  );

  /// Builds a method-identifier enum (e.g. `NotificationMethod` or
  /// `RequestMethod`) from a sequence of [{memberName, method, doc}] records.
  ///
  /// Shared structure: `@JsonEnum(valueField: 'value')`, `final String value`
  /// field, `const Enum(this.value)` constructor, and a `static T? decode`
  /// method backed by json_annotation's `$enumDecodeNullable`.
  Spec _buildMethodEnum(
    String enumName,
    Iterable<({String memberName, String method, String doc})> members,
  ) => Enum((b) {
    b.name = enumName;
    b.docs.add(
      '/// LSP ${enumName.startsWith('Notification') ? 'notification' : 'request'} method identifiers, as sent over the wire.',
    );
    b.implements.add(refer('LSPMethod'));
    b.annotations.add(
      refer('JsonEnum').call([], {
        'valueField': literalString('value'),
        'alwaysCreate': literalTrue,
      }),
    );

    for (final m in members) {
      b.values.add(
        .new((b) {
          b.name = m.memberName;
          b.arguments.add(
            literalString(m.method, raw: m.method.contains(r'$')),
          );
          b.docs.addAll(_docLines(m.doc, indent: 2));
        }),
      );
    }

    b.fields.add(
      .new(
        (b) => b
          ..modifier = .final$
          ..name = 'value'
          ..type = refer('String')
          ..annotations.add(refer('override')),
      ),
    );

    b.constructors.add(
      .new(
        (b) => b
          ..constant = true
          ..requiredParameters.add(
            .new(
              (b) => b
                ..name = 'value'
                ..toThis = true,
            ),
          ),
      ),
    );

    b.methods.add(
      .new(
        (b) => b
          ..static = true
          ..returns = TypeReference(
            (b) => b
              ..symbol = enumName
              ..isNullable = true,
          )
          ..name = 'decode'
          ..requiredParameters.add(
            .new(
              (b) => b
                ..name = 'json'
                ..type = refer('String'),
            ),
          )
          ..lambda = true
          ..body = refer(r'$enumDecodeNullable').call([
            refer(
              '_\$$enumName'
              'EnumMap',
            ),
            refer('json'),
          ]).code,
      ),
    );
  });
}
