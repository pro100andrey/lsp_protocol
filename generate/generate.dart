// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:args/args.dart';
import 'package:http/http.dart';

Future<void> main(List<String> args) async {
  final parser = _argParser();
  final argsResult = parser.parse(args);
  final help = argsResult['help'] as bool;

  if (help) {
    print(parser.usage);
  }

  final version = argsResult['version'] as String;
  final specUri = _specUri(version);
  print('Downloading LSP spec from $specUri');
  final result = await _downloadLSPSpec(specUri);

  print('LSP spec downloaded successfully:');
  print(result);
}

Future<Map<String, dynamic>> _downloadLSPSpec(Uri uri) async {
  print('Downloading from $uri');
  final watch = Stopwatch()..start();

  final response = await get(uri);
  watch.stop();
  print('Download completed in ${watch.elapsedMilliseconds} ms');

  if (response.statusCode == 200) {
    return json.decode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to download LSP spec: ${response.reasonPhrase}');
  }
}

Uri _specUri(String version) {
  final url =
      'https://microsoft.github.io/'
      'language-server-protocol/specifications/'
      'lsp/$version/metaModel/metaModel.json';

  return Uri.parse(url);
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
