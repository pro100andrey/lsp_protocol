import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

import '../common/cli_exception.dart';

/// Downloads the LSP protocol license from Microsoft's official repository
/// and saves it to [outputDir] as `License-code.txt`.
///
/// Fetches the license text from the specified [version] (defaults to `'3.17'`)
/// of the Language Server Protocol. Throws a [CliException] if the download
/// fails.
Future<void> fetchLSPLicense(
  String outputDir,
  Logger logger, [
  String version = '3.17',
]) async {
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

    throw CliException(
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
