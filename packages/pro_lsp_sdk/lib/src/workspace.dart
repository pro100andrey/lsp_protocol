import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Manages dynamic workspace folders synchronized from the client.
final class WorkspaceFoldersManager extends LspFeature {
  WorkspaceFoldersManager();

  final _folders = <WorkspaceFolder>[];
  final _didChangeController =
      StreamController<List<WorkspaceFolder>>.broadcast();
  void Function()? _registration;

  /// Gets the currently open workspace folders.
  List<WorkspaceFolder> get folders => List.unmodifiable(_folders);

  /// A stream that emits the list of workspace folders whenever they change.
  Stream<List<WorkspaceFolder>> get onChange => _didChangeController.stream;

  @override
  void register(LspServer server) {
    if (_registration != null) {
      return;
    }

    _registration = server.workspace.onDidChangeWorkspaceFolders((
      params,
      context,
    ) async {
      final added = params.event.added;
      final removed = params.event.removed;

      _folders
        ..removeWhere((f) => removed.any((r) => r.uri == f.uri))
        ..addAll(added);

      _didChangeController.add(folders);
    });
  }

  /// Sets the initial folders, e.g. after the initialize request handshake.
  void setInitialFolders(List<WorkspaceFolder>? initialFolders) {
    _folders.clear();

    if (initialFolders != null) {
      _folders.addAll(initialFolders);
    }
  }

  @override
  FutureOr<void> dispose() async {
    _registration?.call();
    _registration = null;
    await _didChangeController.close();
  }
}

/// Manages file watching dynamically on the client.
final class WatchedFilesManager {
  WatchedFilesManager(this._server);

  final LspServer _server;
  var _registrationIdCounter = 0;

  /// Whether dynamic registration of watched files is supported by the client.
  ///
  /// Requires [InitializeParams] to be registered in the server's connection
  /// locator (e.g. `server.register(params)` in `onInitialize`).
  bool get isSupported {
    final params = _server.connection.tryResolve<InitializeParams>();
    if (params == null) {
      return false; // Fail-safe fallback to false if we cannot check
    }

    return params
            .capabilities
            .workspace
            ?.didChangeWatchedFiles
            ?.dynamicRegistration ??
        false;
  }

  /// Registers a list of file watch patterns on the client.
  ///
  /// Returns a registration ID string that can be used to unregister later.
  /// Throws [UnsupportedError] if the client does not support dynamic
  /// registration.
  Future<String> register({
    required List<FileSystemWatcher> watchers,
  }) async {
    if (!isSupported) {
      throw UnsupportedError(
        'Client does not support dynamic registration of watched files.',
      );
    }
    
    final registrationId = 'dynamic-watcher-${_registrationIdCounter++}';
    await _server.client.client.registerCapability(
      .new(
        registrations: [
          .new(
            id: registrationId,
            method: NotificationMethod.didChangeWatchedFiles.value,
            registerOptions: LSPAny.fromJson(
              DidChangeWatchedFilesRegistrationOptions(watchers: watchers),
            ),
          ),
        ],
      ),
    );

    return registrationId;
  }

  /// Unregisters a watched files capability by its [registrationId].
  Future<void> unregister(String registrationId) async {
    await _server.client.client.unregisterCapability(
      .new(
        unregisterations: [
          .new(
            id: registrationId,
            method: NotificationMethod.didChangeWatchedFiles.value,
          ),
        ],
      ),
    );
  }
}
