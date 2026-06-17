import 'dart:io';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp_kit/pro_lsp_kit.dart';
import 'package:stream_channel/stream_channel.dart';

import 'features/completion_feature.dart';
import 'features/definition_feature.dart';
import 'features/diagnostics_feature.dart';
import 'features/file_operations_feature.dart';
import 'features/general_feature.dart';
import 'features/hover_feature.dart';
import 'features/references_feature.dart';
import 'features/semantic_tokens_feature.dart';
import 'features/symbols_feature.dart';

/// Registers all LSP handlers and features.
///
/// Usage:
///
///     // stdio (default)
///     final runner = ServerRunner();
///     await runner.run();
///
///     // TCP socket
///     final runner = ServerRunner.fromChannel(channel);
///     await runner.run();
final class ServerRunner {
  ServerRunner()
    : _server = .new(),
      _docService = .new() {
    _initManagers();
  }

  /// Creates a server backed by an arbitrary byte [channel] (e.g. a TCP
  /// socket).
  ServerRunner.fromChannel(StreamChannel<List<int>> channel)
    : _server = .fromChannel(channel),
      _docService = .new() {
    _initManagers();
  }

  final LspServer _server;
  final TextDocumentManager _docService;

  late final ClientLoggingFeature _clientLogging;
  late final FileLoggingFeature _fileLogger;
  late final DiagnosticsManager _diagnosticsManager;
  late final LspConfigurationManager _configManager;
  late final WorkspaceFoldersManager _workspaceFoldersManager;
  late final WatchedFilesManager _watchedFilesManager;
  late final WorkDoneProgressManager _progressManager;
  late final LspDialogHelper _dialogHelper;

  void _initManagers() {
    _clientLogging = .new();
    _fileLogger = .new(logFile: File('.lsp_server.log'));
    _diagnosticsManager = .new();
    _configManager = .new();
    _workspaceFoldersManager = .new();
    _watchedFilesManager = .new(_server);
    _progressManager = .new();
    _dialogHelper = .new();

    // Register LspFeatures on the server so they get automated register/dispose lifecycle
    _server
      ..registerFeature(_clientLogging)
      ..registerFeature(_fileLogger)
      ..registerFeature(_diagnosticsManager)
      ..registerFeature(_configManager)
      ..registerFeature(_workspaceFoldersManager)
      ..registerFeature(_progressManager)
      ..registerFeature(_dialogHelper)
      ..registerFeature(_docService)
      ..registerFeature(GeneralFeature(
        workspaceFoldersManager: _workspaceFoldersManager,
        watchedFilesManager: _watchedFilesManager,
        dialogHelper: _dialogHelper,
      ))
      ..registerFeature(HoverFeature(docService: _docService))
      ..registerFeature(CompletionFeature(
        docService: _docService,
      ))
      ..registerFeature(DefinitionFeature(
        docService: _docService,
        progressManager: _progressManager,
      ))
      ..registerFeature(ReferencesFeature(
        docService: _docService,
        progressManager: _progressManager,
      ))
      ..registerFeature(SymbolsFeature(docService: _docService))
      ..registerFeature(SemanticTokensFeature(docService: _docService))
      ..registerFeature(FileOperationsFeature())
      ..registerFeature(DiagnosticsFeature(
        docService: _docService,
        diagnosticsManager: _diagnosticsManager,
        configManager: _configManager,
      ));
  }

  /// Starts listening on stdio/channel.
  Future<void> run() async {
    await _server.listen();
  }
}
