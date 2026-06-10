import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../resolver/resolved_state.dart';

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/// Generates the typed LSP server API from a fully resolved [ResolvedState].
///
/// Produces a single [Library] containing:
/// - One handler class per namespace for clientToServer requests/notifications.
/// - One sender class per namespace for serverToClient requests/notifications.
/// - A `ServerToClientProxy` aggregating all sender classes.
///
/// Usage:
/// ```dart
/// final lib = ServerApiVisitor(resolvedState).buildServerApi();
/// ```
final class ServerApiVisitor {
  ServerApiVisitor(this._resolved) {
    _requestMethods = _dartNames(
      _resolved.requests,
      (r) => r.method,
    );
    _notificationMethods = _dartNames(
      _resolved.notifications,
      (n) => n.method,
    );
  }

  final ResolvedState _resolved;

  /// wire method → `RequestMethod` enum member name.
  late final Map<String, String> _requestMethods;

  /// wire method → `NotificationMethod` enum member name.
  late final Map<String, String> _notificationMethods;

  static const _header = 'GENERATED — do not edit.';

  // -------------------------------------------------------------------------
  // Build
  // -------------------------------------------------------------------------

  Library buildServerApi() {
    final groups = _groupByNamespace();

    final specs = <Spec>[
      ...groups.handlerGroups.entries.map(
        (e) => _buildHandlerClass(e.key, e.value),
      ),
      ...groups.senderGroups.entries.map(
        (e) => _buildSenderClass(e.key, e.value),
      ),
      _buildProxy(groups.senderGroups.keys),
    ];

    return Library(
      (b) => b
        ..comments.add(_header)
        ..directives.addAll([
          Directive.import('dart:async'),
          Directive.import(
            'package:pro_lsp/pro_lsp.dart',
          ),
        ])
        ..body.addAll(specs),
    );
  }

  // -------------------------------------------------------------------------
  // Namespace grouping
  // -------------------------------------------------------------------------

  _Grouped _groupByNamespace() {
    // namespace → list of entries for handler classes (clientToServer)
    final handlerGroups = <String, List<_MethodEntry>>{};
    // namespace → list of entries for sender classes (serverToClient)
    final senderGroups = <String, List<_MethodEntry>>{};

    void addTo(
      Map<String, List<_MethodEntry>> map,
      String method,
      MetaReference? params,
      MetaReference? result, {
      required bool isNotification,
    }) {
      final (ns, dartName) = _namespacedMethod(method);
      map
          .putIfAbsent(ns, () => [])
          .add(
            _MethodEntry(
              wireMethod: method,
              dartName: dartName,
              params: params,
              result: result,
              isNotification: isNotification,
            ),
          );
    }

    for (final req in _resolved.requests) {
      final dir = req.messageDirection;
      if (dir == .clientToServer || dir == .both) {
        addTo(
          handlerGroups,
          req.method,
          req.params,
          req.result,
          isNotification: false,
        );
      }
      if (dir == .serverToClient || dir == .both) {
        addTo(
          senderGroups,
          req.method,
          req.params,
          req.result,
          isNotification: false,
        );
      }
    }

    for (final notif in _resolved.notifications) {
      final dir = notif.messageDirection;
      if (dir == .clientToServer || dir == .both) {
        addTo(
          handlerGroups,
          notif.method,
          notif.params,
          null,
          isNotification: true,
        );
      }
      if (dir == .serverToClient || dir == .both) {
        addTo(
          senderGroups,
          notif.method,
          notif.params,
          null,
          isNotification: true,
        );
      }
    }

    return _Grouped(handlerGroups: handlerGroups, senderGroups: senderGroups);
  }

  // -------------------------------------------------------------------------
  // Handler class
  // -------------------------------------------------------------------------

