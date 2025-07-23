// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:generate/generate.dart';
import 'package:generate/src/visiters/generator_visitor.dart';

Future<void> main(List<String> args) async {
  final parser = _argParser();
  final argsResult = parser.parse(args);
  final help = argsResult['help'] as bool;

  if (help) {
    print(parser.usage);
    return;
  }

  await downloadLSPSpecAndLicense();

  final meta = await loadLSPMeta();
  final protocol = MetaProtocol.fromJson(meta);

  final generator = ProtocolGenerator(protocol);
  final code = generator.generate();

  final outputFile = resolvePath('../lib/src/generated/protocol.dart');
  await createDirectoryForFilePath(outputFile);
  await writeToFile(code, outputFile);

  // Run dart run build_runner build --delete-conflicting-outputs
  await runBuildRunner();

  // await cleanUp();
}

Future<void> runBuildRunner() async {
  final result = await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    workingDirectory: '../'
  );

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
