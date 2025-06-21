// ignore_for_file: avoid_print

import 'package:args/args.dart';
import 'package:generate/src/lsp_source.dart';
import 'package:generate/src/meta/protocol.dart';

Future<void> main(List<String> args) async {
  final parser = _argParser();
  final argsResult = parser.parse(args);
  final help = argsResult['help'] as bool;

  if (help) {
    print(parser.usage);
    return;
  }

  final version = argsResult['version'] as String;

  await downloadLSPSpecAndLicense(version);

  final meta = await loadLSPMeta(version);

  final protocol = LSPProtocol.fromJson(meta);

  for (final request in protocol.requests) {
    if (request.result.name != null) {
      print('Result Name: ${request.result.name}');
    }
  }

  if (meta case {
    'metaData': final Map metaData,
    'requests': final List _,
    'notifications': final List _,
    'structures': final List _,
    'enumerations': final List _,
    'typeAliases': final List _,
  }) {
    print('Meta Data: $metaData');
  } else {
    print('Failed to load LSP Meta for version $version.');
    return;
  }

  print('Loaded LSP Meta for version $version:');

  // await cleanUp(version);
}

ArgParser _argParser() {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', help: 'Show this help message')
    ..addOption(
      'version',
      abbr: 'v',
      defaultsTo: '3.17',
      help: 'The version of the LSP specification to download',
    );

  return parser;
}
