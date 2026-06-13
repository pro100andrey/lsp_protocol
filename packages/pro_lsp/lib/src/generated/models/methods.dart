// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

part 'methods.g.dart';

/// Base interface for LSP method identifiers.
abstract class LSPMethod {
  String get value;
}

/// LSP notification method identifiers, as sent over the wire.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum NotificationMethod implements LSPMethod {
  /// The `workspace/didChangeWorkspaceFolders` notification is sent from the
  /// client to the server when the workspace folder configuration changes.
  didChangeWorkspaceFolders('workspace/didChangeWorkspaceFolders'),

  /// The `window/workDoneProgress/cancel` notification is sent from the client
  /// to the server to cancel a progress initiated on the server side.
  cancel('window/workDoneProgress/cancel'),

  /// The did create files notification is sent from the client to the server
  /// when files were created from within the client.
  didCreateFiles('workspace/didCreateFiles'),

  /// The did rename files notification is sent from the client to the server
  /// when files were renamed from within the client.
  didRenameFiles('workspace/didRenameFiles'),

  /// The will delete files request is sent from the client to the server before
  /// files are actually deleted as long as the deletion is triggered from
  /// within the client.
  didDeleteFiles('workspace/didDeleteFiles'),

  /// A notification sent when a notebook opens.
  notebookDocumentDidOpen('notebookDocument/didOpen'),

  /// LSP notification `notebookDocument/didChange` (client to server).
  notebookDocumentDidChange('notebookDocument/didChange'),

  /// A notification sent when a notebook document is saved.
  notebookDocumentDidSave('notebookDocument/didSave'),

  /// A notification sent when a notebook closes.
  notebookDocumentDidClose('notebookDocument/didClose'),

  /// The initialized notification is sent from the client to the server after
  /// the client is fully initialized and the server is allowed to send requests
  /// from the server to the client.
  initialized('initialized'),

  /// The exit event is sent from the client to the server to ask the server to
  /// exit its process.
  exit('exit'),

  /// The configuration change notification is sent from the client to the
  /// server when the client's configuration has changed. The notification
  /// contains the changed configuration as defined by the language client.
  didChangeConfiguration('workspace/didChangeConfiguration'),

  /// The show message notification is sent from a server to a client to ask the
  /// client to display a particular message in the user interface.
  showMessage('window/showMessage'),

  /// The log message notification is sent from the server to the client to ask
  /// the client to log a particular message.
  logMessage('window/logMessage'),

  /// The telemetry event notification is sent from the server to the client to
  /// ask the client to log telemetry data.
  event('telemetry/event'),

  /// The document open notification is sent from the client to the server to
  /// signal newly opened text documents. The document's truth is now managed by
  /// the client and the server must not try to read the document's truth using
  /// the document's uri. Open in this sense means it is managed by the client.
  /// It doesn't necessarily mean that its content is presented in an editor. An
  /// open notification must not be sent more than once without a corresponding
  /// close notification send before. This means open and close notification
  /// must be balanced and the max open count is one.
  textDocumentDidOpen('textDocument/didOpen'),

  /// The document change notification is sent from the client to the server to
  /// signal changes to a text document.
  textDocumentDidChange('textDocument/didChange'),

  /// The document close notification is sent from the client to the server when
  /// the document got closed in the client. The document's truth now exists
  /// where the document's uri points to (e.g. if the document's uri is a file
  /// uri the truth now exists on disk). As with the open notification the close
  /// notification is about managing the document's content. Receiving a close
  /// notification doesn't mean that the document was open in an editor before.
  /// A close notification requires a previous open notification to be sent.
  textDocumentDidClose('textDocument/didClose'),

  /// The document save notification is sent from the client to the server when
  /// the document got saved in the client.
  textDocumentDidSave('textDocument/didSave'),

  /// A document will save notification is sent from the client to the server
  /// before the document is actually saved.
  willSave('textDocument/willSave'),

  /// The watched files notification is sent from the client to the server when
  /// the client detects changes to file watched by the language client.
  didChangeWatchedFiles('workspace/didChangeWatchedFiles'),

  /// Diagnostics notification are sent from the server to the client to signal
  /// results of validation runs.
  publishDiagnostics('textDocument/publishDiagnostics'),

  /// LSP notification `$/setTrace` (client to server).
  setTrace(r'$/setTrace'),

  /// LSP notification `$/logTrace` (server to client).
  logTrace(r'$/logTrace'),

  /// LSP notification `$/cancelRequest` (both directions).
  cancelRequest(r'$/cancelRequest'),

  /// LSP notification `$/progress` (both directions).
  progress(r'$/progress');

  const NotificationMethod(this.value);

  @override
  final String value;

  static NotificationMethod? decode(String json) =>
      $enumDecodeNullable(_$NotificationMethodEnumMap, json);
}

