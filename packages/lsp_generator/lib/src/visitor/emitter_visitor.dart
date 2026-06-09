import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart' show MessageDirection, MetaNotification;
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import '../resolver/resolved_state.dart';
import 'type_reference.dart';

// ---------------------------------------------------------------------------
// Union classification
// ---------------------------------------------------------------------------

enum _UnionKind { scalar, scalarStruct, structList, structStruct, mixed }

/// One discriminator check for a struct+struct union.
///
/// For the _last_ check in a list: 'fieldName' is empty and no condition is
/// emitted (it is the unconditional else branch).
typedef _UnionCheck = ({
  /// The variant — either [ClassType] or [InlineRecord].
  ResolvedType variant,

  /// Field name used for the check.
  String fieldName,

  /// Non-null  → kind discriminator: `json['fieldName'] == 'literalValue'`.
  /// Null      → presence discriminator: `json.containsKey('fieldName')`.
  /// Empty [fieldName] → else branch (no condition).
  String? literalValue,
});

// ---------------------------------------------------------------------------

/// Discriminates how a converter class is generated.
/// Enums use `@JsonEnum(valueField: 'value')` with a static `decode()` — no
/// converter needed.
enum _ConverterKind { scalarUnion, structUnion }

/// Metadata about a single needed JsonConverter.
typedef _ConverterEntry = ({String name, _ConverterKind kind});

// ---------------------------------------------------------------------------

/// Generates a Dart `if` (optionally `else`) statement from code_builder
/// [condition] and block bodies.
Code ifStatement(Expression condition, Block ifBlock, [Block? elseBlock]) {
  final visitor = DartEmitter();
  final conditionV = condition.accept(visitor);
  final ifBlockV = ifBlock.accept(visitor);
  final elseBlockV = elseBlock?.accept(visitor);

  final ifElse =
      'if($conditionV){$ifBlockV}'
      '${elseBlockV != null ? 'else {$elseBlockV}' : ''}';

  return Code(ifElse);
}

/// Builds code_builder [Library] objects from a fully resolved [ResolvedState].
///
/// Each [Library] can be emitted to a Dart source string via [DartEmitter].
final class EmitterVisitor {
  EmitterVisitor(this._resolved);

  final ResolvedState _resolved;

  static const _header = 'GENERATED — do not edit.';
  static const _structuresFile = 'structures.dart';
  static const _enumerationsFile = 'enumerations.dart';
  static const _aliasesFile = 'type_aliases.dart';
  static const _unionsFile = 'unions.dart';

  /// Scalar-only unions (e.g. `ProgressToken = int | string`). These live in a
  /// separate file so that `structures.dart` can import them without circulars.
  static const _scalarUnionsFile = 'scalar_unions.dart';

  /// All class names (including anonymous) — used to filter conflicting
  /// aliases.
  late final Set<String> _classNames = _resolved.classes
      .map((c) => c.name)
      .toSet();

  /// Names of aliases emitted as sealed union classes (all union files
  /// combined).
  late final Set<String> _sealedUnionNames = _computeSealedUnionNames();

  /// Subset of [_sealedUnionNames]: purely scalar unions (only [DartCoreType]
  /// items). Emitted to [_scalarUnionsFile]; no import of structures needed.
  late final Set<String> _scalarUnionNames = _computeScalarUnionNames();

  /// Converter classes needed in `structures.dart`, keyed by type name.
  late final ({
    Map<String, _ConverterEntry> scalar,
    Map<String, _ConverterEntry> list,
  })
  _converterNeeds = _computeConverterNeeds();

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Builds a [Library] containing all resolved classes (anonymous first).
  Library buildStructures() {
    final anonymous = _resolved.classes.where((c) => c.isAnonymous);
    // Skip non-anonymous LSP base classes (names starting with '_') — they are
    // structural ancestors flattened into their descendants and unused in Dart.
    final named = _resolved.classes.where(
      (c) => !c.isAnonymous && !c.name.startsWith('_'),
    );

    final allTypes = _resolved.classes.expand(
      (c) => [...c.properties.map((p) => p.type), ...c.extends$, ...c.mixins$],
    );

    return Library(
      (b) => b
        ..comments.addAll([
          _header,
        ])
        ..directives.add(
          Directive.import(
            'package:freezed_annotation/freezed_annotation.dart',
          ),
        )
        ..directives.addAll(_crossImports(allTypes, _structuresFile))
        ..directives.add(Directive.part('structures.freezed.dart'))
        ..directives.add(Directive.part('structures.g.dart'))
        ..body.addAll([
          ...anonymous.map(_buildClass),
          ...named.map(_buildClass),
          ..._buildConverterSpecs(),
        ]),
    );
  }

  /// Builds a [Library] containing all resolved enumerations.
  Library buildEnumerations() => Library(
    (b) => b
      ..comments.add(_header)
      ..directives.add(
        Directive.import('package:json_annotation/json_annotation.dart'),
      )
      ..directives.add(Directive.part('enumerations.g.dart'))
      ..body.addAll(_resolved.enumerations.map(_buildEnum)),
  );

  /// Builds a [Library] containing a NotificationMethod enum with one member
  /// per LSP notification method string.
  ///
  /// Member names use the last path segment when unique across all
  /// notifications, and fall back to the full camelCase path on collisions
  /// (e.g. `textDocument/didOpen` vs `notebookDocument/didOpen`).
  Library buildNotificationMethods() {
    final notifications = _resolved.notifications;
    final requests = _resolved.requests;
    final notifNames = _dartNames(notifications, (n) => n.method);
    final requestNames = _dartNames(requests, (r) => r.method);
    return Library(
      (b) => b
        ..comments.add(_header)
        ..directives.add(
          Directive.import('package:json_annotation/json_annotation.dart'),
        )
        ..directives.add(Directive.part('methods.g.dart'))
        ..body.add(
          _buildMethodEnum(
            'NotificationMethod',
            notifications.map(
              (n) => (
                memberName: notifNames[n]!,
                method: n.method,
                doc:
                    n.documentation ??
                    'LSP notification `${n.method}` '
                        '(${_directionLabel(n.messageDirection)}).',
              ),
            ),
          ),
        )
        ..body.add(
          _buildMethodEnum(
            'RequestMethod',
            requests.map(
              (r) => (
                memberName: requestNames[r]!,
                method: r.method,
                doc:
                    r.documentation ??
                    'LSP request `${r.method}` '
                        '(${_directionLabel(r.messageDirection)}).',
              ),
            ),
          ),
        ),
    );
  }

  /// Builds a [Library] containing all resolved type aliases.
  Library buildAliases() {
    // Skip aliases whose name is already a class — avoids ambiguous_export.
    // Skip aliases handled as sealed union classes by [buildUnions].
    final aliases = _resolved.aliases.where(
      (a) =>
          !_classNames.contains(a.name) && !_sealedUnionNames.contains(a.name),
    );
    final allTypes = aliases.map((a) => a.type);
    return Library(
      (b) => b
        ..comments.add(_header)
        ..directives.addAll(_crossImports(allTypes, _aliasesFile))
        ..body.addAll(aliases.map(_buildAlias)),
    );
  }

  /// Builds a [Library] containing sealed classes for purely scalar unions
  /// (e.g. `ProgressToken = int | string`). Written to [_scalarUnionsFile].
  ///
  /// This file does **not** import `structures.dart`, so `structures.dart` can
  /// safely import this file without creating a circular dependency.
  Library buildScalarUnions() {
    final specs = <Spec>[];

    for (final name in _scalarUnionNames) {
      final alias = _resolved.aliases.firstWhere((a) => a.name == name);
      final ut = alias.type as UnionType;
      final kind = _classifyUnion(ut);
      specs.addAll(
        _buildUnionSpecs(
          name,
          ut,
          kind,
          deprecated: alias.deprecated,
          docs: _docLines(
            alias.documentation,
            since: alias.since,
            proposed: alias.proposed,
          ),
        ),
      );
    }

    // Scalar unions reference no structs — no cross-imports needed.
    return Library(
      (b) => b
        ..comments.add(_header)
        ..directives.add(
          Directive.import(
            'package:freezed_annotation/freezed_annotation.dart',
          ),
        )
        ..directives.add(Directive.part('scalar_unions.freezed.dart'))
        ..body.addAll(specs),
    );
  }

