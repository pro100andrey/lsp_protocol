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
/// For the _last_ check in a list: [fieldName] is empty and no condition is
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

  /// All class names (including anonymous) — used to filter conflicting aliases.
  late final Set<String> _classNames = _resolved.classes
      .map((c) => c.name)
      .toSet();

  /// Names of aliases emitted as sealed union classes (all union files combined).
  late final Set<String> _sealedUnionNames = _computeSealedUnionNames();

  /// Subset of [_sealedUnionNames]: purely scalar unions (only [DartCoreType]
  /// items). Emitted to [_scalarUnionsFile]; no import of structures needed.
  late final Set<String> _scalarUnionNames = _computeScalarUnionNames();

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
        ..directives.addAll(_crossImports(allTypes, _structuresFile))
        ..body.addAll([
          ...anonymous.map(_buildClass),
          ...named.map(_buildClass),
        ]),
    );
  }

  /// Builds a [Library] containing all resolved enumerations.
  Library buildEnumerations() => Library(
    (b) => b
      ..comments.add(_header)
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
        ..body.addAll(specs),
    );
  }

  /// Builds a [Library] containing typed sealed union classes for all
  /// non-scalar sealed union aliases (struct-based: struct+list, struct+struct).
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
        ..directives.addAll(_crossImports(referencedTypes, _unionsFile))
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
          // Sealed union aliases live in their own files, not type_aliases.dart.
          if (_scalarUnionNames.contains(ref.name)) {
            if (currentFile != _scalarUnionsFile) needsScalarUnions = true;
          } else if (_sealedUnionNames.contains(ref.name)) {
            if (currentFile != _unionsFile) needsUnions = true;
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
    // LSP extends/mixins are structural (not Dart inheritance) — flatten all
    // inherited properties into the class so it stands alone.
    final allProps = _allProperties(cls);
    return Class((b) {
      b
        ..name = cls.name
        ..modifier = ClassModifier.final$;

      if (cls.documentation != null) {
        b.docs.add('/// ${cls.documentation!.replaceAll('\n', '\n/// ')}');
      }

      // Fields (own + inherited from extends/mixins)
      for (final prop in allProps) {
        b.fields.add(_buildField(prop));
      }

      // Constructor
      b.constructors.add(_buildConstructor(allProps));

      // copyWith
      if (allProps.isNotEmpty) {
        b.methods.add(_buildCopyWith(cls.name, allProps));
      }

      // fromJson
      b.constructors.add(_buildFromJson(cls.name, allProps));

      // toJson
      b.methods.add(_buildToJson(allProps));
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

  Field _buildField(ResolvedProperty prop) {
    final type = prop.optional
        ? toTypeRef(prop.type).rebuild((b) => b.isNullable = true)
        : toTypeRef(prop.type);
    return Field(
      (b) => b
        ..name = prop.name
        ..type = type
        ..modifier = FieldModifier.final$,
    );
  }

  Constructor _buildConstructor(List<ResolvedProperty> props) => Constructor(
    (b) => b
      ..constant = true
      ..optionalParameters.addAll(
        props.map(
          (p) => Parameter(
            (b) => b
              ..name = p.name
              ..toThis = true
              ..named = true
              ..required = !p.optional,
          ),
        ),
      ),
  );

  Method _buildCopyWith(String className, List<ResolvedProperty> props) {
    final params = <Parameter>[];
    final args = <String, Expression>{};

    for (final prop in props) {
      final baseRef = toTypeRef(prop.type);
      // copyWith param is always nullable so callers can omit it.
      final paramType = baseRef.rebuild((b) => b.isNullable = true);

      params.add(
        Parameter(
          (b) => b
            ..name = prop.name
            ..type = paramType
            ..named = true,
        ),
      );

      args[prop.name] = CodeExpression(
        Code('${prop.name} ?? this.${prop.name}'),
      );
    }

    return Method(
      (b) => b
        ..name = 'copyWith'
        ..returns = refer(className)
        ..optionalParameters.addAll(params)
        ..body = refer(className).call([], args).code,
    );
  }

  Constructor _buildFromJson(String className, List<ResolvedProperty> props) {
    final args = <String, Expression>{};
    for (final prop in props) {
      args[prop.name] = CodeExpression(
        Code(_fromJsonCode(prop.name, prop.type, prop.optional)),
      );
    }

    return Constructor(
      (b) => b
        ..name = 'fromJson'
        ..factory = true
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..name = 'json'
              ..type = TypeReference(
                (b) => b
                  ..symbol = 'Map'
                  ..types.addAll([refer('String'), refer('Object?')]),
              ),
          ),
        )
        ..body = refer(className).call([], args).code,
    );
  }

  /// Returns a Dart expression string that reads and casts `json['name']`
  /// to the appropriate Dart type.
  String _fromJsonCode(
    String name,
    ResolvedType type,
    bool optional,
  ) => switch (type) {
    NullableType(:final inner) => _fromJsonCode(name, inner, true),
    ClassType(:final ref) when optional =>
      "json['$name'] == null ? null : ${ref.name}.fromJson(json['$name'] as Map<String, Object?>)",
    ClassType(:final ref) =>
      "${ref.name}.fromJson(json['$name'] as Map<String, Object?>)",
    MapType(value: final value) when optional =>
      "(json['$name'] as Map<String, Object?>?)?.map((k, v) => MapEntry(k, ${_mapValueCast(value)}))",
    MapType(value: final value) =>
      "(json['$name'] as Map<String, Object?>).map((k, v) => MapEntry(k, ${_mapValueCast(value)}))",
    ListType(:final element) when optional =>
      "(json['$name'] as List<Object?>?)?.map((e) => ${_listElementCast(element)}).toList()",
    ListType(:final element) =>
      "(json['$name'] as List<Object?>).map((e) => ${_listElementCast(element)}).toList()",
    EnumType(:final ref) when !ref.supportsCustomValues && optional =>
      "json['$name'] == null ? null : ${ref.name}.values.firstWhere((e) => e.value == json['$name'] as ${ref.valueType})",
    EnumType(:final ref) when !ref.supportsCustomValues =>
      "${ref.name}.values.firstWhere((e) => e.value == json['$name'] as ${ref.valueType})",
    EnumType(:final ref) when optional =>
      "json['$name'] == null ? null : ${ref.name}(json['$name'] as ${ref.valueType})",
    EnumType(:final ref) => "${ref.name}(json['$name'] as ${ref.valueType})",
    // Scalar sealed union (e.g. ProgressToken = int | string) — call static
    // fromJson which accepts Object?.
    AliasType(:final ref)
        when _scalarUnionNames.contains(ref.name) && optional =>
      "json['$name'] == null ? null : ${ref.name}.fromJson(json['$name'])",
    AliasType(:final ref) when _scalarUnionNames.contains(ref.name) =>
      "${ref.name}.fromJson(json['$name'])",
    // Struct-based sealed union — fromJson expects Map<String, Object?>.
    AliasType(:final ref)
        when _sealedUnionNames.contains(ref.name) && optional =>
      "json['$name'] == null ? null : ${ref.name}.fromJson(json['$name'] as Map<String, Object?>)",
    AliasType(:final ref) when _sealedUnionNames.contains(ref.name) =>
      "${ref.name}.fromJson(json['$name'] as Map<String, Object?>)",
    // UnionType resolves to Object — 'as Object?' is an unnecessary cast.
    UnionType() when optional => "json['$name']",
    UnionType() => "json['$name'] as Object",
    // DartCoreType('Object?') is already Object? — no cast needed.
    DartCoreType(:final dartName) when dartName == 'Object?' => "json['$name']",
    // AliasType that resolves to an Object-like type — 'as AliasName?' expands
    // to 'as Object?' which Dart flags as an unnecessary cast.
    AliasType(:final ref) when optional && _isEffectivelyObject(ref.type) =>
      "json['$name']",
    _ =>
      optional
          ? "json['$name'] as ${_dartTypeName(type)}?"
          : "json['$name'] as ${_dartTypeName(type)}",
  };

  /// Returns `true` when [type] ultimately resolves to `Object` or `Object?`,
  /// meaning a cast from a JSON map value (already `Object?`) would be
  /// flagged as [unnecessary_cast] by the Dart analyser.
  static bool _isEffectivelyObject(ResolvedType type) => switch (type) {
    UnionType() => true,
    DartCoreType(:final dartName) =>
      dartName == 'Object' || dartName == 'Object?',
    AliasType(:final ref) => _isEffectivelyObject(ref.type),
    NullableType(:final inner) => _isEffectivelyObject(inner),
    _ => false,
  };

  /// Returns the Dart type name string for a resolved type, used in string
  /// interpolation contexts (e.g. inside `Code('...')` bodies).
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

  String _mapValueCast(ResolvedType value) => switch (value) {
    ClassType(:final ref) => '${ref.name}.fromJson(v as Map<String, Object?>)',
    NullableType(inner: ClassType(:final ref)) =>
      'v == null ? null : ${ref.name}.fromJson(v as Map<String, Object?>)',
    _ => 'v as ${_dartTypeName(value)}',
  };

  Method _buildToJson(List<ResolvedProperty> props) {
    final entries = <Object?, Object?>{};
    for (final prop in props) {
      entries[literalString(prop.name)] = _toJsonExpr(prop);
    }

    return Method(
      (b) => b
        ..name = 'toJson'
        ..returns = TypeReference(
          (b) => b
            ..symbol = 'Map'
            ..types.addAll([refer('String'), refer('Object?')]),
        )
        ..body = literalMap(
          entries,
          refer('String'),
          refer('Object?'),
        ).returned.statement,
    );
  }

  Expression _toJsonExpr(ResolvedProperty prop) => switch (prop.type) {
    NullableType(inner: ClassType()) => CodeExpression(
      Code('${prop.name}?.toJson()'),
    ),
    ClassType() when prop.optional => CodeExpression(
      Code('${prop.name}?.toJson()'),
    ),
    ClassType() => CodeExpression(Code('${prop.name}.toJson()')),
    NullableType(inner: ListType(element: ClassType())) => CodeExpression(
      Code('${prop.name}?.map((e) => e.toJson()).toList()'),
    ),
    ListType(element: ClassType()) when prop.optional => CodeExpression(
      Code('${prop.name}?.map((e) => e.toJson()).toList()'),
    ),
    ListType(element: ClassType()) => CodeExpression(
      Code('${prop.name}.map((e) => e.toJson()).toList()'),
    ),
    NullableType(inner: EnumType()) => CodeExpression(
      Code('${prop.name}?.value'),
    ),
    EnumType() when prop.optional => CodeExpression(
      Code('${prop.name}?.value'),
    ),
    EnumType() => CodeExpression(Code('${prop.name}.value')),
    NullableType(inner: AliasType(:final ref))
        when _sealedUnionNames.contains(ref.name) =>
      CodeExpression(Code('${prop.name}?.toJson()')),
    AliasType(:final ref)
        when _sealedUnionNames.contains(ref.name) && prop.optional =>
      CodeExpression(Code('${prop.name}?.toJson()')),
    AliasType(:final ref) when _sealedUnionNames.contains(ref.name) =>
      CodeExpression(Code('${prop.name}.toJson()')),
    _ => CodeExpression(Code(prop.name)),
  };

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

  List<Spec> _buildScalarUnionSpecs(String name, List<DartCoreType> scalars) {
    final buf = StringBuffer();
    buf.writeln('sealed class $name {');
    buf.writeln('  static $name fromJson(Object? json) {');
    for (final s in scalars.sublist(0, scalars.length - 1)) {
      final vn = '$name\$${_variantSuffix(s, name)}';
      buf.writeln('    if (json is ${s.dartName}) return $vn(json);');
    }
    final last = scalars.last;
    buf.writeln(
      '    return $name\$${_variantSuffix(last, name)}(json as ${last.dartName});',
    );
    buf.writeln('  }');
    buf.writeln('  Object toJson();');
    buf.writeln('}');
    buf.writeln();
    for (final s in scalars) {
      final vn = '$name\$${_variantSuffix(s, name)}';
      buf.writeln('final class $vn extends $name {');
      buf.writeln('  $vn(this.value);');
      buf.writeln('  final ${s.dartName} value;');
      buf.writeln('  @override');
      buf.writeln('  ${s.dartName} toJson() => value;');
      buf.writeln('}');
      buf.writeln();
    }
    return [Code(buf.toString())];
  }

  List<Spec> _buildScalarStructUnionSpecs(
    String name,
    List<DartCoreType> scalars,
    ClassType struct,
  ) {
    final buf = StringBuffer();
    final sv = '$name\$${_variantSuffix(struct, name)}';
    buf.writeln('sealed class $name {');
    buf.writeln('  static $name fromJson(Object? json) {');
    buf.writeln(
      '    if (json is Map<String, Object?>) return $sv(${struct.ref.name}.fromJson(json));',
    );
    for (final s in scalars.sublist(0, scalars.length - 1)) {
      final vn = '$name\$${_variantSuffix(s, name)}';
      buf.writeln('    if (json is ${s.dartName}) return $vn(json);');
    }
    final last = scalars.last;
    buf.writeln(
      '    return $name\$${_variantSuffix(last, name)}(json as ${last.dartName});',
    );
    buf.writeln('  }');
    buf.writeln('  Object toJson();');
    buf.writeln('}');
    buf.writeln();
    buf.writeln('final class $sv extends $name {');
    buf.writeln('  $sv(this.value);');
    buf.writeln('  final ${struct.ref.name} value;');
    buf.writeln('  @override');
    buf.writeln('  Map<String, Object?> toJson() => value.toJson();');
    buf.writeln('}');
    buf.writeln();
    for (final s in scalars) {
      final vn = '$name\$${_variantSuffix(s, name)}';
      buf.writeln('final class $vn extends $name {');
      buf.writeln('  $vn(this.value);');
      buf.writeln('  final ${s.dartName} value;');
      buf.writeln('  @override');
      buf.writeln('  ${s.dartName} toJson() => value;');
      buf.writeln('}');
      buf.writeln();
    }
    return [Code(buf.toString())];
  }

  List<Spec> _buildStructListUnionSpecs(
    String name,
    ClassType struct,
    ListType list,
  ) {
    final buf = StringBuffer();
    final sv = '$name\$${_variantSuffix(struct, name)}';
    final lv = '$name\$List';
    final elemType = _dartTypeName(list.element);
    final elemFromJson = _listElementCast(list.element);
    final elemToJson = _toJsonCallerFor(list.element, 'e');

    buf.writeln('sealed class $name {');
    buf.writeln('  static $name fromJson(Object? json) {');
    buf.writeln('    if (json is List) {');
    buf.writeln(
      '      return $lv((json as List<Object?>).map((e) => $elemFromJson).toList());',
    );
    buf.writeln('    }');
    buf.writeln(
      '    return $sv(${struct.ref.name}.fromJson(json as Map<String, Object?>));',
    );
    buf.writeln('  }');
    buf.writeln('  Object toJson();');
    buf.writeln('}');
    buf.writeln();
    buf.writeln('final class $sv extends $name {');
    buf.writeln('  $sv(this.value);');
    buf.writeln('  final ${struct.ref.name} value;');
    buf.writeln('  @override');
    buf.writeln('  Map<String, Object?> toJson() => value.toJson();');
    buf.writeln('}');
    buf.writeln();
    buf.writeln('final class $lv extends $name {');
    buf.writeln('  $lv(this.value);');
    buf.writeln('  final List<$elemType> value;');
    buf.writeln('  @override');
    buf.writeln(
      '  List<Object?> toJson() => value.map((e) => $elemToJson).toList();',
    );
    buf.writeln('}');
    buf.writeln();
    return [Code(buf.toString())];
  }

  List<Spec> _buildStructStructUnionSpecs(
    String name,
    List<_UnionCheck> checks,
  ) {
    final buf = StringBuffer();
    buf.writeln('sealed class $name {');
    buf.writeln('  static $name fromJson(Map<String, Object?> json) {');
    for (final check in checks.sublist(0, checks.length - 1)) {
      final vn = '$name\$${_variantSuffix(check.variant, name)}';
      final cond = check.literalValue != null
          ? "json['${check.fieldName}'] == '${check.literalValue}'"
          : "json.containsKey('${check.fieldName}')";
      buf.writeln(
        '    if ($cond) return $vn(${check.variant.ref.name}.fromJson(json));',
      );
    }
    final last = checks.last;
    final lvn = '$name\$${_variantSuffix(last.variant, name)}';
    buf.writeln('    return $lvn(${last.variant.ref.name}.fromJson(json));');
    buf.writeln('  }');
    buf.writeln('  Object toJson();');
    buf.writeln('}');
    buf.writeln();
    final seen = <String>{};
    for (final check in checks) {
      final vn = '$name\$${_variantSuffix(check.variant, name)}';
      if (!seen.add(vn)) continue;
      buf.writeln('final class $vn extends $name {');
      buf.writeln('  $vn(this.value);');
      buf.writeln('  final ${check.variant.ref.name} value;');
      buf.writeln('  @override');
      buf.writeln('  Map<String, Object?> toJson() => value.toJson();');
      buf.writeln('}');
      buf.writeln();
    }
    return [Code(buf.toString())];
  }

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
