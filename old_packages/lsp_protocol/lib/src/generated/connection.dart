//  GENERATED CODE – DO NOT MODIFY BY HAND
//  LSP Version: 3.17.0
//  ignore_for_file: lines_longer_than_80_chars, doc_directive_unknown

import 'dart:async';

import 'models.dart';

/// Abstract LSP connection interface.
///
/// Naming conventions (from the server perspective):
///
/// - clientToServer request      → `on<Name>Request`
/// - serverToClient request      → `send<Name>Request`
/// - clientToServer notification → `on<Name>Notification`
/// - serverToClient notification → `send<Name>Notification`
abstract interface class LspConnection {
  /// **`textDocument/implementation`** — `clientToServer`
  ///
  /// A request to resolve the implementation locations of a symbol at a given
  /// text document position. The request's parameter is of type {@link
  /// TextDocumentPositionParams} the response is of type {@link Definition} or a
  /// Thenable that resolves to such.
  void onTextDocumentImplementationRequest(
    Future<Object?> Function(ImplementationParams params) handler,
  );

  /// **`textDocument/typeDefinition`** — `clientToServer`
  ///
  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type {@link
  /// TextDocumentPositionParams} the response is of type {@link Definition} or a
  /// Thenable that resolves to such.
  void onTextDocumentTypeDefinitionRequest(
    Future<Object?> Function(TypeDefinitionParams params) handler,
  );

  /// **`workspace/workspaceFolders`** — `serverToClient`
  ///
  /// The `workspace/workspaceFolders` is sent from the server to the client to
  /// fetch the open workspace folders.
  Future<List<WorkspaceFolder>?> sendWorkspaceWorkspaceFoldersRequest();

  /// **`workspace/configuration`** — `serverToClient`
  ///
  /// The 'workspace/configuration' request is sent from the server to the client
  /// to fetch a certain configuration setting.
  /// This pull model replaces the old push model where the client signaled
  /// configuration change via an event. If the server still needs to react to
  /// configuration changes (since the server caches the result of
  /// `workspace/configuration` requests) the server should register for an empty
  /// configuration change event and empty the cache if such an event is
  /// received.
  Future<List<LSPAny>?> sendWorkspaceConfigurationRequest(
    ConfigurationParams params,
  );

  /// **`textDocument/documentColor`** — `clientToServer`
  ///
  /// A request to list all color symbols found in a given text document. The
  /// request's parameter is of type {@link DocumentColorParams} the response is
  /// of type {@link ColorInformation ColorInformation[]} or a Thenable that
  /// resolves to such.
  void onTextDocumentDocumentColorRequest(
    Future<List<ColorInformation>?> Function(DocumentColorParams params)
    handler,
  );

  /// **`textDocument/colorPresentation`** — `clientToServer`
  ///
  /// A request to list all presentation for a color. The request's parameter is
  /// of type {@link ColorPresentationParams} the response is of type {@link
  /// ColorInformation ColorInformation[]} or a Thenable that resolves to such.
  void onTextDocumentColorPresentationRequest(
    Future<List<ColorPresentation>?> Function(ColorPresentationParams params)
    handler,
  );

  /// **`textDocument/foldingRange`** — `clientToServer`
  ///
  /// A request to provide folding ranges in a document. The request's parameter
  /// is of type {@link FoldingRangeParams}, the response is of type {@link
  /// FoldingRangeList} or a Thenable that resolves to such.
  void onTextDocumentFoldingRangeRequest(
    Future<List<FoldingRange>?> Function(FoldingRangeParams params) handler,
  );

  /// **`workspace/foldingRange/refresh`** — `serverToClient`
  ///
  /// @since 3.18.0 @proposed
  Future<void> sendWorkspaceFoldingRangeRefreshRequest();

  /// **`textDocument/declaration`** — `clientToServer`
  ///
  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type {@link
  /// TextDocumentPositionParams} the response is of type {@link Declaration} or
  /// a typed array of {@link DeclarationLink} or a Thenable that resolves to
  /// such.
  void onTextDocumentDeclarationRequest(
    Future<Object?> Function(DeclarationParams params) handler,
  );

  /// **`textDocument/selectionRange`** — `clientToServer`
  ///
  /// A request to provide selection ranges in a document. The request's
  /// parameter is of type {@link SelectionRangeParams}, the response is of type
  /// {@link SelectionRange SelectionRange[]} or a Thenable that resolves to
  /// such.
  void onTextDocumentSelectionRangeRequest(
    Future<List<SelectionRange>?> Function(SelectionRangeParams params) handler,
  );

  /// **`window/workDoneProgress/create`** — `serverToClient`
  ///
  /// The `window/workDoneProgress/create` request is sent from the server to the
  /// client to initiate progress reporting from the server.
  Future<void> sendWindowWorkDoneProgressCreateRequest(
    WorkDoneProgressCreateParams params,
  );

  /// **`textDocument/prepareCallHierarchy`** — `clientToServer`
  ///
  /// A request to result a `CallHierarchyItem` in a document at a given
  /// position. Can be used as an input to an incoming or outgoing call
  /// hierarchy.
  /// @since 3.16.0
  void onTextDocumentPrepareCallHierarchyRequest(
    Future<List<CallHierarchyItem>?> Function(CallHierarchyPrepareParams params)
    handler,
  );

  /// **`callHierarchy/incomingCalls`** — `clientToServer`
  ///
  /// A request to resolve the incoming calls for a given `CallHierarchyItem`.
  /// @since 3.16.0
  void onCallHierarchyIncomingCallsRequest(
    Future<List<CallHierarchyIncomingCall>?> Function(
      CallHierarchyIncomingCallsParams params,
    )
    handler,
  );

  /// **`callHierarchy/outgoingCalls`** — `clientToServer`
  ///
  /// A request to resolve the outgoing calls for a given `CallHierarchyItem`.
  /// @since 3.16.0
  void onCallHierarchyOutgoingCallsRequest(
    Future<List<CallHierarchyOutgoingCall>?> Function(
      CallHierarchyOutgoingCallsParams params,
    )
    handler,
  );

  /// **`textDocument/semanticTokens/full`** — `clientToServer`
  ///
  /// @since 3.16.0
  void onTextDocumentSemanticTokensFullRequest(
    Future<SemanticTokens?> Function(SemanticTokensParams params) handler,
  );

  /// **`textDocument/semanticTokens/full/delta`** — `clientToServer`
  ///
  /// @since 3.16.0
  void onTextDocumentSemanticTokensFullDeltaRequest(
    Future<Object?> Function(SemanticTokensDeltaParams params) handler,
  );

  /// **`textDocument/semanticTokens/range`** — `clientToServer`
  ///
  /// @since 3.16.0
  void onTextDocumentSemanticTokensRangeRequest(
    Future<SemanticTokens?> Function(SemanticTokensRangeParams params) handler,
  );

  /// **`workspace/semanticTokens/refresh`** — `serverToClient`
  ///
  /// @since 3.16.0
  Future<void> sendWorkspaceSemanticTokensRefreshRequest();

  /// **`window/showDocument`** — `serverToClient`
  ///
  /// A request to show a document. This request might open an external program
  /// depending on the value of the URI to open. For example a request to open
  /// `https://code.visualstudio.com/` will very likely open the URI in a WEB
  /// browser.
  /// @since 3.16.0
  Future<ShowDocumentResult?> sendWindowShowDocumentRequest(
    ShowDocumentParams params,
  );

  /// **`textDocument/linkedEditingRange`** — `clientToServer`
  ///
  /// A request to provide ranges that can be edited together.
  /// @since 3.16.0
  void onTextDocumentLinkedEditingRangeRequest(
    Future<LinkedEditingRanges?> Function(LinkedEditingRangeParams params)
    handler,
  );

  /// **`workspace/willCreateFiles`** — `clientToServer`
  ///
  /// The will create files request is sent from the client to the server before
  /// files are actually created as long as the creation is triggered from within
  /// the client.
  /// The request can return a `WorkspaceEdit` which will be applied to workspace
  /// before the files are created. Hence the `WorkspaceEdit` can not manipulate
  /// the content of the file to be created.
  /// @since 3.16.0
  void onWorkspaceWillCreateFilesRequest(
    Future<WorkspaceEdit?> Function(CreateFilesParams params) handler,
  );

  /// **`workspace/willRenameFiles`** — `clientToServer`
  ///
  /// The will rename files request is sent from the client to the server before
  /// files are actually renamed as long as the rename is triggered from within
  /// the client.
  /// @since 3.16.0
  void onWorkspaceWillRenameFilesRequest(
    Future<WorkspaceEdit?> Function(RenameFilesParams params) handler,
  );

  /// **`workspace/willDeleteFiles`** — `clientToServer`
  ///
  /// The did delete files notification is sent from the client to the server
  /// when files were deleted from within the client.
  /// @since 3.16.0
  void onWorkspaceWillDeleteFilesRequest(
    Future<WorkspaceEdit?> Function(DeleteFilesParams params) handler,
  );

  /// **`textDocument/moniker`** — `clientToServer`
  ///
  /// A request to get the moniker of a symbol at a given text document position.
  /// The request parameter is of type {@link TextDocumentPositionParams}. The
  /// response is of type {@link Moniker Moniker[]} or `null`.
  void onTextDocumentMonikerRequest(
    Future<List<Moniker>?> Function(MonikerParams params) handler,
  );

  /// **`textDocument/prepareTypeHierarchy`** — `clientToServer`
  ///
  /// A request to result a `TypeHierarchyItem` in a document at a given
  /// position. Can be used as an input to a subtypes or supertypes type
  /// hierarchy.
  /// @since 3.17.0
  void onTextDocumentPrepareTypeHierarchyRequest(
    Future<List<TypeHierarchyItem>?> Function(TypeHierarchyPrepareParams params)
    handler,
  );

  /// **`typeHierarchy/supertypes`** — `clientToServer`
  ///
  /// A request to resolve the supertypes for a given `TypeHierarchyItem`.
  /// @since 3.17.0
  void onTypeHierarchySupertypesRequest(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySupertypesParams params,
    )
    handler,
  );

  /// **`typeHierarchy/subtypes`** — `clientToServer`
  ///
  /// A request to resolve the subtypes for a given `TypeHierarchyItem`.
  /// @since 3.17.0
  void onTypeHierarchySubtypesRequest(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySubtypesParams params,
    )
    handler,
  );

