import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions/string.dart';
import 'meta/protocol.dart';
import 'visitor/visitor.dart';

/// Generates a Dart file containing the abstract `LspConnection` interface.
///
/// Implements [MetaProtocolVisitor] typed as `List<Method>` so that each
/// visited request / notification produces the corresponding code_builder
/// [Method] nodes. Only [visitMetaRequest] and [visitMetaNotification] produce
/// output; all other visitor methods return the empty list.
///
/// All parameter/result types are Object placeholders – to be replaced once
/// the Dart-side representation for `or` types is finalised.
final class ConnectionGenerator implements MetaProtocolVisitor<List<Method>> {
  const ConnectionGenerator();

  static final _void = refer('void');
  static final _futureObject = refer('Future<Object?>');
  static final _object = refer('Object?');

  // ── Public API ────────────────────────────────────────────────────────────

  String generate(MetaProtocol protocol) {
    final library = Library((b) {
      b
        ..comments.addAll([
          ' GENERATED CODE – DO NOT MODIFY BY HAND',
          ' LSP Version: ${protocol.metaData.version}',
          ' ignore_for_file: lines_longer_than_80_chars',
        ])
        ..directives.add(Directive.import('dart:async'))
        ..body.add(_buildInterface(protocol));
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

  Class _buildInterface(MetaProtocol protocol) => Class((b) {
    b
      ..abstract = true
      ..modifier = ClassModifier.interface
      ..name = 'LspConnection'
      ..docs.addAll(_interfaceDocs())
      ..methods.addAll(protocol.requests.expand(visitMetaRequest))
      ..methods.addAll(protocol.notifications.expand(visitMetaNotification));
  });

  // ── Visitor: MetaRequest ──────────────────────────────────────────────────

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
    final handler = r.params != null
        ? refer('Future<Object?> Function(Object? params)')
        : refer('Future<Object?> Function()');

    return Method((b) {
      b
        ..docs.addAll(
          _methodDocs(r.method, r.documentation, r.messageDirection),
        )
        ..name = 'on${name.upperFirstLetter()}Request'
        ..returns = _void
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'handler'
              ..type = handler,
          ),
        );
    });
  }

  Method _sendRequestMethod(String name, MetaRequest r) => Method((b) {
    b
      ..docs.addAll(_methodDocs(r.method, r.documentation, r.messageDirection))
      ..name = 'send${name.upperFirstLetter()}Request'
      ..returns = _futureObject;

    if (r.params != null) {
      b.requiredParameters.add(
        Parameter(
          (p) => p
            ..name = 'params'
            ..type = _object,
        ),
      );
    }
  });

  // ── Visitor: MetaNotification ─────────────────────────────────────────────

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
    final handler = n.params != null
        ? refer('Future<void> Function(Object? params)')
        : refer('Future<void> Function()');

    return Method((b) {
      b
        ..docs.addAll(
          _methodDocs(n.method, n.documentation, n.messageDirection),
        )
        ..name = 'on${name.upperFirstLetter()}Notification'
        ..returns = _void
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'handler'
              ..type = handler,
          ),
        );
    });
  }

  Method _sendNotificationMethod(String name, MetaNotification n) => Method((
    b,
  ) {
    b
      ..docs.addAll(_methodDocs(n.method, n.documentation, n.messageDirection))
      ..name = 'send${name.upperFirstLetter()}Notification'
      ..returns = _void;

    if (n.params != null) {
      b.requiredParameters.add(
        Parameter(
          (p) => p
            ..name = 'params'
            ..type = _object,
        ),
      );
    }
  });

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

  // ── Docs ──────────────────────────────────────────────────────────────────

  List<String> _interfaceDocs() => [
    '/// Abstract LSP connection interface.',
    '///',
    '/// Naming conventions (from the server perspective):',
    '///',
    '/// - clientToServer request      → `on<Name>Request`',
    '/// - serverToClient request      → `send<Name>Request`',
    '/// - clientToServer notification → `on<Name>Notification`',
    '/// - serverToClient notification → `send<Name>Notification`',
    '///',
    '/// All parameter/result types are Object placeholders.',
  ];

  List<String> _methodDocs(
    String method,
    String? doc,
    MessageDirection direction,
  ) => [
    '/// **`$method`** — `${direction.messageDirection}`',
    if (doc != null && doc.isNotEmpty) ...['///', ...doc.asDoc()],
  ];

  // ── Helpers ───────────────────────────────────────────────────────────────

  /// Converts `textDocument/implementation` → `textDocumentImplementation`.
  String _camelName(String method) => method
      .replaceAll(r'$/', '')
      .split('/')
      .map((p) => p.upperFirstLetter())
      .join()
      .lowerFirstLetter();
}
