import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Manages workspace folders synchronized from the LSP client.
///
/// Listens for `workspace/didChangeWorkspaceFolders` notifications and
/// maintains an up-to-date list of [folders]. Call [setInitialFolders]
/// with the folders from [InitializeParams] during the `initialize` handshake.
///
/// Example:
/// ```dart
/// final manager = WorkspaceFoldersManager();
/// server.registerFeature(manager);
///
/// server.general.onInitialize((params, context) async {
///   manager.setInitialFolders(params.workspaceFolders);
///   // ...
/// });
///
/// manager.onChange.listen((folders) {
///   print('Current folders: ${folders.map((f) => f.name).join(', ')}');
/// });
/// ```
final class WorkspaceFoldersManager extends LspFeature {
  WorkspaceFoldersManager();

  final _folders = <WorkspaceFolder>[];
  final _didChangeController =
      StreamController<List<WorkspaceFolder>>.broadcast();
  void Function()? _registration;

  /// The currently known workspace folders.
  ///
  /// Returns an unmodifiable view, use [onChange] to listen for updates.
  List<WorkspaceFolder> get folders => List.unmodifiable(_folders);

  /// Emits the updated folder list whenever folders are added or removed
  /// by the client.
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

  /// Sets the initial workspace folders, typically from [InitializeParams]
  /// received during the `initialize` request.
  ///
  /// Replaces any previously set folders. Call this once after
  /// `LspGeneralServerHandler.onInitialize` receives its params.
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

/// Manages dynamic file watching on the LSP client.
///
/// Uses the LSP `registerCapability`/`unregisterCapability` protocol to
/// dynamically register [FileSystemWatcher] patterns at runtime.
/// Check [isSupported] before calling [register] — it returns `false` if
/// the client doesn't declare `dynamicRegistration` for
/// `didChangeWatchedFiles` or if [InitializeParams] hasn't been registered
/// yet.
///
/// Example:
/// ```dart
/// final manager = WatchedFilesManager(server);
///
/// if (manager.isSupported) {
///   final id = await manager.register(
///     watchers: [
///       const FileSystemWatcher(
///         globPattern: '**/*.txt',
///         kind: WatchKind(7), // Create | Change | Delete
///       ),
///     ],
///   );
///   print('Registered watcher: $id');
/// }
/// ```
final class WatchedFilesManager {
  WatchedFilesManager(this._server);

  final LspServer _server;
  var _registrationIdCounter = 0;

  /// Whether the client supports dynamic registration of file watchers.
  ///
  /// Returns `false` if:
  /// - [InitializeParams] hasn't been registered on the connection yet
  /// - The client's `workspace.didChangeWatchedFiles.dynamicRegistration`
  ///   capability is `null` or `false`.
  ///
  /// Call `server.register(params)` in `LspGeneralServerHandler.onInitialize`
  /// before checking this property.
  bool get isSupported {
    final params = _server.connection.tryResolve<InitializeParams>();
    if (params == null) {
      return false;
    }

    return params
            .capabilities
            .workspace
            ?.didChangeWatchedFiles
            ?.dynamicRegistration ??
        false;
  }

  /// Registers [watchers] patterns on the client via dynamic registration.
  ///
  /// Returns a registration ID string for later use with [unregister].
  ///
  /// Throws [UnsupportedError] if the client doesn't support dynamic
  /// registration — check [isSupported] first.
  ///
  /// Example:
  /// ```dart
  /// final id = await manager.register(
  ///   watchers: [
  ///     const FileSystemWatcher(
  ///       globPattern: '**/*.dart',
  ///       kind: WatchKind(7),
  ///     ),
  ///   ],
  /// );
  /// ```
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

  /// Unregisters a previously registered file watcher by its [registrationId].
  ///
  /// The [registrationId] is returned from [register].
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
