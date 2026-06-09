import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

import '../common/user_exception.dart';

Future<void> fetchLSPLicense(
  String version,
  String outputDir,
  Logger logger,
) async {
  final downloadProgress = logger.progress(
    'Downloading LSP license for version $version...',
  );

  final uri = Uri.parse(
    'https://microsoft.github.io/language-server-protocol/License-code.txt',
  );

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    downloadProgress.complete('Successfully downloaded');
  } else {
    downloadProgress.fail('Failed to download: ${response.statusCode}');

    throw UserException(
      'Failed to download LSP license for version $version.',
      reason: 'HTTP status code: ${response.statusCode}',
      code: 1,
    );
  }

  final saveProgress = logger.progress('Saving License-code.txt...');
  final outDir = Directory(outputDir);
  if (!outDir.existsSync()) {
    outDir.createSync(recursive: true);
  }

  final filePath = p.join(outDir.path, 'License-code.txt');
  File(filePath).writeAsStringSync(response.body);
  
  saveProgress.complete('Saved to $filePath');
}
