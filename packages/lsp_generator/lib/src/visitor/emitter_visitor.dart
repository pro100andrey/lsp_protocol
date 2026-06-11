import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import '../models/protocol.dart' show MessageDirection, MetaNotification;
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import '../resolver/resolved_state.dart';
import 'emitter_helpers.dart';
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

enum _ClassCategory { capabilities, params, common }

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

  /// Inline anonymous unions collected from all class properties.
  late final Map<String, UnionType> _inlineUnions = _computeInlineUnions();

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Builds a [Library] containing all resolved classes (anonymous first).
  _ClassCategory _classifyClass(ResolvedClass cls) => switch (cls.name) {
        final s when s.contains('Capabilities') => _ClassCategory.capabilities,
        final s when s.endsWith('Params') || s.endsWith('Options') =>
          _ClassCategory.params,
        _ => _ClassCategory.common,
      };

  Iterable<ResolvedClass> _classesForCategory(_ClassCategory category) {
    final filtered = _resolved.classes.where((c) {
      if (c.name.startsWith('_') && !c.isAnonymous) {
        // Skip non-anonymous LSP base classes.
        return false;
      }
      return _classifyClass(c) == category;
    });
    if (category == .common) {
      // Keep anonymous classes before named classes for backward compatibility/ordering.
      return [
        ...filtered.where((c) => c.isAnonymous),
        ...filtered.where((c) => !c.isAnonymous),
      ];
    }
    return filtered;
  }

  /// Builds a [Library] containing all resolved classes (anonymous first).
  Library buildStructures() {
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
        ..directives.add(Directive.part('structures.capabilities.dart'))
        ..directives.add(Directive.part('structures.params.dart'))
        ..directives.add(Directive.part('structures.common.dart')),
    );
  }

  Library buildStructuresCapabilities() => Library(
    (b) => b
      ..comments.addAll([
        _header,
      ])
      ..directives.add(
        Directive.partOf('structures.dart'),
      )
      ..body.addAll(
        _classesForCategory(_ClassCategory.capabilities).map(_buildClass),
      ),
  );

  Library buildStructuresParams() => Library(
    (b) => b
      ..comments.addAll([
        _header,
      ])
      ..directives.add(
        Directive.partOf('structures.dart'),
      )
      ..body.addAll(
        _classesForCategory(_ClassCategory.params).map(_buildClass),
      ),
  );

  Library buildStructuresCommon() => Library(
    (b) => b
      ..comments.addAll([
        _header,
      ])
      ..directives.add(
        Directive.partOf('structures.dart'),
      )
      ..body.addAll(
        _classesForCategory(_ClassCategory.common).map(_buildClass),
      ),
  );

  /// Builds a [Library] containing all resolved enumerations.
  Library buildEnumerations() => Library(
    (b) => b
      ..comments.addAll([
        _header,
      ])
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
      specs.add(
        _buildExtensionTypeUnion(
          name,
          ut,
          deprecated: alias.deprecated,
          docs: _docLines(
            alias.documentation,
            since: alias.since,
            proposed: alias.proposed,
          ),
        ),
      );
    }

    // Add inline scalar unions
    for (final entry in _inlineUnions.entries) {
      final name = entry.key;
      final ut = entry.value;
      final kind = _classifyUnion(ut);
      if (kind == _UnionKind.scalar) {
        specs.add(
          _buildExtensionTypeUnion(
            name,
            ut,
            docs: _docLines('Inline union: $name.'),
          ),
        );
      }
    }

    // Scalar unions reference no structs — no cross-imports needed.
    return Library(
      (b) => b
        ..comments.add(_header)
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
      specs.add(
        _buildExtensionTypeUnion(
          name,
          ut,
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

    // Add inline non-scalar unions
    for (final entry in _inlineUnions.entries) {
      final name = entry.key;
      final ut = entry.value;
      final kind = _classifyUnion(ut);
      if (kind != _UnionKind.scalar) {
        specs.add(
          _buildExtensionTypeUnion(
            name,
            ut,
            docs: _docLines('Inline union: $name.'),
          ),
        );
        referencedTypes.addAll(ut.items);
      }
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
    final needed = <String>{};

    void walk(ResolvedType type) {
      switch (type) {
        case ClassType():
          needed.add(_structuresFile);
        case EnumType():
          needed.add(_enumerationsFile);
        case AliasType(:final ref) when _scalarUnionNames.contains(ref.name):
          needed.add(_scalarUnionsFile);
        case AliasType(:final ref) when _sealedUnionNames.contains(ref.name):
          needed.add(_unionsFile);
        case AliasType():
          needed.add(_aliasesFile);
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

    return Class((b) {
      b
        ..name = cls.name
        ..abstract = true
        ..annotations.add(tFreezed);

      b.mixins.add(refer('_\$${cls.name}'));

      b.docs.addAll(
        _docLines(cls.documentation, since: cls.since, proposed: cls.proposed),
      );

      // Redirecting factory — freezed generates getters, copyWith, ==,
      // hashCode.
      b.constructors.add(
        _buildRedirectingFactory(cls.name, allProps),
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
                      ..types.addAll([tString, tDynamic]),
                  ),
              ),
            )
            ..body = refer(
              '_\$${cls.name}FromJson',
            ).call([eJson]).code,
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
      b.annotations.add(tJsonSerializable.call([]));
      b.docs.addAll(
        _docLines(cls.documentation, since: cls.since, proposed: cls.proposed),
      );

      // Final fields (plain class — no freezed mixin).
      for (final p in allProps) {
        b.fields.add(
          Field((b) {
            b
              ..modifier = FieldModifier.final$
              ..name = p.name
              ..type = _propertyTypeRef(cls.name, p);
            if (p.deprecated != null) {
              b.annotations.add(
                tDeprecated.call([literalString(p.deprecated!)]),
              );
            }
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
              [
                ...allProps.where((p) => !p.optional),
                ...allProps.where((p) => p.optional),
              ].map(
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
                      ..types.addAll([tString, tDynamic]),
                  ),
              ),
            )
            ..body = refer('_\$${baseName}FromJson').call([eJson]).code,
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
                ..types.addAll([tString, tDynamic]),
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
  ) => Constructor(
    (b) => b
      ..constant = true
      ..factory = true
      // Prepend `_` to className: for `Foo` → `_Foo`; for `_Foo` → `__Foo`.
      ..redirect = refer('_$className')
      ..optionalParameters.addAll(
        [
          ...props.where((p) => !p.optional),
          ...props.where((p) => p.optional),
        ].map((p) {
          final typeRef = _propertyTypeRef(className, p);
          return Parameter((b) {
            b
              ..name = p.name
              ..type = typeRef
              ..named = true
              ..required = !p.optional;
            if (p.deprecated != null) {
              b.annotations.add(
                tDeprecated.call([literalString(p.deprecated!)]),
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
      tJsonEnum.call([], {
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
          ..type = tString,
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
                ..type = tString,
            ),
          )
          ..lambda = true
          ..body = refer(r'$enumDecodeNullable').call([
            refer(
              '_\$$enumName'
              'EnumMap',
            ),
            eJson,
          ]).code,
      ),
    );
  });

  // ---------------------------------------------------------------------------
  // Private: standard enums
  // ---------------------------------------------------------------------------

  /// Generates a standard Dart enum for closed enums, or a Dart
  /// `extension type` wrapping the underlying primitive value for open
  /// enums (`supportsCustomValues = true`).
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
                    ..type = tDynamic,
                ),
              )
              ..body = refer(en.name).call([
                CodeExpression(Code('json as $valueTypeName')),
              ]).code,
          ),
        );

        // toJson method
        b.methods.add(
          Method(
            (b) => b
              ..name = 'toJson'
              ..returns = refer(valueTypeName)
              ..lambda = true
              ..body = eValue.code,
          ),
        );
      });
    }

    return Enum((b) {
      b.name = en.name;
      b.annotations.add(
        tJsonEnum.call([], {
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
                tDeprecated.call([literalString(member.deprecated!)]),
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
              eJson,
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
          tDeprecated.call([literalString(alias.deprecated!)]),
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

      result.add(alias.name);
    }
    return result;
  }

  _UnionKind _classifyUnion(UnionType u) {
    final scalars = u.items
        .where((t) => t is DartCoreType || t is TupleType)
        .toList(growable: false);
    final structs = u.items
        .where((t) => t is ClassType || t is InlineRecord)
        .toList(growable: false);
    final lists = u.items.whereType<ListType>().toList(growable: false);
    final others = u.items.where(
      (t) =>
          t is! DartCoreType &&
          t is! TupleType &&
          t is! ClassType &&
          t is! InlineRecord &&
          t is! ListType,
    );

    if (others.isNotEmpty) {
      return _UnionKind.mixed;
    }

    if (structs.isEmpty && lists.isEmpty) {
      return _UnionKind.scalar;
    }

    if (lists.isEmpty && scalars.isNotEmpty && structs.isNotEmpty) {
      final uniqueStructs = structs.map(_singleStructKey).toSet();
      return uniqueStructs.length == 1
          ? _UnionKind.scalarStruct
          : _UnionKind.mixed;
    }

    if (scalars.isEmpty && lists.isNotEmpty && structs.isNotEmpty) {
      return _UnionKind.structList;
    }

    if (scalars.isEmpty && lists.isEmpty && structs.length >= 2) {
      final uniqueStructs = structs.map(_singleStructKey).toSet();
      return uniqueStructs.length >= 2
          ? _UnionKind.structStruct
          : _UnionKind.mixed;
    }

    return _UnionKind.mixed;
  }
  String _singleStructKey(ResolvedType t) => switch (t) {
        ClassType(:final ref) => ref.name,
        InlineRecord(:final fields) =>
          'Record(${fields.map((f) => f.name).join(',')})',
        _ => t.toString(),
      };

  /// Returns a list of discriminator checks (last entry = else branch) or
  /// `null` if no reliable discriminator can be found.
  ///
  /// Accepts items that are either [ClassType] or [InlineRecord].
  List<_UnionCheck>? _findStructDiscriminator(List<ResolvedType> variants) {
    // Deduplicate by struct key.
    final seen = <String>{};
    final unique = variants.where((t) {
      final key = _singleStructKey(t);
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
        ClassType(:final ref) => {
            for (final p in _allProperties(ref)) p.name: p,
          },
        InlineRecord(:final fields) => {for (final f in fields) f.name: f},
        _ => {},
      };

  // ---------------------------------------------------------------------------
  // Union spec builders (code_builder Class / Constructor / Method)
  // ---------------------------------------------------------------------------

  Spec _buildExtensionTypeUnion(
    String name,
    UnionType ut, {
    String? deprecated,
    List<String> docs = const [],
  }) => ExtensionType((b) {
    b
      ..name = name
      ..constant = true
      ..representationDeclaration = RepresentationDeclaration(
        (r) => r
          ..name = 'value'
          ..declaredRepresentationType = tObject,
      );

    b.docs.addAll(docs);
    if (deprecated != null) {
      b.annotations.add(tDeprecated.call([literalString(deprecated)]));
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
                ..type = tObject,
            ),
          )
          ..body = refer(name).call([eJson]).code,
      ),
    );

    // toJson method
    b.methods.add(
      Method(
        (b) => b
          ..name = 'toJson'
          ..returns = tObject
          ..lambda = true
          ..body = eValue.code,
      ),
    );

    // For each variant in the union, add getters
    final uniqueItems = <ResolvedType>[];
    final seenSuffixes = <String>{};
    for (final item in ut.items) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = _capitalize(suffix);
      if (seenSuffixes.add(capSuffix)) {
        uniqueItems.add(item);
      }
    }

    final structs = uniqueItems
        .where((t) => t is ClassType || t is InlineRecord)
        .toList();
    final structChecks = _findStructDiscriminator(structs);

    for (final item in uniqueItems) {
      final suffix = _variantSuffix(item, name);
      final capSuffix = _capitalize(suffix);

      // Get the Dart type reference for the variant
      final typeRef = toRef(item);

      final checkExpr = _variantCheckExpression(item, structChecks);
      final castExpr = _variantCastExpression(item, typeRef, capSuffix);

      b.methods.add(
        Method(
          (b) => b
            ..name = 'is$capSuffix'
            ..returns = tBool
            ..type = MethodType.getter
            ..lambda = true
            ..body = checkExpr.code,
        ),
      );

      final isNullType = typeRef is TypeReference && typeRef.symbol == 'Null';
      final nullableTypeRef = isNullType
          ? typeRef
          : (typeRef is TypeReference
              ? typeRef.rebuild((b) => b.isNullable = true)
              : (typeRef is RecordType
                  ? typeRef.rebuild((b) => b.isNullable = true)
                  : typeRef));

      b.methods.add(
        Method(
          (b) => b
            ..name = 'as$capSuffix'
            ..returns = nullableTypeRef
            ..type = MethodType.getter
            ..body = castExpr,
        ),
      );
    }
  });

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
    AliasType(:final ref) =>
      ref.name.startsWith(aliasName) && ref.name.length > aliasName.length
          ? ref.name.substring(aliasName.length)
          : ref.name,
    EnumType(:final ref) =>
      ref.name.startsWith(aliasName) && ref.name.length > aliasName.length
          ? ref.name.substring(aliasName.length)
          : ref.name,
    ListType() => 'List',
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

  Expression _variantCheckExpression(
    ResolvedType type, [
    List<_UnionCheck>? structChecks,
  ]) {
    final actual = type is NullableType ? type.inner : type;
    final val = eValue;

    return switch (actual) {
      DartCoreType(dartName: 'Object?') => literalTrue,
      DartCoreType(dartName: 'Null') =>
        val.asA(tObjectNullable).equalTo(literalNull),
      DartCoreType(:final dartName) => val.isA(refer(dartName)),
      ClassType(:final ref) => val.isA(refer(ref.name)).or(
            _buildStructCheck(
              actual,
              structChecks,
              val,
              val.isA(tMapStringDynamic),
            ),
          ),
      EnumType(:final ref) =>
        val.isA(refer(ref.name)).or(val.isA(refer(ref.valueType))),
      AliasType(:final ref) => _variantCheckExpression(
          _resolved.aliases.firstWhere((a) => a.name == ref.name).type,
          structChecks,
        ),
      UnionType(:final items) => items.skip(1).fold(
            _variantCheckExpression(items.first, structChecks),
            (cond, item) =>
                cond.or(_variantCheckExpression(item, structChecks)),
          ),
      ListType() => val.isA(tList),
      MapType() => val.isA(tMapStringDynamic),
      InlineRecord() => _buildStructCheck(
            actual,
            structChecks,
            val,
            val.isA(tMapStringDynamic),
          ),
      TupleType(:final items) => val.isA(tList).and(
            val.asA(tList).property('length').equalTo(
                  literalNum(items.length),
                ),
          ),
      StringLiteralType() => val.isA(tString),
      _ => val.isA(tObject),
    };
  }

  Expression _buildStructCheck(
    ResolvedType actual,
    List<_UnionCheck>? structChecks,
    Expression val,
    Expression fallback,
  ) {
    if (structChecks != null) {
      final key = _singleStructKey(actual);
      final check = structChecks.firstWhereOrNull(
        (c) => _singleStructKey(c.variant) == key,
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
            final hasKey = mapVal
                .property('containsKey')
                .call([literalString(check.fieldName)]);
            return isMap.and(hasKey);
          }
        } else {
          var cond = isMap;
          for (final other in structChecks) {
            if (other != check && other.fieldName.isNotEmpty) {
              final mapVal = val.asA(mapRef);
              final hasKey = mapVal
                  .property('containsKey')
                  .call([literalString(other.fieldName)]);
              cond = cond.and(hasKey.negate());
            }
          }
          return cond;
        }
      }
    }
    return _buildRequiredPropertiesCheck(actual, val);
  }

  Expression _buildRequiredPropertiesCheck(ResolvedType type, Expression val) {
    final actual = type is NullableType ? type.inner : type;
    final List<String> reqs;
    if (actual is ClassType) {
      final cls = _resolved.classes.firstWhereOrNull(
        (c) => c.name == actual.ref.name,
      );
      reqs = cls != null
          ? [
              for (final p in cls.properties)
                if (!p.optional) p.name
            ]
          : [];
    } else if (actual is InlineRecord) {
      reqs = [for (final f in actual.fields) if (!f.optional) f.name];
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

  Code _variantCastExpression(
    ResolvedType type,
    Reference typeRef,
    String capSuffix,
  ) {
    final actual = type is NullableType ? type.inner : type;
    final typeName = _dartTypeName(actual);
    final val = refer('value');

    switch (actual) {
      case DartCoreType():
        if (typeName == 'Null') {
          return literalNull.returned.statement;
        }
        final typeRef = refer(typeName);
        return val
            .isA(typeRef)
            .conditional(val.asA(typeRef), literalNull)
            .returned
            .statement;

      case ClassType(:final ref):
        final classRef = refer(ref.name);
        return Block.of([
          ifStatement(
            val.isA(classRef),
            Block.of([val.asA(classRef).returned.statement]),
          ),
          ifStatement(
            refer('is$capSuffix'),
            Block.of([
              classRef
                  .newInstanceNamed('fromJson', [
                    val.asA(refer('Map<String, dynamic>')),
                  ])
                  .returned
                  .statement,
            ]),
          ),
          literalNull.returned.statement,
        ]);

      case EnumType(:final ref):
        final enumRef = refer(ref.name);
        final valueType = refer(ref.valueType);
        return Block.of([
          ifStatement(
            val.isA(enumRef),
            Block.of([val.asA(enumRef).returned.statement]),
          ),
          ifStatement(
            refer('is$capSuffix'),
            Block.of([
              enumRef
                  .property('decode')
                  .call([
                    val.asA(valueType),
                  ])
                  .returned
                  .statement,
            ]),
          ),
          literalNull.returned.statement,
        ]);

      case AliasType(:final ref):
        final aliasRef = refer(ref.name);
        if (_sealedUnionNames.contains(ref.name) ||
            _scalarUnionNames.contains(ref.name)) {
          return Block.of([
            ifStatement(
              val.isA(aliasRef),
              Block.of([val.asA(aliasRef).returned.statement]),
            ),
            ifStatement(
              refer('is$capSuffix'),
              Block.of([
                aliasRef.newInstanceNamed('fromJson', [val]).returned.statement,
              ]),
            ),
            literalNull.returned.statement,
          ]);
        }
        return val
            .isA(aliasRef)
            .conditional(val.asA(aliasRef), literalNull)
            .returned
            .statement;

      case ListType(:final element):
        final elName = _dartTypeName(element);
        final elActual = element is NullableType ? element.inner : element;

        if (elActual is ClassType) {
          final elClassRef = refer(elActual.ref.name);
          final listClass = TypeReference(
            (b) => b
              ..symbol = 'List'
              ..types.add(elClassRef),
          );

          final mapExpr = val
              .asA(refer('List'))
              .property('map')
              .call([
                Method(
                  (m) => m
                    ..lambda = true
                    ..requiredParameters.add(Parameter((p) => p..name = 'e'))
                    ..body = refer('e')
                        .isA(elClassRef)
                        .conditional(
                          refer('e'),
                          elClassRef.newInstanceNamed('fromJson', [
                            refer('e').asA(refer('Map<String, dynamic>')),
                          ]),
                        )
                        .code,
                ).closure,
              ])
              .property('toList')
              .call([]);

          return Block.of([
            ifStatement(
              val.isA(listClass),
              Block.of([val.asA(listClass).returned.statement]),
            ),
            ifStatement(
              refer('is$capSuffix'),
              Block.of([mapExpr.returned.statement]),
            ),
            literalNull.returned.statement,
          ]);
        } else if (elActual is AliasType &&
            (_sealedUnionNames.contains(elActual.ref.name) ||
                _scalarUnionNames.contains(elActual.ref.name))) {
          final elAliasRef = refer(elActual.ref.name);
          final listAlias = TypeReference(
            (b) => b
              ..symbol = 'List'
              ..types.add(elAliasRef),
          );

          final mapExpr = val
              .asA(refer('List'))
              .property('map')
              .call([
                Method(
                  (m) => m
                    ..lambda = true
                    ..requiredParameters.add(Parameter((p) => p..name = 'e'))
                    ..body = refer('e')
                        .isA(elAliasRef)
                        .conditional(
                          refer('e'),
                          elAliasRef.newInstanceNamed('fromJson', [
                            refer('e').asA(refer('Object')),
                          ]),
                        )
                        .code,
                ).closure,
              ])
              .property('toList')
              .call([]);

          return Block.of([
            ifStatement(
              val.isA(listAlias),
              Block.of([val.asA(listAlias).returned.statement]),
            ),
            ifStatement(
              refer('is$capSuffix'),
              Block.of([mapExpr.returned.statement]),
            ),
            literalNull.returned.statement,
          ]);
        }

        final castList = val.asA(refer('List')).property('cast').call([], {}, [
          refer(elName),
        ]);
        return refer('is$capSuffix')
            .conditional(castList, literalNull)
            .returned
            .statement;

      case MapType():
        final mapType = refer('Map<String, dynamic>');
        return refer('is$capSuffix')
            .conditional(val.asA(mapType), literalNull)
            .returned
            .statement;

      case InlineRecord(:final fields):
        final buffer = StringBuffer();
        if (fields.isNotEmpty) {
          buffer.write('  final map = value as Map<String, dynamic>;\n');
        }
        buffer.write('  return (\n');
        for (final f in fields) {
          final fName = f.name;
          final fActual = f.type is NullableType
              ? (f.type as NullableType).inner
              : f.type;
          if (fActual is ClassType) {
            final fClass = fActual.ref.name;
            if (f.optional) {
              buffer.write(
                "    $fName: map['$fName'] != null ? "
                "(map['$fName'] is $fClass ? map['$fName'] as $fClass : "
                "$fClass.fromJson(map['$fName'] as Map<String, dynamic>)) "
                ': null,\n',
              );
            } else {
              buffer.write(
                "    $fName: map['$fName'] is $fClass ? "
                "map['$fName'] as $fClass : "
                "$fClass.fromJson(map['$fName'] as Map<String, dynamic>),\n",
              );
            }
          } else {
            final fTypeName = f.optional || f.type is NullableType
                ? '${_dartTypeName(fActual)}?'
                : _dartTypeName(fActual);
            buffer.write("    $fName: map['$fName'] as $fTypeName,\n");
          }
        }
        buffer.write('  );');

        return Block.of([
          ifStatement(
            refer('is$capSuffix'),
            Block(
              (b) => b.statements.add(Code(buffer.toString())),
            ),
          ),
          literalNull.returned.statement,
        ]);

      case TupleType(:final items):
        final buffer = StringBuffer();
        buffer.write('  final list = value as List;\n');
        buffer.write('  return (\n');
        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final typeName = _dartTypeName(item);
          buffer.write('    list[$i] as $typeName,\n');
        }
        buffer.write('  );');

        return Block.of([
          ifStatement(
            refer('is$capSuffix'),
            Block(
              (b) => b.statements.add(Code(buffer.toString())),
            ),
          ),
          literalNull.returned.statement,
        ]);

      default:
        final typeRef = refer(typeName);
        return refer('is$capSuffix')
            .conditional(val.asA(typeRef), literalNull)
            .returned
            .statement;
    }
  }

  static String _dartTypeName(ResolvedType type) => switch (type) {
    DartCoreType(:final dartName) => dartName,
    ClassType(:final ref) => ref.name,
    EnumType(:final ref) => ref.name,
    AliasType(:final ref) => ref.name,
    ListType(:final element) => 'List<${_dartTypeName(element)}>',
    MapType(:final key, :final value) =>
      'Map<${_dartTypeName(key)}, ${_dartTypeName(value)}>',
    NullableType(:final inner) => '${_dartTypeName(inner)}?',
    UnionType() => 'Object',
    TupleType(:final items) => '(${items.map(_dartTypeName).join(', ')})',
    StringLiteralType() => 'String',
    InlineRecord() => 'Object',
  };

  // ---------------------------------------------------------------------------
  // InlineRecord serialization helpers
  // ---------------------------------------------------------------------------

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
      return '<String, dynamic>{}';
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
        '${ref.name}.fromJson($jsonExpr as Map<String, dynamic>)',
      ),
      ListType(element: final el) => orNull(
        '($jsonExpr as List<dynamic>).map((e) => ${_jsonFieldExtract(
          el,
          'e',
        )}).toList()',
      ),
      InlineRecord(:final fields) => orNull(
        _inlineRecordFromJson(fields, '($jsonExpr as Map<String, dynamic>)'),
      ),
      EnumType(:final ref) when ref.supportsCustomValues => orNull(
        '${ref.name}.fromJson($jsonExpr)',
      ),
      EnumType(:final ref) => orNull(
        '${ref.name}.decode($jsonExpr as ${ref.valueType})!',
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
          return '`$target`';
        }
        // Single valid Dart identifier → use as reference.
        if (RegExp(r'^\w+$').hasMatch(rawDisplay)) {
          return '`$rawDisplay`';
        }
        // Multi-word / non-identifier → link to the type part only.
        return '`${target.split('.').first}`';
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

  /// If [type] is an inline [UnionType] (i.e. not a named alias), returns a
  /// one-line note listing the variant names, e.g.
  /// `['Type: TextDocumentSyncOptions | TextDocumentSyncKind']`.
  /// Returns an empty list for all other types.
  static List<String> _inlineUnionNote(ResolvedType type) {
    final inner = type is NullableType ? type.inner : type;
    if (inner case UnionType(:final items)) {
      return ['Type: ${items.map(_dartTypeName).join(' | ')}'];
    }
    return const [];
  }

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

  static String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  Reference _propertyTypeRef(String className, ResolvedProperty p) {
    final inlineUnionName = _getInlineUnionName(className, p.name, p.type);
    if (inlineUnionName != null) {
      final actualType = p.type is NullableType
          ? (p.type as NullableType).inner
          : p.type;
      final isNullable = p.optional || p.type is NullableType;
      if (actualType is ListType) {
        return TypeReference(
          (b) => b
            ..symbol = 'List'
            ..types.add(refer(inlineUnionName))
            ..isNullable = isNullable,
        );
      } else {
        return TypeReference(
          (b) => b
            ..symbol = inlineUnionName
            ..isNullable = isNullable,
        );
      }
    }
    return toRef(p.type, nullable: p.optional);
  }

  /// Returns the unique name of an inline union type for field [propName]
  /// of class [className], if it is indeed an inline union.
  String? _getInlineUnionName(
    String className,
    String propName,
    ResolvedType type,
  ) {
    final inner = type is NullableType ? type.inner : type;
    return switch (inner) {
      UnionType() => '$className${_capitalize(propName)}',
      ListType(:final element) => switch (
          element is NullableType ? element.inner : element) {
        UnionType() => '$className${_capitalize(propName)}Item',
        _ => null,
      },
      _ => null,
    };
  }

  /// Traverse all classes and collect all unique inline union types.
  Map<String, UnionType> _computeInlineUnions() {
    final result = <String, UnionType>{};
    for (final cls in _resolved.classes) {
      for (final prop in _allProperties(cls)) {
        final name = _getInlineUnionName(cls.name, prop.name, prop.type);
        if (name != null) {
          final inner = prop.type is NullableType
              ? (prop.type as NullableType).inner
              : prop.type;
          if (inner is UnionType) {
            result[name] = inner;
          } else if (inner is ListType) {
            final el = inner.element is NullableType
                ? (inner.element as NullableType).inner
                : inner.element;
            if (el is UnionType) {
              result[name] = el;
            }
          }
        }
      }
    }
    return result;
  }
}
