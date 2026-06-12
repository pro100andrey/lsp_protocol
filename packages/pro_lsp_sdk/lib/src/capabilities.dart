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
      RegistrationParams(
        registrations: [
          Registration(
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
      UnregistrationParams(
        unregisterations: [
          Unregistration(
            id: registrationId,
            method: method,
          ),
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

    return ServerCapabilities(
      positionEncoding: PositionEncodingKind.uTF16,
      hoverProvider: registeredMethods.contains(RequestMethod.hover)
          ? const ServerCapabilitiesHoverProvider(true)
          : null,
      completionProvider: registeredMethods.contains(RequestMethod.completion)
          ? CompletionOptions(
              triggerCharacters: completionTriggerCharacters,
            )
          : null,
      definitionProvider: registeredMethods.contains(RequestMethod.definition)
          ? const ServerCapabilitiesDefinitionProvider(true)
          : null,
      typeDefinitionProvider:
          registeredMethods.contains(RequestMethod.typeDefinition)
          ? const ServerCapabilitiesTypeDefinitionProvider(true)
          : null,
      implementationProvider:
          registeredMethods.contains(RequestMethod.implementation)
          ? const ServerCapabilitiesImplementationProvider(true)
          : null,
      referencesProvider: registeredMethods.contains(RequestMethod.references)
          ? const ServerCapabilitiesReferencesProvider(true)
          : null,
      documentHighlightProvider:
          registeredMethods.contains(RequestMethod.documentHighlight)
          ? const ServerCapabilitiesDocumentHighlightProvider(true)
          : null,
      documentSymbolProvider:
          registeredMethods.contains(RequestMethod.documentSymbol)
          ? const ServerCapabilitiesDocumentSymbolProvider(true)
          : null,
      codeActionProvider: registeredMethods.contains(RequestMethod.codeAction)
          ? const ServerCapabilitiesCodeActionProvider(
              CodeActionOptions(codeActionKinds: []),
            )
          : null,
      documentFormattingProvider:
          registeredMethods.contains(RequestMethod.formatting)
          ? const ServerCapabilitiesDocumentFormattingProvider(true)
          : null,
      documentRangeFormattingProvider:
          registeredMethods.contains(RequestMethod.rangeFormatting)
          ? const ServerCapabilitiesDocumentRangeFormattingProvider(true)
          : null,
      renameProvider: registeredMethods.contains(RequestMethod.rename)
          ? const ServerCapabilitiesRenameProvider(true)
          : null,
      foldingRangeProvider:
          registeredMethods.contains(RequestMethod.foldingRange)
          ? const ServerCapabilitiesFoldingRangeProvider(true)
          : null,
      selectionRangeProvider:
          registeredMethods.contains(RequestMethod.selectionRange)
          ? const ServerCapabilitiesSelectionRangeProvider(true)
          : null,
      callHierarchyProvider:
          registeredMethods.contains(RequestMethod.prepareCallHierarchy)
          ? const ServerCapabilitiesCallHierarchyProvider(true)
          : null,
      typeHierarchyProvider:
          registeredMethods.contains(RequestMethod.prepareTypeHierarchy)
          ? const ServerCapabilitiesTypeHierarchyProvider(true)
          : null,
      inlineValueProvider: registeredMethods.contains(RequestMethod.inlineValue)
          ? const ServerCapabilitiesInlineValueProvider(true)
          : null,
      inlayHintProvider: registeredMethods.contains(RequestMethod.inlayHint)
          ? const ServerCapabilitiesInlayHintProvider(true)
          : null,
      diagnosticProvider:
          registeredMethods.contains(RequestMethod.textDocumentDiagnostic)
          ? ServerCapabilitiesDiagnosticProvider(
              DiagnosticOptions(
                interFileDependencies: interFileDependencies,
                workspaceDiagnostics: workspaceDiagnostics,
              ),
            )
          : null,

      workspace: hasWorkspaceMethods
          ? (
              workspaceFolders: const WorkspaceFoldersServerCapabilities(
                supported: true,
              ),
              fileOperations: hasFileOps
                  ? FileOperationOptions(
                      didCreate: _fileOpRegistration('**/*'),
                      didRename: _fileOpRegistration('**/*'),
                      didDelete: _fileOpRegistration('**/*'),
                    )
                  : null,
            )
          : null,
    );
  }

  FileOperationRegistrationOptions _fileOpRegistration(String glob) =>
      FileOperationRegistrationOptions(
        filters: [
          FileOperationFilter(
            pattern: FileOperationPattern(
              glob: glob,
              matches: FileOperationPatternKind.file,
            ),
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
