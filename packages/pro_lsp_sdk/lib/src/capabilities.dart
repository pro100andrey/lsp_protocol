import 'package:pro_lsp/pro_lsp.dart';

/// Simplifies registering and unregistering server capabilities dynamically.
final class CapabilityManager {
  CapabilityManager(this._server);

  final LspServer _server;
  var _registrationIdCounter = 0;

  /// Dynamically registers a capability on the client for the specified
  /// [method].
  ///
  /// Returns a registration ID string that can be used to unregister later.
  Future<String> register({
    required String method,
    LSPAny? registerOptions,
  }) async {
    final registrationId = 'dynamic-registration-${_registrationIdCounter++}';
    await _server.client.client.registerCapability(
      .new(
        registrations: [
          .new(
            id: registrationId,
            method: method,
            registerOptions: registerOptions,
          ),
        ],
      ),
    );
    return registrationId;
  }

  /// Dynamically unregisters a capability by its [registrationId] and [method].
  Future<void> unregister({
    required String registrationId,
    required String method,
  }) async {
    await _server.client.client.unregisterCapability(
      .new(
        unregisterations: [
          .new(id: registrationId, method: method),
        ],
      ),
    );
  }
}

/// Pure utility class to infer [ServerCapabilities] based on a set of
/// registered methods.
final class CapabilitiesInferer {
  const CapabilitiesInferer();

  /// Infers [ServerCapabilities] based on the provided [registeredMethods].
  ///
  /// [completionTriggerCharacters] controls which characters automatically
  /// trigger completion requests. Defaults to `['.', ':', ' ']`.
  /// [interFileDependencies] tells the client whether diagnostics in one file
  /// can affect diagnostics in other files. Defaults to `true`.
  /// [workspaceDiagnostics] tells the client the server supports workspace-wide
  /// diagnostics. Defaults to `false`.
  ServerCapabilities infer(
    Set<LSPMethod> registeredMethods, {
    List<String> completionTriggerCharacters = const ['.', ':', ' '],
    bool interFileDependencies = true,
    bool workspaceDiagnostics = false,
  }) {
    final hasWorkspaceMethods = registeredMethods.any(
      (m) =>
          (m is NotificationMethod && m.value.startsWith('workspace/')) ||
          (m is RequestMethod && m.value.startsWith('workspace/')),
    );
    final hasFileOps = registeredMethods.any(
      (m) =>
          m == NotificationMethod.didCreateFiles ||
          m == NotificationMethod.didRenameFiles ||
          m == NotificationMethod.didDeleteFiles,
    );

    final request = registeredMethods.whereType<RequestMethod>().toList(
      growable: false,
    );
    
    bool allow(RequestMethod m) => request.contains(m);

    return ServerCapabilities(
      positionEncoding: .uTF16,
      hoverProvider: allow(.hover) ? const .bool(true) : null,
      completionProvider: allow(.completion)
          ? .new(triggerCharacters: completionTriggerCharacters)
          : null,
      definitionProvider: allow(.definition) ? const .bool(true) : null,
      typeDefinitionProvider: allow(.typeDefinition) ? const .bool(true) : null,
      implementationProvider: allow(.implementation) ? const .bool(true) : null,
      referencesProvider: allow(.references) ? const .bool(true) : null,
      documentHighlightProvider: allow(.documentHighlight)
          ? const .bool(true)
          : null,
      documentSymbolProvider: allow(.documentSymbol) ? const .bool(true) : null,
      codeActionProvider: allow(.codeAction)
          ? .codeActionOptions(const .new(codeActionKinds: []))
          : null,
      documentFormattingProvider: allow(.formatting) ? const .bool(true) : null,
      documentRangeFormattingProvider: allow(.rangeFormatting)
          ? const .bool(true)
          : null,
      renameProvider: allow(.rename) ? const .bool(true) : null,
      foldingRangeProvider: allow(.foldingRange) ? const .bool(true) : null,
      selectionRangeProvider: allow(.selectionRange) ? const .bool(true) : null,
      callHierarchyProvider: allow(.prepareCallHierarchy)
          ? const .bool(true)
          : null,
      typeHierarchyProvider: allow(.prepareTypeHierarchy)
          ? const .bool(true)
          : null,
      inlineValueProvider: allow(.inlineValue) ? const .bool(true) : null,
      inlayHintProvider: allow(.inlayHint) ? const .bool(true) : null,
      diagnosticProvider: allow(.textDocumentDiagnostic)
          ? .diagnosticOptions(
              .new(
                interFileDependencies: interFileDependencies,
                workspaceDiagnostics: workspaceDiagnostics,
              ),
            )
          : null,

      workspace: hasWorkspaceMethods
          ? (
              workspaceFolders: const .new(supported: true),
              fileOperations: hasFileOps
                  ? .new(
                      didCreate: _fileOpRegistration('**/*'),
                      didRename: _fileOpRegistration('**/*'),
                      didDelete: _fileOpRegistration('**/*'),
                    )
                  : null,
            )
          : null,
    );
  }

  FileOperationRegistrationOptions _fileOpRegistration(String glob) => .new(
    filters: [
      .new(
        pattern: .new(glob: glob, matches: .file),
      ),
    ],
  );
}

extension LspServerCapabilities on LspServer {
  /// Infers [ServerCapabilities] based on the handlers currently registered
  /// on the server.
  ///
  /// This is useful during `initialize` to automatically announce supported
  /// features to the client without manual synchronization of capabilities.
  ///
  /// [completionTriggerCharacters] controls which characters automatically
  /// trigger completion requests. Defaults to `['.', ':', ' ']`.
  /// [interFileDependencies] tells the client whether diagnostics in one file
  /// can affect diagnostics in other files. Defaults to `true`.
  /// [workspaceDiagnostics] tells the client the server supports workspace-wide
  /// diagnostics. Defaults to `false`.
  ServerCapabilities inferCapabilities({
    List<String> completionTriggerCharacters = const ['.', ':', ' '],
    bool interFileDependencies = true,
    bool workspaceDiagnostics = false,
  }) => const CapabilitiesInferer().infer(
    connection.registeredMethods,
    completionTriggerCharacters: completionTriggerCharacters,
    interFileDependencies: interFileDependencies,
    workspaceDiagnostics: workspaceDiagnostics,
  );
}
