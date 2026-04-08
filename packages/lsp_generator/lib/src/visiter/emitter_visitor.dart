import 'package:code_builder/code_builder.dart';

import '../redux/models/resolved_decl.dart';
import '../redux/models/resolved_type.dart';
import '../redux/resolved/resolved_state.dart';
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
/// All Dart enums use `@JsonEnum()` + `@JsonValue` — no converter needed.
enum _ConverterKind { scalarUnion, structUnion }

/// Metadata about a single needed JsonConverter.
typedef _ConverterEntry = ({
  String name,
  _ConverterKind kind,
});

// ---------------------------------------------------------------------------

/// Generates a Dart `if` (optionally `else`) statement from code_builder
/// [condition] and block bodies.
Code ifStatement(Expression condition, Block ifBlock, [Block? elseBlock]) {
  final visiter = DartEmitter();
  final conditionV = condition.accept(visiter);
  final ifBlockV = ifBlock.accept(visiter);
  final elseBlockV = elseBlock?.accept(visiter);

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
        ..comments.add(_header)
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
      ..body.addAll(_resolved.enumerations.map(_buildEnum)),
  );

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
      specs.addAll(_buildUnionSpecs(name, ut, kind));
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
      specs.addAll(_buildUnionSpecs(name, ut, kind));
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
    var needsStructures = false;
    var needsEnumerations = false;
    var needsAliases = false;
    var needsScalarUnions = false;
    var needsUnions = false;

    void walk(ResolvedType type) {
      switch (type) {
        case ClassType():
          if (currentFile != _structuresFile) {
            needsStructures = true;
          }
        case EnumType():
          if (currentFile != _enumerationsFile) {
            needsEnumerations = true;
          }
        case AliasType(:final ref):
          // Sealed union aliases live in their own files, not
          // type_aliases.dart.
          if (_scalarUnionNames.contains(ref.name)) {
            if (currentFile != _scalarUnionsFile) {
              needsScalarUnions = true;
            }
          } else if (_sealedUnionNames.contains(ref.name)) {
            if (currentFile != _unionsFile) {
              needsUnions = true;
            }
          } else if (currentFile != _aliasesFile) {
            needsAliases = true;
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

    return [
      if (needsStructures) Directive.import(_structuresFile),
      if (needsEnumerations) Directive.import(_enumerationsFile),
      if (needsAliases) Directive.import(_aliasesFile),
      if (needsScalarUnions) Directive.import(_scalarUnionsFile),
      if (needsUnions) Directive.import(_unionsFile),
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

    // Freezed mixin and redirect names strip leading underscores from the class
    // name: `_Foo` → mixin `_$Foo`, redirect `__Foo` (still library-private).
    final publicPart = cls.name.startsWith('_')
        ? cls.name.substring(1)
        : cls.name;

    return Class((b) {
      b
        ..name = cls.name
        ..abstract = true
        ..annotations.add(refer('freezed'));

      b.mixins.add(refer('_\$$publicPart'));

      if (cls.documentation != null) {
        b.docs.add('/// ${cls.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // Private const constructor — required by freezed for sealed matching /
      //  instance methods.
      b.constructors.add(
        Constructor(
          (b) => b
            ..constant = true
            ..name = '_',
        ),
      );

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
      if (cls.documentation != null) {
        b.docs.add('/// ${cls.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // Final fields (plain class — no freezed mixin).
      final ownerName = cls.name.replaceFirst(RegExp('^_+'), '');
      for (final p in allProps) {
        b.fields.add(
          Field((b) {
            b
              ..modifier = FieldModifier.final$
              ..name = p.name
              ..type = toRef(p.type, nullable: p.optional);
            for (final ann in _annotationsForParam(p, ownerName)) {
              b.annotations.add(ann);
            }
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
        props.map(
          (p) => Parameter((b) {
            b
              ..name = p.name
              ..type = toRef(p.type, nullable: p.optional)
              ..named = true
              ..required = !p.optional;
            for (final ann in _annotationsForParam(p, className)) {
              b.annotations.add(ann);
            }
          }),
        ),
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

    switch (inner) {
      // All Dart enums: @JsonEnum() + @JsonValue handles them natively —
      // no converter annotation needed.
      case EnumType():
        return null;

      case AliasType(:final ref)
          when _scalarUnionNames.contains(ref.name) ||
              _sealedUnionNames.contains(ref.name):
        return refer('_${ref.name}Converter').call([]);

      case ListType(element: final el):
        final elemInner = el is NullableType ? el.inner : el;
        switch (elemInner) {
          // All enums in lists: json_serializable handles via $enumDecode.
          case EnumType():
            return null;
          case AliasType(:final ref)
              when _scalarUnionNames.contains(ref.name) ||
                  _sealedUnionNames.contains(ref.name):
            return refer('_${ref.name}ListConverter').call([]);
          default:
            return null;
        }

      default:
        return null;
    }
  }

  /// Returns the list of annotations for factory/field parameter [p].
  List<Expression> _annotationsForParam(ResolvedProperty p, String ownerName) {
    final ann = _converterAnnotationFor(p.type);
    return ann != null ? [ann] : [];
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
      // Add to list map only. If the type also appears as a direct (non-list)
      // field, register() will be called separately and will populate scalar.
      list[name] ??= (name: name, kind: kind);
    }

    void processType(ResolvedType type) {
      final inner = type is NullableType ? type.inner : type;
      switch (inner) {
        // All Dart enums: @JsonEnum() handles them — no converter to register.
        case EnumType():
          break;
        case AliasType(:final ref) when _scalarUnionNames.contains(ref.name):
          register(ref.name, _ConverterKind.scalarUnion);
        case AliasType(:final ref) when _sealedUnionNames.contains(ref.name):
          register(ref.name, _ConverterKind.structUnion);

        case ListType(element: final el):
          final elemInner = el is NullableType ? el.inner : el;
          switch (elemInner) {
            // All enums in lists: no converter needed.
            case EnumType():
              break;
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
  Iterable<Spec> _buildConverterSpecs() sync* {
    final needs = _converterNeeds;
    // Emit scalar converters for types used directly as fields.
    for (final entry in needs.scalar.values) {
      yield _scalarConverterSpec(entry);
    }
    // Emit list converters for types used as List<...> elements.
    for (final entry in needs.list.values) {
      yield _listConverterSpec(entry);
    }
  }

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

  /// All enums — open or closed — are emitted as Dart native `enum` with
  /// `@JsonEnum()` and per-member `@JsonValue(...)` annotations.
  Spec _buildEnum(ResolvedEnum en) {
    final isInt = en.valueType == 'int';

    return Enum((b) {
      b.name = en.name;

      // @JsonEnum() — json_serializable uses @JsonValue on each member.
      b.annotations.add(refer('JsonEnum').call([]));

      if (en.documentation != null) {
        b.docs.add('/// ${en.documentation!.replaceAll('\n', '\n/// ')}');
      }

      for (final member in en.members) {
        b.values.add(
          EnumValue((b) {
            b.name = _safeIdentifier(member.name);
            // @JsonValue annotation carries the wire value.
            b.annotations.add(
              refer('JsonValue').call([
                if (isInt)
                  literalNum(int.parse(member.value))
                else
                  literalString(member.value),
              ]),
            );
            if (member.documentation != null) {
              b.docs.add(
                '/// ${member.documentation!.replaceAll('\n', '\n/// ')}',
              );
            }
          }),
        );
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Alias builder
  // ---------------------------------------------------------------------------

  Spec _buildAlias(ResolvedAlias alias) => TypeDef(
    (b) => b
      ..name = alias.name
      ..definition = toTypeRef(alias.type),
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
        'Record(${fields.map((f) => '${f.name}:${f.type.runtimeType}').join(',')})',
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

  List<Spec> _buildUnionSpecs(String name, UnionType ut, _UnionKind kind) {
    final structItems = ut.items
        .where((t) => t is ClassType || t is InlineRecord)
        .toList();
    return switch (kind) {
      _UnionKind.scalar => _buildScalarUnionSpecs(
        name,
        ut.items.whereType<DartCoreType>().toList(),
      ),
      _UnionKind.scalarStruct => _buildScalarStructUnionSpecs(
        name,
        ut.items.whereType<DartCoreType>().toList(),
        structItems.first,
      ),
      _UnionKind.structList => _buildStructListUnionSpecs(
        name,
        ut.items.whereType<ClassType>().first,
        ut.items.whereType<ListType>().first,
      ),
      _UnionKind.structStruct => _buildStructStructUnionSpecs(
        name,
        _findStructDiscriminator(structItems)!,
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
  String _factoryName(String suffix) {
    if (suffix.isEmpty) {
      return suffix;
    }

    return suffix[0].toLowerCase() + suffix.substring(1);
  }

  List<Spec> _buildScalarUnionSpecs(String name, List<DartCoreType> scalars) {
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
          ..annotations.add(refer('freezed'))
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
                        CodeExpression(Code('json is ${v.dartName}')),
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
    ResolvedType struct,
  ) {
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
          ..annotations.add(refer('freezed'))
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
                      const CodeExpression(
                        Code('json is Map<String, Object?>'),
                      ),
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
                        CodeExpression(Code('json is ${v.dartName}')),
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
    ListType list,
  ) {
    final structSuffix = _variantSuffix(struct, name);
    final structCls = '$name\$$structSuffix';
    final structFn = _safeIdentifier(_factoryName(structSuffix));
    const listCls = r'$List';
    const listFn = 'list';

    final elemType = _dartTypeName(list.element);
    final elemFromJson = _listElementCast(list.element);
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

    // List variant fromJson: (json as List<Object?>).map((e) => $elemFromJson).toList()
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
              ..body = Code(elemFromJson),
          ).closure,
        ])
        .property('toList')
        .call([]);

    final switchCases = [
      '    $name\$$structSuffix(:final value) => value.toJson(),',
      '    $name$listCls(:final value) => value.map((e) => $elemToJson).toList(),',
    ].join('\n');

    return [
      Class(
        (b) => b
          ..name = name
          ..sealed = true
          ..annotations.add(refer('freezed'))
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
                      const CodeExpression(Code('json is List')),
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
    List<_UnionCheck> checks,
  ) {
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
            ClassType() => 'value.toJson()',
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
          ..annotations.add(refer('freezed'))
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
    if (fields.isEmpty) return '()';
    final parts = fields
        .map(
          (f) =>
              '${f.name}: ${_jsonFieldExtract(f.type, "$jsonVar['${f.name}']", optional: f.optional)}',
        )
        .join(', ');
    return '($parts)';
  }

  /// Builds a Dart expression string that serializes an inline record to a
  /// JSON map (e.g. `{'delta': value.delta}`).
  String _inlineRecordToJson(List<ResolvedProperty> fields, String valueVar) {
    if (fields.isEmpty) return '<String, Object?>{}';
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
          when dartName == 'String' ||
              dartName == 'int' ||
              dartName == 'bool' ||
              dartName == 'double' =>
        nullable ? '$jsonExpr as $dartName?' : '$jsonExpr as $dartName',
      ClassType(:final ref) => orNull(
        '${ref.name}.fromJson($jsonExpr as Map<String, Object?>)',
      ),
      EnumType(:final ref) when !ref.supportsCustomValues => orNull(
        '\$enumDecode(_\$${ref.name}EnumMap, $jsonExpr)',
      ),
      EnumType(:final ref) => orNull('${ref.name}($jsonExpr as String)'),
      ListType(element: final el) => orNull(
        '($jsonExpr as List<dynamic>)'
        '.map((e) => ${_jsonFieldExtract(el, 'e')})'
        '.toList()',
      ),
      InlineRecord(:final fields) => orNull(
        _inlineRecordFromJson(fields, '($jsonExpr as Map<String, Object?>)'),
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
      EnumType(:final ref) when !ref.supportsCustomValues =>
        nullable
            ? '$fieldExpr != null ? _\$${ref.name}EnumMap[$fieldExpr]! : null'
            : '_\$${ref.name}EnumMap[$fieldExpr]!',
      EnumType() => nullable ? '$fieldExpr?.value' : '$fieldExpr.value',
      ListType(element: final el) =>
        nullable
            ? '$fieldExpr?.map((e) => ${_fieldToJsonExpr(el, 'e')}).toList()'
            : '$fieldExpr.map((e) => ${_fieldToJsonExpr(el, 'e')}).toList()',
      InlineRecord(:final fields) =>
        nullable
            ? '$fieldExpr != null ? ${_inlineRecordToJson(fields, fieldExpr)} : null'
            : _inlineRecordToJson(fields, fieldExpr),
      _ => fieldExpr,
    };
  }

  String _listElementCast(ResolvedType element) => switch (element) {
    ClassType(:final ref) => '${ref.name}.fromJson(e as Map<String, Object?>)',
    NullableType(inner: ClassType(:final ref)) =>
      'e == null ? null : ${ref.name}.fromJson(e as Map<String, Object?>)',
    _ => 'e as ${_dartTypeName(element)}',
  };

  String _toJsonCallerFor(ResolvedType t, String v) => switch (t) {
    ClassType() => '$v.toJson()',
    EnumType() => '$v.value',
    _ => v,
  };

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Ensures an identifier is valid Dart (e.g. avoids reserved words).
  static String _safeIdentifier(String name) {
    const reserved = {
      'abstract',
      'as',
      'assert',
      'async',
      'await',
      'break',
      'case',
      'catch',
      'class',
      'const',
      'continue',
      'covariant',
      'default',
      'deferred',
      'do',
      'dynamic',
      'else',
      'enum',
      'export',
      'extends',
      'extension',
      'external',
      'factory',
      'false',
      'final',
      'finally',
      'for',
      'Function',
      'get',
      'hide',
      'if',
      'implements',
      'import',
      'in',
      'interface',
      'is',
      'late',
      'library',
      'mixin',
      'new',
      'null',
      'of',
      'on',
      'operator',
      'part',
      'required',
      'rethrow',
      'return',
      'sealed',
      'set',
      'show',
      'static',
      'super',
      'switch',
      'sync',
      'this',
      'throw',
      'true',
      'try',
      'type',
      'typedef',
      'var',
      'void',
      'when',
      'while',
      'with',
      'yield',
    };
    return reserved.contains(name) ? '${name}_' : name;
  }
}
