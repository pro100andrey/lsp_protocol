import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

import '../common/cli_exception.dart';
import '../models/protocol.dart';

/// Downloads the LSP meta-model from Microsoft's official repository,
/// parses it into a [MetaProtocol], and saves the raw JSON to [outputDir].
///
/// Fetches the meta-model JSON from the specified [version] (defaults to
/// `'3.17'`) of the Language Server Protocol specification. The parsed
/// [MetaProtocol] is returned, and the raw `metaModel.json` is saved to
/// the output directory for reference.
///
/// Throws a [CliException] if the download or parsing fails.
Future<MetaProtocol> fetchLSPModel(
  String outputDir,
  Logger logger, [
  String version = '3.17',
]) async {
  final downloadProgress = logger.progress(
    'Downloading LSP meta-model for version $version...',
  );

  final uri = Uri.parse(
    'https://microsoft.github.io/language-server-protocol/specifications/lsp/$version/metaModel/metaModel.json',
  );

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    downloadProgress.complete('Successfully downloaded');
  } else {
    downloadProgress.fail('Failed to download: ${response.statusCode}');

    throw CliException(
      'Failed to download LSP meta-model for version $version.',
      reason: 'HTTP status code: ${response.statusCode}',
      code: 1,
    );
  }

  final parserProgress = logger.progress('Parsing LSP meta-model...');

  try {
    final body = response.body;
    final jsonData = jsonDecode(body) as Map<String, dynamic>;
    final meta = MetaProtocol.fromJson(jsonData);

    parserProgress.complete('Successfully parsed');

    final saveProgress = logger.progress('Saving metaModel.json...');
    final outDir = Directory(outputDir);
    if (!outDir.existsSync()) {
      outDir.createSync(recursive: true);
    }
    File(p.join(outDir.path, 'metaModel.json')).writeAsStringSync(body);
    saveProgress.complete('Saved to ${outDir.path}/metaModel.json');

    return meta;
  } catch (e) {
    parserProgress.fail('Failed to parse LSP meta-model: $e');

    throw CliException(
      'Failed to parse LSP meta-model for version $version.',
      reason: 'JSON parsing error: $e',
      code: 1,
    );
  }
}
