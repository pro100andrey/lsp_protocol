// GENERATED — do not edit.

part of 'structures.dart';

/// Defines the capabilities provided by a language server.
@freezed
abstract class ServerCapabilities with _$ServerCapabilities {
  const factory ServerCapabilities({
    /// The position encoding the server picked from the encodings offered by
    /// the client via the client capability `general.positionEncodings`.
    ///
    /// If the client didn't provide any position encodings the only valid value
    /// that a server can return is 'utf-16'.
    ///
    /// If omitted it defaults to 'utf-16'.
    PositionEncodingKind? positionEncoding,

    /// Defines how text documents are synced. Is either a detailed structure
    /// defining each notification or for backwards compatibility the
    /// TextDocumentSyncKind number.
    ///
    /// Type: TextDocumentSyncOptions | TextDocumentSyncKind
    Object? textDocumentSync,

    /// Defines how notebook documents are synced.
    ///
    /// Type: NotebookDocumentSyncOptions | NotebookDocumentSyncRegistrationOptions
    Object? notebookDocumentSync,

    /// The server provides completion support.
    CompletionOptions? completionProvider,

    /// The server provides hover support.
    ///
    /// Type: bool | HoverOptions
    @_ServerCapabilitiesHoverProviderConverter()
    ServerCapabilitiesHoverProvider? hoverProvider,

    /// The server provides signature help support.
    SignatureHelpOptions? signatureHelpProvider,

    /// The server provides Goto Declaration support.
    ///
    /// Type: bool | DeclarationOptions | DeclarationRegistrationOptions
    Object? declarationProvider,

    /// The server provides goto definition support.
    ///
    /// Type: bool | DefinitionOptions
    @_ServerCapabilitiesDefinitionProviderConverter()
    ServerCapabilitiesDefinitionProvider? definitionProvider,

    /// The server provides Goto Type Definition support.
    ///
    /// Type: bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions
    Object? typeDefinitionProvider,

    /// The server provides Goto Implementation support.
    ///
    /// Type: bool | ImplementationOptions | ImplementationRegistrationOptions
    Object? implementationProvider,

    /// The server provides find references support.
    ///
    /// Type: bool | ReferenceOptions
    @_ServerCapabilitiesReferencesProviderConverter()
    ServerCapabilitiesReferencesProvider? referencesProvider,

    /// The server provides document highlight support.
    ///
    /// Type: bool | DocumentHighlightOptions
    @_ServerCapabilitiesDocumentHighlightProviderConverter()
    ServerCapabilitiesDocumentHighlightProvider? documentHighlightProvider,

    /// The server provides document symbol support.
    ///
    /// Type: bool | DocumentSymbolOptions
    @_ServerCapabilitiesDocumentSymbolProviderConverter()
    ServerCapabilitiesDocumentSymbolProvider? documentSymbolProvider,

    /// The server provides code actions. CodeActionOptions may only be
    /// specified if the client states that it supports
    /// `codeActionLiteralSupport` in its initial `initialize` request.
    ///
    /// Type: bool | CodeActionOptions
    @_ServerCapabilitiesCodeActionProviderConverter()
    ServerCapabilitiesCodeActionProvider? codeActionProvider,

    /// The server provides code lens.
    CodeLensOptions? codeLensProvider,

    /// The server provides document link support.
    DocumentLinkOptions? documentLinkProvider,

    /// The server provides color provider support.
    ///
    /// Type: bool | DocumentColorOptions | DocumentColorRegistrationOptions
    Object? colorProvider,

    /// The server provides workspace symbol support.
    ///
    /// Type: bool | WorkspaceSymbolOptions
    @_ServerCapabilitiesWorkspaceSymbolProviderConverter()
    ServerCapabilitiesWorkspaceSymbolProvider? workspaceSymbolProvider,

    /// The server provides document formatting.
    ///
    /// Type: bool | DocumentFormattingOptions
    @_ServerCapabilitiesDocumentFormattingProviderConverter()
    ServerCapabilitiesDocumentFormattingProvider? documentFormattingProvider,

    /// The server provides document range formatting.
    ///
    /// Type: bool | DocumentRangeFormattingOptions
    @_ServerCapabilitiesDocumentRangeFormattingProviderConverter()
    ServerCapabilitiesDocumentRangeFormattingProvider?
    documentRangeFormattingProvider,

    /// The server provides document formatting on typing.
    DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider,

    /// The server provides rename support. RenameOptions may only be specified
    /// if the client states that it supports `prepareSupport` in its initial
    /// `initialize` request.
    ///
    /// Type: bool | RenameOptions
    @_ServerCapabilitiesRenameProviderConverter()
    ServerCapabilitiesRenameProvider? renameProvider,

    /// The server provides folding provider support.
    ///
    /// Type: bool | FoldingRangeOptions | FoldingRangeRegistrationOptions
    Object? foldingRangeProvider,

    /// The server provides selection range support.
    ///
    /// Type: bool | SelectionRangeOptions | SelectionRangeRegistrationOptions
    Object? selectionRangeProvider,

    /// The server provides execute command support.
    ExecuteCommandOptions? executeCommandProvider,

    /// The server provides call hierarchy support.
    ///
    /// Type: bool | CallHierarchyOptions | CallHierarchyRegistrationOptions
    Object? callHierarchyProvider,

    /// The server provides linked editing range support.
    ///
    /// Type: bool | LinkedEditingRangeOptions | LinkedEditingRangeRegistrationOptions
    Object? linkedEditingRangeProvider,

    /// The server provides semantic tokens support.
    ///
    /// Type: SemanticTokensOptions | SemanticTokensRegistrationOptions
    @_ServerCapabilitiesSemanticTokensProviderConverter()
    ServerCapabilitiesSemanticTokensProvider? semanticTokensProvider,

    /// The server provides moniker support.
    ///
    /// Type: bool | MonikerOptions | MonikerRegistrationOptions
    Object? monikerProvider,

    /// The server provides type hierarchy support.
    ///
    /// Type: bool | TypeHierarchyOptions | TypeHierarchyRegistrationOptions
    Object? typeHierarchyProvider,

    /// The server provides inline values.
    ///
    /// Type: bool | InlineValueOptions | InlineValueRegistrationOptions
    Object? inlineValueProvider,

    /// The server provides inlay hints.
    ///
    /// Type: bool | InlayHintOptions | InlayHintRegistrationOptions
    Object? inlayHintProvider,

    /// The server has support for pull model diagnostics.
    ///
    /// Type: DiagnosticOptions | DiagnosticRegistrationOptions
    @_ServerCapabilitiesDiagnosticProviderConverter()
    ServerCapabilitiesDiagnosticProvider? diagnosticProvider,

    /// Inline completion options used during static registration.
    ///
    /// Type: bool | InlineCompletionOptions
    @_ServerCapabilitiesInlineCompletionProviderConverter()
    ServerCapabilitiesInlineCompletionProvider? inlineCompletionProvider,

    /// Workspace specific server capabilities.
    ({
      WorkspaceFoldersServerCapabilities? workspaceFolders,
      FileOperationOptions? fileOperations,
    })?
    workspace,

    /// Experimental server capabilities.
    LSPAny? experimental,
  }) = _ServerCapabilities;

