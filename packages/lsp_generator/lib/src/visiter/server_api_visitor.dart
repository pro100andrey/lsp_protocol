import 'package:code_builder/code_builder.dart';

import '../redux/models/protocol.dart';
import '../redux/resolved/resolved_state.dart';

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
  ServerApiVisitor(this._resolved);

  final ResolvedState _resolved;

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
            'package:lsp_specification/lsp_specification.dart',
          ),
          Directive.import('../connection/lsp_connection.dart'),
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
      if (dir == MessageDirection.clientToServer ||
          dir == MessageDirection.both) {
        addTo(
          handlerGroups,
          req.method,
          req.params,
          req.result,
          isNotification: false,
        );
      }
      if (dir == MessageDirection.serverToClient ||
          dir == MessageDirection.both) {
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
      if (dir == MessageDirection.clientToServer ||
          dir == MessageDirection.both) {
        addTo(
          handlerGroups,
          notif.method,
          notif.params,
          null,
          isNotification: true,
        );
      }
      if (dir == MessageDirection.serverToClient ||
          dir == MessageDirection.both) {
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

    final paramsLine = hasParams
        ? 'final p = $paramsType.fromJson(json as Map<String, Object?>);'
        : '';
    final handlerCall = hasParams ? 'await handler(p)' : 'await handler()';
    final returnExpr = isVoidResult
        ? '$handlerCall;\nreturn null;'
        : _returnExpr(resultType, handlerCall);

    return Code(
      "_connection.registerRequestHandler('$wireMethod', (json) async {\n"
      '  $paramsLine\n'
      '  $returnExpr\n'
      '});',
    );
  }

  Code _notificationHandlerBody(String wireMethod, String paramsType) {
    final hasParams = paramsType.isNotEmpty;
    final paramsLine = hasParams
        ? 'final p = $paramsType.fromJson(json as Map<String, Object?>);'
        : '';
    final handlerCall = hasParams ? 'await handler(p);' : 'await handler();';

    return Code(
      "_connection.registerNotificationHandler('$wireMethod', (json) async {\n"
      '  $paramsLine\n'
      '  $handlerCall\n'
      '});',
    );
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
    final sendCall = hasParams
        ? "_connection.sendNotification('$wireMethod', params.toJson());"
        : "_connection.sendNotification('$wireMethod');";

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
        ..body = Code(sendCall),
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

    final sendCall = hasParams
        ? "_connection.sendRequest('$wireMethod', params.toJson())"
        : "_connection.sendRequest('$wireMethod')";

    final body = isVoidResult
        ? Code('await $sendCall;')
        : Code(
            'final raw = await $sendCall;\n'
            '${_senderResultDecodeExpr(resultType, 'raw')}',
          );

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
        ..body = body,
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
              ..modifier = FieldModifier.final$
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
                ..modifier = FieldModifier.final$
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

  /// Returns `return result?.toJson();` or `return result.toJson();` etc.
  String _returnExpr(String resultType, String handlerCall) {
    final isNullable = resultType.endsWith('?');
    final baseType = isNullable
        ? resultType.substring(0, resultType.length - 1)
        : resultType;

    if (resultType == 'Object?' || resultType == 'Object') {
      return 'return $handlerCall;';
    }
    if (baseType.startsWith('List<')) {
      // List<T?> or List<T>  → .map((e) => e.toJson()).toList()
      final access = isNullable ? '?.map' : '.map';
      return 'final r = $handlerCall;\nreturn r$access((e) => e.toJson()).toList();';
    }
    return isNullable
        ? 'final r = $handlerCall;\nreturn r?.toJson();'
        : 'final r = $handlerCall;\nreturn r.toJson();';
  }

  /// Generates the result decode expression for sender methods.
  String _senderResultDecodeExpr(String resultType, String rawVar) {
    final isNullable = resultType.endsWith('?');
    final baseType = isNullable
        ? resultType.substring(0, resultType.length - 1)
        : resultType;

    if (resultType == 'Object?' || resultType == 'Object') {
      return 'return raw;';
    }
    if (resultType == 'Null' || resultType == 'void') {
      return '';
    }
    if (baseType.startsWith('List<')) {
      // Extract inner type from List<X> for fromJson call — use Object? fallback
      return 'return ($rawVar as List).cast<Map<String, Object?>>().map($baseType.fromJson).toList();';
    }
    return isNullable
        ? 'return $rawVar == null ? null : $baseType.fromJson($rawVar as Map<String, Object?>);'
        : 'return $baseType.fromJson($rawVar as Map<String, Object?>);';
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
      TypeRef(:final name) => name,
      ArrayRef(:final element) => 'List<${_innerTypeName(element)}>',
      OrRef(:final items) => _orTypeName(items),
      _ => 'Object?',
    };
  }

  String _innerTypeName(MetaReference ref) => switch (ref) {
    TypeRef(:final name) => name,
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
      return hasNull ? '$t?' : t;
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