  /// **`textDocument/inlineValue`** — `clientToServer`
  ///
  /// A request to provide inline values in a document. The request's parameter
  /// is of type {@link InlineValueParams}, the response is of type {@link
  /// InlineValue InlineValue[]} or a Thenable that resolves to such.
  /// @since 3.17.0
  void onTextDocumentInlineValueRequest(
    Future<List<InlineValue>?> Function(InlineValueParams params) handler,
  );

  /// **`workspace/inlineValue/refresh`** — `serverToClient`
  ///
  /// @since 3.17.0
  Future<void> sendWorkspaceInlineValueRefreshRequest();

  /// **`textDocument/inlayHint`** — `clientToServer`
  ///
  /// A request to provide inlay hints in a document. The request's parameter is
  /// of type {@link InlayHintsParams}, the response is of type {@link InlayHint
  /// InlayHint[]} or a Thenable that resolves to such.
  /// @since 3.17.0
  void onTextDocumentInlayHintRequest(
    Future<List<InlayHint>?> Function(InlayHintParams params) handler,
  );

  /// **`inlayHint/resolve`** — `clientToServer`
  ///
  /// A request to resolve additional properties for an inlay hint. The request's
  /// parameter is of type {@link InlayHint}, the response is of type {@link
  /// InlayHint} or a Thenable that resolves to such.
  /// @since 3.17.0
  void onInlayHintResolveRequest(
    Future<InlayHint?> Function(InlayHint params) handler,
  );

