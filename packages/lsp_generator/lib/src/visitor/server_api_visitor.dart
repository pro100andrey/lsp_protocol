import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../resolver/resolved_state.dart' show ResolvedState;
import 'api_visitor_base.dart';
import 'emitter_helpers.dart';

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
final class ServerApiVisitor extends ApiVisitorBase {
  ServerApiVisitor(super.resolved);

  static String handlerClassName(String namespace) =>
      'Server${ApiVisitorBase.handlerClassName(namespace)}';

  static String senderClassName(String namespace) =>
      'Server${ApiVisitorBase.senderClassName(namespace)}';

  static const _header = [
    'GENERATED — do not edit.',
  ];

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
        ..comments.addAll(_header)
        ..directives.addAll([
          Directive.import('dart:async'),
          Directive.import('../../connection/lsp_connection.dart'),
          Directive.import('../../connection/lsp_exception.dart'),
          Directive.import('../../server/lsp_request.dart'),
          Directive.import('../models/structures.dart'),
          Directive.import('../models/unions.dart'),
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
      final (ns, dartName) = namespacedMethod(method);
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

    for (final req in resolved.requests) {
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

    for (final notif in resolved.notifications) {
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
    final className = handlerClassName(namespace);
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
              ..modifier = .final$
              ..type = tLspConnection,
          ),
        )
        ..methods.addAll(entries.map(_buildHandlerMethod)),
    );
  }

  Method _buildHandlerMethod(_MethodEntry entry) {
    final paramsType = paramsTypeName(entry.params);
    final resultType = resultTypeName(entry.result, entry.wireMethod);

    // Build the handler function type reference string.
    final handlerType = handlerFunctionType(
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
            'on${ApiVisitorBase.capitalize(
              entry.dartName,
            )}'
        ..returns = entry.isNotification ? refer('void Function()') : tVoid
        ..docs.add('/// Registers handler for `${entry.wireMethod}`.')
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..name = 'handler'
              ..type = refer(handlerType),
          ),
        )
        ..lambda = true
        ..body = body.code,
    );
  }

  Expression _requestHandlerBody(
    String wireMethod,
    String paramsType,
    String resultType,
  ) {
    final hasParams = paramsType.isNotEmpty;
    final isVoidResult = resultType == 'void';
    final isRawParams = paramsType == 'Object?' || paramsType == 'Object';

    final statements = <Code>[
      if (hasParams)
        isRawParams
            ? declareFinal('p').assign(refer('json')).statement
            : ApiVisitorBase.fromJsonAssign(paramsType, 'p', 'json'),
    ];
    final handlerExpr = hasParams
        ? refer('handler').call([refer('p'), refer('context')])
        : refer('handler').call([refer('context')]);

    if (isVoidResult) {
      statements
        ..add(handlerExpr.awaited.statement)
        ..add(literalNull.returned.statement);
    } else {
      statements.addAll(returnStatements(resultType, handlerExpr));
    }

    final needsAsync =
        isVoidResult || (resultType != 'Object?' && resultType != 'Object');

    final closure = Method(
      (b) => b
        ..modifier = needsAsync ? .async : null
        ..requiredParameters.addAll([
          Parameter((b) => b..name = 'json'),
          Parameter((b) => b..name = 'context'),
        ])
        ..body = Block.of(statements),
    ).closure;

    return eConnection.property('registerRequestHandler').call([
      methodRef('RequestMethod', wireMethod),
      closure,
    ]);
  }

  Expression _notificationHandlerBody(String wireMethod, String paramsType) {
    final hasParams = paramsType.isNotEmpty;
    final isRawParams = paramsType == 'Object?' || paramsType == 'Object';

    final statements = <Code>[
      if (hasParams)
        isRawParams
            ? declareFinal('p').assign(refer('json')).statement
            : ApiVisitorBase.fromJsonAssign(paramsType, 'p', 'json'),
    ];

    final handlerExpr = hasParams
        ? refer('handler').call([refer('p'), refer('context')]).awaited
        : refer('handler').call([refer('context')]).awaited;

    statements.add(handlerExpr.statement);

    final closure = Method(
      (b) => b
        ..modifier = .async
        ..requiredParameters.addAll([
          Parameter((b) => b..name = 'json'),
          Parameter((b) => b..name = 'context'),
        ])
        ..body = Block.of(statements),
    ).closure;

    return eConnection.property('registerNotificationHandler').call([
      methodRef('NotificationMethod', wireMethod),
      closure,
    ]);
  }

  // -------------------------------------------------------------------------
  // Sender class
  // -------------------------------------------------------------------------

  Class _buildSenderClass(String namespace, List<_MethodEntry> entries) {
    final className = senderClassName(namespace);
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
              ..modifier = .final$
              ..type = tLspConnection,
          ),
        )
        ..methods.addAll(entries.map(_buildSenderMethod)),
    );
  }

  Method _buildSenderMethod(_MethodEntry entry) {
    final paramsType = paramsTypeName(entry.params);
    final resultType = entry.isNotification
        ? 'void'
        : resultTypeName(entry.result, entry.wireMethod);
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
        ? eParams
        : eParams.property('toJson').call([]);
    final sendCall = hasParams
        ? eConnection.property('sendNotification').call([
            methodRef('NotificationMethod', wireMethod),
            paramsExpr,
          ])
        : eConnection.property('sendNotification').call([
            methodRef('NotificationMethod', wireMethod),
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
        ? eConnection.property('sendRequest').call([
            methodRef('RequestMethod', wireMethod),
            eParams.property('toJson').call([]),
          ])
        : eConnection.property('sendRequest').call([
            methodRef('RequestMethod', wireMethod),
          ]);

    final bodyStatements = <Code>[
      if (isVoidResult)
        sendCallExpr.awaited.statement
      else ...[
        declareFinal(
          'raw',
          type: tDynamic,
        ).assign(sendCallExpr.awaited).statement,
        ...senderDecodeStatements(resultType),
      ],
    ];

    return Method(
      (b) => b
        ..name = dartName
        ..modifier = .async
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
          '/// Access via `LspServer.client`:\n'
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
              ..type = tLspConnection,
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
                  '${senderClassName(ns)}(_connection)',
                ),
            ),
          ),
        ),
    );
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
