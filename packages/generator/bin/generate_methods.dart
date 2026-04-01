import 'package:args/args.dart';
import 'package:generator/generator.dart';

Future<void> main(List<String> args) async {
  final parser = _argParser();
  final argsResult = parser.parse(args);

  if (argsResult['help'] as bool) {
    print(parser.usage);
    return;
  }

  final workDir = argsResult['work_dir'] as String;
  final protocol = await downloadAndParseLSP();
  final code = const MethodEnumGenerator().generate(protocol);

  final outputFile = resolvePath(
    '$workDir/lib/src/generated/methods.dart',
  );
  await createDirectoryForFilePath(outputFile);
  await writeToFile(code, outputFile);
  print('✅ Generated $outputFile');
}

ArgParser _argParser() => ArgParser()
  ..addFlag('help', abbr: 'h', help: 'Show this help message')
  ..addOption(
    'work_dir',
    abbr: 'w',
    help: 'Target package directory',
    defaultsTo: '../lsp_protocol',
  );