  factory ServerCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ServerCapabilitiesFromJson(json);
}

/// Defines the capabilities provided by the client.
@freezed
abstract class ClientCapabilities with _$ClientCapabilities {
  const factory ClientCapabilities({
    /// Workspace specific client capabilities.
    WorkspaceClientCapabilities? workspace,

    /// Text document specific client capabilities.
    TextDocumentClientCapabilities? textDocument,

    /// Capabilities specific to the notebook document support.
    NotebookDocumentClientCapabilities? notebookDocument,

    /// Window specific client capabilities.
    WindowClientCapabilities? window,

    /// General client capabilities.
    GeneralClientCapabilities? general,

    /// Experimental client capabilities.
    LSPAny? experimental,
  }) = _ClientCapabilities;

  factory ClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ClientCapabilitiesFromJson(json);
}

@freezed
abstract class WorkspaceFoldersServerCapabilities
    with _$WorkspaceFoldersServerCapabilities {
  const factory WorkspaceFoldersServerCapabilities({
    /// The server has support for workspace folders
    bool? supported,

    /// Whether the server wants to receive workspace folder change
    /// notifications.
    ///
    /// If a string is provided the string is treated as an ID under which the
    /// notification is registered on the client side. The ID can be used to
    /// unregister for these events using the `client/unregisterCapability`
    /// request.
    ///
    /// Type: String | bool
    @_WorkspaceFoldersServerCapabilitiesChangeNotificationsConverter()
    WorkspaceFoldersServerCapabilitiesChangeNotifications? changeNotifications,
  }) = _WorkspaceFoldersServerCapabilities;

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceFoldersServerCapabilitiesFromJson(json);
}

/// Workspace specific client capabilities.
@freezed
abstract class WorkspaceClientCapabilities with _$WorkspaceClientCapabilities {
  const factory WorkspaceClientCapabilities({
    /// The client supports applying batch edits to the workspace by supporting
    /// the request 'workspace/applyEdit'
    bool? applyEdit,

    /// Capabilities specific to `WorkspaceEdit`s.
    WorkspaceEditClientCapabilities? workspaceEdit,

    /// Capabilities specific to the `workspace/didChangeConfiguration`
    /// notification.
    DidChangeConfigurationClientCapabilities? didChangeConfiguration,

    /// Capabilities specific to the `workspace/didChangeWatchedFiles`
    /// notification.
    DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles,

    /// Capabilities specific to the `workspace/symbol` request.
    WorkspaceSymbolClientCapabilities? symbol,

    /// Capabilities specific to the `workspace/executeCommand` request.
    ExecuteCommandClientCapabilities? executeCommand,

    /// The client has support for workspace folders.
    bool? workspaceFolders,

    /// The client supports `workspace/configuration` requests.
    bool? configuration,

    /// Capabilities specific to the semantic token requests scoped to the
    /// workspace.
    SemanticTokensWorkspaceClientCapabilities? semanticTokens,

    /// Capabilities specific to the code lens requests scoped to the workspace.
    CodeLensWorkspaceClientCapabilities? codeLens,

    /// The client has support for file notifications/requests for user
    /// operations on files.
    ///
    /// Since 3.16.0
    FileOperationClientCapabilities? fileOperations,

    /// Capabilities specific to the inline values requests scoped to the
    /// workspace.
    InlineValueWorkspaceClientCapabilities? inlineValue,

    /// Capabilities specific to the inlay hint requests scoped to the
    /// workspace.
    InlayHintWorkspaceClientCapabilities? inlayHint,

    /// Capabilities specific to the diagnostic requests scoped to the
    /// workspace.
    DiagnosticWorkspaceClientCapabilities? diagnostics,

    /// Capabilities specific to the folding range requests scoped to the
    /// workspace.
    FoldingRangeWorkspaceClientCapabilities? foldingRange,
  }) = _WorkspaceClientCapabilities;

  factory WorkspaceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceClientCapabilitiesFromJson(json);
}