  /// Builds a [Library] containing typed sealed union classes for all
  /// non-scalar sealed union aliases (struct-based: struct+list,
  /// struct+struct).
  ///
  /// Sealed subclass naming: `${AliasName}\$${VariantSuffix}` — the `\$` acts
  /// as a separator and prevents name conflicts with generated struct classes.
  Library buildUnions() {
    final specs = <Spec>[];
    final referencedTypes = <ResolvedType>[];

    // Only non-scalar sealed unions — scalar ones live in buildScalarUnions().
    final nonScalarNames = _sealedUnionNames.difference(_scalarUnionNames);

    for (final name in nonScalarNames) {
      final alias = _resolved.aliases.firstWhere((a) => a.name == name);
      final ut = alias.type as UnionType;
      final kind = _classifyUnion(ut);
      specs.addAll(
        _buildUnionSpecs(
          name,
          ut,
          kind,
          deprecated: alias.deprecated,
          docs: _docLines(
            alias.documentation,
            since: alias.since,
            proposed: alias.proposed,
          ),
        ),
      );
      referencedTypes.addAll(ut.items);
    }

    return Library(
      (b) => b
        ..comments.add(_header)
        ..directives.add(
          Directive.import(
            'package:freezed_annotation/freezed_annotation.dart',
          ),
        )
        ..directives.addAll(_crossImports(referencedTypes, _unionsFile))
        ..directives.add(Directive.part('unions.freezed.dart'))
        ..body.addAll(specs),
    );
  }

  /// Returns [Directive.import] entries for types from a different output file.
  ///
  /// Walks [types] recursively; skips [currentFile] (no self-import).
  Iterable<Directive> _crossImports(
    Iterable<ResolvedType> types,
    String currentFile,
  ) {
    final needed = <String>{};

    void walk(ResolvedType type) {
      switch (type) {
        case ClassType():
          needed.add(_structuresFile);
        case EnumType():
          needed.add(_enumerationsFile);
        case AliasType(:final ref):
          // Sealed union aliases live in their own files,
          // not type_aliases.dart.
          if (_scalarUnionNames.contains(ref.name)) {
            needed.add(_scalarUnionsFile);
          } else if (_sealedUnionNames.contains(ref.name)) {
            needed.add(_unionsFile);
          } else {
            needed.add(_aliasesFile);
          }
        case ListType(:final element):
          walk(element);
        case MapType(:final key, :final value):
          walk(key);
          walk(value);
        case NullableType(:final inner):
          walk(inner);
        case InlineRecord(:final fields):
          for (final f in fields) {
            walk(f.type);
          }
        default:
      }
    }

    types.forEach(walk);
    needed.remove(currentFile); // no self-import

    // Preserve stable output order.
    return [
      for (final f in [
        _structuresFile,
        _enumerationsFile,
        _aliasesFile,
        _scalarUnionsFile,
        _unionsFile,
      ])
        if (needed.contains(f)) Directive.import(f),
    ];
  }

  // ---------------------------------------------------------------------------
  // Class builder
  // ---------------------------------------------------------------------------

