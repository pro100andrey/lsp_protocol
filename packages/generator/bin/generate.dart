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

  final workDir = argsResult['work_dir'] as String;
  final code = const ProtocolGenerator().generate(await downloadAndParseLSP());

  final outputFile = resolvePath('$workDir/lib/src/generated/protocol.dart');
  await createDirectoryForFilePath(outputFile);
  await writeToFile(code, outputFile);
  await _runBuildRunner(workDir);
  await cleanUpDownloads(skip: true);
}

Future<void> _runBuildRunner(String wd) async {
  final result = await Process.run('dart', [
    'run',
    'build_runner',
    'build',
    '-d',
  ], workingDirectory: wd);

  if (result.exitCode == 0) {
    print(result.stdout);
    print('✅ build_runner completed successfully');
  } else {
    print(result.stderr.toString().isEmpty ? result.stdout : result.stderr);
    print('❌ build_runner failed with exit code ${result.exitCode}');
  }
}

ArgParser _argParser() {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', help: 'Show this help message')
    ..addOption(
      'work_dir',
      abbr: 'w',
      help: 'The working directory where the generated code will be placed',
      defaultsTo: '../lsp_protocol',
    );

  return parser;
}
