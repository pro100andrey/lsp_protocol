import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../models/resolved_type.dart';
import '../resolver/resolved_state.dart';
import 'generator_helpers.dart';

/// Abstract base for generating LSP API classes (handlers, senders, proxy).
///
/// Subclasses configure side-specific details (client/server naming,
/// message directions, etc.) while this class handles the shared logic
/// for grouping methods by namespace, resolving type names, and
/// producing the AST [Library] via [buildApi].
abstract class ApiGenerator {
  /// Creates the generator and pre-computes lookup maps for request and
  /// notification wire methods as well as the set of union type names
  /// used in the protocol.
  ApiGenerator(this.resolved) {
    requestMethods = {
      for (final e in dartNames(
        resolved.requests,
        (r) => r.method,
      ).entries)
        e.key.method: e.value,
    };
    notificationMethods = {
      for (final e in dartNames(
        resolved.notifications,
        (n) => n.method,
      ).entries)
        e.key.method: e.value,
    };

    _unionTypeNames = {};
    for (final req in resolved.requests) {
      if (isRequestResultUnion(req.result)) {
        _unionTypeNames.add(requestResultUnionName(req.method));
      }
    }
    for (final alias in resolved.aliases) {
      if (alias.type case UnionType()) {
        _unionTypeNames.add(alias.name);
      }
    }
  }

  /// The resolved protocol state containing all requests, notifications, and
  /// type aliases after direction resolution.
  final ResolvedState resolved;

  /// Maps each wire method name to the corresponding `RequestMethod` enum
  /// member name used in generated code.
  late final Map<String, String> requestMethods;

  /// Maps each wire method name to the corresponding `NotificationMethod` enum
  /// member name used in generated code.
  late final Map<String, String> notificationMethods;

  /// Set of union type names that appear as request result types or alias
  /// types, used to decide whether to call `fromJson` during decoding.
  late final Set<String> _unionTypeNames;

  // Abstract Configuration Getters

  /// The side this generator targets, e.g. `"Client"` or `"Server"`.
  String get side;

  /// The opposite side, used for generating human-readable docs and strings.
  String get otherSide;

  /// The name of the proxy extension type (e.g. `"ClientLsp"`).
  String get proxyName;

  /// The access pattern for the proxy example in docs
  /// (e.g. `"connection.lsp"`).
  String get proxyExampleAccess;

  /// The type name of the example used in proxy docs (e.g. `"LspConnection"`).
  String get proxyExampleType;

  /// The full documentation call expression shown in proxy docs.
  String get proxyExampleDocsCall;

  /// The message direction for handler methods.
  MessageDirection get handlerDirection;

  /// The message direction for sender methods.
  MessageDirection get senderDirection;

  /// Returns the return type reference for handler methods.
  ///
  /// Override to customize the return type based on whether the method
  /// handles a notification (typically [refer('void')]) or a request.
  Reference handlerMethodReturns(bool isNotification) => refer('void');

  // Common Build Entry Point

  /// Builds the complete [Library] AST containing the proxy, handler, and
  /// sender extension types for all namespaces.
  ///
  /// The generated library includes:
  /// 1. A proxy extension type ([_buildProxy]) that provides namespace
  ///    accessors delegating to sender classes.
  /// 2. One handler extension type per namespace ([_buildHandlerClass])
  ///    that registers request/notification handlers on the connection.
  /// 3. One sender extension type per namespace ([_buildSenderClass])
  ///    that exposes methods for sending requests and notifications.
  Library buildApi() {
    final groups = groupByNamespace(
      handlerDir: handlerDirection,
      senderDir: senderDirection,
    );

    final specs = <Spec>[
      _buildProxy(groups.senderGroups.keys),
      ...groups.handlerGroups.entries.map(
        (e) => _buildHandlerClass(e.key, e.value),
      ),
      ...groups.senderGroups.entries.map(
        (e) => _buildSenderClass(e.key, e.value),
      ),
    ];

    return Library(
      (b) => b
        ..comments.addAll(['GENERATED — do not edit.'])
        ..directives.addAll([
          .import('dart:async'),
          .import('../../connection/lsp_connection.dart'),
          .import('../../connection/lsp_exception.dart'),
          .import('../../server/lsp_request.dart'),
          .import('../models/structures.dart'),
          .import('../models/unions.dart'),
        ])
        ..body.addAll(specs),
    );
  }

