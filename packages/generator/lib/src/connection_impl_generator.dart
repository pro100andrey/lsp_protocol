import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'lsp_type_resolver.dart';
import 'meta/protocol.dart';
import 'visitor/visitor.dart';

/// Generates `base mixin LspConnectionMixin implements LspConnection`.
///
/// The mixin provides a concrete implementation for every method in
/// [LspConnection]. It requires a single abstract getter `Peer get peer` which
/// the host class must supply.
///
/// Method strings are referenced via [LspMethod] enum values instead of
/// hard-coded strings.
final class ConnectionImplGenerator
    with LspTypeResolver
    implements MetaProtocolVisitor<List<Method>> {
  ConnectionImplGenerator();

  @override
  final structsByName = <String, MetaStructure>{};
  @override
  final enumNames = <String>{};

  /// Type aliases from the protocol spec, keyed by alias name.
  /// Used to detect "transparent" aliases (those that ultimately equal Object?).
  final _typeAliasTypes = <String, MetaReference>{};

  static final _void = refer('void');

  // ── Public API ────────────────────────────────────────────────────────────

  String generate(MetaProtocol protocol) {
    structsByName
      ..clear()
      ..addAll({for (final s in protocol.structures) s.name: s});
    enumNames
      ..clear()
      ..addAll(protocol.enumerations.map((e) => e.name));
    _typeAliasTypes
      ..clear()
      ..addAll({for (final a in protocol.typeAliases) a.name: a.type});

    final library = Library((b) {
      b
        ..comments.addAll([
          ' GENERATED CODE – DO NOT MODIFY BY HAND',
          ' LSP Version: ${protocol.metaData.version}',
          ' ignore_for_file: avoid_dynamic_calls,'
              ' always_put_control_body_on_new_line',
        ])
        ..directives.addAll([
          Directive.import('package:json_rpc_2/json_rpc_2.dart'),
          Directive.import('connection.dart'),
          Directive.import('methods.dart'),
          Directive.import('models.dart'),
        ])
        ..body.add(_buildMixin(protocol));
    });

    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      useNullSafetySyntax: true,
      orderDirectives: true,
    );

    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
      pageWidth: DartFormatter.defaultPageWidth,
      trailingCommas: TrailingCommas.automate,
    ).format(library.accept(emitter).toString());
  }

  Class _buildMixin(MetaProtocol protocol) => Class((b) {
    b
      ..name = 'LspConnectionMixin'
      ..mixin = true
      ..implements.add(refer('LspConnection'))
      ..methods.add(_peerGetter())
      ..methods.addAll(protocol.requests.expand(visitMetaRequest))
      ..methods.addAll(protocol.notifications.expand(visitMetaNotification));
  });

  /// Getter that the host class must override with the actual [Peer] instance.
  Method _peerGetter() => Method(
    (b) => b
      ..type = MethodType.getter
      ..returns = refer('Peer')
      ..name = 'peer'
      ..lambda = true
      ..body = const Code('throw UnimplementedError()'),
  );

  // ── MetaRequest ─────────────────────────────────────────────────────────

  @override
  List<Method> visitMetaRequest(MetaRequest request) {
    final name = _camelName(request.method);
    return [
      if (request.messageDirection == MessageDirection.clientToServer ||
          request.messageDirection == MessageDirection.both)
        _onRequestMethod(name, request),
      if (request.messageDirection == MessageDirection.serverToClient ||
          request.messageDirection == MessageDirection.both)
        _sendRequestMethod(name, request),
    ];
  }

  Method _onRequestMethod(String name, MetaRequest r) {
    final paramsType = r.params != null ? resolveType(r.params!) : null;
    final resultType = _resultType(r.result);
    final enumVal = 'LspMethod.$name.value';

    final handler = paramsType != null
        ? refer('Future<$resultType> Function($paramsType params)')
        : refer('Future<$resultType> Function()');

    return Method((b) {
      b
        ..annotations.add(refer('override'))
        ..name = 'on${name.upperFirstLetter()}Request'
        ..returns = _void
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'handler'
              ..type = handler,
          ),
        );

      final (body, isLambda) = _onRequestBody(enumVal, paramsType, resultType);
      b.body = Code(body);
      if (isLambda) b.lambda = true;
    });
  }

  /// Returns `(body string, isLambda)`.
  (String, bool) _onRequestBody(
    String enumVal,
    String? paramsType,
    String resultType,
  ) {
    // No params (e.g. shutdown) → simple lambda
    if (paramsType == null) {
      return ('peer.registerMethod($enumVal, (_) => handler())', true);
    }

    // Object? / void / transparent alias → pass-through, no serialization
    if (_isTransparentType(resultType)) {
      return (
        'peer.registerMethod(\n'
            '  $enumVal,\n'
            '  (p) => handler(\n'
            '    $paramsType.fromJson(p.value as Map<String, dynamic>),\n'
            '  ),\n'
            ')',
        true,
      );
    }

    // List<T>? result
    if (resultType.startsWith('List<')) {
      final inner = _extractListElementType(resultType) ?? 'Object?';

      // Transparent element type → pass list through as-is
      if (_isTransparentType(inner)) {
        return (
          'peer.registerMethod($enumVal, (p) async {\n'
              '  final result = await handler(\n'
              '    $paramsType.fromJson(p.value as Map<String, dynamic>),\n'
              '  );\n'
              '  return result;\n'
              '});',
          false,
        );
      }

      // Model element → serialize with .map((e) => e.toJson()).toList()
      return (
        'peer.registerMethod($enumVal, (p) async {\n'
            '  final result = await handler(\n'
            '    $paramsType.fromJson(p.value as Map<String, dynamic>),\n'
            '  );\n'
            '  return result?.map((e) => e.toJson()).toList();\n'
            '});',
        false,
      );
    }

    // T? result → serialize with .toJson()
    return (
      'peer.registerMethod($enumVal, (p) async {\n'
          '  final result = await handler(\n'
          '    $paramsType.fromJson(p.value as Map<String, dynamic>),\n'
          '  );\n'
          '  return result?.toJson();\n'
          '});',
      false,
    );
  }

  Method _sendRequestMethod(String name, MetaRequest r) {
    final paramsType = r.params != null ? resolveType(r.params!) : null;
    final resultType = _resultType(r.result);
    final enumVal = 'LspMethod.$name.value';

    return Method((b) {
      b
        ..annotations.add(refer('override'))
        ..name = 'send${name.upperFirstLetter()}Request'
        ..returns = refer('Future<$resultType>');

      if (paramsType != null) {
        b.requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'params'
              ..type = refer(paramsType),
          ),
        );
      }

      final (body, isLambda, modifier) = _sendRequestBody(
        enumVal,
        paramsType,
        resultType,
      );
      b.body = Code(body);
      if (isLambda) b.lambda = true;
      if (modifier != null) b.modifier = modifier;
    });
  }

  /// Returns `(body string, isLambda, asyncModifier)`.
  (String, bool, MethodModifier?) _sendRequestBody(
    String enumVal,
    String? paramsType,
    String resultType,
  ) {
    final paramsArg = paramsType != null ? ', params.toJson()' : '';

    // void result → expression body
    if (resultType == 'void') {
      return ('peer.sendRequest($enumVal$paramsArg)', true, null);
    }

    // List<T>? result
    if (resultType.startsWith('List<')) {
      final inner = _extractListElementType(resultType) ?? 'Object?';

      // LSPAny / Object? list → cast
      if (inner == 'LSPAny' || inner == 'Object?') {
        return (
          'final result = await peer.sendRequest($enumVal$paramsArg);\n'
              'if (result == null) return null;\n'
              'return (result as List).cast<$inner>();',
          false,
          MethodModifier.async,
        );
      }

      // Typed model list → fromJson
      return (
        'final result = await peer.sendRequest($enumVal$paramsArg);\n'
            'if (result == null) return null;\n'
            'return (result as List)\n'
            '    .map((e) => $inner.fromJson(e as Map<String, dynamic>))\n'
            '    .toList();',
        false,
        MethodModifier.async,
      );
    }

    // T? result → fromJson
    final bareType = resultType.endsWith('?')
        ? resultType.substring(0, resultType.length - 1)
        : resultType;

    return (
      'final result = await peer.sendRequest($enumVal$paramsArg);\n'
          'if (result == null) return null;\n'
          'return $bareType.fromJson(result as Map<String, dynamic>);',
      false,
      MethodModifier.async,
    );
  }

  // ── MetaNotification ─────────────────────────────────────────────────────

  @override
  List<Method> visitMetaNotification(MetaNotification notification) {
    final name = _camelName(notification.method);
    return [
      if (notification.messageDirection == MessageDirection.clientToServer ||
          notification.messageDirection == MessageDirection.both)
        _onNotificationMethod(name, notification),
      if (notification.messageDirection == MessageDirection.serverToClient ||
          notification.messageDirection == MessageDirection.both)
        _sendNotificationMethod(name, notification),
    ];
  }

  Method _onNotificationMethod(String name, MetaNotification n) {
    final paramsType = n.params != null ? resolveType(n.params!) : null;
    final enumVal = 'LspMethod.$name.value';

    final handler = paramsType != null
        ? refer('Future<void> Function($paramsType params)')
        : refer('Future<void> Function()');

    return Method((b) {
      b
        ..annotations.add(refer('override'))
        ..name = 'on${name.upperFirstLetter()}Notification'
        ..returns = _void
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'handler'
              ..type = handler,
          ),
        )
        ..lambda = true;

      if (paramsType == null) {
        b.body = Code('peer.registerMethod($enumVal, (_) => handler())');
      } else {
        b.body = Code(
          'peer.registerMethod(\n'
          '  $enumVal,\n'
          '  (p) => handler(\n'
          '    $paramsType.fromJson(p.value as Map<String, dynamic>),\n'
          '  ),\n'
          ')',
        );
      }
    });
  }

  Method _sendNotificationMethod(String name, MetaNotification n) {
    final paramsType = n.params != null ? resolveType(n.params!) : null;
    final enumVal = 'LspMethod.$name.value';

    return Method((b) {
      b
        ..annotations.add(refer('override'))
        ..name = 'send${name.upperFirstLetter()}Notification'
        ..returns = _void
        ..lambda = true;

      if (paramsType != null) {
        b.requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'params'
              ..type = refer(paramsType),
          ),
        );
      }

      // LSPAny / Object? params → pass directly (no .toJson())
      final needsToJson =
          paramsType != null &&
          paramsType != 'LSPAny' &&
          paramsType != 'Object?';

      if (paramsType == null) {
        b.body = Code('peer.sendNotification($enumVal)');
      } else if (needsToJson) {
        b.body = Code('peer.sendNotification($enumVal, params.toJson())');
      } else {
        b.body = Code('peer.sendNotification($enumVal, params)');
      }
    });
  }

  // ── Visitor: unused ───────────────────────────────────────────────────────

  @override
  List<Method> visitMetaData(MetaData data) => [];

  @override
  List<Method> visitMetaEnumeration(MetaEnumeration enumeration) => [];

  @override
  List<Method> visitMetaTypeAlias(MetaTypeAlias typeAlias) => [];

  @override
  List<Method> visitMetaStructure(MetaStructure structure) => [];

  @override
  List<Method> visitMetaProperty(MetaProperty property) => [];

  @override
  List<Method> visitMetaEnumMember(MetaEnumMember member) => [];

  @override
  List<Method> visitMetaLiteral(MetaLiteral literal) => [];

  @override
  List<Method> visitTypeRef(TypeRef ref) => [];

  @override
  List<Method> visitArrayRef(ArrayRef ref) => [];

  @override
  List<Method> visitBaseRef(BaseRef ref) => [];

  @override
  List<Method> visitOrRef(OrRef ref) => [];

  @override
  List<Method> visitAndRef(AndRef ref) => [];

  @override
  List<Method> visitMapRef(MapRef ref) => [];

  @override
  List<Method> visitLiteralRef(LiteralRef ref) => [];

  @override
  List<Method> visitStringLiteralRef(StringLiteralRef ref) => [];

  @override
  List<Method> visitTupleRef(TupleRef ref) => [];

  // ── Helpers ───────────────────────────────────────────────────────────────

  /// Returns true if [typeName] ultimately resolves to `Object?` (i.e., the
  /// result should be passed through without calling `.toJson()` / `.fromJson()`).
  bool _isTransparentType(String typeName) {
    if (typeName == 'void' || typeName == 'Object?' || typeName == 'Object') {
      return true;
    }
    final bare = typeName.endsWith('?')
        ? typeName.substring(0, typeName.length - 1)
        : typeName;
    final aliasType = _typeAliasTypes[bare];
    if (aliasType == null) return false;
    final resolved = resolveType(aliasType);
    return resolved == 'Object?' || resolved == 'Null' || resolved == 'void';
  }

  String _resultType(MetaReference? result) {
    if (result == null) return 'void';
    final resolved = resolveType(result);
    if (resolved == 'Null') return 'void';
    return resolved.optional(optional: true);
  }

  /// Converts `textDocument/implementation` → `textDocumentImplementation`.
  String _camelName(String method) => method
      .replaceAll(r'$/', '')
      .split('/')
      .map((p) => p.upperFirstLetter())
      .join()
      .lowerFirstLetter();

  /// Extracts `T` from `List<T>?` or `List<T>`.
  String? _extractListElementType(String type) {
    final match = RegExp(r'List<(.+?)>\??$').firstMatch(type);
    return match?.group(1);
  }
}
