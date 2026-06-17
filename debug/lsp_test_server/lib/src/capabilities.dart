import 'package:pro_lsp/pro_lsp.dart';

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
  /// [syncKind] is the document-sync mode advertised (always with
  /// `openClose: true`). Defaults to [TextDocumentSyncKind.full].
  /// [completionResolveProvider] advertises support for
  /// `completionItem/resolve`. Defaults to `false`.
  /// [semanticTokensLegend] must be supplied to advertise semantic tokens —
  /// the legend is server-defined and cannot be inferred. When provided, the
  /// provider is announced for whichever of `full`/`range` request methods are
  /// registered.
  ServerCapabilities infer(
    List<LSPMethod> registeredMethods, {
    List<String> completionTriggerCharacters = const ['.', ':', ' '],
    bool interFileDependencies = true,
    bool workspaceDiagnostics = false,
    TextDocumentSyncKind syncKind = .full,
    bool completionResolveProvider = false,
    SemanticTokensLegend? semanticTokensLegend,
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
      textDocumentSync: .textDocumentSyncOptions(
        .new(openClose: true, change: syncKind),
      ),
      hoverProvider: allow(.hover) ? const .bool(true) : null,
      completionProvider: allow(.completion)
          ? .new(
              triggerCharacters: completionTriggerCharacters,
              resolveProvider: completionResolveProvider,
            )
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
      semanticTokensProvider:
          (semanticTokensLegend != null &&
              (allow(.full) || allow(.range) || allow(.delta)))
          ? .semanticTokensOptions(
              SemanticTokensOptions(
                legend: semanticTokensLegend,
                full: (allow(.full) || allow(.delta))
                    ? const .bool(true)
                    : null,
                range: allow(.range) ? const .bool(true) : null,
              ),
            )
          : null,
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
    TextDocumentSyncKind syncKind = .full,
    bool completionResolveProvider = false,
    SemanticTokensLegend? semanticTokensLegend,
  }) => const CapabilitiesInferer().infer(
    connection.registeredMethods.toList(growable: false),
    completionTriggerCharacters: completionTriggerCharacters,
    interFileDependencies: interFileDependencies,
    workspaceDiagnostics: workspaceDiagnostics,
    syncKind: syncKind,
    completionResolveProvider: completionResolveProvider,
    semanticTokensLegend: semanticTokensLegend,
  );
}
