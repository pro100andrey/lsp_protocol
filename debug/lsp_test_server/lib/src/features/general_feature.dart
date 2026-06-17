import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_kit/pro_lsp_kit.dart';

import 'semantic_tokens_feature.dart';
import 'shared.dart';

/// Handles connection initialization, shutdown, and exit lifecycle.
final class GeneralFeature extends LspFeature {
  GeneralFeature({
    required WorkspaceFoldersManager workspaceFoldersManager,
    required WatchedFilesManager watchedFilesManager,
    required LspDialogHelper dialogHelper,
  }) : _workspaceFoldersManager = workspaceFoldersManager,
       _watchedFilesManager = watchedFilesManager,
       _dialogHelper = dialogHelper;

  final WorkspaceFoldersManager _workspaceFoldersManager;
  final WatchedFilesManager _watchedFilesManager;
  final LspDialogHelper _dialogHelper;

  final _logger = Logger('GeneralFeature');

  @override
  void register(LspServer server) {
    server.general.onInitialize((params, context) async {
      _logger.info('${context.prefix} Received initialize request');

      // Set initial workspace folders in the manager
      _workspaceFoldersManager.setInitialFolders(params.workspaceFolders);

      // Register initialize params so WatchedFilesManager can resolve it later
      server.connection.register(params);

      // Infer capabilities from registered handlers
      final inferred = server.inferCapabilities(
        completionTriggerCharacters: ['.', ':', '_'],
      );

      // Customize capabilities with manual sync and semantic tokens
      final customized = inferred.copyWith(
        textDocumentSync: .textDocumentSyncOptions(
          const .new(change: .full, openClose: true),
        ),
        semanticTokensProvider: .semanticTokensOptions(
          const .new(
            legend: .new(
              tokenTypes: SemanticTokensFeature.legendTypes,
              tokenModifiers: SemanticTokensFeature.legendModifiers,
            ),
            full: .bool(true),
          ),
        ),
      );

      return .new(
        capabilities: customized,
        serverInfo: (name: 'lsp-test-server', version: '0.2.0'),
      );
    });

    server.general.onInitialized((_, context) async {
      _logger.info('${context.prefix} Received initialized notification');

      // Send a welcome dialog message to the user via LspDialogHelper
      _dialogHelper.showMessage(
        type: .info,
        message: 'Welcome to LSP Test Server powered by pro_lsp_kit!',
      );

      // Register file watching dynamically if supported
      try {
        if (_watchedFilesManager.isSupported) {
          final registrationId = await _watchedFilesManager.register(
            watchers: [
              const .new(
                globPattern: .pattern('**/*.txt'),
                kind: WatchKind(7),
              ),
            ],
          );
          _logger.info(
            '${context.prefix} Dynamically registered file watcher with ID: '
            '$registrationId',
          );
        } else {
          _logger.warning(
            '${context.prefix} Client does not support dynamic registration '
            'of watched files.',
          );
        }
      } on Object catch (e, st) {
        _logger.severe(
          '${context.prefix} Failed to dynamically register watched files '
          'capability',
          e,
          st,
        );
      }
    });

    server.general.onShutdown((context) async {
      _logger.info('${context.prefix} Received shutdown request');
    });

    server.general.onExit((context) async {
      _logger.info('${context.prefix} Received exit notification');
    });
  }
}