/// LSP request method identifiers, as sent over the wire.
@JsonEnum(valueField: 'value', alwaysCreate: true)
enum RequestMethod implements LSPMethod {
  /// A request to resolve the implementation locations of a symbol at a given
  /// text document position. The request's parameter is of type
  /// `TextDocumentPositionParams` the response is of type `Definition` or a
  /// Thenable that resolves to such.
  implementation('textDocument/implementation'),

  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type
  /// `TextDocumentPositionParams` the response is of type `Definition` or a
  /// Thenable that resolves to such.
  typeDefinition('textDocument/typeDefinition'),

  /// The `workspace/workspaceFolders` is sent from the server to the client to
  /// fetch the open workspace folders.
  workspaceFolders('workspace/workspaceFolders'),

  /// The 'workspace/configuration' request is sent from the server to the
  /// client to fetch a certain configuration setting.
  ///
  /// This pull model replaces the old push model where the client signaled
  /// configuration change via an event. If the server still needs to react to
  /// configuration changes (since the server caches the result of
  /// `workspace/configuration` requests) the server should register for an
  /// empty configuration change event and empty the cache if such an event is
  /// received.
  configuration('workspace/configuration'),

  /// A request to list all color symbols found in a given text document. The
  /// request's parameter is of type `DocumentColorParams` the response is of
  /// type `ColorInformation` or a Thenable that resolves to such.
  documentColor('textDocument/documentColor'),

  /// A request to list all presentation for a color. The request's parameter is
  /// of type `ColorPresentationParams` the response is of type
  /// `ColorInformation` or a Thenable that resolves to such.
  colorPresentation('textDocument/colorPresentation'),

  /// A request to provide folding ranges in a document. The request's parameter
  /// is of type `FoldingRangeParams`, the response is of type
  /// `FoldingRangeList` or a Thenable that resolves to such.
  foldingRange('textDocument/foldingRange'),
  workspaceFoldingRangeRefresh('workspace/foldingRange/refresh'),

  /// A request to resolve the type definition locations of a symbol at a given
  /// text document position. The request's parameter is of type
  /// `TextDocumentPositionParams` the response is of type `Declaration` or a
  /// typed array of `DeclarationLink` or a Thenable that resolves to such.
  declaration('textDocument/declaration'),

  /// A request to provide selection ranges in a document. The request's
  /// parameter is of type `SelectionRangeParams`, the response is of type
  /// `SelectionRange` or a Thenable that resolves to such.
  selectionRange('textDocument/selectionRange'),

  /// The `window/workDoneProgress/create` request is sent from the server to
  /// the client to initiate progress reporting from the server.
  create('window/workDoneProgress/create'),

  /// A request to result a `CallHierarchyItem` in a document at a given
  /// position. Can be used as an input to an incoming or outgoing call
  /// hierarchy.
  prepareCallHierarchy('textDocument/prepareCallHierarchy'),

  /// A request to resolve the incoming calls for a given `CallHierarchyItem`.
  incomingCalls('callHierarchy/incomingCalls'),

  /// A request to resolve the outgoing calls for a given `CallHierarchyItem`.
  outgoingCalls('callHierarchy/outgoingCalls'),
  full('textDocument/semanticTokens/full'),
  delta('textDocument/semanticTokens/full/delta'),
  range('textDocument/semanticTokens/range'),
  workspaceSemanticTokensRefresh('workspace/semanticTokens/refresh'),

  /// A request to show a document. This request might open an external program
  /// depending on the value of the URI to open. For example a request to open
  /// `https://code.visualstudio.com/` will very likely open the URI in a WEB
  /// browser.
  showDocument('window/showDocument'),

  /// A request to provide ranges that can be edited together.
  linkedEditingRange('textDocument/linkedEditingRange'),