  /// **`workspace/inlayHint/refresh`** — `serverToClient`
  ///
  /// @since 3.17.0
  Future<void> sendWorkspaceInlayHintRefreshRequest();

  /// **`textDocument/diagnostic`** — `clientToServer`
  ///
  /// The document diagnostic request definition.
  /// @since 3.17.0
  void onTextDocumentDiagnosticRequest(
    Future<DocumentDiagnosticReport?> Function(DocumentDiagnosticParams params)
    handler,
  );

  /// **`workspace/diagnostic`** — `clientToServer`
  ///
  /// The workspace diagnostic request definition.
  /// @since 3.17.0
  void onWorkspaceDiagnosticRequest(
    Future<WorkspaceDiagnosticReport?> Function(
      WorkspaceDiagnosticParams params,
    )
    handler,
  );

  /// **`workspace/diagnostic/refresh`** — `serverToClient`
  ///
  /// The diagnostic refresh request definition.
  /// @since 3.17.0
  Future<void> sendWorkspaceDiagnosticRefreshRequest();

  /// **`textDocument/inlineCompletion`** — `clientToServer`
  ///
  /// A request to provide inline completions in a document. The request's
  /// parameter is of type {@link InlineCompletionParams}, the response is of
  /// type {@link InlineCompletion InlineCompletion[]} or a Thenable that
  /// resolves to such.
  /// @since 3.18.0 @proposed
  void onTextDocumentInlineCompletionRequest(
    Future<Object?> Function(InlineCompletionParams params) handler,
  );

