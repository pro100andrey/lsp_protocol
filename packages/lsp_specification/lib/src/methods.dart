// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

part 'methods.g.dart';

/// LSP notification method identifiers, as sent over the wire.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum NotificationMethod {
  /// The `workspace/didChangeWorkspaceFolders` notification is sent from the
  /// client to the server when the workspace folder configuration changes.
  didChangeWorkspaceFolders(r'workspace/didChangeWorkspaceFolders'),

  /// The `window/workDoneProgress/cancel` notification is sent from the client to
  /// the server to cancel a progress initiated on the server side.
  cancel(r'window/workDoneProgress/cancel'),

  /// The did create files notification is sent from the client to the server when
  /// files were created from within the client.
  didCreateFiles(r'workspace/didCreateFiles'),

  /// The did rename files notification is sent from the client to the server when
  /// files were renamed from within the client.
  didRenameFiles(r'workspace/didRenameFiles'),

  /// The will delete files request is sent from the client to the server before
  /// files are actually deleted as long as the deletion is triggered from within
  /// the client.
  didDeleteFiles(r'workspace/didDeleteFiles'),

  /// A notification sent when a notebook opens.
  notebookDocumentDidOpen(r'notebookDocument/didOpen'),

  /// LSP notification `notebookDocument/didChange` (client to server).
  notebookDocumentDidChange(r'notebookDocument/didChange'),

  /// A notification sent when a notebook document is saved.
  notebookDocumentDidSave(r'notebookDocument/didSave'),

  /// A notification sent when a notebook closes.
  notebookDocumentDidClose(r'notebookDocument/didClose'),

  /// The initialized notification is sent from the client to the server after the
  /// client is fully initialized and the server is allowed to send requests from
  /// the server to the client.
  initialized(r'initialized'),

  /// The exit event is sent from the client to the server to ask the server to
  /// exit its process.
  exit(r'exit'),

  /// The configuration change notification is sent from the client to the server
  /// when the client's configuration has changed. The notification contains the
  /// changed configuration as defined by the language client.
  didChangeConfiguration(r'workspace/didChangeConfiguration'),

  /// The show message notification is sent from a server to a client to ask the
  /// client to display a particular message in the user interface.
  showMessage(r'window/showMessage'),

  /// The log message notification is sent from the server to the client to ask
  /// the client to log a particular message.
  logMessage(r'window/logMessage'),

  /// The telemetry event notification is sent from the server to the client to
  /// ask the client to log telemetry data.
  event(r'telemetry/event'),

  /// The document open notification is sent from the client to the server to
  /// signal newly opened text documents. The document's truth is now managed by
  /// the client and the server must not try to read the document's truth using
  /// the document's uri. Open in this sense means it is managed by the client. It
  /// doesn't necessarily mean that its content is presented in an editor. An open
  /// notification must not be sent more than once without a corresponding close
  /// notification send before. This means open and close notification must be
  /// balanced and the max open count is one.
  textDocumentDidOpen(r'textDocument/didOpen'),

  /// The document change notification is sent from the client to the server to
  /// signal changes to a text document.
  textDocumentDidChange(r'textDocument/didChange'),

  /// The document close notification is sent from the client to the server when
  /// the document got closed in the client. The document's truth now exists where
  /// the document's uri points to (e.g. if the document's uri is a file uri the
  /// truth now exists on disk). As with the open notification the close
  /// notification is about managing the document's content. Receiving a close
  /// notification doesn't mean that the document was open in an editor before. A
  /// close notification requires a previous open notification to be sent.
  textDocumentDidClose(r'textDocument/didClose'),

  /// The document save notification is sent from the client to the server when
  /// the document got saved in the client.
  textDocumentDidSave(r'textDocument/didSave'),

  /// A document will save notification is sent from the client to the server
  /// before the document is actually saved.
  willSave(r'textDocument/willSave'),

  /// The watched files notification is sent from the client to the server when
  /// the client detects changes to file watched by the language client.
  didChangeWatchedFiles(r'workspace/didChangeWatchedFiles'),

  /// Diagnostics notification are sent from the server to the client to signal
  /// results of validation runs.
  publishDiagnostics(r'textDocument/publishDiagnostics'),

  /// LSP notification `$/setTrace` (client to server).
  setTrace(r'$/setTrace'),

  /// LSP notification `$/logTrace` (server to client).
  logTrace(r'$/logTrace'),

  /// LSP notification `$/cancelRequest` (both directions).
  cancelRequest(r'$/cancelRequest'),

  /// LSP notification `$/progress` (both directions).
  progress(r'$/progress');

  const NotificationMethod(this.value);

  final String value;

  static NotificationMethod? decode(String json) =>
      $enumDecodeNullable(_$NotificationMethodEnumMap, json);
}

