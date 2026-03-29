import 'package:generator/generator.dart';

/// Quick manual test for [PrettyPrinter].
///
/// Run from the generator package root:
///   dart run bin/pretty_print.dart
Future<void> main() async {
  final protocol = await downloadAndParseLSP();
  const printer = PrettyPrinter();

  _section('METADATA');
  print(printer.visitMetaData(protocol.metaData));

  _section('REQUESTS (${protocol.requests.length})');
  for (final r in protocol.requests) {
    print(printer.visitMetaRequest(r));
    print('');
  }

  _section('NOTIFICATIONS (${protocol.notifications.length})');
  for (final n in protocol.notifications) {
    print(printer.visitMetaNotification(n));
    print('');
  }

  _section('ENUMERATIONS (${protocol.enumerations.length})');
  for (final e in protocol.enumerations) {
    print(printer.visitMetaEnumeration(e));
    print('');
  }

  _section('TYPE ALIASES (${protocol.typeAliases.length})');
  for (final t in protocol.typeAliases) {
    print(printer.visitMetaTypeAlias(t));
    print('');
  }
}

void _section(String title) {
  print('\n${'─' * 60}');
  print(' $title');
  print('─' * 60);
}