  /// Groups all resolved requests and notifications by namespace and direction.
  ///
  /// Each method entry is placed into [GroupedMethods.handlerGroups] if its
  /// message direction matches [handlerDir], and into
  /// [GroupedMethods.senderGroups] if it matches [senderDir]. Methods with
  /// direction [.both] are included in both maps.
  GroupedMethods groupByNamespace({
    required MessageDirection handlerDir,
    required MessageDirection senderDir,
  }) {
    final handlerGroups = <String, List<MethodEntry>>{};
    final senderGroups = <String, List<MethodEntry>>{};

    void addTo(
      Map<String, List<MethodEntry>> map,
      String method,
      MetaReference? params,
      MetaReference? result, {
      required bool isNotification,
    }) {
      final (ns, dartName) = namespacedMethod(method);
      map
          .putIfAbsent(ns, () => [])
          .add(
            .new(
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
      if (dir == handlerDir || dir == .both) {
        addTo(
          handlerGroups,
          req.method,
          req.params,
          req.result,
          isNotification: false,
        );
      }
      if (dir == senderDir || dir == .both) {
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
      if (dir == handlerDir || dir == .both) {
        addTo(
          handlerGroups,
          notif.method,
          notif.params,
          null,
          isNotification: true,
        );
      }
      if (dir == senderDir || dir == .both) {
        addTo(
          senderGroups,
          notif.method,
          notif.params,
          null,
          isNotification: true,
        );
      }
    }

    return .new(
      handlerGroups: handlerGroups,
      senderGroups: senderGroups,
    );
  }

  // Helper Methods

  /// Returns whether [typeName] is a union type that requires `fromJson`
  /// decoding during request result processing.
  bool isUnionType(String typeName) => _unionTypeNames.contains(typeName);

  /// Resolves the Dart type name for a request result [MetaReference].
  ///
  /// Handles union types, nullable types, arrays, and base type mapping.
  /// Returns `'void'` when the result type is effectively null-only.
  String resultTypeName(MetaReference? result, String wireMethod) {
    if (result case null) {
      return 'void';
    }

    if (isRequestResultUnion(result)) {
      final hasNull = switch (result) {
        OrRef(:final items) => ApiGenerator._hasNull(items),
        _ => false,
      };
      final unionName = requestResultUnionName(wireMethod);
      return hasNull ? '$unionName?' : unionName;
    }

    return switch (result) {
      BaseRef(name: 'null') => 'void',
      TypeRef(:final name) => name == 'LSPAny' ? 'Object?' : name,
      ArrayRef(:final element) => 'List<${_innerTypeName(element)}>',
      OrRef(:final items) => _orTypeName(items),
      _ => 'Object?',
    };
  }

  /// Recursively resolves the Dart type name for an array element reference.
  String _innerTypeName(MetaReference ref) => switch (ref) {
    TypeRef(:final name) => name == 'LSPAny' ? 'Object?' : name,
    BaseRef(:final name) => _baseDartName(name),
    ArrayRef(:final element) => 'List<${_innerTypeName(element)}>',
    OrRef(:final items) => _orTypeName(items),
    _ => 'Object?',
  };

  /// Resolves the Dart type name for an `or` union of [items].
  ///
  /// Returns `'void'` for null-only unions, a single type (possibly nullable)
  /// for one non-null item, or `'Object'` / `'Object?'` for unions with
  /// multiple non-null variants.
  String _orTypeName(List<MetaReference> items) {
    final hasNull = items.any((i) => i is BaseRef && i.name == 'null');
    final nonNull = items
        .where((i) => !(i is BaseRef && i.name == 'null'))
        .toList(growable: false);

    if (nonNull.isEmpty) {
      return 'void';
    }

    if (nonNull.length == 1) {
      final t = _innerTypeName(nonNull.first);
      if (!hasNull) {
        return t;
      }

      return t.endsWith('?') ? t : '$t?';
    }

    return hasNull ? 'Object?' : 'Object';
  }

  static bool _hasNull(List<MetaReference> items) => items.any(
    (i) => i is BaseRef && i.name == 'null',
  );

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

  /// Resolves the Dart type name for request/notification parameters.
  ///
  /// Returns an empty string when parameters are absent or null-only,
  /// indicating no parameter is needed in the generated method signature.
  String paramsTypeName(MetaReference? params) {
    if (params == null) {
      return '';
    }

    return switch (params) {
      TypeRef(:final name) => name == 'LSPAny' ? 'Object?' : name,
      BaseRef(name: 'null') => '',
      _ => 'Object?',
    };
  }

  /// Builds the handler function type string for a given method signature.
  ///
  /// Returns a type like:
  /// `Future<ResultType> Function(ParamsType params, LspRequest context)`
  /// or `Future<void> Function(LspRequest context)` for notifications
  /// without params.
  String handlerFunctionType({
    required String paramsType,
    required String resultType,
    required bool isNotification,
  }) {
    final returnType = isNotification ? 'Future<void>' : 'Future<$resultType>';
    final param = paramsType.isNotEmpty ? '$paramsType params' : '';
    final comma = param.isNotEmpty ? ', ' : '';
    return '$returnType Function($param${comma}LspRequest context)';
  }

  /// Generates return statements for a request handler body.
  ///
  /// Awaits the [handlerExpr] result and converts it to JSON:
  /// - Raw `Object?` results are returned directly.
  /// - List results are mapped via `.toJson()` on each element.
  /// - Single-object results have `.toJson()` called on the awaited value.
  List<Code> returnStatements(String resultType, Expression handlerExpr) {
    final isNullable = resultType.endsWith('?');
    final baseType = isNullable
        ? resultType.substring(0, resultType.length - 1)
        : resultType;

    if (resultType == 'Object?' || resultType == 'Object') {
      return [handlerExpr.returned.statement];
    }

    if (baseType.startsWith('List<')) {
      final innerType = baseType.substring(5, baseType.length - 1);
      final isRawObject = innerType == 'Object' || innerType == 'Object?';
      final mapClosure = Method(
        (b) => b
          ..lambda = true
          ..requiredParameters.add(.new((b) => b..name = 'e'))
          ..body =
              (isRawObject
                      ? refer(
                          'e',
                        ).asA(refer('dynamic')).property('toJson').call([])
                      : refer('e').property('toJson').call([]))
                  .code,
      ).closure;
      final listExpr = isNullable
          ? refer('result')
                .nullSafeProperty('map')
                .call([mapClosure])
                .property('toList')
                .call([])
          : refer(
              'result',
            ).property('map').call([mapClosure]).property('toList').call([]);
      return [
        declareFinal('result').assign(handlerExpr.awaited).statement,
        listExpr.returned.statement,
      ];
    }

    final toJson = isNullable
        ? refer('result').nullSafeProperty('toJson').call([])
        : refer('result').property('toJson').call([]);
    return [
      declareFinal('result').assign(handlerExpr.awaited).statement,
      toJson.returned.statement,
    ];
  }

  /// Generates decode statements for a sender method response.
  ///
  /// Converts the raw JSON response (['raw']) into the typed result:
  /// - Raw `Object?` results are returned directly.
  /// - Void results produce no statements.
  /// - List results are cast and mapped via `fromJson`.
  /// - Single-object results call the type's `fromJson` constructor.
  List<Code> senderDecodeStatements(String resultType) {
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
        final castExpr = refer('raw')
            .asA(refer('List'))
            .property('cast')
            .call([], {}, [refer('Object')])
            .property('toList')
            .call([]);
        if (isNullable) {
          return [
            refer('raw')
                .equalTo(literalNull)
                .conditional(literalNull, castExpr)
                .returned
                .statement,
          ];
        }

        return [castExpr.returned.statement];
      }

      final isInnerUnion = isUnionType(innerType);
      if (isInnerUnion) {
        final mapClosure = Method(
          (b) => b
            ..lambda = true
            ..requiredParameters.add(.new((b) => b..name = 'e'))
            ..body =
                refer(
                  innerType,
                ).newInstanceNamed('fromJson', [
                  refer('e').bareAsA(refer('Object')),
                ]).code,
        ).closure;
        final mapExpr = refer('raw')
            .asA(refer('List'))
            .property('map')
            .call([mapClosure])
            .property('toList')
            .call([]);
        if (isNullable) {
          return [
            refer('raw')
                .equalTo(literalNull)
                .conditional(literalNull, mapExpr)
                .returned
                .statement,
          ];
        }
        return [mapExpr.returned.statement];
      }

      final castExpr = refer('raw')
          .asA(refer('List'))
          .property('cast')
          .call([], {}, [_jsonMapRef()])
          .property('map')
          .call([refer(innerType).property('fromJson')])
          .property('toList')
          .call([]);
      if (isNullable) {
        return [
          refer('raw')
              .equalTo(literalNull)
              .conditional(literalNull, castExpr)
              .returned
              .statement,
        ];
      }
      return [castExpr.returned.statement];
    }

    final isUnion = isUnionType(baseType);
    final castExprStr = isUnion
        ? 'raw as Object'
        : 'raw as Map<String, dynamic>';

    if (isNullable) {
      return [
        refer('raw')
            .equalTo(literalNull)
            .conditional(
              literalNull,
              refer(baseType).newInstanceNamed(
                'fromJson',
                [CodeExpression(.new(castExprStr))],
              ),
            )
            .returned
            .statement,
      ];
    }
    return [
      refer(baseType)
          .newInstanceNamed(
            'fromJson',
            [CodeExpression(.new(castExprStr))],
          )
          .returned
          .statement,
    ];
  }

  static TypeReference _jsonMapRef() => TypeReference(
    (b) => b
      ..symbol = 'Map'
      ..types.addAll([refer('String'), refer('dynamic')]),
  );

  /// Generates an assignment expression for parsing parameters from JSON.
  ///
  /// Uses the `parseParams` helper with the given type's `fromJson` factory.
  static Code fromJsonAssign(
    String typeName,
    String varName,
    String sourceVar,
  ) => .new('final $varName = parseParams($sourceVar, $typeName.fromJson);');

  /// Resolves a wire method name to its corresponding enum reference.
  ///
  /// Looks up [wireMethod] in either [requestMethods] or [notificationMethods]
  /// based on [enumType]. Returns a literal string for unknown methods.
  Expression methodRef(String enumType, String wireMethod) {
    final map = enumType == 'RequestMethod'
        ? requestMethods
        : notificationMethods;
    final member = map[wireMethod];
    if (member != null) {
      return refer('').property(member);
    }

    return literalString(wireMethod, raw: wireMethod.contains(r'$'));
  }

  /// Builds the handler class name for a given namespace.
  ///
  /// The `general` and `$` namespaces both map to `GeneralHandlers`.
  static String handlerClassName(String namespace) =>
      '${capitalize(namespace == 'general' ? 'general' : namespace)}Handlers';

  /// Builds the sender class name for a given namespace.
  ///
  /// The `$` and `general` namespaces both map to `GeneralSender`.
  static String senderClassName(String namespace) =>
      '${capitalize(namespace == r'$'
          ? 'general'
          : namespace == 'general'
          ? 'general'
          : namespace)}Sender';

  // AST Generation Methods

  /// Builds the handler extension type for a single namespace.
  ///
  /// Each method in [entries] becomes a handler registration method
  /// (e.g. `onInitialized`, `onWorkspaceDidChangeFolders`) that calls
  /// the appropriate `registerRequestHandler` or `registerNotificationHandler`
  /// on the connection representation.
  ExtensionType _buildHandlerClass(
    String namespace,
    List<MethodEntry> entries,
  ) {
    final className = '$side${ApiGenerator.handlerClassName(namespace)}';

    return .new(
      (b) => b
        ..name = className
        ..docs.add(
          '/// Registers incoming LSP handlers for the '
          '`$namespace` namespace.',
        )
        ..representationDeclaration = .new(
          (b) => b
            ..name = '_c'
            ..declaredRepresentationType = refer('LspConnection'),
        )
        ..methods.addAll(entries.map(_buildHandlerMethod)),
    );
  }

  /// Builds a single handler registration method for a [MethodEntry].
  ///
  /// The generated method accepts a handler callback and wires it to the
  /// connection's request or notification handler registry.
  Method _buildHandlerMethod(MethodEntry entry) {
    final paramsType = paramsTypeName(entry.params);
    final resultType = resultTypeName(entry.result, entry.wireMethod);

    final handlerType = handlerFunctionType(
      paramsType: paramsType,
      resultType: resultType,
      isNotification: entry.isNotification,
    );

    final body = entry.isNotification
        ? _notificationHandlerBody(entry.wireMethod, paramsType)
        : _requestHandlerBody(entry.wireMethod, paramsType, resultType);

    return .new(
      (b) => b
        ..name = 'on${capitalize(entry.dartName)}'
        ..returns = handlerMethodReturns(entry.isNotification)
        ..docs.add('/// Registers handler for `${entry.wireMethod}`.')
        ..requiredParameters.add(
          .new(
            (b) => b
              ..name = 'handler'
              ..type = refer(handlerType),
          ),
        )
        ..lambda = true
        ..body = body.code,
    );
  }

  /// Generates the body expression for a request handler method.
  ///
  /// Parses parameters (if any), invokes the handler, and converts the
  /// result to JSON for the response.
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
            ? declareFinal('params').assign(refer('j')).statement
            : ApiGenerator.fromJsonAssign(paramsType, 'params', 'j'),
    ];
    final handlerExpr = hasParams
        ? refer('handler').call([refer('params'), refer('c')])
        : refer('handler').call([refer('c')]);

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
          .new((b) => b..name = 'j'),
          .new((b) => b..name = 'c'),
        ])
        ..body = Block.of(statements),
    ).closure;

    return refer('_c').property('registerRequestHandler').call([
      methodRef('RequestMethod', wireMethod),
      closure,
    ]);
  }

  /// Generates the body expression for a notification handler method.
  ///
  /// Parses parameters (if any) and invokes the handler asynchronously.
  /// Notifications do not return a value.
  Expression _notificationHandlerBody(String wireMethod, String paramsType) {
    final hasParams = paramsType.isNotEmpty;
    final isRawParams = paramsType == 'Object?' || paramsType == 'Object';

    final statements = [
      if (hasParams)
        isRawParams
            ? declareFinal('params').assign(refer('j')).statement
            : ApiGenerator.fromJsonAssign(paramsType, 'params', 'j'),
    ];

    final handlerExpr = hasParams
        ? refer('handler').call([refer('params'), refer('c')]).awaited
        : refer('handler').call([refer('c')]).awaited;

    statements.add(handlerExpr.statement);

    final closure = Method(
      (b) => b
        ..modifier = .async
        ..requiredParameters.addAll([
          .new((b) => b..name = 'j'),
          .new((b) => b..name = 'c'),
        ])
        ..body = Block.of(statements),
    ).closure;

    return refer('_c').property('registerNotificationHandler').call([
      methodRef('NotificationMethod', wireMethod),
      closure,
    ]);
  }

  /// Builds the sender extension type for a single namespace.
  ///
  /// Each method in [entries] becomes a public method that sends a request
  /// or notification via the connection's `sendRequest` or `sendNotification`.
  ExtensionType _buildSenderClass(String namespace, List<MethodEntry> entries) {
    final className = '$side${ApiGenerator.senderClassName(namespace)}';
    return .new(
      (b) => b
        ..name = className
        ..docs.add(
          '/// Sends LSP messages to the ${otherSide.toLowerCase()} for the '
          '`$namespace` namespace.',
        )
        ..representationDeclaration = .new(
          (b) => b
            ..name = '_c'
            ..declaredRepresentationType = refer('LspConnection'),
        )
        ..methods.addAll(entries.map(_buildSenderMethod)),
    );
  }

  /// Builds a single sender method for a [MethodEntry].
  ///
  /// Dispatches to [_buildNotificationSenderMethod] or
  /// [_buildRequestSenderMethod] based on whether the entry is a notification.
  Method _buildSenderMethod(MethodEntry entry) {
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

  /// Builds a notification sender method that calls `sendNotification`.
  ///
  /// Converts [paramsType] parameters to JSON before sending.
  Method _buildNotificationSenderMethod(
    String dartName,
    String wireMethod,
    String paramsType,
    bool hasParams,
  ) {
    final paramsExpr = (paramsType == 'Object?' || paramsType == 'Object')
        ? refer('params')
        : refer('params').property('toJson').call([]);
    final sendCall = hasParams
        ? refer('_c').property('sendNotification').call([
            methodRef('NotificationMethod', wireMethod),
            paramsExpr,
          ])
        : refer('_c').property('sendNotification').call([
            methodRef('NotificationMethod', wireMethod),
          ]);

    return .new(
      (b) => b
        ..name = dartName
        ..returns = refer('void')
        ..docs.add(
          '/// Sends the `$wireMethod` notification to the ${otherSide.toLowerCase()}.',
        )
        ..requiredParameters.addAll([
          if (hasParams)
            .new(
              (b) => b
                ..name = 'params'
                ..type = refer(paramsType),
            ),
        ])
        ..lambda = true
        ..body = sendCall.code,
    );
  }

  /// Builds a request sender method that calls `sendRequest` and decodes
  /// the result.
  ///
  /// Awaits the response and converts the raw JSON to the expected [resultType]
  /// using [senderDecodeStatements].
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
        ? refer('_c').property('sendRequest').call([
            methodRef('RequestMethod', wireMethod),
            refer('params').property('toJson').call([]),
          ])
        : refer('_c').property('sendRequest').call([
            methodRef('RequestMethod', wireMethod),
          ]);

    final bodyStatements = <Code>[
      if (isVoidResult)
        sendCallExpr.awaited.statement
      else ...[
        declareFinal(
          'raw',
          type: refer('dynamic'),
        ).assign(sendCallExpr.awaited).statement,
        ...senderDecodeStatements(resultType),
      ],
    ];

    return Method(
      (b) => b
        ..name = dartName
        ..modifier = .async
        ..returns = returnRef
        ..docs.add(
          '/// Sends the `$wireMethod` request to the ${otherSide.toLowerCase()}.',
        )
        ..requiredParameters.addAll([
          if (hasParams)
            .new(
              (b) => b
                ..name = 'params'
                ..type = refer(paramsType),
            ),
        ])
        ..body = Block.of(bodyStatements),
    );
  }

  /// Builds the proxy extension type that aggregates all sender classes.
  ///
  /// Each namespace gets a getter property that instantiates the corresponding
  /// sender class with the connection. For example, `client.lsp.workspace`
  /// returns the `WorkspaceSender` instance.
  ExtensionType _buildProxy(Iterable<String> senderNamespaces) {
    final namespaces = senderNamespaces.toList(growable: false);

    return .new(
      (b) => b
        ..name = proxyName
        ..docs.add(
          '/// Aggregates all outgoing sender classes.\n'
          '///\n'
          '/// Access via `$proxyExampleType.$proxyExampleAccess`:\n'
          '/// ```dart\n'
          '/// $proxyExampleDocsCall\n'
          '/// ```',
        )
        ..representationDeclaration = .new(
          (b) => b
            ..name = '_c'
            ..declaredRepresentationType = refer('LspConnection'),
        )
        ..methods.addAll(
          namespaces.map(
            (ns) {
              final propName = ns == r'$'
                  ? 'protocol'
                  : ns == 'general'
                  ? 'general'
                  : ns;
              final senderClass = '$side${ApiGenerator.senderClassName(ns)}';

              return .new(
                (b) => b
                  ..name = propName
                  ..type = .getter
                  ..returns = refer(senderClass)
                  ..lambda = true
                  ..body = refer(senderClass).call([refer('_c')]).code,
              );
            },
          ),
        ),
    );
  }
}

/// Represents a single LSP method (request or notification) for code
/// generation.
///
/// Holds the wire protocol method name, the generated Dart method name,
/// parameter and result type references, and whether it is a notification.
class MethodEntry {
  const MethodEntry({
    required this.wireMethod,
    required this.dartName,
    required this.params,
    required this.result,
    required this.isNotification,
  });

  /// The LSP wire method name (e.g. `"textDocument/completion"`).
  final String wireMethod;

  /// The generated Dart method name (e.g. `"textDocumentCompletion"`).
  final String dartName;

  /// Parameter type reference, or null if the method takes no parameters.
  final MetaReference? params;

  /// Result type reference, or null if the method has no result.
  final MetaReference? result;

  /// Whether this entry represents a notification (true) or a request (false).
  final bool isNotification;
}

/// Holds method entries grouped by namespace for handlers and senders.
class GroupedMethods {
  const GroupedMethods({
    required this.handlerGroups,
    required this.senderGroups,
  });

  /// Methods grouped by namespace for handler registration, keyed by namespace.
  final Map<String, List<MethodEntry>> handlerGroups;

  /// Methods grouped by namespace for sender methods, keyed by namespace.
  final Map<String, List<MethodEntry>> senderGroups;
}
