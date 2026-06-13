import 'package:code_builder/code_builder.dart';

import '../models/protocol.dart';
import '../models/resolved_type.dart';
import '../resolver/resolved_state.dart';
import 'generator_helpers.dart';

abstract class ApiGenerator {
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
      if (alias.type is UnionType) {
        _unionTypeNames.add(alias.name);
      }
    }
  }

  final ResolvedState resolved;

  /// wire method → `RequestMethod` enum member name.
  late final Map<String, String> requestMethods;

  /// wire method → `NotificationMethod` enum member name.
  late final Map<String, String> notificationMethods;

  late final Set<String> _unionTypeNames;

  // -------------------------------------------------------------------------
  // Abstract Configuration Getters
  // -------------------------------------------------------------------------

  String get side;
  String get otherSide;
  String get proxyName;
  String get proxyExampleAccess;
  String get proxyExampleType;
  String get proxyExampleDocsCall;
  MessageDirection get handlerDirection;
  MessageDirection get senderDirection;

  Reference handlerMethodReturns(bool isNotification) => tVoid;

  // -------------------------------------------------------------------------
  // Common Build Entry Point
  // -------------------------------------------------------------------------

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

  // -------------------------------------------------------------------------
  // Helper Methods
  // -------------------------------------------------------------------------

  bool isUnionType(String typeName) => _unionTypeNames.contains(typeName);

  String resultTypeName(MetaReference? result, String wireMethod) {
    if (result == null) {
      return 'void';
    }

    if (isRequestResultUnion(result)) {
      final hasNull = (result as OrRef).items.any(
        (i) => i is BaseRef && i.name == 'null',
      );
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
                      ? refer('e').asA(tDynamic).property('toJson').call([])
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
            .asA(tList)
            .property('cast')
            .call([], {}, [tObject])
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
            ..body = refer(
              innerType,
            ).newInstanceNamed('fromJson', [refer('e').bareAsA(tObject)]).code,
        ).closure;
        final mapExpr = refer('raw')
            .asA(tList)
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
          .asA(tList)
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
      ..types.addAll([tString, tDynamic]),
  );

  static Code fromJsonAssign(
    String typeName,
    String varName,
    String sourceVar,
  ) => .new('final $varName = parseParams($sourceVar, $typeName.fromJson);');

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

  static String handlerClassName(String namespace) =>
      '${capitalize(namespace == 'general' ? 'general' : namespace)}Handlers';

  static String senderClassName(String namespace) =>
      '${capitalize(namespace == r'$'
          ? 'general'
          : namespace == 'general'
          ? 'general'
          : namespace)}Sender';

  // -------------------------------------------------------------------------
  // AST Generation Methods
  // -------------------------------------------------------------------------

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

  Method _buildNotificationSenderMethod(
    String dartName,
    String wireMethod,
    String paramsType,
    bool hasParams,
  ) {
    final paramsExpr = (paramsType == 'Object?' || paramsType == 'Object')
        ? eParams
        : eParams.property('toJson').call([]);
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
            eParams.property('toJson').call([]),
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

  ExtensionType _buildProxy(Iterable<String> senderNamespaces) {
    final namespaces = senderNamespaces.toList(growable: false);

    return ExtensionType(
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

class MethodEntry {
  const MethodEntry({
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

class GroupedMethods {
  const GroupedMethods({
    required this.handlerGroups,
    required this.senderGroups,
  });

  final Map<String, List<MethodEntry>> handlerGroups;
  final Map<String, List<MethodEntry>> senderGroups;
}
