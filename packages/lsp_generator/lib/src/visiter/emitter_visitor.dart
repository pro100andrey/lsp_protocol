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
  /// The struct variant returned when the condition matches.
  ClassType variant,

  /// Field name used for the check.
  String fieldName,

  /// Non-null  → kind discriminator: `json['fieldName'] == 'literalValue'`.
  /// Null      → presence discriminator: `json.containsKey('fieldName')`.
  /// Empty [fieldName] → else branch (no condition).
  String? literalValue,
});

// ---------------------------------------------------------------------------

/// Discriminates how a converter class is generated.
/// Closed Dart enums use `@JsonEnum(valueField: 'value')` — no converter
/// needed.
enum _ConverterKind { openEnum, scalarUnion, structUnion }

/// Metadata about a single needed JsonConverter.
typedef _ConverterEntry = ({
  String name,
  _ConverterKind kind,

  /// `'int'` or `'String'` for enum-based converters, `''` otherwise.
  String valueType,
});

// ---------------------------------------------------------------------------

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
          ..._buildConverterSpecs(),
          ...anonymous.map(_buildClass),
          ...named.map(_buildClass),
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
      for (final p in allProps) {
        b.fields.add(
          Field((b) {
            b
              ..modifier = FieldModifier.final$
              ..name = p.name
              ..type = p.optional
                  ? toTypeRef(p.type).rebuild((b) => b.isNullable = true)
                  : toTypeRef(p.type);
            final ann = _converterAnnotationFor(p.type);
            if (ann != null) {
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
              ..type = p.optional
                  ? toTypeRef(p.type).rebuild((b) => b.isNullable = true)
                  : toTypeRef(p.type)
              ..named = true
              ..required = !p.optional;
            final ann = _converterAnnotationFor(p.type);
            if (ann != null) {
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
      // Closed Dart enums: @JsonEnum(valueField: 'value') handles them natively
      // — no converter annotation needed.
      case EnumType(:final ref) when !ref.supportsCustomValues:
        return null;

      // Open enums (supportsCustomValues = final class): need a converter.
      case EnumType(:final ref):
        return refer('_${ref.name}Converter').call([]);

      case AliasType(:final ref)
          when _scalarUnionNames.contains(ref.name) ||
              _sealedUnionNames.contains(ref.name):
        return refer('_${ref.name}Converter').call([]);

      case ListType(element: final el):
        final elemInner = el is NullableType ? el.inner : el;
        switch (elemInner) {
          // Closed enums in lists: json_serializable handles via $enumDecode.
          case EnumType(:final ref) when !ref.supportsCustomValues:
            return null;
          case EnumType(:final ref):
            return refer('_${ref.name}ListConverter').call([]);
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

  /// Walks every property of every resolved class and collects the set of
  /// converter classes that need to be emitted into `structures.dart`.
  ({Map<String, _ConverterEntry> scalar, Map<String, _ConverterEntry> list})
  _computeConverterNeeds() {
    final scalar = <String, _ConverterEntry>{};
    final list = <String, _ConverterEntry>{};

    void register(String name, _ConverterKind kind, String valueType) {
      scalar[name] ??= (name: name, kind: kind, valueType: valueType);
    }

    void registerList(String name, _ConverterKind kind, String valueType) {
      // Add to list map only. If the type also appears as a direct (non-list)
      // field, register() will be called separately and will populate scalar.
      list[name] ??= (name: name, kind: kind, valueType: valueType);
    }

    void processType(ResolvedType type) {
      final inner = type is NullableType ? type.inner : type;
      switch (inner) {
        // Closed Dart enums: @JsonEnum handles them — no converter to register.
        case EnumType(:final ref) when !ref.supportsCustomValues:
          break;
        case EnumType(:final ref):
          register(ref.name, _ConverterKind.openEnum, ref.valueType);
        case AliasType(:final ref) when _scalarUnionNames.contains(ref.name):
          register(ref.name, _ConverterKind.scalarUnion, '');
        case AliasType(:final ref) when _sealedUnionNames.contains(ref.name):
          register(ref.name, _ConverterKind.structUnion, '');

        case ListType(element: final el):
          final elemInner = el is NullableType ? el.inner : el;
          switch (elemInner) {
            // Closed enums in lists: no converter needed.
            case EnumType(:final ref) when !ref.supportsCustomValues:
              break;
            case EnumType(:final ref):
              registerList(ref.name, _ConverterKind.openEnum, ref.valueType);
            case AliasType(:final ref)
                when _scalarUnionNames.contains(ref.name):
              registerList(ref.name, _ConverterKind.scalarUnion, '');
            case AliasType(:final ref)
                when _sealedUnionNames.contains(ref.name):
              registerList(ref.name, _ConverterKind.structUnion, '');
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
      case _ConverterKind.openEnum:
        rawType = refer(entry.valueType == 'int' ? 'int' : 'String');
        fromBody = refer(n).call([refer('json')]).code;
        toBody = refer('object').property('value').code;
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

    final Code fromBody;
    final Code toBody;

    switch (entry.kind) {
      case _ConverterKind.openEnum:
        final raw = entry.valueType == 'int' ? 'int' : 'String';
        fromBody = Code('json.map((e) => $n(e as $raw)).toList()');
        toBody = const Code('object.map((e) => e.value).toList()');
      case _ConverterKind.scalarUnion:
        fromBody = Code('json.map((e) => $n.fromJson(e as Object)).toList()');
        toBody = const Code('object.map((e) => e.toJson()).toList()');
      case _ConverterKind.structUnion:
        fromBody = Code(
          'json.map((e) => $n.fromJson(e as Map<String, Object?>)).toList()',
        );
        toBody = const Code('object.map<Object>((e) => e.toJson()).toList()');
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

  /// Creates an `@override` method with one required parameter and a lambda body.
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

  Spec _buildEnum(ResolvedEnum en) {
    if (en.supportsCustomValues) {
      return _buildEnumAsClass(en);
    }
    return _buildDartEnum(en);
  }

  /// Dart native `enum` for enums without custom values.
  Spec _buildDartEnum(ResolvedEnum en) {
    final valueType = en.valueType == 'int' ? refer('int') : refer('String');

    return Enum((b) {
      b.name = en.name;

      // @JsonEnum(valueField: 'value') lets json_serializable encode/decode
      // using the `value` field instead of the enum name.
      b.annotations.add(
        refer('JsonEnum').call([], {'valueField': literalString('value')}),
      );

      if (en.documentation != null) {
        b.docs.add('/// ${en.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // Constructor with `value` param
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

      // `final Type value` field
      b.fields.add(
        Field(
          (b) => b
            ..name = 'value'
            ..type = valueType
            ..modifier = FieldModifier.final$,
        ),
      );

      // Enum values
      for (final member in en.members) {
        b.values.add(
          EnumValue((b) {
            b.name = _safeIdentifier(member.name);
            if (en.valueType == 'int') {
              b.arguments.add(literalNum(int.parse(member.value)));
            } else {
              b.arguments.add(literalString(member.value));
            }
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

  /// `final class` for enums that support custom values (open-ended).
  Spec _buildEnumAsClass(ResolvedEnum en) {
    final valueType = en.valueType == 'int' ? refer('int') : refer('String');

    return Class((b) {
      b
        ..name = en.name
        ..modifier = ClassModifier.final$;

      if (en.documentation != null) {
        b.docs.add('/// ${en.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // const constructor
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

      // final value field
      b.fields.add(
        Field(
          (b) => b
            ..name = 'value'
            ..type = valueType
            ..modifier = FieldModifier.final$,
        ),
      );

      // static const members
      for (final member in en.members) {
        final init = en.valueType == 'int'
            ? refer(en.name).call([literalNum(int.parse(member.value))])
            : refer(en.name).call([literalString(member.value)]);

        b.fields.add(
          Field((b) {
            b
              ..name = _safeIdentifier(member.name)
              ..type = refer(en.name)
              ..static = true
              ..modifier = FieldModifier.constant
              ..assignment = init.code;
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
      if (_classNames.contains(alias.name)) continue;
      if (alias.type is! UnionType) continue;
      final ut = alias.type as UnionType;
      final kind = _classifyUnion(ut);
      if (kind == _UnionKind.mixed) continue;
      if (kind == _UnionKind.structStruct) {
        final structs = ut.items.whereType<ClassType>().toList();
        if (_findStructDiscriminator(structs) == null) continue;
      }
      result.add(alias.name);
    }
    return result;
  }

  _UnionKind _classifyUnion(UnionType u) {
    final scalars = u.items.whereType<DartCoreType>().toList();
    final structs = u.items.whereType<ClassType>().toList();
    final lists = u.items.whereType<ListType>().toList();
    final others = u.items.where(
      (t) => t is! DartCoreType && t is! ClassType && t is! ListType,
    );

    if (others.isNotEmpty) return _UnionKind.mixed;
    if (structs.isEmpty && lists.isEmpty) return _UnionKind.scalar;
    if (lists.isEmpty && scalars.isNotEmpty && structs.isNotEmpty) {
      final uniqueStructs = structs.map((t) => t.ref.name).toSet();
      return uniqueStructs.length == 1
          ? _UnionKind.scalarStruct
          : _UnionKind.mixed;
    }
    if (scalars.isEmpty && lists.isNotEmpty && structs.isNotEmpty) {
      return _UnionKind.structList;
    }
    if (scalars.isEmpty && lists.isEmpty && structs.length >= 2) {
      final uniqueStructs = structs.map((t) => t.ref.name).toSet();
      return uniqueStructs.length >= 2
          ? _UnionKind.structStruct
          : _UnionKind.mixed;
    }
    return _UnionKind.mixed;
  }

  /// Returns a list of discriminator checks (last entry = else branch) or
  /// `null` if no reliable discriminator can be found.
  List<_UnionCheck>? _findStructDiscriminator(List<ClassType> variants) {
    // Deduplicate by struct name.
    final seen = <String>{};
    final unique = variants.where((t) => seen.add(t.ref.name)).toList();
    if (unique.length < 2) return null;

    final propMaps = [for (final v in unique) _allPropertiesMap(v.ref)];
    final requiredSets = [
      for (final m in propMaps)
        {
          for (final e in m.entries)
            if (!e.value.optional) e.key,
        },
    ];
    final commonRequired = requiredSets.reduce((a, b) => a.intersection(b));

    // Kind discriminator: shared required property with distinct StringLiteralType values.
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
    ClassType? elseVariant;
    for (var i = 0; i < unique.length; i++) {
      final otherRequired = <String>{};
      for (var j = 0; j < unique.length; j++) {
        if (j != i) otherRequired.addAll(requiredSets[j]);
      }
      final uniqueProps = requiredSets[i].difference(otherRequired);
      if (uniqueProps.isEmpty) {
        if (elseVariant != null) return null;
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

  Map<String, ResolvedProperty> _allPropertiesMap(ResolvedClass cls) => {
    for (final p in _allProperties(cls)) p.name: p,
  };

  // ---------------------------------------------------------------------------
  // Union spec builders (raw Dart code strings via [Code])
  // ---------------------------------------------------------------------------

  List<Spec> _buildUnionSpecs(String name, UnionType ut, _UnionKind kind) =>
      switch (kind) {
        _UnionKind.scalar => _buildScalarUnionSpecs(
          name,
          ut.items.whereType<DartCoreType>().toList(),
        ),
        _UnionKind.scalarStruct => _buildScalarStructUnionSpecs(
          name,
          ut.items.whereType<DartCoreType>().toList(),
          ut.items.whereType<ClassType>().first,
        ),
        _UnionKind.structList => _buildStructListUnionSpecs(
          name,
          ut.items.whereType<ClassType>().first,
          ut.items.whereType<ListType>().first,
        ),
        _UnionKind.structStruct => _buildStructStructUnionSpecs(
          name,
          _findStructDiscriminator(ut.items.whereType<ClassType>().toList())!,
        ),
        _UnionKind.mixed => [],
      };

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
    _ => 'Unknown',
  };

  /// Lowercase first character of [suffix] to form a factory constructor name.
  String _factoryName(String suffix) {
    if (suffix.isEmpty) return suffix;
    return suffix[0].toLowerCase() + suffix.substring(1);
  }

  List<Spec> _buildScalarUnionSpecs(String name, List<DartCoreType> scalars) {
    final buf = StringBuffer();

    // (suffix, dartName, cls, factoryName) for each variant
    final variants = scalars
        .map(
          (s) => (
            suffix: _variantSuffix(s, name),
            dartName: s.dartName,
          ),
        )
        .toList();

    buf.writeln('@freezed');
    buf.writeln('sealed class $name with _\$$name {');
    buf.writeln('  const $name._();');
    buf.writeln();
    for (final v in variants) {
      final cls = '$name\$${v.suffix}';
      final fn = _safeIdentifier(_factoryName(v.suffix));
      buf.writeln(
        '  const factory $name.$fn({required ${v.dartName} value}) = $cls;',
      );
    }
    buf.writeln();
    buf.writeln('  static $name fromJson(Object? json) {');
    for (final v in variants.sublist(0, variants.length - 1)) {
      final fn = _safeIdentifier(_factoryName(v.suffix));
      buf.writeln(
        '    if (json is ${v.dartName}) return $name.$fn(value: json);',
      );
    }
    final last = variants.last;
    final lastFn = _safeIdentifier(_factoryName(last.suffix));
    buf.writeln(
      '    return $name.$lastFn(value: json as ${last.dartName});',
    );
    buf.writeln('  }');
    buf.writeln();
    buf.writeln('  Object toJson() => switch (this) {');
    for (final v in variants) {
      final cls = '$name\$${v.suffix}';
      buf.writeln('    $cls(:final value) => value,');
    }
    buf.writeln('  };');
    buf.writeln('}');
    buf.writeln();
    return [Code(buf.toString())];
  }

  List<Spec> _buildScalarStructUnionSpecs(
    String name,
    List<DartCoreType> scalars,
    ClassType struct,
  ) {
    final buf = StringBuffer();

    final structSuffix = _variantSuffix(struct, name);
    final structCls = '$name\$$structSuffix';
    final structFn = _safeIdentifier(_factoryName(structSuffix));

    final scalarVariants = scalars
        .map(
          (s) => (
            suffix: _variantSuffix(s, name),
            dartName: s.dartName,
          ),
        )
        .toList();

    buf.writeln('@freezed');
    buf.writeln('sealed class $name with _\$$name {');
    buf.writeln('  const $name._();');
    buf.writeln();
    buf.writeln(
      '  const factory $name.$structFn({required ${struct.ref.name} value}) = $structCls;',
    );
    for (final v in scalarVariants) {
      final cls = '$name\$${v.suffix}';
      final fn = _safeIdentifier(_factoryName(v.suffix));
      buf.writeln(
        '  const factory $name.$fn({required ${v.dartName} value}) = $cls;',
      );
    }
    buf.writeln();
    buf.writeln('  static $name fromJson(Object? json) {');
    buf.writeln(
      '    if (json is Map<String, Object?>) return $name.$structFn(value: ${struct.ref.name}.fromJson(json));',
    );
    for (final v in scalarVariants.sublist(0, scalarVariants.length - 1)) {
      final fn = _safeIdentifier(_factoryName(v.suffix));
      buf.writeln(
        '    if (json is ${v.dartName}) return $name.$fn(value: json);',
      );
    }
    final last = scalarVariants.last;
    final lastFn = _safeIdentifier(_factoryName(last.suffix));
    buf.writeln(
      '    return $name.$lastFn(value: json as ${last.dartName});',
    );
    buf.writeln('  }');
    buf.writeln();
    buf.writeln('  Object toJson() => switch (this) {');
    buf.writeln('    $structCls(:final value) => value.toJson(),');
    for (final v in scalarVariants) {
      final cls = '$name\$${v.suffix}';
      buf.writeln('    $cls(:final value) => value,');
    }
    buf.writeln('  };');
    buf.writeln('}');
    buf.writeln();
    return [Code(buf.toString())];
  }

  List<Spec> _buildStructListUnionSpecs(
    String name,
    ClassType struct,
    ListType list,
  ) {
    final buf = StringBuffer();

    final structSuffix = _variantSuffix(struct, name);
    final structCls = '$name\$$structSuffix';
    final structFn = _safeIdentifier(_factoryName(structSuffix));
    final listCls = '$name\$List';
    const listFn = 'list';
    final elemType = _dartTypeName(list.element);
    final elemFromJson = _listElementCast(list.element);
    final elemToJson = _toJsonCallerFor(list.element, 'e');

    buf.writeln('@freezed');
    buf.writeln('sealed class $name with _\$$name {');
    buf.writeln('  const $name._();');
    buf.writeln();
    buf.writeln(
      '  const factory $name.$structFn({required ${struct.ref.name} value}) = $structCls;',
    );
    buf.writeln(
      '  const factory $name.$listFn({required List<$elemType> value}) = $listCls;',
    );
    buf.writeln();
    buf.writeln('  static $name fromJson(Object? json) {');
    buf.writeln('    if (json is List) {');
    buf.writeln(
      '      return $name.$listFn(value: (json as List<Object?>).map((e) => $elemFromJson).toList());',
    );
    buf.writeln('    }');
    buf.writeln(
      '    return $name.$structFn(value: ${struct.ref.name}.fromJson(json as Map<String, Object?>));',
    );
    buf.writeln('  }');
    buf.writeln();
    buf.writeln('  Object toJson() => switch (this) {');
    buf.writeln('    $structCls(:final value) => value.toJson(),');
    buf.writeln(
      '    $listCls(:final value) => value.map((e) => $elemToJson).toList(),',
    );
    buf.writeln('  };');
    buf.writeln('}');
    buf.writeln();
    return [Code(buf.toString())];
  }

  List<Spec> _buildStructStructUnionSpecs(
    String name,
    List<_UnionCheck> checks,
  ) {
    final buf = StringBuffer();

    // Unique variants in encounter order (checks may repeat the same variant
    // as the unconditional else branch).
    final seenSuffixes = <String>{};
    final variants =
        <({String suffix, String cls, String fn, String structName})>[];
    for (final check in checks) {
      final suffix = _variantSuffix(check.variant, name);
      if (seenSuffixes.add(suffix)) {
        variants.add((
          suffix: suffix,
          cls: '$name\$$suffix',
          fn: _safeIdentifier(_factoryName(suffix)),
          structName: check.variant.ref.name,
        ));
      }
    }

    buf.writeln('@freezed');
    buf.writeln('sealed class $name with _\$$name {');
    buf.writeln('  const $name._();');
    buf.writeln();
    for (final v in variants) {
      buf.writeln(
        '  const factory $name.${v.fn}({required ${v.structName} value}) = ${v.cls};',
      );
    }
    buf.writeln();
    buf.writeln('  static $name fromJson(Map<String, Object?> json) {');
    for (final check in checks.sublist(0, checks.length - 1)) {
      final suffix = _variantSuffix(check.variant, name);
      final fn = _safeIdentifier(_factoryName(suffix));
      final cond = check.literalValue != null
          ? "json['${check.fieldName}'] == '${check.literalValue}'"
          : "json.containsKey('${check.fieldName}')";
      buf.writeln(
        '    if ($cond) return $name.$fn(value: ${check.variant.ref.name}.fromJson(json));',
      );
    }
    final last = checks.last;
    final lastSuffix = _variantSuffix(last.variant, name);
    final lastFn = _safeIdentifier(_factoryName(lastSuffix));
    buf.writeln(
      '    return $name.$lastFn(value: ${last.variant.ref.name}.fromJson(json));',
    );
    buf.writeln('  }');
    buf.writeln();
    buf.writeln('  Object toJson() => switch (this) {');
    for (final v in variants) {
      buf.writeln('    ${v.cls}(:final value) => value.toJson(),');
    }
    buf.writeln('  };');
    buf.writeln('}');
    buf.writeln();
    return [Code(buf.toString())];
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
  };

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
