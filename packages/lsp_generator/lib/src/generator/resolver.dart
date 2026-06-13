import '../models/protocol.dart';
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import 'meta_visitor.dart';

/// Two-pass visitor that builds resolved IR from a [MetaProtocol].
///
/// Pass 1 — register pass: creates shell [ResolvedDecl] objects and
///   populates the registry with all named declarations.
/// Pass 2 — resolve pass: fills in all resolved type fields by resolving
///   every [MetaReference] against the registry.
final class ModelResolver {
  ModelResolver([Map<String, ResolvedDecl>? registry]) {
    if (registry != null) {
      _registry.addAll(registry);
    }
  }

  final Map<String, ResolvedDecl> _registry = {};
  final List<ResolvedClass> _classes = [];
  final List<ResolvedEnum> _enumerations = [];
  final List<ResolvedAlias> _aliases = [];

  Map<String, ResolvedDecl> get registry => Map.unmodifiable(_registry);
  List<ResolvedClass> get classes => List.unmodifiable(_classes);
  List<ResolvedEnum> get enumerations => List.unmodifiable(_enumerations);
  List<ResolvedAlias> get aliases => List.unmodifiable(_aliases);

  /// Runs both resolution passes over [protocol].
  /// After this call, inspect [registry], [classes], [enumerations], [aliases].
  void resolve(MetaProtocol protocol) {
    _RegisterPass(this).run(protocol);
    _ResolvePass(this).run(protocol);
  }

  // ---------------------------------------------------------------------------
  // Helpers used by both passes
  // ---------------------------------------------------------------------------

  /// Converts a [MetaReference] to a [ResolvedType].
  /// Must be called during pass 2 (registry is complete).
  ResolvedType resolveRef(
    MetaReference ref, {
    String parentName = '',
    String fieldName = '',
  }) => switch (ref) {
    TypeRef(:final name) => switch (_registry[name]) {
      final ResolvedClass c => ClassType(ref: c),
      final ResolvedEnum e => EnumType(ref: e),
      final ResolvedAlias a => AliasType(ref: a),
      _ => DartCoreType(dartName: name),
    },
    BaseRef(:final name) => DartCoreType(dartName: _baseRefToDart(name)),
    ArrayRef(:final element) => ListType(
      element: resolveRef(
        element,
        parentName: parentName,
        fieldName: fieldName,
      ),
    ),
    MapRef(:final key, :final value) => MapType(
      key: resolveRef(key, parentName: parentName, fieldName: fieldName),
      value: resolveRef(value, parentName: parentName, fieldName: fieldName),
    ),
    OrRef() => _resolveOr(ref, parentName: parentName, fieldName: fieldName),
    AndRef(:final items) => UnionType(
      items: items
          .map(
            (i) => resolveRef(i, parentName: parentName, fieldName: fieldName),
          )
          .toList(growable: false),
    ),
    TupleRef(:final items) => TupleType(
      items: items
          .map(
            (i) => resolveRef(i, parentName: parentName, fieldName: fieldName),
          )
          .toList(growable: false),
    ),
    LiteralRef() => _resolveLiteral(
      ref,
      parentName: parentName,
      fieldName: fieldName,
    ),
    StringLiteralRef(:final value) => StringLiteralType(value: value),
  };

  // ---------------------------------------------------------------------------
  // Private resolution helpers
  // ---------------------------------------------------------------------------

  ResolvedType _resolveOr(
    OrRef ref, {
    required String parentName,
    required String fieldName,
  }) {
    final items = ref.items;

    // Detect OrRef([T, null]) → NullableType(T)
    final nullItems = items.where(_isNull).toList(growable: false);
    final nonNullItems = items
        .where((i) => !_isNull(i))
        .toList(growable: false);

    if (nullItems.length == 1 && nonNullItems.length == 1) {
      return NullableType(
        inner: resolveRef(
          nonNullItems.first,
          parentName: parentName,
          fieldName: fieldName,
        ),
      );
    }

    // Multiple non-null types → UnionType
    return UnionType(
      items: items
          .map(
            (item) => resolveRef(
              item,
              parentName: parentName,
              fieldName: fieldName,
            ),
          )
          .toList(growable: false),
    );
  }

  /// Returns an [InlineRecord] directly from a [LiteralRef] — no named class
  /// is created.  json_serializable generates `_$recordConvert` for record
  /// fields automatically.
  ResolvedType _resolveLiteral(
    LiteralRef ref, {
    required String parentName,
    required String fieldName,
  }) {
    final fields = ref.value.properties
        .map(
          (prop) => ResolvedProperty(
            name: prop.name,
            type: resolveRef(
              prop.type,
              parentName: parentName,
              fieldName: prop.name,
            ),
            optional: prop.optional,
            documentation: prop.documentation,
            since: prop.since,
            deprecated: prop.deprecated,
          ),
        )
        .toList(growable: false);

    return InlineRecord(fields: fields);
  }