  /// **`client/registerCapability`** — `serverToClient`
  ///
  /// The `client/registerCapability` request is sent from the server to the
  /// client to register a new capability handler on the client side.
  Future<void> sendClientRegisterCapabilityRequest(RegistrationParams params);

  /// **`client/unregisterCapability`** — `serverToClient`
  ///
  /// The `client/unregisterCapability` request is sent from the server to the
  /// client to unregister a previously registered capability handler on the
  /// client side.
  Future<void> sendClientUnregisterCapabilityRequest(
    UnregistrationParams params,
  );

  /// **`initialize`** — `clientToServer`
  ///
  /// The initialize request is sent from the client to the server. It is sent
  /// once as the request after starting up the server. The requests parameter is
  /// of type {@link InitializeParams} the response if of type {@link
  /// InitializeResult} of a Thenable that resolves to such.
  void onInitializeRequest(
    Future<InitializeResult?> Function(InitializeParams params) handler,
  );

  /// **`shutdown`** — `clientToServer`
  ///
  /// A shutdown request is sent from the client to the server. It is sent once
  /// when the client decides to shutdown the server. The only notification that
  /// is sent after a shutdown request is the exit event.
  void onShutdownRequest(Future<void> Function() handler);

  /// **`window/showMessageRequest`** — `serverToClient`
  ///
  /// The show message request is sent from the server to the client to show a
  /// message and a set of options actions to the user.
  Future<MessageActionItem?> sendWindowShowMessageRequestRequest(
    ShowMessageRequestParams params,
  );

  /// **`textDocument/willSaveWaitUntil`** — `clientToServer`
  ///
  /// A document will save request is sent from the client to the server before
  /// the document is actually saved. The request can return an array of
  /// TextEdits which will be applied to the text document before it is saved.
  /// Please note that clients might drop results if computing the text edits
  /// took too long or if a server constantly fails on this request. This is done
  /// to keep the save fast and reliable.
  void onTextDocumentWillSaveWaitUntilRequest(
    Future<List<TextEdit>?> Function(WillSaveTextDocumentParams params) handler,
  );

