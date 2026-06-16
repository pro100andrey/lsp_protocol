import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';

import 'shared.dart';

/// Handles workspace file operation notifications and requests.
final class FileOperationsFeature extends LspFeature {
  final _logger = Logger('FileOperationsFeature');

  @override
  void register(LspServer server) {
    server.workspace.onWillCreateFiles((params, context) async {
      _logger.info(
        '${context.prefix} Files will be created: '
        '${params.files.map((f) => f.uri).join(', ')}',
      );
      return const .new();
    });

    server.workspace.onWillRenameFiles((params, context) async {
      final filesStr =
          params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ');
      _logger.info('${context.prefix} Files will be renamed: $filesStr');
      return const .new();
    });

    server.workspace.onWillDeleteFiles((params, context) async {
      _logger.info(
        '${context.prefix} Files will be deleted: '
        '${params.files.map((f) => f.uri).join(', ')}',
      );
      return const .new();
    });

    server.workspace.onDidCreateFiles((params, context) async {
      _logger.info(
        '${context.prefix} Files created: '
        '${params.files.map((f) => f.uri).join(', ')}',
      );
    });

    server.workspace.onDidRenameFiles((params, context) async {
      final filesStr =
          params.files.map((f) => '${f.oldUri} -> ${f.newUri}').join(', ');
      _logger.info('${context.prefix} Files renamed: $filesStr');
    });

    server.workspace.onDidDeleteFiles((params, context) async {
      _logger.info(
        '${context.prefix} Files deleted: '
        '${params.files.map((f) => f.uri).join(', ')}',
      );
    });
  }
}