  Class _buildHandlerClass(String namespace, List<_MethodEntry> entries) {
    final className = _handlerClassName(namespace);
    return Class(
      (b) => b
        ..name = className
        ..docs.add(
          '/// Registers incoming LSP handlers for the '
          '`$namespace` namespace.',
        )
        ..constructors.add(
          Constructor(
            (b) => b
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..toThis = true
                    ..name = '_connection',
                ),
              ),
          ),
        )
        ..fields.add(
          Field(
            (b) => b
              ..name = '_connection'
              ..modifier = FieldModifier.final$
              ..type = refer('LspConnection'),
          ),
        )
        ..methods.addAll(entries.map(_buildHandlerMethod)),
    );
  }

  Method _buildHandlerMethod(_MethodEntry entry) {
    final paramsType = _paramsTypeName(entry.params);
    final resultType = _resultTypeName(entry.result);

    // Build the handler function type reference string.
    final handlerType = _handlerFunctionType(
      paramsType: paramsType,
      resultType: resultType,
      isNotification: entry.isNotification,
    );

    final body = entry.isNotification
        ? _notificationHandlerBody(entry.wireMethod, paramsType)
        : _requestHandlerBody(entry.wireMethod, paramsType, resultType);

    return Method(
      (b) => b
        ..name =
            '${entry.isNotification ? 'on' : 'on'}${_capitalize(
              entry.dartName,
            )}'
        ..returns = refer('void')
        ..docs.add('/// Registers handler for `${entry.wireMethod}`.')
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..name = 'handler'
              ..type = refer(handlerType),
          ),
        )
        ..body = body,
    );
  }

  Code _requestHandlerBody(
    String wireMethod,
    String paramsType,
    String resultType,
  ) {
    final hasParams = paramsType.isNotEmpty;
    final isVoidResult = resultType == 'void';

    final statements = <Code>[
      if (hasParams) _fromJsonAssign(paramsType, 'p', 'json'),
    ];
    final handlerExpr = hasParams
        ? refer('handler').call([refer('p')]).awaited
        : refer('handler').call([]).awaited;

    if (isVoidResult) {
      statements
        ..add(handlerExpr.statement)
        ..add(literalNull.returned.statement);
    } else {
      statements.addAll(_returnStatements(resultType, handlerExpr));
    }

    final closure = Method(
      (b) => b
        ..modifier = MethodModifier.async
        ..requiredParameters.add(Parameter((b) => b..name = 'json'))
        ..body = Block.of(statements),
    ).closure;

    return refer('_connection').property('registerRequestHandler').call([
      _methodRef('RequestMethod', wireMethod),
      closure,
    ]).statement;
  }

  Code _notificationHandlerBody(String wireMethod, String paramsType) {
    final hasParams = paramsType.isNotEmpty;

    final statements = <Code>[
      if (hasParams) _fromJsonAssign(paramsType, 'p', 'json'),
    ];
    final handlerExpr = hasParams
        ? refer('handler').call([refer('p')]).awaited
        : refer('handler').call([]).awaited;
    statements.add(handlerExpr.statement);

    final closure = Method(
      (b) => b
        ..modifier = MethodModifier.async
        ..requiredParameters.add(Parameter((b) => b..name = 'json'))
        ..body = Block.of(statements),
    ).closure;

    return refer('_connection').property('registerNotificationHandler').call([
      _methodRef('NotificationMethod', wireMethod),
      closure,
    ]).statement;
  }

  // -------------------------------------------------------------------------
  // Sender class
  // -------------------------------------------------------------------------

  Class _buildSenderClass(String namespace, List<_MethodEntry> entries) {
    final className = _senderClassName(namespace);
    return Class(
      (b) => b
        ..name = className
        ..docs.add(
          '/// Sends LSP messages to the client for the '
          '`$namespace` namespace.',
        )
        ..constructors.add(
          Constructor(
            (b) => b
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..toThis = true
                    ..name = '_connection',
                ),
              ),
          ),
        )
        ..fields.add(
          Field(
            (b) => b
              ..name = '_connection'
              ..modifier = FieldModifier.final$
              ..type = refer('LspConnection'),
          ),
        )
        ..methods.addAll(entries.map(_buildSenderMethod)),
    );
  }

  Method _buildSenderMethod(_MethodEntry entry) {
    final paramsType = _paramsTypeName(entry.params);
    final resultType = entry.isNotification
        ? 'void'
        : _resultTypeName(entry.result);
    final isVoidResult = resultType == 'void';
    final hasParams = paramsType.isNotEmpty;

    if (entry.isNotification) {
      return _buildNotificationSenderMethod(
        entry.dartName,
        entry.wireMethod,
        paramsType,
        hasParams,
      );
    }
    return _buildRequestSenderMethod(
      entry.dartName,
      entry.wireMethod,
      paramsType,
      resultType,
      hasParams,
      isVoidResult,
    );
  }

  Method _buildNotificationSenderMethod(
    String dartName,
    String wireMethod,
    String paramsType,
    bool hasParams,
  ) {
    // Object?/Object (LSPAny) params are already raw JSON — pass through directly.
    final paramsExpr = (paramsType == 'Object?' || paramsType == 'Object')
        ? refer('params')
        : refer('params').property('toJson').call([]);
    final sendCall = hasParams
        ? refer('_connection').property('sendNotification').call([
            _methodRef('NotificationMethod', wireMethod),
            paramsExpr,
          ])
        : refer('_connection').property('sendNotification').call([
            _methodRef('NotificationMethod', wireMethod),
          ]);

    return Method(
      (b) => b
        ..name = dartName
        ..returns = refer('void')
        ..docs.add('/// Sends the `$wireMethod` notification to the client.')
        ..requiredParameters.addAll([
          if (hasParams)
            Parameter(
              (b) => b
                ..name = 'params'
                ..type = refer(paramsType),
            ),
        ])
        ..lambda = true
        ..body = sendCall.code,
    );
  }

  Method _buildRequestSenderMethod(
    String dartName,
    String wireMethod,
    String paramsType,
    String resultType,
    bool hasParams,
    bool isVoidResult,
  ) {
    final returnRef = isVoidResult
        ? refer('Future<void>')
        : TypeReference(
            (b) => b
              ..symbol = 'Future'
              ..types.add(refer(resultType)),
          );

    final sendCallExpr = hasParams
        ? refer('_connection').property('sendRequest').call([
            _methodRef('RequestMethod', wireMethod),
            refer('params').property('toJson').call([]),
          ])
        : refer(
            '_connection',
          ).property('sendRequest').call([
            _methodRef('RequestMethod', wireMethod),
          ]);

    final bodyStatements = <Code>[
      if (isVoidResult)
        sendCallExpr.awaited.statement
      else ...[
        declareFinal('raw').assign(sendCallExpr.awaited).statement,
        ..._senderDecodeStatements(resultType),
      ],
    ];

    return Method(
      (b) => b
        ..name = dartName
        ..modifier = MethodModifier.async
        ..returns = returnRef
        ..docs.add('/// Sends the `$wireMethod` request to the client.')
        ..requiredParameters.addAll([
          if (hasParams)
            Parameter(
              (b) => b
                ..name = 'params'
                ..type = refer(paramsType),
            ),
        ])
        ..body = Block.of(bodyStatements),
    );
  }

  // -------------------------------------------------------------------------
  // ServerToClientProxy
  // -------------------------------------------------------------------------

  Class _buildProxy(Iterable<String> senderNamespaces) {
    final namespaces = senderNamespaces.toList();
    return Class(
      (b) => b
        ..name = 'ServerToClientProxy'
        ..docs.add(
          '/// Aggregates all outgoing sender classes.\n'
          '///\n'
          '/// Access via [LspServer.client]:\n'
          '/// ```dart\n'
          '/// server.client.window.logMessage(LogMessageParams(...));\n'
          '/// ```',
        )
        ..constructors.add(
          Constructor(
            (b) => b
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..toThis = true
                    ..name = '_connection',
                ),
              ),
          ),
        )
        ..fields.add(
          Field(
            (b) => b
              ..name = '_connection'
              ..modifier = .final$
              ..type = refer('LspConnection'),
          ),
        )
        ..fields.addAll(
          namespaces.map(
            (ns) => Field(
              (b) => b
                ..name = ns == r'$'
                    ? 'protocol'
                    : ns == 'general'
                    ? 'general'
                    : ns
                ..late = true
                ..modifier = .final$
                ..assignment = Code(
                  '${_senderClassName(ns)}(_connection)',
                ),
            ),
          ),
        ),
    );
  }

  // -------------------------------------------------------------------------
  // Type name helpers
  // -------------------------------------------------------------------------

  /// Returns the Dart handler function type string.
  /// e.g. `Future<Hover?> Function(HoverParams params)`
  String _handlerFunctionType({
    required String paramsType,
    required String resultType,
    required bool isNotification,
  }) {
    final returnType = isNotification ? 'Future<void>' : 'Future<$resultType>';
    final param = paramsType.isNotEmpty ? '$paramsType params' : '';
    return '$returnType Function($param)';
  }

  /// Returns code_builder [Code] statements that serialize [handlerExpr]
  /// (the awaited handler call, e.g. `await handler(p)`) and return it from
  /// the registerRequestHandler closure.
  List<Code> _returnStatements(String resultType, Expression handlerExpr) {
    final isNullable = resultType.endsWith('?');
    final baseType = isNullable
        ? resultType.substring(0, resultType.length - 1)
        : resultType;

    // Object?/Object — return the handler result directly.
    if (resultType == 'Object?' || resultType == 'Object') {
      return [handlerExpr.returned.statement];
    }

    if (baseType.startsWith('List<')) {
      // final r = await handler(p);
      // return r.map((e) => e.toJson()).toList();  (or r?.map(...).toList())
      final innerType = baseType.substring(5, baseType.length - 1);
      final isRawObject = innerType == 'Object' || innerType == 'Object?';
      final mapClosure = Method(
        (b) => b
          ..lambda = true
          ..requiredParameters.add(Parameter((b) => b..name = 'e'))
          ..body =
              (isRawObject
                      ? refer(
                          'e',
                        ).asA(refer('dynamic')).property('toJson').call([])
                      : refer('e').property('toJson').call([]))
                  .code,
      ).closure;
      final listExpr = isNullable
          ? refer('r')
                .nullSafeProperty('map')
                .call([mapClosure])
                .property('toList')
                .call([])
          : refer(
              'r',
            ).property('map').call([mapClosure]).property('toList').call([]);
      return [
        declareFinal('r').assign(handlerExpr).statement,
        listExpr.returned.statement,
      ];
    }

    // Named type: return r.toJson() / r?.toJson()
    final toJson = isNullable
        ? refer('r').nullSafeProperty('toJson').call([])
        : refer('r').property('toJson').call([]);
    return [
      declareFinal('r').assign(handlerExpr).statement,
      toJson.returned.statement,
    ];
  }

  /// Returns code_builder [Code] statements that decode the `raw` local
  /// variable (type [Object?] from `LspConnection.sendRequest`) into
  /// [resultType].
  List<Code> _senderDecodeStatements(String resultType) {
    final isNullable = resultType.endsWith('?');
    final baseType = isNullable
        ? resultType.substring(0, resultType.length - 1)
        : resultType;

    if (resultType == 'Object?' || resultType == 'Object') {
      return [refer('raw').returned.statement];
    }
    if (resultType == 'Null' || resultType == 'void') {
      return [];
    }
    if (baseType.startsWith('List<')) {
      final innerType = baseType.substring(5, baseType.length - 1);
      if (innerType == 'Object' || innerType == 'Object?') {
        // LSPAny list — values are already raw JSON, no deserialization needed.
        return [
          refer('raw')
              .asA(refer('List'))
              .property('cast')
              .call([], {}, [refer('Object')])
              .property('toList')
              .call([])
              .returned
              .statement,
        ];
      }
      // (raw as List).cast<Map<String, Object?>>().map(T.fromJson).toList()
      return [
        refer('raw')
            .asA(refer('List'))
            .property('cast')
            .call([], {}, [_jsonMapRef()])
            .property('map')
            .call([refer(innerType).property('fromJson')])
            .property('toList')
            .call([])
            .returned
            .statement,
      ];
    }
    if (isNullable) {
      // raw == null ? null : T.fromJson(raw as Map<String, Object?>)
      return [
        refer('raw')
            .equalTo(literalNull)
            .conditional(
              literalNull,
              refer(baseType).newInstanceNamed(
                'fromJson',
                [refer('raw').asA(_jsonMapRef())],
              ),
            )
            .returned
            .statement,
      ];
    }
    return [
      refer(baseType)
          .newInstanceNamed('fromJson', [refer('raw').asA(_jsonMapRef())])
          .returned
          .statement,
    ];
  }

  // -------------------------------------------------------------------------
  // MetaReference → Dart type name
  // -------------------------------------------------------------------------

  /// Returns the Dart type name for a params [MetaReference].
  /// Empty string means no params.
  String _paramsTypeName(MetaReference? params) {
    if (params == null) {
      return '';
    }

    return switch (params) {
      TypeRef(:final name) => name == 'LSPAny' ? 'Object?' : name,
      BaseRef(name: 'null') => '',
      _ => 'Object?',
    };
  }

  /// Returns the Dart type name for a result [MetaReference].
  String _resultTypeName(MetaReference? result) {
    if (result == null) {
      return 'void';
    }

    return switch (result) {
      BaseRef(name: 'null') => 'void',
      TypeRef(:final name) => name == 'LSPAny' ? 'Object?' : name,
      ArrayRef(:final element) => 'List<${_innerTypeName(element)}>',
      OrRef(:final items) => _orTypeName(items),
      _ => 'Object?',
    };
  }

  String _innerTypeName(MetaReference ref) => switch (ref) {
    TypeRef(:final name) => name == 'LSPAny' ? 'Object?' : name,
    BaseRef(:final name) => _baseDartName(name),
    ArrayRef(:final element) => 'List<${_innerTypeName(element)}>',
    OrRef(:final items) => _orTypeName(items),
    _ => 'Object?',
  };

  String _orTypeName(List<MetaReference> items) {
    final hasNull = items.any((i) => i is BaseRef && i.name == 'null');
    final nonNull = items
        .where((i) => !(i is BaseRef && i.name == 'null'))
        .toList();
    if (nonNull.isEmpty) {
      return 'void';
    }

    if (nonNull.length == 1) {
      final t = _innerTypeName(nonNull.first);
      if (!hasNull) {
        return t;
      }
      // Avoid double-nullable: Object? from LSPAny should not become Object??
      return t.endsWith('?') ? t : '$t?';
    }
    return hasNull ? 'Object?' : 'Object';
  }

  static String _baseDartName(String name) => switch (name) {
    'null' => 'Null',
    'string' => 'String',
    'integer' => 'int',
    'uinteger' => 'int',
    'decimal' => 'double',
    'boolean' => 'bool',
    'DocumentUri' => 'String',
    'URI' => 'String',
    _ => 'Object?',
  };

  // -------------------------------------------------------------------------
  // Naming helpers
  // -------------------------------------------------------------------------

  /// Extracts (namespace, dartMethodName) from a wire method string.
  ///
  /// - `textDocument/hover`              → (`textDocument`, `hover`)
  /// - `textDocument/semanticTokens/full`→ (`textDocument`, `semanticTokensFull`)
  /// - `initialize`                      → (`general`, `initialize`)
  /// - `$/cancelRequest`                 → (`general`, `cancelRequest`)
  static (String, String) _namespacedMethod(String method) {
    final clean = method.startsWith(r'$/')
        ? method.substring(2)
        : method.startsWith(r'$')
        ? method.substring(1)
        : method;

    final slashIdx = clean.indexOf('/');
    if (slashIdx == -1) {
      return ('general', _safeIdentifier(clean));
    }

    final ns = clean.substring(0, slashIdx);
    final rest = clean.substring(slashIdx + 1);
    final parts = rest.split('/');
    final camel = [
      parts.first,
      ...parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)),
    ].join();

    return (ns, _safeIdentifier(camel));
  }

  static String _handlerClassName(String namespace) =>
      '${_capitalize(namespace == 'general' ? 'general' : namespace)}Handlers';

  static String _senderClassName(String namespace) =>
      '${_capitalize(namespace == r'$'
          ? 'general'
          : namespace == 'general'
          ? 'general'
          : namespace)}Sender';

  static String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  // -------------------------------------------------------------------------
  // code_builder helpers
  // -------------------------------------------------------------------------

  /// Returns a [TypeReference] for `Map<String, Object?>`.
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

  /// Emits `final [varName] =
  /// [typeName].fromJson([sourceVar] as `Map<String, Object?>`);`
  static Code _fromJsonAssign(
    String typeName,
    String varName,
    String sourceVar,
  ) => declareFinal(varName)
      .assign(
        refer(typeName).newInstanceNamed(
          'fromJson',
          [refer(sourceVar).asA(_jsonMapRef())],
        ),
      )
      .statement;

  /// Returns `EnumType.memberName.value` for [wireMethod].
  /// Falls back to a raw string if the method is not in the enum map
  /// (should not happen for a well-formed meta-model).
  Expression _methodRef(String enumType, String wireMethod) {
    final map = enumType == 'RequestMethod'
        ? _requestMethods
        : _notificationMethods;
    final member = map[wireMethod];
    if (member != null) {
      return refer(enumType).property(member).property('value');
    }
    // Fallback — preserves correctness even if meta-model adds new methods.
    return literalString(wireMethod, raw: wireMethod.contains(r'$'));
  }

  /// Maps each item in [items] to a unique Dart enum member name derived from
  /// its LSP method string (e.g. `textDocument/didOpen` → `didOpen`).
  ///
  /// Uses the last path segment when it is unique; falls back to full
  /// camelCase on collisions. Mirrors `EmitterVisitor._dartNames`.
  static Map<String, String> _dartNames<T>(
    List<T> items,
    String Function(T) getMethod,
  ) {
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

    final methods = {for (final x in items) x: getMethod(x)};
    final lastSegs = {for (final e in methods.entries) e.key: lastSeg(e.value)};
    final counts = <String, int>{};
    for (final s in lastSegs.values) {
      counts[s] = (counts[s] ?? 0) + 1;
    }
    return {
      for (final e in methods.entries)
        e.value: _safeIdentifier(
          counts[lastSegs[e.key]!]! > 1 ? camelCase(e.value) : lastSegs[e.key]!,
        ),
    };
  }

  static String _safeIdentifier(String name) {
    const reserved = {
      'class',
      'enum',
      'null',
      'void',
      'async',
      'await',
      'yield',
      'abstract',
      'interface',
      'operator',
      'static',
      'macro',
      'value',
    };

    return reserved.contains(name) ? '${name}_' : name;
  }
}

// ---------------------------------------------------------------------------
// Private data types
// ---------------------------------------------------------------------------

final class _MethodEntry {
  const _MethodEntry({
    required this.wireMethod,
    required this.dartName,
    required this.params,
    required this.result,
    required this.isNotification,
  });

  final String wireMethod;
  final String dartName;
  final MetaReference? params;
  final MetaReference? result;
  final bool isNotification;
}

final class _Grouped {
  const _Grouped({
    required this.handlerGroups,
    required this.senderGroups,
  });

  /// namespace → handler entries (clientToServer)
  final Map<String, List<_MethodEntry>> handlerGroups;

  /// namespace → sender entries (serverToClient)
  final Map<String, List<_MethodEntry>> senderGroups;
}
