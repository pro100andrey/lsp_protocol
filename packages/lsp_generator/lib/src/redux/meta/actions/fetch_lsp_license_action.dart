import 'package:cli_utils/cli_utils.dart';
import 'package:http/http.dart' as http;

import '../../common.dart';

final class FetchLSPLicenseAction extends BaseAction {
  @override
  Future<AppState?> reduce() async {
    final version = select.lspVersion;

    final downloadProgress = logger.progress(
      'Downloading LSP license for version $version...',
    );

    final response = await http.get(select.lspLicenseUri);

    if (response.statusCode == 200) {
      downloadProgress.complete('Successfully downloaded');
    } else {
      downloadProgress.fail('Failed to download: ${response.statusCode}');

      throw ReduxException(
        message: 'Failed to download LSP license for version $version.',
        reason: 'HTTP status code: ${response.statusCode}',
        exitCode: ReduxException.exIO,
      );
    }

    final saveProgress = logger.progress('Saving License-code.txt...');
    final outDir = DirectoryPath(select.resolvedOutputDir);
    if (outDir.notFound) {
      outDir.create(recursive: true);
    }
    outDir.joinFile('License-code.txt').writeAsString(response.body);
    saveProgress.complete('Saved to ${outDir.path}/License-code.txt');

    return null;
  }
}