/// LSP request method identifiers, as sent over the wire.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum RequestMethod {
  /// A request to resolve the implementation locations of a symbol at a given
  /// text document position. The request's parameter is of type
  /// [TextDocumentPositionParams] the response is of type [Definition] or a
  /// Thenable that resolves to such.
  implementation(r'textDocument/implementation'),

  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type
  /// [TextDocumentPositionParams] the response is of type [Definition] or a
  /// Thenable that resolves to such.
  typeDefinition(r'textDocument/typeDefinition'),

  /// The `workspace/workspaceFolders` is sent from the server to the client to
  /// fetch the open workspace folders.
  workspaceFolders(r'workspace/workspaceFolders'),

  /// The 'workspace/configuration' request is sent from the server to the client
  /// to fetch a certain configuration setting.
  ///
  /// This pull model replaces the old push model where the client signaled
  /// configuration change via an event. If the server still needs to react to
  /// configuration changes (since the server caches the result of
  /// `workspace/configuration` requests) the server should register for an empty
  /// configuration change event and empty the cache if such an event is received.
  configuration(r'workspace/configuration'),

  /// A request to list all color symbols found in a given text document. The
  /// request's parameter is of type [DocumentColorParams] the response is of type
  /// [ColorInformation] or a Thenable that resolves to such.
  documentColor(r'textDocument/documentColor'),

  /// A request to list all presentation for a color. The request's parameter is
  /// of type [ColorPresentationParams] the response is of type [ColorInformation]
  /// or a Thenable that resolves to such.
  colorPresentation(r'textDocument/colorPresentation'),

  /// A request to provide folding ranges in a document. The request's parameter
  /// is of type [FoldingRangeParams], the response is of type [FoldingRangeList]
  /// or a Thenable that resolves to such.
  foldingRange(r'textDocument/foldingRange'),
  workspaceFoldingRangeRefresh(r'workspace/foldingRange/refresh'),

  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type
  /// [TextDocumentPositionParams] the response is of type [Declaration] or a
  /// typed array of [DeclarationLink] or a Thenable that resolves to such.
  declaration(r'textDocument/declaration'),

  /// A request to provide selection ranges in a document. The request's parameter
  /// is of type [SelectionRangeParams], the response is of type [SelectionRange]
  /// or a Thenable that resolves to such.
  selectionRange(r'textDocument/selectionRange'),

  /// The `window/workDoneProgress/create` request is sent from the server to the
  /// client to initiate progress reporting from the server.
  create(r'window/workDoneProgress/create'),

  /// A request to result a `CallHierarchyItem` in a document at a given position.
  /// Can be used as an input to an incoming or outgoing call hierarchy.
  prepareCallHierarchy(r'textDocument/prepareCallHierarchy'),

  /// A request to resolve the incoming calls for a given `CallHierarchyItem`.
  incomingCalls(r'callHierarchy/incomingCalls'),

  /// A request to resolve the outgoing calls for a given `CallHierarchyItem`.
  outgoingCalls(r'callHierarchy/outgoingCalls'),
  full(r'textDocument/semanticTokens/full'),
  delta(r'textDocument/semanticTokens/full/delta'),
  range(r'textDocument/semanticTokens/range'),
  workspaceSemanticTokensRefresh(r'workspace/semanticTokens/refresh'),

  /// A request to show a document. This request might open an external program
  /// depending on the value of the URI to open. For example a request to open
  /// `https://code.visualstudio.com/` will very likely open the URI in a WEB
  /// browser.
  showDocument(r'window/showDocument'),

  /// A request to provide ranges that can be edited together.
  linkedEditingRange(r'textDocument/linkedEditingRange'),

  /// The will create files request is sent from the client to the server before
  /// files are actually created as long as the creation is triggered from within
  /// the client.
  ///
  /// The request can return a `WorkspaceEdit` which will be applied to workspace
  /// before the files are created. Hence the `WorkspaceEdit` can not manipulate
  /// the content of the file to be created.
  willCreateFiles(r'workspace/willCreateFiles'),

  /// The will rename files request is sent from the client to the server before
  /// files are actually renamed as long as the rename is triggered from within
  /// the client.
  willRenameFiles(r'workspace/willRenameFiles'),

  /// The did delete files notification is sent from the client to the server when
  /// files were deleted from within the client.
  willDeleteFiles(r'workspace/willDeleteFiles'),

  /// A request to get the moniker of a symbol at a given text document position.
  /// The request parameter is of type [TextDocumentPositionParams]. The response
  /// is of type [Moniker] or `null`.
  moniker(r'textDocument/moniker'),

  /// A request to result a `TypeHierarchyItem` in a document at a given position.
  /// Can be used as an input to a subtypes or supertypes type hierarchy.
  prepareTypeHierarchy(r'textDocument/prepareTypeHierarchy'),

  /// A request to resolve the supertypes for a given `TypeHierarchyItem`.
  supertypes(r'typeHierarchy/supertypes'),

  /// A request to resolve the subtypes for a given `TypeHierarchyItem`.
  subtypes(r'typeHierarchy/subtypes'),

  /// A request to provide inline values in a document. The request's parameter is
  /// of type [InlineValueParams], the response is of type [InlineValue] or a
  /// Thenable that resolves to such.
  inlineValue(r'textDocument/inlineValue'),
  workspaceInlineValueRefresh(r'workspace/inlineValue/refresh'),

  /// A request to provide inlay hints in a document. The request's parameter is
  /// of type [InlayHintsParams], the response is of type [InlayHint] or a
  /// Thenable that resolves to such.
  inlayHint(r'textDocument/inlayHint'),

  /// A request to resolve additional properties for an inlay hint. The request's
  /// parameter is of type [InlayHint], the response is of type [InlayHint] or a
  /// Thenable that resolves to such.
  inlayHintResolve(r'inlayHint/resolve'),
  workspaceInlayHintRefresh(r'workspace/inlayHint/refresh'),

  /// The document diagnostic request definition.
  textDocumentDiagnostic(r'textDocument/diagnostic'),

  /// The workspace diagnostic request definition.
  workspaceDiagnostic(r'workspace/diagnostic'),

  /// The diagnostic refresh request definition.
  workspaceDiagnosticRefresh(r'workspace/diagnostic/refresh'),

  /// A request to provide inline completions in a document. The request's
  /// parameter is of type [InlineCompletionParams], the response is of type
  /// [InlineCompletion] or a Thenable that resolves to such.
  inlineCompletion(r'textDocument/inlineCompletion'),

  /// The `client/registerCapability` request is sent from the server to the
  /// client to register a new capability handler on the client side.
  registerCapability(r'client/registerCapability'),

  /// The `client/unregisterCapability` request is sent from the server to the
  /// client to unregister a previously registered capability handler on the
  /// client side.
  unregisterCapability(r'client/unregisterCapability'),

  /// The initialize request is sent from the client to the server. It is sent
  /// once as the request after starting up the server. The requests parameter is
  /// of type [InitializeParams] the response if of type [InitializeResult] of a
  /// Thenable that resolves to such.
  initialize(r'initialize'),

  /// A shutdown request is sent from the client to the server. It is sent once
  /// when the client decides to shutdown the server. The only notification that
  /// is sent after a shutdown request is the exit event.
  shutdown(r'shutdown'),

  /// The show message request is sent from the server to the client to show a
  /// message and a set of options actions to the user.
  showMessageRequest(r'window/showMessageRequest'),

  /// A document will save request is sent from the client to the server before
  /// the document is actually saved. The request can return an array of TextEdits
  /// which will be applied to the text document before it is saved. Please note
  /// that clients might drop results if computing the text edits took too long or
  /// if a server constantly fails on this request. This is done to keep the save
  /// fast and reliable.
  willSaveWaitUntil(r'textDocument/willSaveWaitUntil'),

  /// Request to request completion at a given text document position. The
  /// request's parameter is of type [TextDocumentPosition] the response is of
  /// type [CompletionItem] or [CompletionList] or a Thenable that resolves to
  /// such.
  ///
  /// The request can delay the computation of the [detail] and [documentation]
  /// properties to the `completionItem/resolve` request. However, properties that
  /// are needed for the initial sorting and filtering, like `sortText`,
  /// `filterText`, `insertText`, and `textEdit`, must not be changed during
  /// resolve.
  completion(r'textDocument/completion'),

  /// Request to resolve additional information for a given completion item.The
  /// request's parameter is of type [CompletionItem] the response is of type
  /// [CompletionItem] or a Thenable that resolves to such.
  completionItemResolve(r'completionItem/resolve'),

  /// Request to request hover information at a given text document position. The
  /// request's parameter is of type [TextDocumentPosition] the response is of
  /// type [Hover] or a Thenable that resolves to such.
  hover(r'textDocument/hover'),

  /// LSP request `textDocument/signatureHelp` (client to server).
  signatureHelp(r'textDocument/signatureHelp'),

  /// A request to resolve the definition location of a symbol at a given text
  /// document position. The request's parameter is of type [TextDocumentPosition]
  /// the response is of either type [Definition] or a typed array of
  /// [DefinitionLink] or a Thenable that resolves to such.
  definition(r'textDocument/definition'),

  /// A request to resolve project-wide references for the symbol denoted by the
  /// given text document position. The request's parameter is of type
  /// [ReferenceParams] the response is of type [Location] or a Thenable that
  /// resolves to such.
  references(r'textDocument/references'),

  /// Request to resolve a [DocumentHighlight] for a given text document position.
  /// The request's parameter is of type [TextDocumentPosition] the request
  /// response is an array of type [DocumentHighlight] or a Thenable that resolves
  /// to such.
  documentHighlight(r'textDocument/documentHighlight'),

  /// A request to list all symbols found in a given text document. The request's
  /// parameter is of type [TextDocumentIdentifier] the response is of type
  /// [SymbolInformation] or a Thenable that resolves to such.
  documentSymbol(r'textDocument/documentSymbol'),

  /// A request to provide commands for the given text document and range.
  codeAction(r'textDocument/codeAction'),

  /// Request to resolve additional information for a given code action.The
  /// request's parameter is of type [CodeAction] the response is of type
  /// [CodeAction] or a Thenable that resolves to such.
  codeActionResolve(r'codeAction/resolve'),

  /// A request to list project-wide symbols matching the query string given by
  /// the [WorkspaceSymbolParams]. The response is of type [SymbolInformation] or
  /// a Thenable that resolves to such.
  ///
  /// - support for WorkspaceSymbol in the returned data. Clients need to
  /// advertise support for WorkspaceSymbols via the client capability
  /// `workspace.symbol.resolveSupport`.
  symbol(r'workspace/symbol'),

  /// A request to resolve the range inside the workspace symbol's location.
  workspaceSymbolResolve(r'workspaceSymbol/resolve'),

  /// A request to provide code lens for the given text document.
  codeLens(r'textDocument/codeLens'),

  /// A request to resolve a command for a given code lens.
  codeLensResolve(r'codeLens/resolve'),

  /// A request to refresh all code actions
  workspaceCodeLensRefresh(r'workspace/codeLens/refresh'),

  /// A request to provide document links
  documentLink(r'textDocument/documentLink'),

  /// Request to resolve additional information for a given document link. The
  /// request's parameter is of type [DocumentLink] the response is of type
  /// [DocumentLink] or a Thenable that resolves to such.
  documentLinkResolve(r'documentLink/resolve'),

  /// A request to format a whole document.
  formatting(r'textDocument/formatting'),

  /// A request to format a range in a document.
  rangeFormatting(r'textDocument/rangeFormatting'),

  /// A request to format ranges in a document.
  rangesFormatting(r'textDocument/rangesFormatting'),

  /// A request to format a document on type.
  onTypeFormatting(r'textDocument/onTypeFormatting'),

  /// A request to rename a symbol.
  rename(r'textDocument/rename'),

  /// A request to test and perform the setup necessary for a rename.
  ///
  /// - support for default behavior
  prepareRename(r'textDocument/prepareRename'),

  /// A request send from the client to the server to execute a command. The
  /// request might return a workspace edit which the client will apply to the
  /// workspace.
  executeCommand(r'workspace/executeCommand'),

  /// A request sent from the server to the client to modified certain resources.
  applyEdit(r'workspace/applyEdit');

  const RequestMethod(this.value);

  final String value;

  static RequestMethod? decode(String json) =>
      $enumDecodeNullable(_$RequestMethodEnumMap, json);
}