  Spec _buildClass(ResolvedClass cls) {
    // For underscore-prefixed anonymous structs (e.g.
    // `_InitializeParamsClientInfo`),  use plain @JsonSerializable instead
    //of @freezed. When the abstract class name
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

    // After the early return above, cls.name never starts with '_'.
    final publicPart = cls.name;

    // Private constructor is required by freezed only when the class has
    // custom instance methods (i.e. open-enum getters).
    final hasEnumGetters = allProps.any((p) => _openEnumInfo(p.type) != null);

    return Class((b) {
      b
        ..name = cls.name
        ..abstract = true
        ..annotations.add(refer('freezed'));

      b.mixins.add(refer('_\$$publicPart'));

      b.docs.addAll(
        _docLines(cls.documentation, since: cls.since, proposed: cls.proposed),
      );

      if (hasEnumGetters) {
        b.constructors.add(
          Constructor(
            (b) => b
              ..constant = true
              ..name = '_',
          ),
        );
      }

      // Redirecting factory — freezed generates getters, copyWith, ==,
      // hashCode.
      b.constructors.add(
        _buildRedirectingFactory(cls.name, allProps, publicPart),
      );

      // Standard json_serializable fromJson factory — freezed generates toJson
      // in its mixin.
      b.constructors.add(
        Constructor(
          (b) => b
            ..factory = true
            ..name = 'fromJson'
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'json'
                  ..type = TypeReference(
                    (b) => b
                      ..symbol = 'Map'
                      ..types.addAll([refer('String'), refer('dynamic')]),
                  ),
              ),
            )
            ..body = refer(
              '_\$${publicPart}FromJson',
            ).call([refer('json')]).code,
        ),
      );

      // Getters for open-enum properties (stored as raw primitives on the
      // wire).
      for (final p in allProps) {
        final info = _openEnumInfo(p.type);
        if (info == null) {
          continue;
        }

        final isNullableField = p.optional || p.type is NullableType;
        final bodyExpr = isNullableField
            ? refer(p.name)
                  .notEqualTo(literalNull)
                  .conditional(
                    refer(
                      info.ref.name,
                    ).property('decode').call([refer(p.name).nullChecked]),
                    literalNull,
                  )
            : refer(info.ref.name).property('decode').call([refer(p.name)]);
        b.methods.add(
          Method(
            (b) => b
              ..type = MethodType.getter
              ..returns = TypeReference(
                (b) => b
                  ..symbol = info.ref.name
                  ..isNullable = true,
              )
              ..name = '${p.name}Enum'
              ..lambda = true
              ..body = bodyExpr.code,
          ),
        );
      }
    });
  }

  /// Collects all properties for [cls] by recursively flattening its
  /// extends/mixins chain. Own properties take precedence (deduplicated by name).
  List<ResolvedProperty> _allProperties(
    ResolvedClass cls, [
    Set<String>? visited,
  ]) {
    visited ??= {};
    if (!visited.add(cls.name)) {
      return [];
    }

    final ownNames = cls.properties.map((p) => p.name).toSet();
    final inherited = <ResolvedProperty>[];
    final inheritedSeen = <String>{};

    void addFrom(Iterable<ResolvedProperty> props) {
      for (final p in props) {
        if (inheritedSeen.add(p.name)) {
          inherited.add(p);
        }
      }
    }

    for (final ext in cls.extends$) {
      if (ext case ClassType(:final ref)) {
        addFrom(_allProperties(ref, visited));
      }
    }
    for (final mixin in cls.mixins$) {
      if (mixin case ClassType(:final ref)) {
        addFrom(_allProperties(ref, visited));
      }
    }

    return [
      ...inherited.where((p) => !ownNames.contains(p.name)),
      ...cls.properties,
    ];
  }

  /// Builds a plain `@JsonSerializable` class for underscore-prefixed anonymous
  /// structs. These avoid the naming conflict that arises when `@freezed` is
  /// used with a leading-underscore class name (freezed and json_serializable
  /// both generate `_$XxxFromJson` with incompatible signatures).
  Class _buildPrivateJsonClass(ResolvedClass cls) {
    final allProps = _allProperties(cls);
    // json_serializable strips ALL leading underscores when naming helpers:
    // `_Foo` → `_$FooFromJson`, `__Foo` → `_$FooFromJson`.
    final baseName = cls.name.replaceFirst(RegExp('^_+'), '');

    return Class((b) {
      b.name = cls.name;
      b.annotations.add(refer('JsonSerializable').call([]));
      b.docs.addAll(
        _docLines(cls.documentation, since: cls.since, proposed: cls.proposed),
      );

      // Final fields (plain class — no freezed mixin).
      for (final p in allProps) {
        b.fields.add(
          Field((b) {
            final openEnum = _openEnumInfo(p.type);
            b
              ..modifier = FieldModifier.final$
              ..name = p.name
              ..type = openEnum != null
                  ? (p.optional
                        ? TypeReference(
                            (b) => b
                              ..symbol = openEnum.primitive
                              ..isNullable = true,
                          )
                        : refer(openEnum.primitive))
                  : toRef(p.type, nullable: p.optional);
            _annotationsForParam(p).forEach(b.annotations.add);
            b.docs.addAll(_docLines(p.documentation, indent: 2));
          }),
        );
      }

      // Const constructor — parameters mirror the fields.
      b.constructors.add(
        Constructor(
          (b) => b
            ..constant = true
            ..optionalParameters.addAll(
              allProps.map(
                (p) => Parameter(
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
        Constructor(
          (b) => b
            ..factory = true
            ..name = 'fromJson'
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'json'
                  ..type = TypeReference(
                    (b) => b
                      ..symbol = 'Map'
                      ..types.addAll([refer('String'), refer('dynamic')]),
                  ),
              ),
            )
            ..body = refer('_\$${baseName}FromJson').call([refer('json')]).code,
        ),
      );

      // toJson method delegating to json_serializable's generated function.
      b.methods.add(
        Method(
          (b) => b
            ..name = 'toJson'
            ..returns = TypeReference(
              (b) => b
                ..symbol = 'Map'
                ..types.addAll([refer('String'), refer('dynamic')]),
            )
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
    String publicPart,
  ) => Constructor(
    (b) => b
      ..constant = true
      ..factory = true
      // Prepend `_` to className: for `Foo` → `_Foo`; for `_Foo` → `__Foo`.
      ..redirect = refer('_$className')
      ..optionalParameters.addAll(
        props.map((p) {
          final openEnum = _openEnumInfo(p.type);
          final typeRef = openEnum != null
              ? (p.optional
                    ? TypeReference(
                        (b) => b
                          ..symbol = openEnum.primitive
                          ..isNullable = true,
                      )
                    : refer(openEnum.primitive))
              : toRef(p.type, nullable: p.optional);
          return Parameter((b) {
            b
              ..name = p.name
              ..type = typeRef
              ..named = true
              ..required = !p.optional;
            _annotationsForParam(p).forEach(b.annotations.add);
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

  // ---------------------------------------------------------------------------
  // Converter infrastructure (json_serializable)
  // ---------------------------------------------------------------------------

  /// Returns a call expression for the converter annotation that should be
  /// placed on a factory parameter of the given [type], or `null`
  /// if no annotation is needed (json_serializable handles the type natively).
  Expression? _converterAnnotationFor(ResolvedType type) {
    // Strip the outer NullableType — the converter itself is non-nullable;
    // json_serializable adds the null check around the converter call.
    final inner = type is NullableType ? type.inner : type;
    return switch (inner) {
      AliasType(:final ref)
          when _scalarUnionNames.contains(ref.name) ||
              _sealedUnionNames.contains(ref.name) =>
        refer('_${ref.name}Converter').call([]),
      ListType(element: final el) => switch (el is NullableType
          ? el.inner
          : el) {
        AliasType(:final ref)
            when _scalarUnionNames.contains(ref.name) ||
                _sealedUnionNames.contains(ref.name) =>
          refer('_${ref.name}ListConverter').call([]),
        _ => null,
      },
      _ => null,
    };
  }

  /// Returns the list of annotations for factory/field parameter [p].
  List<Expression> _annotationsForParam(ResolvedProperty p) {
    final conv = _converterAnnotationFor(p.type);
    final deprecated = p.deprecated != null
        ? refer('Deprecated').call([literalString(p.deprecated!)])
        : null;
    return [
      ?deprecated,
      ?conv,
    ];
  }

  /// Walks every property of every resolved class and collects the set of
  /// converter classes that need to be emitted into `structures.dart`.
  ({Map<String, _ConverterEntry> scalar, Map<String, _ConverterEntry> list})
  _computeConverterNeeds() {
    final scalar = <String, _ConverterEntry>{};
    final list = <String, _ConverterEntry>{};

    void register(String name, _ConverterKind kind) {
      scalar[name] ??= (name: name, kind: kind);
    }

    void registerList(String name, _ConverterKind kind) {
      list[name] ??= (name: name, kind: kind);
    }

    void processType(ResolvedType type) {
      final inner = type is NullableType ? type.inner : type;
      switch (inner) {
        case AliasType(:final ref) when _scalarUnionNames.contains(ref.name):
          register(ref.name, _ConverterKind.scalarUnion);
        case AliasType(:final ref) when _sealedUnionNames.contains(ref.name):
          register(ref.name, _ConverterKind.structUnion);
        case ListType(element: final el):
          switch (el is NullableType ? el.inner : el) {
            case AliasType(:final ref)
                when _scalarUnionNames.contains(ref.name):
              registerList(ref.name, _ConverterKind.scalarUnion);
            case AliasType(:final ref)
                when _sealedUnionNames.contains(ref.name):
              registerList(ref.name, _ConverterKind.structUnion);
            default:
              break;
          }
        default:
          break;
      }
    }

    for (final cls in _resolved.classes) {
      for (final prop in _allProperties(cls)) {
        processType(prop.type);
      }
    }

    return (scalar: scalar, list: list);
  }

  /// Emits one [Spec] per needed converter (scalar + list variants).
  Iterable<Spec> _buildConverterSpecs() => [
    ..._converterNeeds.scalar.values.map(_scalarConverterSpec),
    ..._converterNeeds.list.values.map(_listConverterSpec),
  ];

  Class _scalarConverterSpec(_ConverterEntry entry) {
    final n = entry.name;
    final mapStringObjectNullable = TypeReference(
      (b) => b
        ..symbol = 'Map'
        ..types.addAll([
          refer('String'),
          TypeReference(
            (b) => b
              ..symbol = 'Object'
              ..isNullable = true,
          ),
        ]),
    );

    final Reference rawType;
    final Code fromBody;
    final Code toBody;

    switch (entry.kind) {
      case _ConverterKind.scalarUnion:
        rawType = refer('Object');
        fromBody = refer(n).newInstanceNamed('fromJson', [refer('json')]).code;
        toBody = refer('object').property('toJson').call([]).code;
      case _ConverterKind.structUnion:
        rawType = mapStringObjectNullable;
        fromBody = refer(n).newInstanceNamed('fromJson', [refer('json')]).code;
        toBody = refer(
          'object',
        ).property('toJson').call([]).asA(mapStringObjectNullable).code;
    }

    return Class(
      (b) => b
        ..name = '_${n}Converter'
        ..extend = TypeReference(
          (b) => b
            ..symbol = 'JsonConverter'
            ..types.addAll([refer(n), rawType]),
        )
        ..constructors.add(Constructor((b) => b..constant = true))
        ..methods.addAll([
          _converterMethod(
            name: 'fromJson',
            returns: refer(n),
            paramName: 'json',
            paramType: rawType,
            body: fromBody,
          ),
          _converterMethod(
            name: 'toJson',
            returns: rawType,
            paramName: 'object',
            paramType: refer(n),
            body: toBody,
          ),
        ]),
    );
  }

  Class _listConverterSpec(_ConverterEntry entry) {
    final n = entry.name;
    final listN = TypeReference(
      (b) => b
        ..symbol = 'List'
        ..types.add(refer(n)),
    );
    final listDynamic = TypeReference(
      (b) => b
        ..symbol = 'List'
        ..types.add(refer('dynamic')),
    );

    // Helper: inline closure `(e) => <body>`
    Expression closure(Code body) => Method(
      (b) => b
        ..lambda = true
        ..requiredParameters.add(Parameter((b) => b..name = 'e'))
        ..body = body,
    ).closure;

    final Code fromBody;
    final Code toBody;

    switch (entry.kind) {
      case _ConverterKind.scalarUnion:
        fromBody = refer('json')
            .property('map')
            .call([
              closure(
                refer(n).newInstanceNamed('fromJson', [
                  refer('e').asA(refer('Object')),
                ]).code,
              ),
            ])
            .property('toList')
            .call([])
            .code;
        toBody = refer('object')
            .property('map')
            .call([closure(refer('e').property('toJson').call([]).code)])
            .property('toList')
            .call([])
            .code;
      case _ConverterKind.structUnion:
        final mapType = TypeReference(
          (b) => b
            ..symbol = 'Map'
            ..types.addAll([
              refer('String'),
              TypeReference(
                (b) => b
                  ..symbol = 'Object'
                  ..isNullable = true,
              ),
            ]),
        );
        fromBody = refer('json')
            .property('map')
            .call([
              closure(
                refer(
                  n,
                ).newInstanceNamed('fromJson', [refer('e').asA(mapType)]).code,
              ),
            ])
            .property('toList')
            .call([])
            .code;
        toBody = refer('object')
            .property('map')
            .call(
              [closure(refer('e').property('toJson').call([]).code)],
              {},
              [refer('Object')],
            )
            .property('toList')
            .call([])
            .code;
    }

    return Class(
      (b) => b
        ..name = '_${n}ListConverter'
        ..extend = TypeReference(
          (b) => b
            ..symbol = 'JsonConverter'
            ..types.addAll([listN, listDynamic]),
        )
        ..constructors.add(Constructor((b) => b..constant = true))
        ..methods.addAll([
          _converterMethod(
            name: 'fromJson',
            returns: listN,
            paramName: 'json',
            paramType: listDynamic,
            body: fromBody,
          ),
          _converterMethod(
            name: 'toJson',
            returns: listDynamic,
            paramName: 'object',
            paramType: listN,
            body: toBody,
          ),
        ]),
    );
  }

  /// Creates an `@override` method with one required parameter and a lambda
  /// body.
  Method _converterMethod({
    required String name,
    required Reference returns,
    required String paramName,
    required Reference paramType,
    required Code body,
  }) => Method(
    (b) => b
      ..annotations.add(refer('override'))
      ..name = name
      ..returns = returns
      ..requiredParameters.add(
        Parameter(
          (b) => b
            ..name = paramName
            ..type = paramType,
        ),
      )
      ..lambda = true
      ..body = body,
  );

  // ---------------------------------------------------------------------------
  // Enum builder
  // ---------------------------------------------------------------------------

  /// Emits all enums with `@JsonEnum(valueField: 'value', alwaysCreate: true)`.
  ///
  /// Each member stores its raw wire value in a `final T value` field and
  /// accepts it via a `const EnumName(this.value)` constructor. A static
  // ---------------------------------------------------------------------------
  // Private: notification method enum
  // ---------------------------------------------------------------------------

  static String _directionLabel(MessageDirection d) => switch (d) {
    MessageDirection.clientToServer => 'client to server',
    MessageDirection.serverToClient => 'server to client',
    MessageDirection.both => 'both directions',
  };

  /// Returns a map from each [MetaNotification] to its Dart enum member name.
  ///
  /// The last path segment is used when unique across all notifications.
  /// Collisions (e.g. `textDocument/didOpen` vs `notebookDocument/didOpen`)
  /// fall back to the full camelCase path.
  /// Maps each item in [items] to a unique Dart identifier derived from its
  /// LSP method string (e.g. `textDocument/didOpen` → `didOpen`).
  ///
  /// Uses the last path segment when it is unique across all items; falls back
  /// to the full camelCase path on collisions.
  Map<T, String> _dartNames<T>(List<T> items, String Function(T) getMethod) {
    String clean(String m) => m.startsWith(r'$/')
        ? m.substring(2)
        : m.startsWith(r'$')
        ? m.substring(1)
        : m;
    String lastSeg(String m) => clean(m).split('/').last;
    String camelCase(String m) {
      final parts = clean(m).split('/');
      return [
        parts.first,
        ...parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)),
      ].join();
    }

    final lastSegs = {for (final x in items) x: lastSeg(getMethod(x))};
    final counts = <String, int>{};
    for (final s in lastSegs.values) {
      counts[s] = (counts[s] ?? 0) + 1;
    }
    return {
      for (final x in items)
        x: _safeIdentifier(
          counts[lastSegs[x]!]! > 1 ? camelCase(getMethod(x)) : lastSegs[x]!,
        ),
    };
  }

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
    b.annotations.add(
      refer('JsonEnum').call([], {
        'valueField': literalString('value'),
        'alwaysCreate': literalTrue,
      }),
    );

    for (final m in members) {
      b.values.add(
        EnumValue((b) {
          b.name = m.memberName;
          b.arguments.add(
            literalString(m.method, raw: m.method.contains(r'$')),
          );
          b.docs.addAll(_docLines(m.doc, indent: 2));
        }),
      );
    }

    b.fields.add(
      Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..name = 'value'
          ..type = refer('String'),
      ),
    );

    b.constructors.add(
      Constructor(
        (b) => b
          ..constant = true
          ..requiredParameters.add(
            Parameter(
              (b) => b
                ..name = 'value'
                ..toThis = true,
            ),
          ),
      ),
    );

    b.methods.add(
      Method(
        (b) => b
          ..static = true
          ..returns = TypeReference(
            (b) => b
              ..symbol = enumName
              ..isNullable = true,
          )
          ..name = 'decode'
          ..requiredParameters.add(
            Parameter(
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

  // ---------------------------------------------------------------------------
  // Private: standard enums
  // ---------------------------------------------------------------------------

  /// `decode` method returns `null` for unknown values, which makes it safe
  /// for both open and closed enums without needing a sentinel member.
  ///
  /// Open enums (`supportsCustomValues = true`) are handled on the struct side:
  /// the property is stored as a raw `String`/`int` and a getter exposes the
  /// decoded enum (see [_buildClass]).
  Spec _buildEnum(ResolvedEnum en) {
    final isInt = en.valueType == 'int';
    final valueTypeName = isInt ? 'int' : 'String';

    if (en.supportsCustomValues) {
      return ExtensionType((b) {
        b
          ..name = en.name
          ..constant = true
          ..representationDeclaration = RepresentationDeclaration(
            (r) => r
              ..name = 'value'
              ..declaredRepresentationType = refer(valueTypeName),
          );

        b.docs.addAll(
          _docLines(en.documentation, since: en.since, proposed: en.proposed),
        );

        // static const values
        for (final member in en.members) {
          b.fields.add(
            Field(
              (b) => b
                ..static = true
                ..modifier = FieldModifier.constant
                ..name = _safeIdentifier(_toLowerCamelCase(member.name))
                ..type = refer(en.name)
                ..assignment = refer(en.name).call([
                  if (isInt)
                    literalNum(int.parse(member.value))
                  else
                    literalString(member.value),
                ]).code
                ..docs.addAll(
                  _docLines(
                    member.documentation,
                    since: member.since,
                    indent: 2,
                  ),
                ),
            ),
          );
        }

        // fromJson constructor
        b.constructors.add(
          Constructor(
            (b) => b
              ..factory = true
              ..name = 'fromJson'
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = 'json'
                    ..type = refer('Object?'),
                ),
              )
              ..body = refer(
                en.name,
              ).call([refer('json').asA(refer(valueTypeName))]).code,
          ),
        );

        // toJson method
        b.methods.add(
          Method(
            (b) => b
              ..name = 'toJson'
              ..returns = refer(valueTypeName)
              ..lambda = true
              ..body = refer('value').code,
          ),
        );
      });
    }

    return Enum((b) {
      b.name = en.name;
      b.annotations.add(
        refer('JsonEnum').call([], {
          'valueField': literalString('value'),
          'alwaysCreate': literalTrue,
        }),
      );

      b.docs.addAll(
        _docLines(en.documentation, since: en.since, proposed: en.proposed),
      );

      for (final member in en.members) {
        b.values.add(
          EnumValue((b) {
            b.name = _safeIdentifier(_toLowerCamelCase(member.name));
            b.arguments.add(
              isInt
                  ? literalNum(int.parse(member.value))
                  : literalString(member.value),
            );
            if (member.deprecated != null) {
              b.annotations.add(
                refer('Deprecated').call([literalString(member.deprecated!)]),
              );
            }
            b.docs.addAll(
              _docLines(
                member.documentation,
                since: member.since,
                indent: 2,
              ),
            );
          }),
        );
      }

      // final T value field.
      b.fields.add(
        Field(
          (b) => b
            ..modifier = FieldModifier.final$
            ..name = 'value'
            ..type = refer(valueTypeName),
        ),
      );

      // const constructor accepting the raw wire value.
      b.constructors.add(
        Constructor(
          (b) => b
            ..constant = true
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'value'
                  ..toThis = true,
              ),
            ),
        ),
      );

      // static decode — returns null for unknown values.
      b.methods.add(
        Method(
          (b) => b
            ..static = true
            ..returns = TypeReference(
              (b) => b
                ..symbol = en.name
                ..isNullable = true,
            )
            ..name = 'decode'
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'json'
                  ..type = refer(valueTypeName),
              ),
            )
            ..lambda = true
            ..body = refer(r'$enumDecodeNullable').call([
              refer('_\$${en.name}EnumMap'),
              refer('json'),
            ]).code,
        ),
      );
    });
  }

  // ---------------------------------------------------------------------------
  // Alias builder
  // ---------------------------------------------------------------------------

  Spec _buildAlias(ResolvedAlias alias) => TypeDef(
    (b) {
      b
        ..name = alias.name
        ..definition = toTypeRef(alias.type);
      if (alias.deprecated != null) {
        b.annotations.add(
          refer('Deprecated').call([literalString(alias.deprecated!)]),
        );
      }
      b.docs.addAll(
        _docLines(
          alias.documentation,
          since: alias.since,
          proposed: alias.proposed,
        ),
      );
    },
  );

  // ---------------------------------------------------------------------------
  // Union helpers — classification, discriminator, code generation
  // ---------------------------------------------------------------------------

  /// Unions where all items are pure scalars ([DartCoreType]) — no struct refs,
  /// so they can live in a file that `structures.dart` safely imports.
  Set<String> _computeScalarUnionNames() => _sealedUnionNames.where((name) {
    final alias = _resolved.aliases.firstWhere((a) => a.name == name);
    return _classifyUnion(alias.type as UnionType) == _UnionKind.scalar;
  }).toSet();

  /// Computes the set of alias names that [buildUnions]/[buildScalarUnions]
  /// will emit as sealed classes — i.e. non-mixed unions where a discriminator
  /// can be found.
  Set<String> _computeSealedUnionNames() {
    final result = <String>{};
    for (final alias in _resolved.aliases) {
      if (_classNames.contains(alias.name)) {
        continue;
      }

      if (alias.type is! UnionType) {
        continue;
      }

      final ut = alias.type as UnionType;
      final kind = _classifyUnion(ut);

      if (kind == _UnionKind.mixed) {
        continue;
      }

      if (kind == _UnionKind.structStruct) {
        final structs = ut.items
            .where((t) => t is ClassType || t is InlineRecord)
            .toList();
        if (_findStructDiscriminator(structs) == null) {
          continue;
        }
      }

      result.add(alias.name);
    }
    return result;
  }

  _UnionKind _classifyUnion(UnionType u) {
    final scalars = u.items.whereType<DartCoreType>().toList(growable: false);
    final structs = u.items
        .where((t) => t is ClassType || t is InlineRecord)
        .toList(growable: false);
    final lists = u.items.whereType<ListType>().toList(growable: false);
    final others = u.items.where(
      (t) =>
          t is! DartCoreType &&
          t is! ClassType &&
          t is! InlineRecord &&
          t is! ListType,
    );

    if (others.isNotEmpty) {
      return .mixed;
    }

    if (structs.isEmpty && lists.isEmpty) {
      return .scalar;
    }

    if (lists.isEmpty && scalars.isNotEmpty && structs.isNotEmpty) {
      final uniqueStructs = _structKey(structs).toSet();
      return uniqueStructs.length == 1 ? .scalarStruct : .mixed;
    }

    if (scalars.isEmpty && lists.isNotEmpty && structs.isNotEmpty) {
      return .structList;
    }

    if (scalars.isEmpty && lists.isEmpty && structs.length >= 2) {
      final uniqueStructs = _structKey(structs).toSet();
      return uniqueStructs.length >= 2 ? .structStruct : .mixed;
    }

    return .mixed;
  }

  /// Deduplication key for a struct-like type item.
  Iterable<String> _structKey(Iterable<ResolvedType> items) => items.map(
    (t) => switch (t) {
      ClassType(:final ref) => ref.name,
      InlineRecord(:final fields) =>
        'Record(${fields.map(
          (f) => '${f.name}:${f.type.runtimeType}',
        ).join(',')})',
      _ => t.toString(),
    },
  );

  /// Returns a list of discriminator checks (last entry = else branch) or
  /// `null` if no reliable discriminator can be found.
  ///
  /// Accepts items that are either [ClassType] or [InlineRecord].
  List<_UnionCheck>? _findStructDiscriminator(List<ResolvedType> variants) {
    // Deduplicate by struct key.
    final seen = <String>{};
    final unique = variants.where((t) {
      final key = switch (t) {
        ClassType(:final ref) => ref.name,
        InlineRecord(:final fields) =>
          'Record(${fields.map((f) => f.name).join(',')})',
        _ => t.toString(),
      };
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

    // Kind discriminator: shared required property with distinct
    // StringLiteralType values.
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

    // Presence discriminator: each variant (except the last) has a required
    // field that no other variant requires.
    final checks = <_UnionCheck>[];
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

  /// Returns a name→property map for any struct-like union arm
  /// ([ClassType] or [InlineRecord]).
  Map<String, ResolvedProperty> _variantPropertiesMap(ResolvedType variant) =>
      switch (variant) {
        ClassType(:final ref) => _allPropertiesMap(ref),
        InlineRecord(:final fields) => {for (final f in fields) f.name: f},
        _ => {},
      };

  Map<String, ResolvedProperty> _allPropertiesMap(ResolvedClass cls) => {
    for (final p in _allProperties(cls)) p.name: p,
  };

  // ---------------------------------------------------------------------------
  // Union spec builders (code_builder Class / Constructor / Method)
  // ---------------------------------------------------------------------------

  List<Spec> _buildUnionSpecs(
    String name,
    UnionType ut,
    _UnionKind kind, {
    String? deprecated,
    List<String> docs = const [],
  }) {
    final structItems = ut.items
        .where((t) => t is ClassType || t is InlineRecord)
        .toList();
    return switch (kind) {
      _UnionKind.scalar => _buildScalarUnionSpecs(
        name,
        ut.items.whereType<DartCoreType>().toList(),
        deprecated: deprecated,
        docs: docs,
      ),
      _UnionKind.scalarStruct => _buildScalarStructUnionSpecs(
        name,
        ut.items.whereType<DartCoreType>().toList(),
        structItems.first,
        deprecated: deprecated,
        docs: docs,
      ),
      _UnionKind.structList => _buildStructListUnionSpecs(
        name,
        ut.items.whereType<ClassType>().first,
        ut.items.whereType<ListType>().first,
        deprecated: deprecated,
        docs: docs,
      ),
      _UnionKind.structStruct => _buildStructStructUnionSpecs(
        name,
        _findStructDiscriminator(structItems)!,
        deprecated: deprecated,
        docs: docs,
      ),
      _UnionKind.mixed => [],
    };
  }

  /// Variant suffix: strips the [aliasName] prefix from struct names so that
  /// e.g. `InlineValue` + `InlineValueText` → suffix `Text`.
  String _variantSuffix(ResolvedType item, String aliasName) => switch (item) {
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
    ListType() => 'List',
    InlineRecord(:final fields) =>
      fields.isEmpty
          ? 'Empty'
          : fields
                .map((f) => f.name[0].toUpperCase() + f.name.substring(1))
                .join(),
    _ => 'Unknown',
  };

  /// Lowercase first character of [suffix] to form a factory constructor name.
  String _factoryName(String suffix) =>
      suffix.isEmpty ? suffix : suffix[0].toLowerCase() + suffix.substring(1);

  List<Spec> _buildScalarUnionSpecs(
    String name,
    List<DartCoreType> scalars, {
    String? deprecated,
    List<String> docs = const [],
  }) {
    final variants = scalars
        .map((s) => (suffix: _variantSuffix(s, name), dartName: s.dartName))
        .toList();

    final switchCases = variants
        .map((v) => '    $name\$${v.suffix}(:final value) => value,')
        .join('\n');

    return [
      Class(
        (b) => b
          ..name = name
          ..sealed = true
          ..annotations.addAll([
            refer('freezed'),
            if (deprecated != null)
              refer('Deprecated').call([literalString(deprecated)]),
          ])
          ..docs.addAll(docs)
          ..mixins.add(refer('_\$$name'))
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..name = '_',
            ),
          )
          ..constructors.addAll(
            variants.map(
              (v) => Constructor(
                (b) => b
                  ..constant = true
                  ..factory = true
                  ..name = _safeIdentifier(_factoryName(v.suffix))
                  ..optionalParameters.add(
                    Parameter(
                      (b) => b
                        ..name = 'value'
                        ..named = true
                        ..required = true
                        ..type = refer(v.dartName),
                    ),
                  )
                  ..redirect = refer('$name\$${v.suffix}'),
              ),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..static = true
                ..returns = refer(name)
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = TypeReference(
                        (b) => b
                          ..symbol = 'Object'
                          ..isNullable = true,
                      ),
                  ),
                )
                ..body = Block((b) {
                  for (final v in variants.sublist(0, variants.length - 1)) {
                    final fn = _safeIdentifier(_factoryName(v.suffix));
                    b.statements.add(
                      ifStatement(
                        refer('json').isA(refer(v.dartName)),
                        Block(
                          (bb) => bb.addExpression(
                            refer(name).newInstanceNamed(fn, [], {
                              'value': refer('json'),
                            }).returned,
                          ),
                        ),
                      ),
                    );
                  }
                  final last = variants.last;
                  b.addExpression(
                    refer(name).newInstanceNamed(
                      _safeIdentifier(_factoryName(last.suffix)),
                      [],
                      {'value': refer('json').asA(refer(last.dartName))},
                    ).returned,
                  );
                }),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..returns = refer('Object')
                ..name = 'toJson'
                ..lambda = true
                ..body = Code('switch (this) {\n$switchCases\n  }'),
            ),
          ),
      ),
    ];
  }

  List<Spec> _buildScalarStructUnionSpecs(
    String name,
    List<DartCoreType> scalars,
    ResolvedType struct, {
    String? deprecated,
    List<String> docs = const [],
  }) {
    final structSuffix = _variantSuffix(struct, name);
    final structCls = '$name\$$structSuffix';
    final structFn = _safeIdentifier(_factoryName(structSuffix));

    final scalarVariants = scalars
        .map((s) => (suffix: _variantSuffix(s, name), dartName: s.dartName))
        .toList();

    final structToJson = switch (struct) {
      InlineRecord(:final fields) => _inlineRecordToJson(fields, 'value'),
      _ => 'value.toJson()',
    };

    final switchCases = [
      '    $structCls(:final value) => $structToJson,',
      ...scalarVariants.map(
        (v) => '    $name\$${v.suffix}(:final value) => value,',
      ),
    ].join('\n');

    // fromJson: value expression for the struct arm
    final structFromJsonExpr = switch (struct) {
      ClassType(:final ref) => refer(
        ref.name,
      ).newInstanceNamed('fromJson', [refer('json')]),
      InlineRecord(:final fields) => CodeExpression(
        Code(
          _inlineRecordFromJson(
            fields,
            // Inside `if (json is Map<String, Object?>)` Dart narrows the
            // type — no explicit cast needed.
            'json',
          ),
        ),
      ),
      _ => refer('json'),
    };

    return [
      Class(
        (b) => b
          ..name = name
          ..sealed = true
          ..annotations.addAll([
            refer('freezed'),
            if (deprecated != null)
              refer('Deprecated').call([literalString(deprecated)]),
          ])
          ..docs.addAll(docs)
          ..mixins.add(refer('_\$$name'))
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..name = '_',
            ),
          )
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..factory = true
                ..name = structFn
                ..optionalParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'value'
                      ..named = true
                      ..required = true
                      ..type = toRef(struct),
                  ),
                )
                ..redirect = refer(structCls),
            ),
          )
          ..constructors.addAll(
            scalarVariants.map(
              (v) => Constructor(
                (b) => b
                  ..constant = true
                  ..factory = true
                  ..name = _safeIdentifier(_factoryName(v.suffix))
                  ..optionalParameters.add(
                    Parameter(
                      (b) => b
                        ..name = 'value'
                        ..named = true
                        ..required = true
                        ..type = refer(v.dartName),
                    ),
                  )
                  ..redirect = refer('$name\$${v.suffix}'),
              ),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..static = true
                ..returns = refer(name)
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = TypeReference(
                        (b) => b
                          ..symbol = 'Object'
                          ..isNullable = true,
                      ),
                  ),
                )
                ..body = Block((b) {
                  b.statements.add(
                    ifStatement(
                      refer('json').isA(_jsonMapRef()),
                      Block(
                        (bb) => bb.addExpression(
                          refer(name).newInstanceNamed(structFn, [], {
                            'value': structFromJsonExpr,
                          }).returned,
                        ),
                      ),
                    ),
                  );
                  for (final v in scalarVariants.sublist(
                    0,
                    scalarVariants.length - 1,
                  )) {
                    final fn = _safeIdentifier(_factoryName(v.suffix));
                    b.statements.add(
                      ifStatement(
                        refer('json').isA(refer(v.dartName)),
                        Block(
                          (bb) => bb.addExpression(
                            refer(name).newInstanceNamed(fn, [], {
                              'value': refer('json'),
                            }).returned,
                          ),
                        ),
                      ),
                    );
                  }
                  final last = scalarVariants.last;
                  b.addExpression(
                    refer(name).newInstanceNamed(
                      _safeIdentifier(_factoryName(last.suffix)),
                      [],
                      {'value': refer('json').asA(refer(last.dartName))},
                    ).returned,
                  );
                }),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..returns = refer('Object')
                ..name = 'toJson'
                ..lambda = true
                ..body = Code('switch (this) {\n$switchCases\n  }'),
            ),
          ),
      ),
    ];
  }

  List<Spec> _buildStructListUnionSpecs(
    String name,
    ClassType struct,
    ListType list, {
    String? deprecated,
    List<String> docs = const [],
  }) {
    final structSuffix = _variantSuffix(struct, name);
    final structCls = '$name\$$structSuffix';
    final structFn = _safeIdentifier(_factoryName(structSuffix));
    const listCls = r'$List';
    const listFn = 'list';

    final elemType = _dartTypeName(list.element);
    final elemToJson = _toJsonCallerFor(list.element, 'e');

    final mapType = TypeReference(
      (b) => b
        ..symbol = 'Map'
        ..types.addAll([
          refer('String'),
          TypeReference(
            (b) => b
              ..symbol = 'Object'
              ..isNullable = true,
          ),
        ]),
    );
    final listObjectNullable = TypeReference(
      (b) => b
        ..symbol = 'List'
        ..types.add(
          TypeReference(
            (b) => b
              ..symbol = 'Object'
              ..isNullable = true,
          ),
        ),
    );

    // List variant fromJson:
    // (json as List<Object?>).map((e) => fromJson(e)).toList()
    final listFromExpr = refer('json')
        .asA(listObjectNullable)
        .property('map')
        .call([
          Method(
            (b) => b
              ..lambda = true
              ..requiredParameters.add(
                Parameter((b) => b..name = 'e'),
              )
              ..body = _listElementCastExpr(list.element).code,
          ).closure,
        ])
        .property('toList')
        .call([]);

    final switchCases = [
      '$name\$$structSuffix(:final value) => value.toJson(),',
      '$name$listCls(:final value) => value.map((e) => $elemToJson).toList(),',
    ].join('\n');

    return [
      Class(
        (b) => b
          ..name = name
          ..sealed = true
          ..annotations.addAll([
            refer('freezed'),
            if (deprecated != null)
              refer('Deprecated').call([literalString(deprecated)]),
          ])
          ..docs.addAll(docs)
          ..mixins.add(refer('_\$$name'))
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..name = '_',
            ),
          )
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..factory = true
                ..name = structFn
                ..optionalParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'value'
                      ..named = true
                      ..required = true
                      ..type = refer(struct.ref.name),
                  ),
                )
                ..redirect = refer(structCls),
            ),
          )
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..factory = true
                ..name = listFn
                ..optionalParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'value'
                      ..named = true
                      ..required = true
                      ..type = TypeReference(
                        (b) => b
                          ..symbol = 'List'
                          ..types.add(refer(elemType)),
                      ),
                  ),
                )
                ..redirect = refer('$name\$List'),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..static = true
                ..returns = refer(name)
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = TypeReference(
                        (b) => b
                          ..symbol = 'Object'
                          ..isNullable = true,
                      ),
                  ),
                )
                ..body = Block((b) {
                  b.statements.add(
                    ifStatement(
                      refer('json').isA(refer('List')),
                      Block(
                        (bb) => bb.addExpression(
                          refer(name).newInstanceNamed(listFn, [], {
                            'value': listFromExpr,
                          }).returned,
                        ),
                      ),
                    ),
                  );
                  b.addExpression(
                    refer(name).newInstanceNamed(structFn, [], {
                      'value': refer(struct.ref.name).newInstanceNamed(
                        'fromJson',
                        [refer('json').asA(mapType)],
                      ),
                    }).returned,
                  );
                }),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..returns = refer('Object')
                ..name = 'toJson'
                ..lambda = true
                ..body = Code('switch (this) {\n$switchCases\n  }'),
            ),
          ),
      ),
    ];
  }

  List<Spec> _buildStructStructUnionSpecs(
    String name,
    List<_UnionCheck> checks, {
    String? deprecated,
    List<String> docs = const [],
  }) {
    final seenSuffixes = <String>{};
    final variants =
        <({String suffix, String cls, String fn, ResolvedType variant})>[];
    for (final check in checks) {
      final suffix = _variantSuffix(check.variant, name);
      if (seenSuffixes.add(suffix)) {
        variants.add((
          suffix: suffix,
          cls: '$name\$$suffix',
          fn: _safeIdentifier(_factoryName(suffix)),
          variant: check.variant,
        ));
      }
    }

    final switchCases = variants
        .map((v) {
          final toJsonExpr = switch (v.variant) {
            InlineRecord(:final fields) => _inlineRecordToJson(fields, 'value'),
            _ => 'value.toJson()',
          };
          return '    ${v.cls}(:final value) => $toJsonExpr,';
        })
        .join('\n');

    final mapType = TypeReference(
      (b) => b
        ..symbol = 'Map'
        ..types.addAll([
          refer('String'),
          TypeReference(
            (b) => b
              ..symbol = 'Object'
              ..isNullable = true,
          ),
        ]),
    );

    return [
      Class(
        (b) => b
          ..name = name
          ..sealed = true
          ..annotations.addAll([
            refer('freezed'),
            if (deprecated != null)
              refer('Deprecated').call([literalString(deprecated)]),
          ])
          ..docs.addAll(docs)
          ..mixins.add(refer('_\$$name'))
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..name = '_',
            ),
          )
          ..constructors.addAll(
            variants.map(
              (v) => Constructor(
                (b) => b
                  ..constant = true
                  ..factory = true
                  ..name = v.fn
                  ..optionalParameters.add(
                    Parameter(
                      (b) => b
                        ..name = 'value'
                        ..named = true
                        ..required = true
                        ..type = toRef(v.variant),
                    ),
                  )
                  ..redirect = refer(v.cls),
              ),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..static = true
                ..returns = refer(name)
                ..name = 'fromJson'
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = mapType,
                  ),
                )
                ..body = Block((b) {
                  for (final check in checks.sublist(0, checks.length - 1)) {
                    final suffix = _variantSuffix(check.variant, name);
                    final fn = _safeIdentifier(_factoryName(suffix));
                    final condExpr = check.literalValue != null
                        ? refer('json')
                              .index(literalString(check.fieldName))
                              .equalTo(literalString(check.literalValue!))
                        : refer('json').property('containsKey').call([
                            literalString(check.fieldName),
                          ]);
                    final valueExpr = _variantFromJsonExpr(
                      check.variant,
                      'json',
                    );
                    b.statements.add(
                      ifStatement(
                        condExpr,
                        Block(
                          (bb) => bb.addExpression(
                            refer(name).newInstanceNamed(fn, [], {
                              'value': valueExpr,
                            }).returned,
                          ),
                        ),
                      ),
                    );
                  }
                  final last = checks.last;
                  final lastFn = _safeIdentifier(
                    _factoryName(_variantSuffix(last.variant, name)),
                  );
                  b.addExpression(
                    refer(name).newInstanceNamed(lastFn, [], {
                      'value': _variantFromJsonExpr(last.variant, 'json'),
                    }).returned,
                  );
                }),
            ),
          )
          ..methods.add(
            Method(
              (b) => b
                ..returns = refer('Object')
                ..name = 'toJson'
                ..lambda = true
                ..body = Code('switch (this) {\n$switchCases\n  }'),
            ),
          ),
      ),
    ];
  }

  /// Returns the Dart type name string for a resolved type, used in string
  /// interpolation contexts (e.g. inside `Code('...')` bodies for union specs).
  String _dartTypeName(ResolvedType type) => switch (type) {
    DartCoreType(:final dartName) => dartName,
    ClassType(:final ref) => ref.name,
    EnumType(:final ref) => ref.name,
    AliasType(:final ref) => ref.name,
    ListType(:final element) => 'List<${_dartTypeName(element)}>',
    MapType(:final key, :final value) =>
      'Map<${_dartTypeName(key)}, ${_dartTypeName(value)}>',
    NullableType(:final inner) => '${_dartTypeName(inner)}?',
    UnionType() => 'Object',
    TupleType() => 'List<Object?>',
    StringLiteralType() => 'String',
    InlineRecord() => 'Object',
  };

  // ---------------------------------------------------------------------------
  // InlineRecord serialization helpers
  // ---------------------------------------------------------------------------

  /// Returns a code_builder [Expression] that deserializes [variant] from a
  /// JSON map variable named [jsonVar].
  Expression _variantFromJsonExpr(ResolvedType variant, String jsonVar) =>
      switch (variant) {
        ClassType(:final ref) => refer(
          ref.name,
        ).newInstanceNamed('fromJson', [refer(jsonVar)]),
        InlineRecord(:final fields) => CodeExpression(
          Code(_inlineRecordFromJson(fields, jsonVar)),
        ),
        _ => refer(jsonVar),
      };

  /// Builds a Dart expression string that constructs an inline record from a
  /// JSON map (e.g. `(delta: json['delta'] as bool?)`).
  String _inlineRecordFromJson(
    List<ResolvedProperty> fields,
    String jsonVar,
  ) {
    if (fields.isEmpty) {
      return '()';
    }

    final parts = fields
        .map(
          (f) =>
              '${f.name}: ${_jsonFieldExtract(
                f.type,
                "$jsonVar['${f.name}']",
                optional: f.optional,
              )}',
        )
        .join(', ');
    return '($parts)';
  }

  /// Builds a Dart expression string that serializes an inline record to a
  /// JSON map (e.g. `{'delta': value.delta}`).
  String _inlineRecordToJson(List<ResolvedProperty> fields, String valueVar) {
    if (fields.isEmpty) {
      return '<String, Object?>{}';
    }

    final entries = fields.map((f) {
      final fieldAccess = '$valueVar.${f.name}';
      final jsonValue = _fieldToJsonExpr(f.type, fieldAccess);
      if (f.optional) {
        return "if ($fieldAccess != null) '${f.name}': $jsonValue";
      }
      return "'${f.name}': $jsonValue";
    });
    return '{${entries.join(', ')}}';
  }

  /// JSON→Dart cast/conversion for a single record field.
  ///
  /// [optional] treats the value as nullable whether or not [type] is already
  /// wrapped in [NullableType].
  String _jsonFieldExtract(
    ResolvedType type,
    String jsonExpr, {
    bool optional = false,
  }) {
    // Normalise: a type already wrapped in NullableType, or flagged optional,
    // is treated as nullable.
    final (inner, nullable) = switch (type) {
      NullableType(:final inner) => (inner, true),
      _ => (type, optional),
    };

    // Wraps [nonNullExpr] with a null-guard if [nullable].
    String orNull(String nonNullExpr) =>
        nullable ? '$jsonExpr != null ? $nonNullExpr : null' : nonNullExpr;

    return switch (inner) {
      DartCoreType(:final dartName)
          when const {'String', 'int', 'bool', 'double'}.contains(dartName) =>
        nullable ? '$jsonExpr as $dartName?' : '$jsonExpr as $dartName',
      ClassType(:final ref) => orNull(
        '${ref.name}.fromJson($jsonExpr as Map<String, Object?>)',
      ),
      ListType(element: final el) => orNull(
        '($jsonExpr as List<dynamic>).map((e) => ${_jsonFieldExtract(
          el,
          'e',
        )}).toList()',
      ),
      InlineRecord(:final fields) => orNull(
        _inlineRecordFromJson(fields, '($jsonExpr as Map<String, Object?>)'),
      ),
      EnumType(:final ref) when ref.supportsCustomValues => orNull(
        '${ref.name}.fromJson($jsonExpr)',
      ),
      EnumType(:final ref) => orNull(
        '${ref.name}.decode($jsonExpr as ${_enumPrimitiveName(ref)})!',
      ),
      _ => jsonExpr,
    };
  }

  /// Dart→JSON conversion for a single record field value.
  String _fieldToJsonExpr(ResolvedType type, String fieldExpr) {
    final (inner, nullable) = switch (type) {
      NullableType(:final inner) => (inner, true),
      _ => (type, false),
    };

    return switch (inner) {
      DartCoreType() => fieldExpr,
      ClassType() => nullable ? '$fieldExpr?.toJson()' : '$fieldExpr.toJson()',
      EnumType(:final ref) when ref.supportsCustomValues =>
        nullable ? '$fieldExpr?.toJson()' : '$fieldExpr.toJson()',
      EnumType() =>
        // closed enum — serialize via the value field
        nullable ? '$fieldExpr?.value' : '$fieldExpr.value',
      ListType(element: final el) =>
        nullable
            ? '$fieldExpr?.map((e) => ${_fieldToJsonExpr(el, 'e')}).toList()'
            : '$fieldExpr.map((e) => ${_fieldToJsonExpr(el, 'e')}).toList()',
      InlineRecord(:final fields) =>
        nullable
            ? '$fieldExpr != null ? ${_inlineRecordToJson(
                fields,
                fieldExpr,
              )} : null'
            : _inlineRecordToJson(fields, fieldExpr),
      _ => fieldExpr,
    };
  }

  Expression _listElementCastExpr(ResolvedType element) => switch (element) {
    ClassType(:final ref) => refer(
      ref.name,
    ).newInstanceNamed('fromJson', [refer('e').asA(_jsonMapRef())]),
    NullableType(inner: ClassType(:final ref)) =>
      refer('e')
          .equalTo(literalNull)
          .conditional(
            literalNull,
            refer(
              ref.name,
            ).newInstanceNamed('fromJson', [refer('e').asA(_jsonMapRef())]),
          ),
    EnumType(:final ref) when ref.supportsCustomValues => refer(
      ref.name,
    ).newInstanceNamed('fromJson', [refer('e')]),
    EnumType(:final ref) => refer(ref.name).property('decode').call([
      refer('e').asA(refer(_enumPrimitiveName(ref))),
    ]).nullChecked,
    _ => refer('e').asA(refer(_dartTypeName(element))),
  };

  String _toJsonCallerFor(ResolvedType t, String v) => switch (t) {
    ClassType() => '$v.toJson()',
    EnumType(:final ref) when ref.supportsCustomValues => '$v.toJson()',
    EnumType() => '$v.value',
    _ => v,
  };

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Returns the Dart primitive name for an enum's value type (`'int'` or
  /// `'String'`).
  static String _enumPrimitiveName(ResolvedEnum ref) =>
      ref.valueType == 'int' ? 'int' : 'String';

  /// If [type] (unwrapping [NullableType]) is an open enum
  /// (`supportsCustomValues`), returns the Dart primitive name (`'String'` or
  /// `'int'`) and the enum ref. Otherwise returns `null`.
  ({String primitive, ResolvedEnum ref})? _openEnumInfo(ResolvedType type) =>
      null;

  // ---------------------------------------------------------------------------
  // Documentation helpers
  // ---------------------------------------------------------------------------

  /// Formats a documentation string into `/// ` doc-comment lines.
  ///
  /// Resolves JSDoc `{@link Target}` and `{@link Target displayText}` to Dart
  /// cross-reference syntax:
  /// * `{@link Foo}` → `[Foo]`
  /// * `{@link Foo.bar}` → `[Foo.bar]`
  /// * `{@link Foo.bar name}` → `[name]` when *name* is a valid identifier,
  ///   otherwise `[Foo]` (type part only).
  ///
  /// When [since] is non-null, appends `/// @since X` after the main body (or
  /// emits it alone when [input] is blank). [proposed] appends `/// @proposed`
  /// similarly.
  ///
  /// Lines are word-wrapped at [maxWidth] characters. Returns an empty list
  /// when [input] is null or blank and neither [since] nor [proposed] are set.
  static List<String> _docLines(
    String? input, {
    int maxWidth = 80,
    int indent = 0,
    String? since,
    bool proposed = false,
    List<String> extra = const [],
  }) {
    // Structured tags — single source of truth used for both empty
    // and non-empty body paths.
    final tags = [
      if (since != null) '/// @since $since',
      if (proposed) '/// @proposed',
    ];

    // Strip any @since / @proposed already embedded in the documentation text —
    // they are re-emitted from the structured fields so they appear
    // exactly once.
    final body = (input ?? '')
        .replaceAll(RegExp(r'@since\s+\S+'), '')
        .replaceAll('@proposed', '')
        .trim();

    if (body.isEmpty) {
      return tags;
    }

    const prefix = '/// ';
    final maxContent = maxWidth - prefix.length - indent;

    // Resolve {@link Target} / {@link Target displayText} → Dart cross-refs.
    final resolved = body.replaceAllMapped(
      RegExp(r'\{@link\s+(\S+?)(?:\s+([^}]*?))?\}'),
      (m) {
        final target = m.group(1)!.replaceAll('[]', '');
        final rawDisplay = m.group(2)?.replaceAll('`', '').trim() ?? '';
        if (rawDisplay.isEmpty) {
          return '[$target]';
        }
        // Single valid Dart identifier → use as reference.
        if (RegExp(r'^\w+$').hasMatch(rawDisplay)) {
          return '[$rawDisplay]';
        }
        // Multi-word / non-identifier → link to the type part only.
        return '[${target.split('.').first}]';
      },
    );

    // Normalise line endings; split into non-empty paragraphs.
    final paragraphs = resolved
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .split(RegExp(r'\n\s*\n'))
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();

    final lines = <String>[];
    for (final paragraph in paragraphs) {
      if (lines.isNotEmpty) {
        lines.add('///');
      }

      // Collapse intra-paragraph newlines to spaces, then word-wrap.
      final words = paragraph.replaceAll('\n', ' ').split(RegExp(r'\s+'));
      final buf = StringBuffer();
      for (final word in words) {
        if (buf.isEmpty) {
          buf.write(word);
        } else if (buf.length + 1 + word.length <= maxContent) {
          buf
            ..write(' ')
            ..write(word);
        } else {
          lines.add('$prefix$buf');
          buf
            ..clear()
            ..write(word);
        }
      }
      if (buf.isNotEmpty) {
        lines.add('$prefix$buf');
      }
    }

    if (extra.isNotEmpty) {
      lines
        ..add('///')
        ..addAll(extra.map((l) => '/// $l'));
    }

    if (tags.isNotEmpty) {
      lines
        ..add('///')
        ..addAll(tags);
    }
    return lines;
  }

  static String _typeName(ResolvedType type) => switch (type) {
    ClassType(:final ref) => ref.name,
    EnumType(:final ref) => ref.name,
    AliasType(:final ref) => ref.name,
    DartCoreType(:final dartName) => dartName,
    TupleType(:final items) => '(${items.map(_typeName).join(', ')})',
    ListType(:final element) => 'List<${_typeName(element)}>',
    _ => 'Object',
  };

  /// If [type] is an inline [UnionType] (i.e. not a named alias), returns a
  /// one-line note listing the variant names, e.g.
  /// `['Type: TextDocumentSyncOptions | TextDocumentSyncKind']`.
  /// Returns an empty list for all other types.
  static List<String> _inlineUnionNote(ResolvedType type) {
    final inner = type is NullableType ? type.inner : type;
    if (inner is! UnionType) {
      return const [];
    }
    final names = inner.items.map(_typeName);
    return ['Type: ${names.join(' | ')}'];
  }

  /// Returns a [TypeReference] for `Map<String, Object?>}`.
  static TypeReference _jsonMapRef() => TypeReference(
    (b) => b
      ..symbol = 'Map'
      ..types.addAll([
        refer('String'),
        TypeReference(
          (b) => b
            ..symbol = 'Object'
            ..isNullable = true,
        ),
      ]),
  );

  /// Ensures an identifier is valid Dart (e.g. avoids reserved words).
  static String _safeIdentifier(String name) {
    const reserved = {
      'class',
      'enum',
      'value',
      'macro',
      'null',
      'interface',
      'operator',
      'static',
      'abstract',
      'async',
    };

    return reserved.contains(name) ? '${name}_' : name;
  }

  /// Converts the first character of [name] to lowercase.
  ///
  /// Used to normalise PascalCase LSP enum member names (e.g. `PlainText`)
  /// to the lowerCamelCase Dart convention.
  static String _toLowerCamelCase(String name) =>
      name.isEmpty ? name : name[0].toLowerCase() + name.substring(1);
}