/// Text document specific client capabilities.
@freezed
abstract class TextDocumentClientCapabilities
    with _$TextDocumentClientCapabilities {
  const factory TextDocumentClientCapabilities({
    /// Defines which synchronization capabilities the client supports.
    TextDocumentSyncClientCapabilities? synchronization,

    /// Capabilities specific to the `textDocument/completion` request.
    CompletionClientCapabilities? completion,

    /// Capabilities specific to the `textDocument/hover` request.
    HoverClientCapabilities? hover,

    /// Capabilities specific to the `textDocument/signatureHelp` request.
    SignatureHelpClientCapabilities? signatureHelp,

    /// Capabilities specific to the `textDocument/declaration` request.
    DeclarationClientCapabilities? declaration,

    /// Capabilities specific to the `textDocument/definition` request.
    DefinitionClientCapabilities? definition,

    /// Capabilities specific to the `textDocument/typeDefinition` request.
    TypeDefinitionClientCapabilities? typeDefinition,

    /// Capabilities specific to the `textDocument/implementation` request.
    ImplementationClientCapabilities? implementation,

    /// Capabilities specific to the `textDocument/references` request.
    ReferenceClientCapabilities? references,

    /// Capabilities specific to the `textDocument/documentHighlight` request.
    DocumentHighlightClientCapabilities? documentHighlight,

    /// Capabilities specific to the `textDocument/documentSymbol` request.
    DocumentSymbolClientCapabilities? documentSymbol,

    /// Capabilities specific to the `textDocument/codeAction` request.
    CodeActionClientCapabilities? codeAction,

    /// Capabilities specific to the `textDocument/codeLens` request.
    CodeLensClientCapabilities? codeLens,

    /// Capabilities specific to the `textDocument/documentLink` request.
    DocumentLinkClientCapabilities? documentLink,

    /// Capabilities specific to the `textDocument/documentColor` and the
    /// `textDocument/colorPresentation` request.
    DocumentColorClientCapabilities? colorProvider,

    /// Capabilities specific to the `textDocument/formatting` request.
    DocumentFormattingClientCapabilities? formatting,

    /// Capabilities specific to the `textDocument/rangeFormatting` request.
    DocumentRangeFormattingClientCapabilities? rangeFormatting,

    /// Capabilities specific to the `textDocument/onTypeFormatting` request.
    DocumentOnTypeFormattingClientCapabilities? onTypeFormatting,

    /// Capabilities specific to the `textDocument/rename` request.
    RenameClientCapabilities? rename,

    /// Capabilities specific to the `textDocument/foldingRange` request.
    FoldingRangeClientCapabilities? foldingRange,

    /// Capabilities specific to the `textDocument/selectionRange` request.
    SelectionRangeClientCapabilities? selectionRange,

    /// Capabilities specific to the `textDocument/publishDiagnostics`
    /// notification.
    PublishDiagnosticsClientCapabilities? publishDiagnostics,

    /// Capabilities specific to the various call hierarchy requests.
    CallHierarchyClientCapabilities? callHierarchy,

    /// Capabilities specific to the various semantic token request.
    SemanticTokensClientCapabilities? semanticTokens,

    /// Capabilities specific to the `textDocument/linkedEditingRange` request.
    LinkedEditingRangeClientCapabilities? linkedEditingRange,

    /// Client capabilities specific to the `textDocument/moniker` request.
    MonikerClientCapabilities? moniker,

    /// Capabilities specific to the various type hierarchy requests.
    TypeHierarchyClientCapabilities? typeHierarchy,

    /// Capabilities specific to the `textDocument/inlineValue` request.
    InlineValueClientCapabilities? inlineValue,

    /// Capabilities specific to the `textDocument/inlayHint` request.
    InlayHintClientCapabilities? inlayHint,

    /// Capabilities specific to the diagnostic pull model.
    DiagnosticClientCapabilities? diagnostic,

    /// Client capabilities specific to inline completions.
    InlineCompletionClientCapabilities? inlineCompletion,
  }) = _TextDocumentClientCapabilities;

  factory TextDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentClientCapabilitiesFromJson(json);
}

/// Capabilities specific to the notebook document support.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentClientCapabilities
    with _$NotebookDocumentClientCapabilities {
  const factory NotebookDocumentClientCapabilities({
    /// Capabilities specific to notebook document synchronization
    required NotebookDocumentSyncClientCapabilities synchronization,
  }) = _NotebookDocumentClientCapabilities;

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentClientCapabilitiesFromJson(json);
}

@freezed
abstract class WindowClientCapabilities with _$WindowClientCapabilities {
  const factory WindowClientCapabilities({
    /// It indicates whether the client supports server initiated progress using
    /// the `window/workDoneProgress/create` request.
    ///
    /// The capability also controls Whether client supports handling of
    /// progress notifications. If set servers are allowed to report a
    /// `workDoneProgress` property in the request specific server capabilities.
    bool? workDoneProgress,

    /// Capabilities specific to the showMessage request.
    ShowMessageRequestClientCapabilities? showMessage,

    /// Capabilities specific to the showDocument request.
    ShowDocumentClientCapabilities? showDocument,
  }) = _WindowClientCapabilities;

  factory WindowClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WindowClientCapabilitiesFromJson(json);
}

/// General client capabilities.
///
/// @since 3.16.0
@freezed
abstract class GeneralClientCapabilities with _$GeneralClientCapabilities {
  const factory GeneralClientCapabilities({
    /// Client capability that signals how the client handles stale requests
    /// (e.g. a request for which the client will not process the response
    /// anymore since the information is outdated).
    ({bool cancel, List<String> retryOnContentModified})? staleRequestSupport,

    /// Client capabilities specific to regular expressions.
    RegularExpressionsClientCapabilities? regularExpressions,

    /// Client capabilities specific to the client's markdown parser.
    MarkdownClientCapabilities? markdown,

    /// The position encodings supported by the client. Client and server have
    /// to agree on the same position encoding to ensure that offsets (e.g.
    /// character position in a line) are interpreted the same on both sides.
    ///
    /// To keep the protocol backwards compatible the following applies: if the
    /// value 'utf-16' is missing from the array of position encodings servers
    /// can assume that the client supports UTF-16. UTF-16 is therefore a
    /// mandatory encoding.
    ///
    /// If omitted it defaults to ['utf-16'].
    ///
    /// Implementation considerations: since the conversion from one encoding
    /// into another requires the content of the file / line the conversion is
    /// best done where the file is read which is usually on the server side.
    List<PositionEncodingKind>? positionEncodings,
  }) = _GeneralClientCapabilities;