  /// The will create files request is sent from the client to the server before
  /// files are actually created as long as the creation is triggered from
  /// within the client.
  ///
  /// The request can return a `WorkspaceEdit` which will be applied to
  /// workspace before the files are created. Hence the `WorkspaceEdit` can not
  /// manipulate the content of the file to be created.
  willCreateFiles('workspace/willCreateFiles'),

  /// The will rename files request is sent from the client to the server before
  /// files are actually renamed as long as the rename is triggered from within
  /// the client.
  willRenameFiles('workspace/willRenameFiles'),

  /// The did delete files notification is sent from the client to the server
  /// when files were deleted from within the client.
  willDeleteFiles('workspace/willDeleteFiles'),

  /// A request to get the moniker of a symbol at a given text document
  /// position. The request parameter is of type `TextDocumentPositionParams`.
  /// The response is of type `Moniker` or `null`.
  moniker('textDocument/moniker'),

  /// A request to result a `TypeHierarchyItem` in a document at a given
  /// position. Can be used as an input to a subtypes or supertypes type
  /// hierarchy.
  prepareTypeHierarchy('textDocument/prepareTypeHierarchy'),

  /// A request to resolve the supertypes for a given `TypeHierarchyItem`.
  supertypes('typeHierarchy/supertypes'),

  /// A request to resolve the subtypes for a given `TypeHierarchyItem`.
  subtypes('typeHierarchy/subtypes'),

  /// A request to provide inline values in a document. The request's parameter
  /// is of type `InlineValueParams`, the response is of type `InlineValue` or a
  /// Thenable that resolves to such.
  inlineValue('textDocument/inlineValue'),
  workspaceInlineValueRefresh('workspace/inlineValue/refresh'),

  /// A request to provide inlay hints in a document. The request's parameter is
  /// of type `InlayHintsParams`, the response is of type `InlayHint` or a
  /// Thenable that resolves to such.
  inlayHint('textDocument/inlayHint'),

  /// A request to resolve additional properties for an inlay hint. The
  /// request's parameter is of type `InlayHint`, the response is of type
  /// `InlayHint` or a Thenable that resolves to such.
  inlayHintResolve('inlayHint/resolve'),
  workspaceInlayHintRefresh('workspace/inlayHint/refresh'),

  /// The document diagnostic request definition.
  textDocumentDiagnostic('textDocument/diagnostic'),

  /// The workspace diagnostic request definition.
  workspaceDiagnostic('workspace/diagnostic'),

  /// The diagnostic refresh request definition.
  workspaceDiagnosticRefresh('workspace/diagnostic/refresh'),

  /// A request to provide inline completions in a document. The request's
  /// parameter is of type `InlineCompletionParams`, the response is of type
  /// `InlineCompletion` or a Thenable that resolves to such.
  inlineCompletion('textDocument/inlineCompletion'),

  /// The `client/registerCapability` request is sent from the server to the
  /// client to register a new capability handler on the client side.
  registerCapability('client/registerCapability'),

  /// The `client/unregisterCapability` request is sent from the server to the
  /// client to unregister a previously registered capability handler on the
  /// client side.
  unregisterCapability('client/unregisterCapability'),

  /// The initialize request is sent from the client to the server. It is sent
  /// once as the request after starting up the server. The requests parameter
  /// is of type `InitializeParams` the response if of type `InitializeResult`
  /// of a Thenable that resolves to such.
  initialize('initialize'),

  /// A shutdown request is sent from the client to the server. It is sent once
  /// when the client decides to shutdown the server. The only notification that
  /// is sent after a shutdown request is the exit event.
  shutdown('shutdown'),

  /// The show message request is sent from the server to the client to show a
  /// message and a set of options actions to the user.
  showMessageRequest('window/showMessageRequest'),

  /// A document will save request is sent from the client to the server before
  /// the document is actually saved. The request can return an array of
  /// TextEdits which will be applied to the text document before it is saved.
  /// Please note that clients might drop results if computing the text edits
  /// took too long or if a server constantly fails on this request. This is
  /// done to keep the save fast and reliable.
  willSaveWaitUntil('textDocument/willSaveWaitUntil'),

  /// Request to request completion at a given text document position. The
  /// request's parameter is of type `TextDocumentPosition` the response is of
  /// type `CompletionItem` or `CompletionList` or a Thenable that resolves to
  /// such.
  ///
  /// The request can delay the computation of the `detail` and `documentation`
  /// properties to the `completionItem/resolve` request. However, properties
  /// that are needed for the initial sorting and filtering, like `sortText`,
  /// `filterText`, `insertText`, and `textEdit`, must not be changed during
  /// resolve.
  completion('textDocument/completion'),

