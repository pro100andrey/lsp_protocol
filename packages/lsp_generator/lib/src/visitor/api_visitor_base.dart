import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import '../models/protocol.dart';
import '../models/resolved_type.dart';
import '../resolver/resolved_state.dart';
import 'emitter_helpers.dart';

abstract class ApiVisitorBase {
  ApiVisitorBase(this.resolved) {
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
  }

  final ResolvedState resolved;

  /// wire method → `RequestMethod` enum member name.
  late final Map<String, String> requestMethods;

  /// wire method → `NotificationMethod` enum member name.
  late final Map<String, String> notificationMethods;

  bool isUnionType(String typeName) {
    // Check if it's a synthesized request result union
    for (final req in resolved.requests) {
      final resRef = req.result;
      if (resRef != null && resRef is OrRef) {
        final nonNullItems = resRef.items
            .where((i) => !(i is BaseRef && i.name == 'null'))
            .toList();
        if (nonNullItems.length > 1) {
          if (requestResultUnionName(req.method) == typeName) {
            return true;
          }
        }
      }
    }
    final alias = resolved.aliases.firstWhereOrNull((a) => a.name == typeName);
    if (alias != null && alias.type is UnionType) {
      return true;
    }
    return false;
  }

  String resultTypeName(MetaReference? result, String wireMethod) {
    if (result == null) {
      return 'void';
    }

    if (result is OrRef) {
      final nonNullItems = result.items
          .where((i) => !(i is BaseRef && i.name == 'null'))
          .toList();
      if (nonNullItems.length > 1) {
        final hasNull = result.items.any(
          (i) => i is BaseRef && i.name == 'null',
        );
        final unionName = requestResultUnionName(wireMethod);
        return hasNull ? '$unionName?' : unionName;
      }
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
          ..requiredParameters.add(Parameter((b) => b..name = 'e'))
          ..body =
              (isRawObject
                      ? refer('e').asA(tDynamic).property('toJson').call([])
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
        declareFinal('r').assign(handlerExpr.awaited).statement,
        listExpr.returned.statement,
      ];
    }

    final toJson = isNullable
        ? refer('r').nullSafeProperty('toJson').call([])
        : refer('r').property('toJson').call([]);
    return [
      declareFinal('r').assign(handlerExpr.awaited).statement,
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
        return [
          refer('raw')
              .asA(tList)
              .property('cast')
              .call([], {}, [tObject])
              .property('toList')
              .call([])
              .returned
              .statement,
        ];
      }

      final isInnerUnion = isUnionType(innerType);
      if (isInnerUnion) {
        final mapClosure = Method(
          (b) => b
            ..lambda = true
            ..requiredParameters.add(Parameter((b) => b..name = 'e'))
            ..body = refer(
              innerType,
            ).newInstanceNamed('fromJson', [refer('e').asA(tObject)]).code,
        ).closure;
        return [
          refer('raw')
              .asA(tList)
              .property('map')
              .call([mapClosure])
              .property('toList')
              .call([])
              .returned
              .statement,
        ];
      }

      return [
        refer('raw')
            .asA(tList)
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
                [CodeExpression(Code(castExprStr))],
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
            [CodeExpression(Code(castExprStr))],
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
  ) => Code('final $varName = parseParams($sourceVar, $typeName.fromJson);');

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

  static String capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}