  factory GeneralClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$GeneralClientCapabilitiesFromJson(json);
}

@freezed
abstract class WorkspaceEditClientCapabilities
    with _$WorkspaceEditClientCapabilities {
  const factory WorkspaceEditClientCapabilities({
    /// The client supports versioned document changes in `WorkspaceEdit`s
    bool? documentChanges,

    /// The resource operations the client supports. Clients should at least
    /// support 'create', 'rename' and 'delete' files and folders.
    List<ResourceOperationKind>? resourceOperations,

    /// The failure handling strategy of a client if applying the workspace edit
    /// fails.
    FailureHandlingKind? failureHandling,

    /// Whether the client normalizes line endings to the client specific
    /// setting. If set to `true` the client will normalize line ending
    /// characters in a workspace edit to the client-specified new line
    /// character.
    bool? normalizesLineEndings,

    /// Whether the client in general supports change annotations on text edits,
    /// create file, rename file and delete file changes.
    ({bool? groupsOnLabel})? changeAnnotationSupport,
  }) = _WorkspaceEditClientCapabilities;

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEditClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeConfigurationClientCapabilities
    with _$DidChangeConfigurationClientCapabilities {
  const factory DidChangeConfigurationClientCapabilities({
    /// Did change configuration notification supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DidChangeConfigurationClientCapabilities;

  factory DidChangeConfigurationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeConfigurationClientCapabilitiesFromJson(json);
}

@freezed
abstract class DidChangeWatchedFilesClientCapabilities
    with _$DidChangeWatchedFilesClientCapabilities {
  const factory DidChangeWatchedFilesClientCapabilities({
    /// Did change watched files notification supports dynamic registration.
    /// Please note that the current protocol doesn't support static
    /// configuration for file changes from the server side.
    bool? dynamicRegistration,

    /// Whether the client has support for [RelativePattern] or not.
    bool? relativePatternSupport,
  }) = _DidChangeWatchedFilesClientCapabilities;

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DidChangeWatchedFilesClientCapabilitiesFromJson(json);
}

/// Client capabilities for a [WorkspaceSymbolRequest].
@freezed
abstract class WorkspaceSymbolClientCapabilities
    with _$WorkspaceSymbolClientCapabilities {
  const factory WorkspaceSymbolClientCapabilities({
    /// Symbol request supports dynamic registration.
    bool? dynamicRegistration,

    /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
    /// request.
    ({List<SymbolKind>? valueSet})? symbolKind,

    /// The client supports tags on `SymbolInformation`. Clients supporting tags
    /// have to handle unknown tags gracefully.
    ({List<SymbolTag> valueSet})? tagSupport,

    /// The client support partial workspace symbols. The client will send the
    /// request `workspaceSymbol/resolve` to the server to resolve additional
    /// properties.
    ({List<String> properties})? resolveSupport,
  }) = _WorkspaceSymbolClientCapabilities;

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$WorkspaceSymbolClientCapabilitiesFromJson(json);
}

/// The client capabilities of a [ExecuteCommandRequest].
@freezed
abstract class ExecuteCommandClientCapabilities
    with _$ExecuteCommandClientCapabilities {
  const factory ExecuteCommandClientCapabilities({
    /// Execute command supports dynamic registration.
    bool? dynamicRegistration,
  }) = _ExecuteCommandClientCapabilities;

  factory ExecuteCommandClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ExecuteCommandClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensWorkspaceClientCapabilities
    with _$SemanticTokensWorkspaceClientCapabilities {
  const factory SemanticTokensWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// semantic tokens currently shown. It should be used with absolute care
    /// and is useful for situation where a server for example detects a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _SemanticTokensWorkspaceClientCapabilities;

  factory SemanticTokensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensWorkspaceClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class CodeLensWorkspaceClientCapabilities
    with _$CodeLensWorkspaceClientCapabilities {
  const factory CodeLensWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// code lenses currently shown. It should be used with absolute care and is
    /// useful for situation where a server for example detect a project wide
    /// change that requires such a calculation.
    bool? refreshSupport,
  }) = _CodeLensWorkspaceClientCapabilities;

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$CodeLensWorkspaceClientCapabilitiesFromJson(json);
}

/// Capabilities relating to events from file operations by the user in the
/// client.
///
/// These events do not come from the file system, they come from user
/// operations like renaming a file in the UI.
///
/// @since 3.16.0
@freezed
abstract class FileOperationClientCapabilities
    with _$FileOperationClientCapabilities {
  const factory FileOperationClientCapabilities({
    /// Whether the client supports dynamic registration for file
    /// requests/notifications.
    bool? dynamicRegistration,

    /// The client has support for sending didCreateFiles notifications.
    bool? didCreate,

    /// The client has support for sending willCreateFiles requests.
    bool? willCreate,

    /// The client has support for sending didRenameFiles notifications.
    bool? didRename,

    /// The client has support for sending willRenameFiles requests.
    bool? willRename,

    /// The client has support for sending didDeleteFiles notifications.
    bool? didDelete,

    /// The client has support for sending willDeleteFiles requests.
    bool? willDelete,
  }) = _FileOperationClientCapabilities;

  factory FileOperationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FileOperationClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to inline values.
///
/// @since 3.17.0
@freezed
abstract class InlineValueWorkspaceClientCapabilities
    with _$InlineValueWorkspaceClientCapabilities {
  const factory InlineValueWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// inline values currently shown. It should be used with absolute care and
    /// is useful for situation where a server for example detects a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _InlineValueWorkspaceClientCapabilities;

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineValueWorkspaceClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to inlay hints.
///
/// @since 3.17.0
@freezed
abstract class InlayHintWorkspaceClientCapabilities
    with _$InlayHintWorkspaceClientCapabilities {
  const factory InlayHintWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// inlay hints currently shown. It should be used with absolute care and is
    /// useful for situation where a server for example detects a project wide
    /// change that requires such a calculation.
    bool? refreshSupport,
  }) = _InlayHintWorkspaceClientCapabilities;

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlayHintWorkspaceClientCapabilitiesFromJson(json);
}

/// Workspace client capabilities specific to diagnostic pull requests.
///
/// @since 3.17.0
@freezed
abstract class DiagnosticWorkspaceClientCapabilities
    with _$DiagnosticWorkspaceClientCapabilities {
  const factory DiagnosticWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// pulled diagnostics currently shown. It should be used with absolute care
    /// and is useful for situation where a server for example detects a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _DiagnosticWorkspaceClientCapabilities;

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DiagnosticWorkspaceClientCapabilitiesFromJson(json);
}

/// Client workspace capabilities specific to folding ranges
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class FoldingRangeWorkspaceClientCapabilities
    with _$FoldingRangeWorkspaceClientCapabilities {
  const factory FoldingRangeWorkspaceClientCapabilities({
    /// Whether the client implementation supports a refresh request sent from
    /// the server to the client.
    ///
    /// Note that this event is global and will force the client to refresh all
    /// folding ranges currently shown. It should be used with absolute care and
    /// is useful for situation where a server for example detects a project
    /// wide change that requires such a calculation.
    bool? refreshSupport,
  }) = _FoldingRangeWorkspaceClientCapabilities;

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$FoldingRangeWorkspaceClientCapabilitiesFromJson(json);
}

@freezed
abstract class TextDocumentSyncClientCapabilities
    with _$TextDocumentSyncClientCapabilities {
  const factory TextDocumentSyncClientCapabilities({
    /// Whether text document synchronization supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports sending will save notifications.
    bool? willSave,

    /// The client supports sending a will save request and waits for a response
    /// providing text edits which will be applied to the document before it is
    /// saved.
    bool? willSaveWaitUntil,

    /// The client supports did save notifications.
    bool? didSave,
  }) = _TextDocumentSyncClientCapabilities;

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TextDocumentSyncClientCapabilitiesFromJson(json);
}

/// Completion client capabilities
@freezed
abstract class CompletionClientCapabilities
    with _$CompletionClientCapabilities {
  const factory CompletionClientCapabilities({
    /// Whether completion supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports the following `CompletionItem` specific
    /// capabilities.
    ({
      bool? snippetSupport,
      bool? commitCharactersSupport,
      List<MarkupKind>? documentationFormat,
      bool? deprecatedSupport,
      bool? preselectSupport,
      ({List<CompletionItemTag> valueSet})? tagSupport,
      bool? insertReplaceSupport,
      ({List<String> properties})? resolveSupport,
      ({List<InsertTextMode> valueSet})? insertTextModeSupport,
      bool? labelDetailsSupport,
    })?
    completionItem,
    ({List<CompletionItemKind>? valueSet})? completionItemKind,

    /// Defines how the client handles whitespace and indentation when accepting
    /// a completion item that uses multi line text in either `insertText` or
    /// `textEdit`.
    InsertTextMode? insertTextMode,

    /// The client supports to send additional context information for a
    /// `textDocument/completion` request.
    bool? contextSupport,

    /// The client supports the following `CompletionList` specific
    /// capabilities.
    ({List<String>? itemDefaults})? completionList,
  }) = _CompletionClientCapabilities;

  factory CompletionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CompletionClientCapabilitiesFromJson(json);
}

@freezed
abstract class HoverClientCapabilities with _$HoverClientCapabilities {
  const factory HoverClientCapabilities({
    /// Whether hover supports dynamic registration.
    bool? dynamicRegistration,

    /// Client supports the following content formats for the content property.
    /// The order describes the preferred format of the client.
    List<MarkupKind>? contentFormat,
  }) = _HoverClientCapabilities;

  factory HoverClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$HoverClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [SignatureHelpRequest].
@freezed
abstract class SignatureHelpClientCapabilities
    with _$SignatureHelpClientCapabilities {
  const factory SignatureHelpClientCapabilities({
    /// Whether signature help supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports the following `SignatureInformation` specific
    /// properties.
    ({
      List<MarkupKind>? documentationFormat,
      ({bool? labelOffsetSupport})? parameterInformation,
      bool? activeParameterSupport,
    })?
    signatureInformation,

    /// The client supports to send additional context information for a
    /// `textDocument/signatureHelp` request. A client that opts into
    /// contextSupport will also support the `retriggerCharacters` on
    /// `SignatureHelpOptions`.
    bool? contextSupport,
  }) = _SignatureHelpClientCapabilities;

  factory SignatureHelpClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$SignatureHelpClientCapabilitiesFromJson(json);
}

/// @since 3.14.0
@freezed
abstract class DeclarationClientCapabilities
    with _$DeclarationClientCapabilities {
  const factory DeclarationClientCapabilities({
    /// Whether declaration supports dynamic registration. If this is set to
    /// `true` the client supports the new `DeclarationRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of declaration
    /// links.
    bool? linkSupport,
  }) = _DeclarationClientCapabilities;

  factory DeclarationClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DeclarationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [DefinitionRequest].
@freezed
abstract class DefinitionClientCapabilities
    with _$DefinitionClientCapabilities {
  const factory DefinitionClientCapabilities({
    /// Whether definition supports dynamic registration.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of definition links.
    bool? linkSupport,
  }) = _DefinitionClientCapabilities;

  factory DefinitionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DefinitionClientCapabilitiesFromJson(json);
}

/// Since 3.6.0
@freezed
abstract class TypeDefinitionClientCapabilities
    with _$TypeDefinitionClientCapabilities {
  const factory TypeDefinitionClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of definition links.
    ///
    /// Since 3.14.0
    bool? linkSupport,
  }) = _TypeDefinitionClientCapabilities;

  factory TypeDefinitionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$TypeDefinitionClientCapabilitiesFromJson(json);
}

/// @since 3.6.0
@freezed
abstract class ImplementationClientCapabilities
    with _$ImplementationClientCapabilities {
  const factory ImplementationClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `ImplementationRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,

    /// The client supports additional metadata in the form of definition links.
    bool? linkSupport,
  }) = _ImplementationClientCapabilities;

  factory ImplementationClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ImplementationClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [ReferencesRequest].
@freezed
abstract class ReferenceClientCapabilities with _$ReferenceClientCapabilities {
  const factory ReferenceClientCapabilities({
    /// Whether references supports dynamic registration.
    bool? dynamicRegistration,
  }) = _ReferenceClientCapabilities;

  factory ReferenceClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ReferenceClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [DocumentHighlightRequest].
@freezed
abstract class DocumentHighlightClientCapabilities
    with _$DocumentHighlightClientCapabilities {
  const factory DocumentHighlightClientCapabilities({
    /// Whether document highlight supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentHighlightClientCapabilities;

  factory DocumentHighlightClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentHighlightClientCapabilitiesFromJson(json);
}

/// Client Capabilities for a [DocumentSymbolRequest].
@freezed
abstract class DocumentSymbolClientCapabilities
    with _$DocumentSymbolClientCapabilities {
  const factory DocumentSymbolClientCapabilities({
    /// Whether document symbol supports dynamic registration.
    bool? dynamicRegistration,

    /// Specific capabilities for the `SymbolKind` in the
    /// `textDocument/documentSymbol` request.
    ({List<SymbolKind>? valueSet})? symbolKind,

    /// The client supports hierarchical document symbols.
    bool? hierarchicalDocumentSymbolSupport,

    /// The client supports tags on `SymbolInformation`. Tags are supported on
    /// `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
    /// Clients supporting tags have to handle unknown tags gracefully.
    ({List<SymbolTag> valueSet})? tagSupport,

    /// The client supports an additional label presented in the UI when
    /// registering a document symbol provider.
    bool? labelSupport,
  }) = _DocumentSymbolClientCapabilities;

  factory DocumentSymbolClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentSymbolClientCapabilitiesFromJson(json);
}

/// The Client Capabilities of a [CodeActionRequest].
@freezed
abstract class CodeActionClientCapabilities
    with _$CodeActionClientCapabilities {
  const factory CodeActionClientCapabilities({
    /// Whether code action supports dynamic registration.
    bool? dynamicRegistration,

    /// The client support code action literals of type `CodeAction` as a valid
    /// response of the `textDocument/codeAction` request. If the property is
    /// not set the request can only return `Command` literals.
    ({({List<CodeActionKind> valueSet}) codeActionKind})?
    codeActionLiteralSupport,

    /// Whether code action supports the `isPreferred` property.
    bool? isPreferredSupport,

    /// Whether code action supports the `disabled` property.
    bool? disabledSupport,

    /// Whether code action supports the `data` property which is preserved
    /// between a `textDocument/codeAction` and a `codeAction/resolve` request.
    bool? dataSupport,

    /// Whether the client supports resolving additional code action properties
    /// via a separate `codeAction/resolve` request.
    ({List<String> properties})? resolveSupport,

    /// Whether the client honors the change annotations in text edits and
    /// resource operations returned via the `CodeAction#edit` property by for
    /// example presenting the workspace edit in the user interface and asking
    /// for confirmation.
    bool? honorsChangeAnnotations,
  }) = _CodeActionClientCapabilities;

  factory CodeActionClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeActionClientCapabilitiesFromJson(json);
}

/// The client capabilities of a [CodeLensRequest].
@freezed
abstract class CodeLensClientCapabilities with _$CodeLensClientCapabilities {
  const factory CodeLensClientCapabilities({
    /// Whether code lens supports dynamic registration.
    bool? dynamicRegistration,
  }) = _CodeLensClientCapabilities;

  factory CodeLensClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CodeLensClientCapabilitiesFromJson(json);
}

/// The client capabilities of a [DocumentLinkRequest].
@freezed
abstract class DocumentLinkClientCapabilities
    with _$DocumentLinkClientCapabilities {
  const factory DocumentLinkClientCapabilities({
    /// Whether document link supports dynamic registration.
    bool? dynamicRegistration,

    /// Whether the client supports the `tooltip` property on `DocumentLink`.
    bool? tooltipSupport,
  }) = _DocumentLinkClientCapabilities;

  factory DocumentLinkClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentLinkClientCapabilitiesFromJson(json);
}

@freezed
abstract class DocumentColorClientCapabilities
    with _$DocumentColorClientCapabilities {
  const factory DocumentColorClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `DocumentColorRegistrationOptions`
    /// return value for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _DocumentColorClientCapabilities;

  factory DocumentColorClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DocumentColorClientCapabilitiesFromJson(json);
}

/// Client capabilities of a [DocumentFormattingRequest].
@freezed
abstract class DocumentFormattingClientCapabilities
    with _$DocumentFormattingClientCapabilities {
  const factory DocumentFormattingClientCapabilities({
    /// Whether formatting supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentFormattingClientCapabilities;

  factory DocumentFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentFormattingClientCapabilitiesFromJson(json);
}

/// Client capabilities of a [DocumentRangeFormattingRequest].
@freezed
abstract class DocumentRangeFormattingClientCapabilities
    with _$DocumentRangeFormattingClientCapabilities {
  const factory DocumentRangeFormattingClientCapabilities({
    /// Whether range formatting supports dynamic registration.
    bool? dynamicRegistration,

    /// Whether the client supports formatting multiple ranges at once.
    bool? rangesSupport,
  }) = _DocumentRangeFormattingClientCapabilities;

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentRangeFormattingClientCapabilitiesFromJson(json);
}

/// Client capabilities of a [DocumentOnTypeFormattingRequest].
@freezed
abstract class DocumentOnTypeFormattingClientCapabilities
    with _$DocumentOnTypeFormattingClientCapabilities {
  const factory DocumentOnTypeFormattingClientCapabilities({
    /// Whether on type formatting supports dynamic registration.
    bool? dynamicRegistration,
  }) = _DocumentOnTypeFormattingClientCapabilities;

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$DocumentOnTypeFormattingClientCapabilitiesFromJson(json);
}

@freezed
abstract class RenameClientCapabilities with _$RenameClientCapabilities {
  const factory RenameClientCapabilities({
    /// Whether rename supports dynamic registration.
    bool? dynamicRegistration,

    /// Client supports testing for validity of rename operations before
    /// execution.
    bool? prepareSupport,

    /// Client supports the default behavior result.
    ///
    /// The value indicates the default behavior used by the client.
    PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior,

    /// Whether the client honors the change annotations in text edits and
    /// resource operations returned via the rename request's workspace edit by
    /// for example presenting the workspace edit in the user interface and
    /// asking for confirmation.
    bool? honorsChangeAnnotations,
  }) = _RenameClientCapabilities;

  factory RenameClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$RenameClientCapabilitiesFromJson(json);
}

@freezed
abstract class FoldingRangeClientCapabilities
    with _$FoldingRangeClientCapabilities {
  const factory FoldingRangeClientCapabilities({
    /// Whether implementation supports dynamic registration for folding range
    /// providers. If this is set to `true` the client supports the new
    /// `FoldingRangeRegistrationOptions` return value for the corresponding
    /// server capability as well.
    bool? dynamicRegistration,

    /// The maximum number of folding ranges that the client prefers to receive
    /// per document. The value serves as a hint, servers are free to follow the
    /// limit.
    int? rangeLimit,

    /// If set, the client signals that it only supports folding complete lines.
    /// If set, client will ignore specified `startCharacter` and `endCharacter`
    /// properties in a FoldingRange.
    bool? lineFoldingOnly,

    /// Specific options for the folding range kind.
    ({List<FoldingRangeKind>? valueSet})? foldingRangeKind,

    /// Specific options for the folding range.
    ({bool? collapsedText})? foldingRange,
  }) = _FoldingRangeClientCapabilities;

  factory FoldingRangeClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FoldingRangeClientCapabilitiesFromJson(json);
}

@freezed
abstract class SelectionRangeClientCapabilities
    with _$SelectionRangeClientCapabilities {
  const factory SelectionRangeClientCapabilities({
    /// Whether implementation supports dynamic registration for selection range
    /// providers. If this is set to `true` the client supports the new
    /// `SelectionRangeRegistrationOptions` return value for the corresponding
    /// server capability as well.
    bool? dynamicRegistration,
  }) = _SelectionRangeClientCapabilities;

  factory SelectionRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SelectionRangeClientCapabilitiesFromJson(json);
}

/// The publish diagnostic client capabilities.
@freezed
abstract class PublishDiagnosticsClientCapabilities
    with _$PublishDiagnosticsClientCapabilities {
  const factory PublishDiagnosticsClientCapabilities({
    /// Whether the clients accepts diagnostics with related information.
    bool? relatedInformation,

    /// Client supports the tag property to provide meta data about a
    /// diagnostic. Clients supporting tags have to handle unknown tags
    /// gracefully.
    ({List<DiagnosticTag> valueSet})? tagSupport,

    /// Whether the client interprets the version property of the
    /// `textDocument/publishDiagnostics` notification's parameter.
    bool? versionSupport,

    /// Client supports a codeDescription property
    bool? codeDescriptionSupport,

    /// Whether code action supports the `data` property which is preserved
    /// between a `textDocument/publishDiagnostics` and
    /// `textDocument/codeAction` request.
    bool? dataSupport,
  }) = _PublishDiagnosticsClientCapabilities;

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$PublishDiagnosticsClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class CallHierarchyClientCapabilities
    with _$CallHierarchyClientCapabilities {
  const factory CallHierarchyClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _CallHierarchyClientCapabilities;

  factory CallHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CallHierarchyClientCapabilitiesFromJson(json);
}

/// @since 3.16.0
@freezed
abstract class SemanticTokensClientCapabilities
    with _$SemanticTokensClientCapabilities {
  const factory SemanticTokensClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// Which requests the client supports and might send to the server
    /// depending on the server's capability. Please note that clients might not
    /// show semantic tokens or degrade some of the user experience if a range
    /// or full request is advertised by the client but not provided by the
    /// server. If for example the client capability `requests.full` and
    /// `request.range` are both set to true but the server only provides a
    /// range provider the client might not render a minimap correctly or might
    /// even decide to not show any semantic tokens at all.
    required ({Object? range, Object? full}) requests,

    /// The token types that the client supports.
    required List<String> tokenTypes,

    /// The token modifiers that the client supports.
    required List<String> tokenModifiers,

    /// The token formats the clients supports.
    required List<TokenFormat> formats,

    /// Whether the client supports tokens that can overlap each other.
    bool? overlappingTokenSupport,

    /// Whether the client supports tokens that can span multiple lines.
    bool? multilineTokenSupport,

    /// Whether the client allows the server to actively cancel a semantic token
    /// request, e.g. supports returning LSPErrorCodes.ServerCancelled. If a
    /// server does the client needs to retrigger the request.
    bool? serverCancelSupport,

    /// Whether the client uses semantic tokens to augment existing syntax
    /// tokens. If set to `true` client side created syntax tokens and semantic
    /// tokens are both used for colorization. If set to `false` the client only
    /// uses the returned semantic tokens for colorization.
    ///
    /// If the value is `undefined` then the client behavior is not specified.
    bool? augmentsSyntaxTokens,
  }) = _SemanticTokensClientCapabilities;

  factory SemanticTokensClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$SemanticTokensClientCapabilitiesFromJson(json);
}

/// Client capabilities for the linked editing range request.
///
/// @since 3.16.0
@freezed
abstract class LinkedEditingRangeClientCapabilities
    with _$LinkedEditingRangeClientCapabilities {
  const factory LinkedEditingRangeClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _LinkedEditingRangeClientCapabilities;

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$LinkedEditingRangeClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to the moniker request.
///
/// @since 3.16.0
@freezed
abstract class MonikerClientCapabilities with _$MonikerClientCapabilities {
  const factory MonikerClientCapabilities({
    /// Whether moniker supports dynamic registration. If this is set to `true`
    /// the client supports the new `MonikerRegistrationOptions` return value
    /// for the corresponding server capability as well.
    bool? dynamicRegistration,
  }) = _MonikerClientCapabilities;

  factory MonikerClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MonikerClientCapabilitiesFromJson(json);
}

/// @since 3.17.0
@freezed
abstract class TypeHierarchyClientCapabilities
    with _$TypeHierarchyClientCapabilities {
  const factory TypeHierarchyClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,
  }) = _TypeHierarchyClientCapabilities;

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TypeHierarchyClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to inline values.
///
/// @since 3.17.0
@freezed
abstract class InlineValueClientCapabilities
    with _$InlineValueClientCapabilities {
  const factory InlineValueClientCapabilities({
    /// Whether implementation supports dynamic registration for inline value
    /// providers.
    bool? dynamicRegistration,
  }) = _InlineValueClientCapabilities;

  factory InlineValueClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlineValueClientCapabilitiesFromJson(json);
}

/// Inlay hint client capabilities.
///
/// @since 3.17.0
@freezed
abstract class InlayHintClientCapabilities with _$InlayHintClientCapabilities {
  const factory InlayHintClientCapabilities({
    /// Whether inlay hints support dynamic registration.
    bool? dynamicRegistration,

    /// Indicates which properties a client can resolve lazily on an inlay hint.
    ({List<String> properties})? resolveSupport,
  }) = _InlayHintClientCapabilities;

  factory InlayHintClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$InlayHintClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to diagnostic pull requests.
///
/// @since 3.17.0
@freezed
abstract class DiagnosticClientCapabilities
    with _$DiagnosticClientCapabilities {
  const factory DiagnosticClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// Whether the clients supports related documents for document diagnostic
    /// pulls.
    bool? relatedDocumentSupport,
  }) = _DiagnosticClientCapabilities;

  factory DiagnosticClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to inline completions.
///
/// @since 3.18.0
/// @proposed
@freezed
abstract class InlineCompletionClientCapabilities
    with _$InlineCompletionClientCapabilities {
  const factory InlineCompletionClientCapabilities({
    /// Whether implementation supports dynamic registration for inline
    /// completion providers.
    bool? dynamicRegistration,
  }) = _InlineCompletionClientCapabilities;

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$InlineCompletionClientCapabilitiesFromJson(json);
}

/// Notebook specific client capabilities.
///
/// @since 3.17.0
@freezed
abstract class NotebookDocumentSyncClientCapabilities
    with _$NotebookDocumentSyncClientCapabilities {
  const factory NotebookDocumentSyncClientCapabilities({
    /// Whether implementation supports dynamic registration. If this is set to
    /// `true` the client supports the new `(TextDocumentRegistrationOptions &
    /// StaticRegistrationOptions)` return value for the corresponding server
    /// capability as well.
    bool? dynamicRegistration,

    /// The client supports sending execution summary data per cell.
    bool? executionSummarySupport,
  }) = _NotebookDocumentSyncClientCapabilities;

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$NotebookDocumentSyncClientCapabilitiesFromJson(json);
}

/// Show message request client capabilities
@freezed
abstract class ShowMessageRequestClientCapabilities
    with _$ShowMessageRequestClientCapabilities {
  const factory ShowMessageRequestClientCapabilities({
    /// Capabilities specific to the `MessageActionItem` type.
    ({bool? additionalPropertiesSupport})? messageActionItem,
  }) = _ShowMessageRequestClientCapabilities;

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$ShowMessageRequestClientCapabilitiesFromJson(json);
}

/// Client capabilities for the showDocument request.
///
/// @since 3.16.0
@freezed
abstract class ShowDocumentClientCapabilities
    with _$ShowDocumentClientCapabilities {
  const factory ShowDocumentClientCapabilities({
    /// The client has support for the showDocument request.
    required bool support,
  }) = _ShowDocumentClientCapabilities;

  factory ShowDocumentClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ShowDocumentClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to regular expressions.
///
/// @since 3.16.0
@freezed
abstract class RegularExpressionsClientCapabilities
    with _$RegularExpressionsClientCapabilities {
  const factory RegularExpressionsClientCapabilities({
    /// The engine's name.
    required String engine,

    /// The engine's version.
    String? version,
  }) = _RegularExpressionsClientCapabilities;

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, dynamic> json,
  ) => _$RegularExpressionsClientCapabilitiesFromJson(json);
}

/// Client capabilities specific to the used markdown parser.
///
/// @since 3.16.0
@freezed
abstract class MarkdownClientCapabilities with _$MarkdownClientCapabilities {
  const factory MarkdownClientCapabilities({
    /// The name of the parser.
    required String parser,

    /// The version of the parser.
    String? version,

    /// A list of HTML tags that the client allows / supports in Markdown.
    List<String>? allowedTags,
  }) = _MarkdownClientCapabilities;

  factory MarkdownClientCapabilities.fromJson(Map<String, dynamic> json) =>
      _$MarkdownClientCapabilitiesFromJson(json);
}
