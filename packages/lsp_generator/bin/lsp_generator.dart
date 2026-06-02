import 'dart:io';

import 'package:lsp_generator/lsp_generator.dart';

Future<void> main(List<String> args) async {
  final exitCode = await run(args);

  exit(exitCode);
}
