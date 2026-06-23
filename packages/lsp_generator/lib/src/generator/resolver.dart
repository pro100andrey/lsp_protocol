import 'dart:io';

import '../models/protocol.dart';
import '../models/resolved_decl.dart';
import '../models/resolved_type.dart';
import 'meta_visitor.dart';

typedef ResolveResult = ({
  Map<String, ResolvedDecl> registry,
  List<ResolvedClass> classes,
  List<ResolvedEnum> enumerations,
  List<ResolvedAlias> aliases,
  List<ResolvedNotification> notifications,
  List<ResolvedRequest> requests,
});

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
  final List<ResolvedNotification> _notifications = [];
  final List<ResolvedRequest> _requests = [];

  /// Runs both resolution passes over [protocol].
  ResolveResult resolve(MetaProtocol protocol) {
    _RegisterPass(this).run(protocol);
    _ResolvePass(this).run(protocol);

    return (
      registry: Map.unmodifiable(_registry),
      classes: List.unmodifiable(_classes),
      enumerations: List.unmodifiable(_enumerations),
      aliases: List.unmodifiable(_aliases),
      notifications: List.unmodifiable(_notifications),
      requests: List.unmodifiable(_requests),
    );
  }

  // Helpers used by both passes

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
    BaseRef(:final name) => switch (name) {
      'LSPObject' => const MapType(
        key: DartCoreType(dartName: 'String'),
        value: DartCoreType(dartName: 'Object?'),
      ),
      'LSPArray' => const ListType(
        element: DartCoreType(dartName: 'Object?'),
      ),
      _ => DartCoreType(dartName: _baseRefToDart(name)),
    },
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

  // Private resolution helpers

  /// Resolves an [OrRef] to either a [NullableType] (for T | null) or a
  /// [UnionType] (for multiple non-null types).
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

  /// Returns true if [ref] represents a `null` type.
  static bool _isNull(MetaReference ref) => switch (ref) {
    BaseRef(name: 'null') => true,
    _ => false,
  };

  /// Maps LSP base type names to their Dart equivalents.
  ///
  /// The LSP base-type set is closed and stable. An unrecognized name means
  /// the spec introduced a new base type the generator doesn't model yet —
  /// warn loudly (it may emit an invalid Dart type) but stay lenient by
  /// passing the name through unchanged.
  static String _baseRefToDart(String name) => switch (name) {
    'string' => 'String',
    'integer' || 'uinteger' => 'int',
    'decimal' => 'double',
    'boolean' => 'bool',
    'null' => 'Null',
    'URI' || 'DocumentUri' => 'String',
    'RegExp' => 'String',
    'LSPAny' => 'Object?',
    _ => () {
      stderr.writeln(
        'warning: unknown LSP base type "$name"; emitting it verbatim as a '
        'Dart type. The generator may need a new mapping in _baseRefToDart.',
      );
      return name;
    }(),
  };
}

// Pass 1 — register shell declarations

/// First resolution pass: creates shell [ResolvedDecl] objects and populates
/// the registry with all named declarations (classes, enums, aliases).
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
    final valueType = switch (enumeration.type) {
      BaseRef(:final name) => ModelResolver._baseRefToDart(name),
      _ => 'String',
    };

    final members = enumeration.values
        .map(
          (m) => ResolvedEnumMember(
            name: m.name,
            value: switch (m.value) {
              EnumRawValueString(:final raw) => raw,
              EnumRawValueInteger(:final raw) => int.parse(raw),
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

// Pass 2 — resolve all MetaReference → ResolvedType

/// Second resolution pass: fills in all resolved type fields by resolving
/// every [MetaReference] against the registry populated in pass 1.
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
        _r.resolveRef(ref, parentName: structure.name) as ClassType,
      );
    }

    for (final ref in structure.mixins$) {
      cls.mixins$.add(
        _r.resolveRef(ref, parentName: structure.name) as ClassType,
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

  ResolvedType? _resolveOptionalRef(
    MetaReference? ref,
    String parentName,
    String fieldName,
  ) => ref != null
      ? _r.resolveRef(ref, parentName: parentName, fieldName: fieldName)
      : null;

  @override
  void visitRequest(MetaRequest request) {
    _r._requests.add(
      ResolvedRequest(
        method: request.method,
        messageDirection: request.messageDirection,
        params: _resolveOptionalRef(request.params, request.method, 'params'),
        result: _resolveOptionalRef(request.result, request.method, 'result'),
        documentation: request.documentation,
        partialResult: _resolveOptionalRef(
          request.partialResult,
          request.method,
          'partialResult',
        ),
        registrationOptions: _resolveOptionalRef(
          request.registrationOptions,
          request.method,
          'registrationOptions',
        ),
        since: request.since,
        proposed: request.proposed ?? false,
        registrationMethod: request.registrationMethod,
        errorData: _resolveOptionalRef(
          request.errorData,
          request.method,
          'errorData',
        ),
      ),
    );
  }

  @override
  void visitNotification(MetaNotification notification) {
    _r._notifications.add(
      ResolvedNotification(
        method: notification.method,
        messageDirection: notification.messageDirection,
        params: _resolveOptionalRef(
          notification.params,
          notification.method,
          'params',
        ),
        documentation: notification.documentation,
        registrationOptions: _resolveOptionalRef(
          notification.registrationOptions,
          notification.method,
          'registrationOptions',
        ),
        since: notification.since,
        registrationMethod: notification.registrationMethod,
      ),
    );
  }
}
