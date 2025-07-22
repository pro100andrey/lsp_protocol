// ignore_for_file: avoid_print

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
  // await cleanUp();
}

ArgParser _argParser() {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', help: 'Show this help message');

  return parser;
}