  static bool _isNull(MetaReference ref) =>
      ref is BaseRef && ref.name == 'null';

  static String _baseRefToDart(String name) => switch (name) {
    'string' => 'String',
    'integer' || 'uinteger' => 'int',
    'decimal' => 'double',
    'boolean' => 'bool',
    'null' => 'Null',
    'URI' || 'DocumentUri' => 'String',
    'RegExp' => 'String',
    'LSPAny' => 'Object?',
    'LSPObject' => 'Map<String, Object?>',
    'LSPArray' => 'List<Object?>',
    _ => name, // fallback: keep as-is
  };
}

// ---------------------------------------------------------------------------
// Pass 1 — register shell declarations
// ---------------------------------------------------------------------------

final class _RegisterPass extends MetaVisitor {
  _RegisterPass(this._r);
  final ModelResolver _r;

  @override
  void visitStructure(MetaStructure structure) {
    final cls = ResolvedClass(
      name: structure.name,
      properties: [],
      extends$: [],
      mixins$: [],
      documentation: structure.documentation,
      since: structure.since,
      proposed: structure.proposed,
    );

    _r._registry[structure.name] = cls;
    _r._classes.add(cls);
    // Do NOT walk children in pass 1
  }

  @override
  void visitEnumeration(MetaEnumeration enumeration) {
    final valueType = enumeration.type is BaseRef
        ? ModelResolver._baseRefToDart((enumeration.type as BaseRef).name)
        : 'String';

    final members = enumeration.values
        .map(
          (m) => ResolvedEnumMember(
            name: m.name,
            value: switch (m.value) {
              EnumRawValueString(:final raw) => raw,
              EnumRawValueInteger(:final raw) => raw,
            },
            documentation: m.documentation,
            since: m.since,
            deprecated: m.deprecated,
          ),
        )
        .toList(growable: false);

    final en = ResolvedEnum(
      name: enumeration.name,
      members: members,
      valueType: valueType,
      supportsCustomValues: enumeration.supportsCustomValues ?? false,
      documentation: enumeration.documentation,
      since: enumeration.since,
      proposed: enumeration.proposed,
    );

    _r._registry[enumeration.name] = en;
    _r._enumerations.add(en);
  }

  @override
  void visitTypeAlias(MetaTypeAlias typeAlias) {
    // Shell with placeholder type; resolved in pass 2
    final alias = ResolvedAlias(
      name: typeAlias.name,
      type: const DartCoreType(dartName: 'Object?'),
      documentation: typeAlias.documentation,
      since: typeAlias.since,
      deprecated: typeAlias.deprecated,
      proposed: typeAlias.proposed,
    );

    _r._registry[typeAlias.name] = alias;
    _r._aliases.add(alias);
  }

  // Skip requests/notifications — they don't produce named declarations
  @override
  void visitRequest(MetaRequest request) {}

  @override
  void visitNotification(MetaNotification notification) {}
}

// ---------------------------------------------------------------------------
// Pass 2 — resolve all MetaReference → ResolvedType
// ---------------------------------------------------------------------------

final class _ResolvePass extends MetaVisitor {
  _ResolvePass(this._r);
  final ModelResolver _r;

  @override
  void visitStructure(MetaStructure structure) {
    final cls = _r._registry[structure.name];
    if (cls is! ResolvedClass) {
      return;
    }

    for (final prop in structure.properties) {
      cls.properties.add(
        .new(
          name: prop.name,
          type: _r.resolveRef(
            prop.type,
            parentName: structure.name,
            fieldName: prop.name,
          ),
          optional: prop.optional,
          documentation: prop.documentation,
          since: prop.since,
          deprecated: prop.deprecated,
        ),
      );
    }

    for (final ref in structure.extends$) {
      cls.extends$.add(
        _r.resolveRef(ref, parentName: structure.name),
      );
    }

    for (final ref in structure.mixins$) {
      cls.mixins$.add(
        _r.resolveRef(ref, parentName: structure.name),
      );
    }
  }

  @override
  void visitTypeAlias(MetaTypeAlias typeAlias) {
    final alias = _r._registry[typeAlias.name];
    if (alias is! ResolvedAlias) {
      return;
    }
    // Mutate in-place so every AliasType(ref=alias) reference in structures
    // automatically sees the resolved type — regardless of visit order.
    alias.type = _r.resolveRef(
      typeAlias.type,
      parentName: typeAlias.name,
    );
  }

  // Enumerations: all member data captured in pass 1 — nothing to resolve.
  @override
  void visitEnumeration(MetaEnumeration enumeration) {}

  @override
  void visitRequest(MetaRequest request) {}

  @override
  void visitNotification(MetaNotification notification) {}
}