  /// **`textDocument/completion`** — `clientToServer`
  ///
  /// Request to request completion at a given text document position. The
  /// request's parameter is of type {@link TextDocumentPosition} the response is
  /// of type {@link CompletionItem CompletionItem[]} or {@link CompletionList}
  /// or a Thenable that resolves to such.
  /// The request can delay the computation of the {@link CompletionItem.detail
  /// `detail`} and {@link CompletionItem.documentation `documentation`}
  /// properties to the `completionItem/resolve` request. However, properties
  /// that are needed for the initial sorting and filtering, like `sortText`,
  /// `filterText`, `insertText`, and `textEdit`, must not be changed during
  /// resolve.
  void onTextDocumentCompletionRequest(
    Future<Object?> Function(CompletionParams params) handler,
  );

  /// **`completionItem/resolve`** — `clientToServer`
  ///
  /// Request to resolve additional information for a given completion item.The
  /// request's parameter is of type {@link CompletionItem} the response is of
  /// type {@link CompletionItem} or a Thenable that resolves to such.
  void onCompletionItemResolveRequest(
    Future<CompletionItem?> Function(CompletionItem params) handler,
  );

  /// **`textDocument/hover`** — `clientToServer`
  ///
  /// Request to request hover information at a given text document position. The
  /// request's parameter is of type {@link TextDocumentPosition} the response is
  /// of type {@link Hover} or a Thenable that resolves to such.
  void onTextDocumentHoverRequest(
    Future<Hover?> Function(HoverParams params) handler,
  );

  /// **`textDocument/signatureHelp`** — `clientToServer`
  void onTextDocumentSignatureHelpRequest(
    Future<SignatureHelp?> Function(SignatureHelpParams params) handler,
  );

  /// **`textDocument/definition`** — `clientToServer`
  ///
  /// A request to resolve the definition location of a symbol at a given text
  /// document position. The request's parameter is of type {@link
  /// TextDocumentPosition} the response is of either type {@link Definition} or
  /// a typed array of {@link DefinitionLink} or a Thenable that resolves to
  /// such.
  void onTextDocumentDefinitionRequest(
    Future<Object?> Function(DefinitionParams params) handler,
  );

  /// **`textDocument/references`** — `clientToServer`
  ///
  /// A request to resolve project-wide references for the symbol denoted by the
  /// given text document position. The request's parameter is of type {@link
  /// ReferenceParams} the response is of type {@link Location Location[]} or a
  /// Thenable that resolves to such.
  void onTextDocumentReferencesRequest(
    Future<List<Location>?> Function(ReferenceParams params) handler,
  );

  /// **`textDocument/documentHighlight`** — `clientToServer`
  ///
  /// Request to resolve a {@link DocumentHighlight} for a given text document
  /// position. The request's parameter is of type {@link TextDocumentPosition}
  /// the request response is an array of type {@link DocumentHighlight} or a
  /// Thenable that resolves to such.
  void onTextDocumentDocumentHighlightRequest(
    Future<List<DocumentHighlight>?> Function(DocumentHighlightParams params)
    handler,
  );

  /// **`textDocument/documentSymbol`** — `clientToServer`
  ///
  /// A request to list all symbols found in a given text document. The request's
  /// parameter is of type {@link TextDocumentIdentifier} the response is of type
  /// {@link SymbolInformation SymbolInformation[]} or a Thenable that resolves
  /// to such.
  void onTextDocumentDocumentSymbolRequest(
    Future<Object?> Function(DocumentSymbolParams params) handler,
  );

  /// **`textDocument/codeAction`** — `clientToServer`
  ///
  /// A request to provide commands for the given text document and range.
  void onTextDocumentCodeActionRequest(
    Future<List<Object?>?> Function(CodeActionParams params) handler,
  );

  /// **`codeAction/resolve`** — `clientToServer`
  ///
  /// Request to resolve additional information for a given code action.The
  /// request's parameter is of type {@link CodeAction} the response is of type
  /// {@link CodeAction} or a Thenable that resolves to such.
  void onCodeActionResolveRequest(
    Future<CodeAction?> Function(CodeAction params) handler,
  );

