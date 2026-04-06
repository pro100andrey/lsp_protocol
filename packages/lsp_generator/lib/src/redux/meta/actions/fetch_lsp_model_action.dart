import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../common.dart';
import '../../models/protocol.dart';

final class FetchLSPModelAction extends BaseAction {
  @override
  Future<AppState> reduce() async {
    final version = select.lspVersion;

    final downloadProgress = logger.progress(
      'Downloading LSP meta-model for version $version...',
    );

    final response = await http.get(select.lspMetaModelUri);

    if (response.statusCode == 200) {
      downloadProgress.complete('Successfully downloaded');
    } else {
      downloadProgress.fail('Failed to download: ${response.statusCode}');

      throw ReduxException(
        message: 'Failed to download LSP meta-model for version $version.',
        reason: 'HTTP status code: ${response.statusCode}',
        exitCode: ReduxException.exIO,
      );
    }

    final parserProgress = logger.progress('Parsing LSP meta-model...');

    try {
      final body = response.body;
      final jsonData = jsonDecode(body) as Map<String, dynamic>;
      final meta = MetaProtocol.fromJson(jsonData);

      parserProgress.complete('Successfully parsed');

      return state.copyWith.meta(protocol: meta);
    } catch (e) {
      parserProgress.fail('Failed to parse LSP meta-model: $e');

      throw ReduxException(
        message: 'Failed to parse LSP meta-model for version $version.',
        reason: 'JSON parsing error: $e',
        exitCode: ReduxException.exTempFail,
      );
    }
  }
}
