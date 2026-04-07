import '../redux/models/protocol.dart';
import '../redux/models/resolved_decl.dart';
import '../redux/models/resolved_type.dart';
import 'meta_visitor.dart';

/// Two-pass visitor that builds resolved IR from a [MetaProtocol].
///
/// Pass 1 — register pass: creates shell [ResolvedDecl] objects and
///   populates the registry with all named declarations.
/// Pass 2 — resolve pass: fills in all resolved type fields by resolving
///   every [MetaReference] against the registry.
final class ResolverVisitor {
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
  }) {
    switch (ref) {
      case TypeRef():
        final decl = _registry[ref.name];
        if (decl == null) {
          return DartCoreType(ref.name);
        }
        return switch (decl) {
          ResolvedClass() => ClassType(decl),
          ResolvedEnum() => EnumType(decl),
          ResolvedAlias() => AliasType(decl),
        };

      case BaseRef():
        return DartCoreType(_baseRefToDart(ref.name));

      case ArrayRef():
        return ListType(
          resolveRef(ref.element, parentName: parentName, fieldName: fieldName),
        );

      case MapRef():
        return MapType(
          resolveRef(ref.key, parentName: parentName, fieldName: fieldName),
          resolveRef(ref.value, parentName: parentName, fieldName: fieldName),
        );

      case OrRef():
        return _resolveOr(ref, parentName: parentName, fieldName: fieldName);

      case AndRef():
        return UnionType(
          ref.items
              .map(
                (item) => resolveRef(
                  item,
                  parentName: parentName,
                  fieldName: fieldName,
                ),
              )
              .toList(),
        );

      case TupleRef():
        return TupleType(
          ref.items
              .map(
                (item) => resolveRef(
                  item,
                  parentName: parentName,
                  fieldName: fieldName,
                ),
              )
              .toList(),
        );

      case LiteralRef():
        return _resolveLiteral(
          ref,
          parentName: parentName,
          fieldName: fieldName,
        );

      case StringLiteralRef():
        return StringLiteralType(ref.value);
    }
  }

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
    final nullItems = items.where(_isNull).toList();
    final nonNullItems = items.where((i) => !_isNull(i)).toList();

    if (nullItems.length == 1 && nonNullItems.length == 1) {
      return NullableType(
        resolveRef(
          nonNullItems.first,
          parentName: parentName,
          fieldName: fieldName,
        ),
      );
    }

    // Multiple non-null types → UnionType
    return UnionType(
      items
          .map(
            (item) => resolveRef(
              item,
              parentName: parentName,
              fieldName: fieldName,
            ),
          )
          .toList(),
    );
  }

  /// Extracts an inline [LiteralRef] as a named [ResolvedClass].
  ResolvedType _resolveLiteral(
    LiteralRef ref, {
    required String parentName,
    required String fieldName,
  }) {
    final syntheticName = _syntheticName(parentName, fieldName);

    // Re-use if already extracted (same position visited twice)
    final existing = _registry[syntheticName];
    if (existing is ResolvedClass) {
      return ClassType(existing);
    }

    final cls = ResolvedClass(
      name: syntheticName,
      properties: [],
      extends$: [],
      mixins$: [],
      isAnonymous: true,
    );
    _registry[syntheticName] = cls;
    _classes.add(cls);

    for (final prop in ref.value.properties) {
      cls.properties.add(
        ResolvedProperty(
          name: prop.name,
          type: resolveRef(
            prop.type,
            parentName: syntheticName,
            fieldName: prop.name,
          ),
          optional: prop.optional,
          documentation: prop.documentation,
          since: prop.since,
          deprecated: prop.deprecated,
        ),
      );
    }

    return ClassType(cls);
  }

  static bool _isNull(MetaReference ref) =>
      ref is BaseRef && ref.name == 'null';

  static String _baseRefToDart(String name) => switch (name) {
    'string' => 'String',
    'integer' || 'uinteger' => 'int',
    'decimal' => 'double',
    'boolean' => 'bool',
    'null' => 'Null',
    'URI' || 'DocumentUri' => 'Uri',
    'RegExp' => 'String',
    'LSPAny' => 'Object?',
    'LSPObject' => 'Map<String, Object?>',
    'LSPArray' => 'List<Object?>',
    _ => name, // fallback: keep as-is
  };

  /// Generates a PascalCase synthetic class name for an inline literal.
  /// e.g. parent=`WorkspaceEdit`, field=`changeAnnotations`
  ///   → `WorkspaceEditChangeAnnotations`
  static String _syntheticName(String parent, String field) {
    if (parent.isEmpty && field.isEmpty) {
      return 'Anonymous';
    }
    final capitalizedField = field.isEmpty
        ? ''
        : field[0].toUpperCase() + field.substring(1);
    return '$parent$capitalizedField';
  }
}

// ---------------------------------------------------------------------------
// Pass 1 — register shell declarations
// ---------------------------------------------------------------------------

final class _RegisterPass extends MetaVisitor {
  _RegisterPass(this._r);
  final ResolverVisitor _r;

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
        ? ResolverVisitor._baseRefToDart(
            (enumeration.type as BaseRef).name,
          )
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
          ),
        )
        .toList();

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
      type: const DartCoreType('Object?'),
      documentation: typeAlias.documentation,
      since: typeAlias.since,
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
  final ResolverVisitor _r;

  @override
  void visitStructure(MetaStructure structure) {
    final cls = _r._registry[structure.name];
    if (cls is! ResolvedClass) {
      return;
    }

    for (final prop in structure.properties) {
      cls.properties.add(
        ResolvedProperty(
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
    // ResolvedAlias is const so we replace it in the registry
    final resolved = ResolvedAlias(
      name: typeAlias.name,
      type: _r.resolveRef(
        typeAlias.type,
        parentName: typeAlias.name,
      ),
      documentation: typeAlias.documentation,
      since: typeAlias.since,
      proposed: typeAlias.proposed,
    );
    _r._registry[typeAlias.name] = resolved;
    final idx = _r._aliases.indexOf(alias);
    if (idx >= 0) {
      _r._aliases[idx] = resolved;
    }
  }

  // Enumerations: all member data captured in pass 1 — nothing to resolve.
  @override
  void visitEnumeration(MetaEnumeration enumeration) {}

  @override
  void visitRequest(MetaRequest request) {}

  @override
  void visitNotification(MetaNotification notification) {}
}