  /// **`workspace/symbol`** — `clientToServer`
  ///
  /// A request to list project-wide symbols matching the query string given by
  /// the {@link WorkspaceSymbolParams}. The response is of type {@link
  /// SymbolInformation SymbolInformation[]} or a Thenable that resolves to such.
  /// @since 3.17.0 - support for WorkspaceSymbol in the returned data. Clients
  /// need to advertise support for WorkspaceSymbols via the client capability
  /// `workspace.symbol.resolveSupport`.
  void onWorkspaceSymbolRequest(
    Future<Object?> Function(WorkspaceSymbolParams params) handler,
  );

  /// **`workspaceSymbol/resolve`** — `clientToServer`
  ///
  /// A request to resolve the range inside the workspace symbol's location.
  /// @since 3.17.0
  void onWorkspaceSymbolResolveRequest(
    Future<WorkspaceSymbol?> Function(WorkspaceSymbol params) handler,
  );

  /// **`textDocument/codeLens`** — `clientToServer`
  ///
  /// A request to provide code lens for the given text document.
  void onTextDocumentCodeLensRequest(
    Future<List<CodeLens>?> Function(CodeLensParams params) handler,
  );

  /// **`codeLens/resolve`** — `clientToServer`
  ///
  /// A request to resolve a command for a given code lens.
  void onCodeLensResolveRequest(
    Future<CodeLens?> Function(CodeLens params) handler,
  );

  /// **`workspace/codeLens/refresh`** — `serverToClient`
  ///
  /// A request to refresh all code actions
  /// @since 3.16.0
  Future<void> sendWorkspaceCodeLensRefreshRequest();

  /// **`textDocument/documentLink`** — `clientToServer`
  ///
  /// A request to provide document links
  void onTextDocumentDocumentLinkRequest(
    Future<List<DocumentLink>?> Function(DocumentLinkParams params) handler,
  );

  /// **`documentLink/resolve`** — `clientToServer`
  ///
  /// Request to resolve additional information for a given document link. The
  /// request's parameter is of type {@link DocumentLink} the response is of type
  /// {@link DocumentLink} or a Thenable that resolves to such.
  void onDocumentLinkResolveRequest(
    Future<DocumentLink?> Function(DocumentLink params) handler,
  );

