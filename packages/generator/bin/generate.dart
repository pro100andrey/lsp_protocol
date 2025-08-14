// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:generator/generator.dart';

Future<void> main(List<String> args) async {
  final parser = _argParser();
  final argsResult = parser.parse(args);
  final help = argsResult['help'] as bool;

  if (help) {
    print(parser.usage);
    return;
  }

  final metaProtocol = await downloadAndParseLSP();

  const generator = ProtocolGenerator();
  final code = generator.generate(metaProtocol);

  final outputFile = resolvePath(
    '../lsp_protocol/lib/src/generated/protocol.dart',
  );
  await createDirectoryForFilePath(outputFile);
  await writeToFile(code, outputFile);

  await runBuildRunner();

  await cleanUpDownloads(skip: true);
}

Future<void> runBuildRunner() async {
  final result = await Process.run('dart', [
    'run',
    'build_runner',
    'build',
    '-d',
  ], workingDirectory: '../lsp_protocol');

  if (result.exitCode == 0) {
    print(result.stdout);
    print('✅ build_runner completed successfully');
  } else {
    print(result.stderr);
    print('❌ build_runner failed with exit code ${result.exitCode}');
  }
}

ArgParser _argParser() {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', help: 'Show this help message');

  return parser;
}