  /// Request to resolve additional information for a given completion item.The
  /// request's parameter is of type `CompletionItem` the response is of type
  /// `CompletionItem` or a Thenable that resolves to such.
  completionItemResolve('completionItem/resolve'),

  /// Request to request hover information at a given text document position.
  /// The request's parameter is of type `TextDocumentPosition` the response is
  /// of type `Hover` or a Thenable that resolves to such.
  hover('textDocument/hover'),

  /// LSP request `textDocument/signatureHelp` (client to server).
  signatureHelp('textDocument/signatureHelp'),

  /// A request to resolve the definition location of a symbol at a given text
  /// document position. The request's parameter is of type
  /// `TextDocumentPosition` the response is of either type `Definition` or a
  /// typed array of `DefinitionLink` or a Thenable that resolves to such.
  definition('textDocument/definition'),

  /// A request to resolve project-wide references for the symbol denoted by the
  /// given text document position. The request's parameter is of type
  /// `ReferenceParams` the response is of type `Location` or a Thenable that
  /// resolves to such.
  references('textDocument/references'),

  /// Request to resolve a `DocumentHighlight` for a given text document
  /// position. The request's parameter is of type `TextDocumentPosition` the
  /// request response is an array of type `DocumentHighlight` or a Thenable
  /// that resolves to such.
  documentHighlight('textDocument/documentHighlight'),

  /// A request to list all symbols found in a given text document. The
  /// request's parameter is of type `TextDocumentIdentifier` the response is of
  /// type `SymbolInformation` or a Thenable that resolves to such.
  documentSymbol('textDocument/documentSymbol'),

  /// A request to provide commands for the given text document and range.
  codeAction('textDocument/codeAction'),

  /// Request to resolve additional information for a given code action.The
  /// request's parameter is of type `CodeAction` the response is of type
  /// `CodeAction` or a Thenable that resolves to such.
  codeActionResolve('codeAction/resolve'),

  /// A request to list project-wide symbols matching the query string given by
  /// the `WorkspaceSymbolParams`. The response is of type `SymbolInformation`
  /// or a Thenable that resolves to such.
  ///
  /// - support for WorkspaceSymbol in the returned data. Clients need to
  /// advertise support for WorkspaceSymbols via the client capability
  /// `workspace.symbol.resolveSupport`.
  symbol('workspace/symbol'),

  /// A request to resolve the range inside the workspace symbol's location.
  workspaceSymbolResolve('workspaceSymbol/resolve'),

  /// A request to provide code lens for the given text document.
  codeLens('textDocument/codeLens'),

  /// A request to resolve a command for a given code lens.
  codeLensResolve('codeLens/resolve'),

  /// A request to refresh all code actions
  workspaceCodeLensRefresh('workspace/codeLens/refresh'),

  /// A request to provide document links
  documentLink('textDocument/documentLink'),

  /// Request to resolve additional information for a given document link. The
  /// request's parameter is of type `DocumentLink` the response is of type
  /// `DocumentLink` or a Thenable that resolves to such.
  documentLinkResolve('documentLink/resolve'),

  /// A request to format a whole document.
  formatting('textDocument/formatting'),

  /// A request to format a range in a document.
  rangeFormatting('textDocument/rangeFormatting'),

  /// A request to format ranges in a document.
  rangesFormatting('textDocument/rangesFormatting'),

  /// A request to format a document on type.
  onTypeFormatting('textDocument/onTypeFormatting'),

  /// A request to rename a symbol.
  rename('textDocument/rename'),

  /// A request to test and perform the setup necessary for a rename.
  ///
  /// - support for default behavior
  prepareRename('textDocument/prepareRename'),

  /// A request send from the client to the server to execute a command. The
  /// request might return a workspace edit which the client will apply to the
  /// workspace.
  executeCommand('workspace/executeCommand'),

  /// A request sent from the server to the client to modified certain
  /// resources.
  applyEdit('workspace/applyEdit');

  const RequestMethod(this.value);

  @override
  final String value;

  static RequestMethod? decode(String json) =>
      $enumDecodeNullable(_$RequestMethodEnumMap, json);
}