  /// **`textDocument/formatting`** — `clientToServer`
  ///
  /// A request to format a whole document.
  void onTextDocumentFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentFormattingParams params) handler,
  );

  /// **`textDocument/rangeFormatting`** — `clientToServer`
  ///
  /// A request to format a range in a document.
  void onTextDocumentRangeFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentRangeFormattingParams params)
    handler,
  );

  /// **`textDocument/rangesFormatting`** — `clientToServer`
  ///
  /// A request to format ranges in a document.
  /// @since 3.18.0 @proposed
  void onTextDocumentRangesFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentRangesFormattingParams params)
    handler,
  );

  /// **`textDocument/onTypeFormatting`** — `clientToServer`
  ///
  /// A request to format a document on type.
  void onTextDocumentOnTypeFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentOnTypeFormattingParams params)
    handler,
  );

  /// **`textDocument/rename`** — `clientToServer`
  ///
  /// A request to rename a symbol.
  void onTextDocumentRenameRequest(
    Future<WorkspaceEdit?> Function(RenameParams params) handler,
  );

  /// **`textDocument/prepareRename`** — `clientToServer`
  ///
  /// A request to test and perform the setup necessary for a rename.
  /// @since 3.16 - support for default behavior
  void onTextDocumentPrepareRenameRequest(
    Future<PrepareRenameResult?> Function(PrepareRenameParams params) handler,
  );

  /// **`workspace/executeCommand`** — `clientToServer`
  ///
  /// A request send from the client to the server to execute a command. The
  /// request might return a workspace edit which the client will apply to the
  /// workspace.
  void onWorkspaceExecuteCommandRequest(
    Future<LSPAny?> Function(ExecuteCommandParams params) handler,
  );

  /// **`workspace/applyEdit`** — `serverToClient`
  ///
  /// A request sent from the server to the client to modified certain resources.
  Future<ApplyWorkspaceEditResult?> sendWorkspaceApplyEditRequest(
    ApplyWorkspaceEditParams params,
  );

  /// **`workspace/didChangeWorkspaceFolders`** — `clientToServer`
  ///
  /// The `workspace/didChangeWorkspaceFolders` notification is sent from the
  /// client to the server when the workspace folder configuration changes.
  void onWorkspaceDidChangeWorkspaceFoldersNotification(
    Future<void> Function(DidChangeWorkspaceFoldersParams params) handler,
  );

  /// **`window/workDoneProgress/cancel`** — `clientToServer`
  ///
  /// The `window/workDoneProgress/cancel` notification is sent from the client
  /// to the server to cancel a progress initiated on the server side.
  void onWindowWorkDoneProgressCancelNotification(
    Future<void> Function(WorkDoneProgressCancelParams params) handler,
  );

  /// **`workspace/didCreateFiles`** — `clientToServer`
  ///
  /// The did create files notification is sent from the client to the server
  /// when files were created from within the client.
  /// @since 3.16.0
  void onWorkspaceDidCreateFilesNotification(
    Future<void> Function(CreateFilesParams params) handler,
  );

  /// **`workspace/didRenameFiles`** — `clientToServer`
  ///
  /// The did rename files notification is sent from the client to the server
  /// when files were renamed from within the client.
  /// @since 3.16.0
  void onWorkspaceDidRenameFilesNotification(
    Future<void> Function(RenameFilesParams params) handler,
  );

  /// **`workspace/didDeleteFiles`** — `clientToServer`
  ///
  /// The will delete files request is sent from the client to the server before
  /// files are actually deleted as long as the deletion is triggered from within
  /// the client.
  /// @since 3.16.0
  void onWorkspaceDidDeleteFilesNotification(
    Future<void> Function(DeleteFilesParams params) handler,
  );

  /// **`notebookDocument/didOpen`** — `clientToServer`
  ///
  /// A notification sent when a notebook opens.
  /// @since 3.17.0
  void onNotebookDocumentDidOpenNotification(
    Future<void> Function(DidOpenNotebookDocumentParams params) handler,
  );

  /// **`notebookDocument/didChange`** — `clientToServer`
  void onNotebookDocumentDidChangeNotification(
    Future<void> Function(DidChangeNotebookDocumentParams params) handler,
  );

  /// **`notebookDocument/didSave`** — `clientToServer`
  ///
  /// A notification sent when a notebook document is saved.
  /// @since 3.17.0
  void onNotebookDocumentDidSaveNotification(
    Future<void> Function(DidSaveNotebookDocumentParams params) handler,
  );

  /// **`notebookDocument/didClose`** — `clientToServer`
  ///
  /// A notification sent when a notebook closes.
  /// @since 3.17.0
  void onNotebookDocumentDidCloseNotification(
    Future<void> Function(DidCloseNotebookDocumentParams params) handler,
  );

  /// **`initialized`** — `clientToServer`
  ///
  /// The initialized notification is sent from the client to the server after
  /// the client is fully initialized and the server is allowed to send requests
  /// from the server to the client.
  void onInitializedNotification(
    Future<void> Function(InitializedParams params) handler,
  );

  /// **`exit`** — `clientToServer`
  ///
  /// The exit event is sent from the client to the server to ask the server to
  /// exit its process.
  void onExitNotification(Future<void> Function() handler);

  /// **`workspace/didChangeConfiguration`** — `clientToServer`
  ///
  /// The configuration change notification is sent from the client to the server
  /// when the client's configuration has changed. The notification contains the
  /// changed configuration as defined by the language client.
  void onWorkspaceDidChangeConfigurationNotification(
    Future<void> Function(DidChangeConfigurationParams params) handler,
  );

  /// **`window/showMessage`** — `serverToClient`
  ///
  /// The show message notification is sent from a server to a client to ask the
  /// client to display a particular message in the user interface.
  void sendWindowShowMessageNotification(ShowMessageParams params);

  /// **`window/logMessage`** — `serverToClient`
  ///
  /// The log message notification is sent from the server to the client to ask
  /// the client to log a particular message.
  void sendWindowLogMessageNotification(LogMessageParams params);

  /// **`telemetry/event`** — `serverToClient`
  ///
  /// The telemetry event notification is sent from the server to the client to
  /// ask the client to log telemetry data.
  void sendTelemetryEventNotification(LSPAny params);

  /// **`textDocument/didOpen`** — `clientToServer`
  ///
  /// The document open notification is sent from the client to the server to
  /// signal newly opened text documents. The document's truth is now managed by
  /// the client and the server must not try to read the document's truth using
  /// the document's uri. Open in this sense means it is managed by the client.
  /// It doesn't necessarily mean that its content is presented in an editor. An
  /// open notification must not be sent more than once without a corresponding
  /// close notification send before. This means open and close notification must
  /// be balanced and the max open count is one.
  void onTextDocumentDidOpenNotification(
    Future<void> Function(DidOpenTextDocumentParams params) handler,
  );

  /// **`textDocument/didChange`** — `clientToServer`
  ///
  /// The document change notification is sent from the client to the server to
  /// signal changes to a text document.
  void onTextDocumentDidChangeNotification(
    Future<void> Function(DidChangeTextDocumentParams params) handler,
  );

  /// **`textDocument/didClose`** — `clientToServer`
  ///
  /// The document close notification is sent from the client to the server when
  /// the document got closed in the client. The document's truth now exists
  /// where the document's uri points to (e.g. if the document's uri is a file
  /// uri the truth now exists on disk). As with the open notification the close
  /// notification is about managing the document's content. Receiving a close
  /// notification doesn't mean that the document was open in an editor before. A
  /// close notification requires a previous open notification to be sent.
  void onTextDocumentDidCloseNotification(
    Future<void> Function(DidCloseTextDocumentParams params) handler,
  );

  /// **`textDocument/didSave`** — `clientToServer`
  ///
  /// The document save notification is sent from the client to the server when
  /// the document got saved in the client.
  void onTextDocumentDidSaveNotification(
    Future<void> Function(DidSaveTextDocumentParams params) handler,
  );

  /// **`textDocument/willSave`** — `clientToServer`
  ///
  /// A document will save notification is sent from the client to the server
  /// before the document is actually saved.
  void onTextDocumentWillSaveNotification(
    Future<void> Function(WillSaveTextDocumentParams params) handler,
  );

  /// **`workspace/didChangeWatchedFiles`** — `clientToServer`
  ///
  /// The watched files notification is sent from the client to the server when
  /// the client detects changes to file watched by the language client.
  void onWorkspaceDidChangeWatchedFilesNotification(
    Future<void> Function(DidChangeWatchedFilesParams params) handler,
  );

  /// **`textDocument/publishDiagnostics`** — `serverToClient`
  ///
  /// Diagnostics notification are sent from the server to the client to signal
  /// results of validation runs.
  void sendTextDocumentPublishDiagnosticsNotification(
    PublishDiagnosticsParams params,
  );

  /// **`$/setTrace`** — `clientToServer`
  void onSetTraceNotification(
    Future<void> Function(SetTraceParams params) handler,
  );

  /// **`$/logTrace`** — `serverToClient`
  void sendLogTraceNotification(LogTraceParams params);

  /// **`$/cancelRequest`** — `both`
  void onCancelRequestNotification(
    Future<void> Function(CancelParams params) handler,
  );

  /// **`$/cancelRequest`** — `both`
  void sendCancelRequestNotification(CancelParams params);

  /// **`$/progress`** — `both`
  void onProgressNotification(
    Future<void> Function(ProgressParams params) handler,
  );

  /// **`$/progress`** — `both`
  void sendProgressNotification(ProgressParams params);
}
