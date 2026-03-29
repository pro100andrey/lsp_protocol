import '../meta/protocol.dart';
import 'visitor.dart';

/// A visitor that produces a human-readable representation of MetaProtocol
/// model objects.
///
/// Usage:
/// ```dart
/// const printer = PrettyPrinter();
/// print(printer.visitMetaData(protocol.metaData));
/// protocol.requests.forEach((r) => print(printer.visitMetaRequest(r)));
/// protocol.notifications
///     .forEach((n) => print(printer.visitMetaNotification(n)));
/// protocol.enumerations
///     .forEach((e) => print(printer.visitMetaEnumeration(e)));
/// protocol.typeAliases.forEach((t) => print(printer.visitMetaTypeAlias(t)));
/// ```
final class PrettyPrinter implements MetaProtocolVisitor<String> {
  const PrettyPrinter([this._depth = 0]);

  final int _depth;

  String get _pad => '  ' * _depth;
  PrettyPrinter get _nested => PrettyPrinter(_depth + 1);

  String _ref(MetaReference r) => r.accept(this);

  // ---- Top-level protocol sections ----------------------------------------

  @override
  String visitMetaData(MetaData data) => 'LSP version: ${data.version}';

  @override
  String visitMetaRequest(MetaRequest r) {
    final buf = StringBuffer()..writeln('${_pad}Request: ${r.method}');
    final child = _nested;
    buf.writeln(
      '${child._pad}direction: ${r.messageDirection.messageDirection}',
    );
    if (r.params case final p?) {
      buf.writeln('${child._pad}params:    ${_ref(p)}');
    }
    if (r.result case final res?) {
      buf.writeln('${child._pad}result:    ${_ref(res)}');
    }
    if (r.partialResult case final pr?) {
      buf.writeln('${child._pad}partial:   ${_ref(pr)}');
    }
    if (r.errorData case final ed?) {
      buf.writeln('${child._pad}errorData: ${_ref(ed)}');
    }
    if (r.since case final s?) {
      buf.writeln('${child._pad}since:     $s');
    }
    if (r.documentation case final d?) {
      buf.write('${child._pad}doc:       ${_truncate(d)}');
    }
    return buf.toString().trimRight();
  }

  @override
  String visitMetaNotification(MetaNotification n) {
    final buf = StringBuffer()..writeln('${_pad}Notification: ${n.method}');
    final child = _nested;
    buf.writeln(
      '${child._pad}direction: ${n.messageDirection.messageDirection}',
    );
    if (n.params case final p?) {
      buf.writeln('${child._pad}params:    ${_ref(p)}');
    }
    if (n.since case final s?) {
      buf.writeln('${child._pad}since:     $s');
    }
    if (n.documentation case final d?) {
      buf.write('${child._pad}doc:       ${_truncate(d)}');
    }
    return buf.toString().trimRight();
  }

  @override
  String visitMetaEnumeration(MetaEnumeration e) {
    final buf = StringBuffer()
      ..writeln('${_pad}Enumeration: ${e.name} (${_ref(e.type)})');
    final child = _nested;
    for (final v in e.values) {
      buf.writeln(child.visitMetaEnumMember(v));
    }
    return buf.toString().trimRight();
  }

  @override
  String visitMetaTypeAlias(MetaTypeAlias t) {
    final buf = StringBuffer()
      ..write('${_pad}TypeAlias: ${t.name} = ${_ref(t.type)}');
    if (t.documentation case final d?) {
      buf
        ..writeln()
        ..write('${_nested._pad}doc: ${_truncate(d)}');
    }
    return buf.toString();
  }

  @override
  String visitMetaStructure(MetaStructure s) {
    final buf = StringBuffer()..writeln('${_pad}Structure: ${s.name}');
    final child = _nested;
    for (final p in s.properties) {
      buf.writeln(child.visitMetaProperty(p));
    }
    return buf.toString().trimRight();
  }

  // ---- Supporting types ---------------------------------------------------

  @override
  String visitMetaProperty(MetaProperty p) {
    final opt = p.optional ? '?' : ' ';
    return '$_pad${p.name}$opt: ${_ref(p.type)}';
  }

  @override
  String visitMetaEnumMember(MetaEnumMember m) {
    final raw = switch (m.value) {
      EnumRawValueInteger(:final raw) => raw,
      EnumRawValueString(:final raw) => '"$raw"',
    };
    return '$_pad${m.name} = $raw';
  }

  @override
  String visitMetaLiteral(MetaLiteral lit) {
    if (lit.properties.isEmpty) {
      return '{}';
    }
    final props = lit.properties
        .map((p) {
          final opt = p.optional ? '?' : '';
          return '${p.name}$opt: ${_ref(p.type)}';
        })
        .join(', ');
    return '{ $props }';
  }

  // ---- MetaReference variants ---------------------------------------------

  @override
  String visitTypeRef(TypeRef r) => r.name;

  @override
  String visitArrayRef(ArrayRef r) => 'Array<${_ref(r.element)}>';

  @override
  String visitBaseRef(BaseRef r) => r.name;

  @override
  String visitOrRef(OrRef r) => r.items.map(_ref).join(' | ');

  @override
  String visitAndRef(AndRef r) => r.items.map(_ref).join(' & ');

  @override
  String visitMapRef(MapRef r) => 'Map<${_ref(r.key)}, ${_ref(r.value)}>';

  @override
  String visitLiteralRef(LiteralRef r) => visitMetaLiteral(r.value);

  @override
  String visitStringLiteralRef(StringLiteralRef r) => '"${r.value}"';

  @override
  String visitTupleRef(TupleRef r) => '[${r.items.map(_ref).join(', ')}]';

  // ---- Helpers ------------------------------------------------------------

  static String _truncate(String s, {int max = 4086}) =>
      s.length > max ? '${s.substring(0, max - 3)}...' : s;
}
