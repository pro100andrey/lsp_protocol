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
  }) {
    final methods = connection.registeredMethods;
    final hasWorkspaceMethods = methods.any(
      (m) =>
          (m is NotificationMethod && m.value.startsWith('workspace/')) ||
          (m is RequestMethod && m.value.startsWith('workspace/')),
    );
    final hasFileOps = methods.any(
      (m) =>
          m == NotificationMethod.didCreateFiles ||
          m == NotificationMethod.didRenameFiles ||
          m == NotificationMethod.didDeleteFiles,
    );

    return ServerCapabilities(
      positionEncoding: PositionEncodingKind.uTF16,
      hoverProvider: methods.contains(RequestMethod.hover)
          ? const ServerCapabilitiesHoverProvider(true)
          : null,
      completionProvider: methods.contains(RequestMethod.completion)
          ? CompletionOptions(
              triggerCharacters: completionTriggerCharacters,
            )
          : null,
      definitionProvider: methods.contains(RequestMethod.definition)
          ? const ServerCapabilitiesDefinitionProvider(true)
          : null,
      typeDefinitionProvider:
          methods.contains(RequestMethod.typeDefinition)
          ? const ServerCapabilitiesTypeDefinitionProvider(true)
          : null,
      implementationProvider:
          methods.contains(RequestMethod.implementation)
          ? const ServerCapabilitiesImplementationProvider(true)
          : null,
      referencesProvider: methods.contains(RequestMethod.references)
          ? const ServerCapabilitiesReferencesProvider(true)
          : null,
      documentHighlightProvider:
          methods.contains(RequestMethod.documentHighlight)
          ? const ServerCapabilitiesDocumentHighlightProvider(true)
          : null,
      documentSymbolProvider:
          methods.contains(RequestMethod.documentSymbol)
          ? const ServerCapabilitiesDocumentSymbolProvider(true)
          : null,
      codeActionProvider: methods.contains(RequestMethod.codeAction)
          ? const ServerCapabilitiesCodeActionProvider(
              CodeActionOptions(codeActionKinds: []),
            )
          : null,
      documentFormattingProvider:
          methods.contains(RequestMethod.formatting)
          ? const ServerCapabilitiesDocumentFormattingProvider(true)
          : null,
      documentRangeFormattingProvider:
          methods.contains(RequestMethod.rangeFormatting)
          ? const ServerCapabilitiesDocumentRangeFormattingProvider(true)
          : null,
      renameProvider: methods.contains(RequestMethod.rename)
          ? const ServerCapabilitiesRenameProvider(true)
          : null,
      foldingRangeProvider: methods.contains(RequestMethod.foldingRange)
          ? const ServerCapabilitiesFoldingRangeProvider(true)
          : null,
      selectionRangeProvider:
          methods.contains(RequestMethod.selectionRange)
          ? const ServerCapabilitiesSelectionRangeProvider(true)
          : null,
      callHierarchyProvider:
          methods.contains(RequestMethod.prepareCallHierarchy)
          ? const ServerCapabilitiesCallHierarchyProvider(true)
          : null,
      typeHierarchyProvider:
          methods.contains(RequestMethod.prepareTypeHierarchy)
          ? const ServerCapabilitiesTypeHierarchyProvider(true)
          : null,
      inlineValueProvider: methods.contains(RequestMethod.inlineValue)
          ? const ServerCapabilitiesInlineValueProvider(true)
          : null,
      inlayHintProvider: methods.contains(RequestMethod.inlayHint)
          ? const ServerCapabilitiesInlayHintProvider(true)
          : null,
      diagnosticProvider:
          methods.contains(RequestMethod.textDocumentDiagnostic)
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
