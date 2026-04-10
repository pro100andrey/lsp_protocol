// GENERATED — do not edit.

import 'dart:async';

import 'package:lsp_specification/lsp_specification.dart';

import '../connection/lsp_connection.dart';/// Registers incoming LSP handlers for the `textDocument` namespace.
class TextDocumentHandlers {TextDocumentHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `textDocument/implementation`.
void onImplementation(Future<Object?> Function(ImplementationParams params) handler) { _connection.registerRequestHandler('textDocument/implementation', (json) async {
  final p = ImplementationParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/typeDefinition`.
void onTypeDefinition(Future<Object?> Function(TypeDefinitionParams params) handler) { _connection.registerRequestHandler('textDocument/typeDefinition', (json) async {
  final p = TypeDefinitionParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/documentColor`.
void onDocumentColor(Future<List<ColorInformation>> Function(DocumentColorParams params) handler) { _connection.registerRequestHandler('textDocument/documentColor', (json) async {
  final p = DocumentColorParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/colorPresentation`.
void onColorPresentation(Future<List<ColorPresentation>> Function(ColorPresentationParams params) handler) { _connection.registerRequestHandler('textDocument/colorPresentation', (json) async {
  final p = ColorPresentationParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/foldingRange`.
void onFoldingRange(Future<List<FoldingRange>?> Function(FoldingRangeParams params) handler) { _connection.registerRequestHandler('textDocument/foldingRange', (json) async {
  final p = FoldingRangeParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/declaration`.
void onDeclaration(Future<Object?> Function(DeclarationParams params) handler) { _connection.registerRequestHandler('textDocument/declaration', (json) async {
  final p = DeclarationParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/selectionRange`.
void onSelectionRange(Future<List<SelectionRange>?> Function(SelectionRangeParams params) handler) { _connection.registerRequestHandler('textDocument/selectionRange', (json) async {
  final p = SelectionRangeParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/prepareCallHierarchy`.
void onPrepareCallHierarchy(Future<List<CallHierarchyItem>?> Function(CallHierarchyPrepareParams params) handler) { _connection.registerRequestHandler('textDocument/prepareCallHierarchy', (json) async {
  final p = CallHierarchyPrepareParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/semanticTokens/full`.
void onSemanticTokensFull(Future<SemanticTokens?> Function(SemanticTokensParams params) handler) { _connection.registerRequestHandler('textDocument/semanticTokens/full', (json) async {
  final p = SemanticTokensParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/semanticTokens/full/delta`.
void onSemanticTokensFullDelta(Future<Object?> Function(SemanticTokensDeltaParams params) handler) { _connection.registerRequestHandler('textDocument/semanticTokens/full/delta', (json) async {
  final p = SemanticTokensDeltaParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/semanticTokens/range`.
void onSemanticTokensRange(Future<SemanticTokens?> Function(SemanticTokensRangeParams params) handler) { _connection.registerRequestHandler('textDocument/semanticTokens/range', (json) async {
  final p = SemanticTokensRangeParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/linkedEditingRange`.
void onLinkedEditingRange(Future<LinkedEditingRanges?> Function(LinkedEditingRangeParams params) handler) { _connection.registerRequestHandler('textDocument/linkedEditingRange', (json) async {
  final p = LinkedEditingRangeParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/moniker`.
void onMoniker(Future<List<Moniker>?> Function(MonikerParams params) handler) { _connection.registerRequestHandler('textDocument/moniker', (json) async {
  final p = MonikerParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/prepareTypeHierarchy`.
void onPrepareTypeHierarchy(Future<List<TypeHierarchyItem>?> Function(TypeHierarchyPrepareParams params) handler) { _connection.registerRequestHandler('textDocument/prepareTypeHierarchy', (json) async {
  final p = TypeHierarchyPrepareParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/inlineValue`.
void onInlineValue(Future<List<InlineValue>?> Function(InlineValueParams params) handler) { _connection.registerRequestHandler('textDocument/inlineValue', (json) async {
  final p = InlineValueParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/inlayHint`.
void onInlayHint(Future<List<InlayHint>?> Function(InlayHintParams params) handler) { _connection.registerRequestHandler('textDocument/inlayHint', (json) async {
  final p = InlayHintParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/diagnostic`.
void onDiagnostic(Future<DocumentDiagnosticReport> Function(DocumentDiagnosticParams params) handler) { _connection.registerRequestHandler('textDocument/diagnostic', (json) async {
  final p = DocumentDiagnosticParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
/// Registers handler for `textDocument/inlineCompletion`.
void onInlineCompletion(Future<Object?> Function(InlineCompletionParams params) handler) { _connection.registerRequestHandler('textDocument/inlineCompletion', (json) async {
  final p = InlineCompletionParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/willSaveWaitUntil`.
void onWillSaveWaitUntil(Future<List<TextEdit>?> Function(WillSaveTextDocumentParams params) handler) { _connection.registerRequestHandler('textDocument/willSaveWaitUntil', (json) async {
  final p = WillSaveTextDocumentParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/completion`.
void onCompletion(Future<Object?> Function(CompletionParams params) handler) { _connection.registerRequestHandler('textDocument/completion', (json) async {
  final p = CompletionParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/hover`.
void onHover(Future<Hover?> Function(HoverParams params) handler) { _connection.registerRequestHandler('textDocument/hover', (json) async {
  final p = HoverParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/signatureHelp`.
void onSignatureHelp(Future<SignatureHelp?> Function(SignatureHelpParams params) handler) { _connection.registerRequestHandler('textDocument/signatureHelp', (json) async {
  final p = SignatureHelpParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/definition`.
void onDefinition(Future<Object?> Function(DefinitionParams params) handler) { _connection.registerRequestHandler('textDocument/definition', (json) async {
  final p = DefinitionParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/references`.
void onReferences(Future<List<Location>?> Function(ReferenceParams params) handler) { _connection.registerRequestHandler('textDocument/references', (json) async {
  final p = ReferenceParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/documentHighlight`.
void onDocumentHighlight(Future<List<DocumentHighlight>?> Function(DocumentHighlightParams params) handler) { _connection.registerRequestHandler('textDocument/documentHighlight', (json) async {
  final p = DocumentHighlightParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/documentSymbol`.
void onDocumentSymbol(Future<Object?> Function(DocumentSymbolParams params) handler) { _connection.registerRequestHandler('textDocument/documentSymbol', (json) async {
  final p = DocumentSymbolParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `textDocument/codeAction`.
void onCodeAction(Future<List<Object>?> Function(CodeActionParams params) handler) { _connection.registerRequestHandler('textDocument/codeAction', (json) async {
  final p = CodeActionParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/codeLens`.
void onCodeLens(Future<List<CodeLens>?> Function(CodeLensParams params) handler) { _connection.registerRequestHandler('textDocument/codeLens', (json) async {
  final p = CodeLensParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/documentLink`.
void onDocumentLink(Future<List<DocumentLink>?> Function(DocumentLinkParams params) handler) { _connection.registerRequestHandler('textDocument/documentLink', (json) async {
  final p = DocumentLinkParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/formatting`.
void onFormatting(Future<List<TextEdit>?> Function(DocumentFormattingParams params) handler) { _connection.registerRequestHandler('textDocument/formatting', (json) async {
  final p = DocumentFormattingParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/rangeFormatting`.
void onRangeFormatting(Future<List<TextEdit>?> Function(DocumentRangeFormattingParams params) handler) { _connection.registerRequestHandler('textDocument/rangeFormatting', (json) async {
  final p = DocumentRangeFormattingParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/rangesFormatting`.
void onRangesFormatting(Future<List<TextEdit>?> Function(DocumentRangesFormattingParams params) handler) { _connection.registerRequestHandler('textDocument/rangesFormatting', (json) async {
  final p = DocumentRangesFormattingParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/onTypeFormatting`.
void onOnTypeFormatting(Future<List<TextEdit>?> Function(DocumentOnTypeFormattingParams params) handler) { _connection.registerRequestHandler('textDocument/onTypeFormatting', (json) async {
  final p = DocumentOnTypeFormattingParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `textDocument/rename`.
void onRename(Future<WorkspaceEdit?> Function(RenameParams params) handler) { _connection.registerRequestHandler('textDocument/rename', (json) async {
  final p = RenameParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/prepareRename`.
void onPrepareRename(Future<PrepareRenameResult?> Function(PrepareRenameParams params) handler) { _connection.registerRequestHandler('textDocument/prepareRename', (json) async {
  final p = PrepareRenameParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `textDocument/didOpen`.
void onDidOpen(Future<void> Function(DidOpenTextDocumentParams params) handler) { _connection.registerNotificationHandler('textDocument/didOpen', (json) async {
  final p = DidOpenTextDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `textDocument/didChange`.
void onDidChange(Future<void> Function(DidChangeTextDocumentParams params) handler) { _connection.registerNotificationHandler('textDocument/didChange', (json) async {
  final p = DidChangeTextDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `textDocument/didClose`.
void onDidClose(Future<void> Function(DidCloseTextDocumentParams params) handler) { _connection.registerNotificationHandler('textDocument/didClose', (json) async {
  final p = DidCloseTextDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `textDocument/didSave`.
void onDidSave(Future<void> Function(DidSaveTextDocumentParams params) handler) { _connection.registerNotificationHandler('textDocument/didSave', (json) async {
  final p = DidSaveTextDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `textDocument/willSave`.
void onWillSave(Future<void> Function(WillSaveTextDocumentParams params) handler) { _connection.registerNotificationHandler('textDocument/willSave', (json) async {
  final p = WillSaveTextDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
 }
/// Registers incoming LSP handlers for the `callHierarchy` namespace.
class CallHierarchyHandlers {CallHierarchyHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `callHierarchy/incomingCalls`.
void onIncomingCalls(Future<List<CallHierarchyIncomingCall>?> Function(CallHierarchyIncomingCallsParams params) handler) { _connection.registerRequestHandler('callHierarchy/incomingCalls', (json) async {
  final p = CallHierarchyIncomingCallsParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `callHierarchy/outgoingCalls`.
void onOutgoingCalls(Future<List<CallHierarchyOutgoingCall>?> Function(CallHierarchyOutgoingCallsParams params) handler) { _connection.registerRequestHandler('callHierarchy/outgoingCalls', (json) async {
  final p = CallHierarchyOutgoingCallsParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
 }
/// Registers incoming LSP handlers for the `workspace` namespace.
class WorkspaceHandlers {WorkspaceHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `workspace/willCreateFiles`.
void onWillCreateFiles(Future<WorkspaceEdit?> Function(CreateFilesParams params) handler) { _connection.registerRequestHandler('workspace/willCreateFiles', (json) async {
  final p = CreateFilesParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `workspace/willRenameFiles`.
void onWillRenameFiles(Future<WorkspaceEdit?> Function(RenameFilesParams params) handler) { _connection.registerRequestHandler('workspace/willRenameFiles', (json) async {
  final p = RenameFilesParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `workspace/willDeleteFiles`.
void onWillDeleteFiles(Future<WorkspaceEdit?> Function(DeleteFilesParams params) handler) { _connection.registerRequestHandler('workspace/willDeleteFiles', (json) async {
  final p = DeleteFilesParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `workspace/diagnostic`.
void onDiagnostic(Future<WorkspaceDiagnosticReport> Function(WorkspaceDiagnosticParams params) handler) { _connection.registerRequestHandler('workspace/diagnostic', (json) async {
  final p = WorkspaceDiagnosticParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
/// Registers handler for `workspace/symbol`.
void onSymbol(Future<Object?> Function(WorkspaceSymbolParams params) handler) { _connection.registerRequestHandler('workspace/symbol', (json) async {
  final p = WorkspaceSymbolParams.fromJson(json as Map<String, Object?>);
  return await handler(p);
}); } 
/// Registers handler for `workspace/executeCommand`.
void onExecuteCommand(Future<LSPAny?> Function(ExecuteCommandParams params) handler) { _connection.registerRequestHandler('workspace/executeCommand', (json) async {
  final p = ExecuteCommandParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.toJson();
}); } 
/// Registers handler for `workspace/didChangeWorkspaceFolders`.
void onDidChangeWorkspaceFolders(Future<void> Function(DidChangeWorkspaceFoldersParams params) handler) { _connection.registerNotificationHandler('workspace/didChangeWorkspaceFolders', (json) async {
  final p = DidChangeWorkspaceFoldersParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `workspace/didCreateFiles`.
void onDidCreateFiles(Future<void> Function(CreateFilesParams params) handler) { _connection.registerNotificationHandler('workspace/didCreateFiles', (json) async {
  final p = CreateFilesParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `workspace/didRenameFiles`.
void onDidRenameFiles(Future<void> Function(RenameFilesParams params) handler) { _connection.registerNotificationHandler('workspace/didRenameFiles', (json) async {
  final p = RenameFilesParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `workspace/didDeleteFiles`.
void onDidDeleteFiles(Future<void> Function(DeleteFilesParams params) handler) { _connection.registerNotificationHandler('workspace/didDeleteFiles', (json) async {
  final p = DeleteFilesParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `workspace/didChangeConfiguration`.
void onDidChangeConfiguration(Future<void> Function(DidChangeConfigurationParams params) handler) { _connection.registerNotificationHandler('workspace/didChangeConfiguration', (json) async {
  final p = DidChangeConfigurationParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `workspace/didChangeWatchedFiles`.
void onDidChangeWatchedFiles(Future<void> Function(DidChangeWatchedFilesParams params) handler) { _connection.registerNotificationHandler('workspace/didChangeWatchedFiles', (json) async {
  final p = DidChangeWatchedFilesParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
 }
/// Registers incoming LSP handlers for the `typeHierarchy` namespace.
class TypeHierarchyHandlers {TypeHierarchyHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `typeHierarchy/supertypes`.
void onSupertypes(Future<List<TypeHierarchyItem>?> Function(TypeHierarchySupertypesParams params) handler) { _connection.registerRequestHandler('typeHierarchy/supertypes', (json) async {
  final p = TypeHierarchySupertypesParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
/// Registers handler for `typeHierarchy/subtypes`.
void onSubtypes(Future<List<TypeHierarchyItem>?> Function(TypeHierarchySubtypesParams params) handler) { _connection.registerRequestHandler('typeHierarchy/subtypes', (json) async {
  final p = TypeHierarchySubtypesParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r?.map((e) => e.toJson()).toList();
}); } 
 }
/// Registers incoming LSP handlers for the `inlayHint` namespace.
class InlayHintHandlers {InlayHintHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `inlayHint/resolve`.
void onResolve(Future<InlayHint> Function(InlayHint params) handler) { _connection.registerRequestHandler('inlayHint/resolve', (json) async {
  final p = InlayHint.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
 }
/// Registers incoming LSP handlers for the `general` namespace.
class GeneralHandlers {GeneralHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `initialize`.
void onInitialize(Future<InitializeResult> Function(InitializeParams params) handler) { _connection.registerRequestHandler('initialize', (json) async {
  final p = InitializeParams.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
/// Registers handler for `shutdown`.
void onShutdown(Future<void> Function() handler) { _connection.registerRequestHandler('shutdown', (json) async {
  
  await handler();
return null;
}); } 
/// Registers handler for `initialized`.
void onInitialized(Future<void> Function(InitializedParams params) handler) { _connection.registerNotificationHandler('initialized', (json) async {
  final p = InitializedParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `exit`.
void onExit(Future<void> Function() handler) { _connection.registerNotificationHandler('exit', (json) async {
  
  await handler();
}); } 
/// Registers handler for `$/setTrace`.
void onSetTrace(Future<void> Function(SetTraceParams params) handler) { _connection.registerNotificationHandler('$/setTrace', (json) async {
  final p = SetTraceParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `$/cancelRequest`.
void onCancelRequest(Future<void> Function(CancelParams params) handler) { _connection.registerNotificationHandler('$/cancelRequest', (json) async {
  final p = CancelParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `$/progress`.
void onProgress(Future<void> Function(ProgressParams params) handler) { _connection.registerNotificationHandler('$/progress', (json) async {
  final p = ProgressParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
 }
/// Registers incoming LSP handlers for the `completionItem` namespace.
class CompletionItemHandlers {CompletionItemHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `completionItem/resolve`.
void onResolve(Future<CompletionItem> Function(CompletionItem params) handler) { _connection.registerRequestHandler('completionItem/resolve', (json) async {
  final p = CompletionItem.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
 }
/// Registers incoming LSP handlers for the `codeAction` namespace.
class CodeActionHandlers {CodeActionHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `codeAction/resolve`.
void onResolve(Future<CodeAction> Function(CodeAction params) handler) { _connection.registerRequestHandler('codeAction/resolve', (json) async {
  final p = CodeAction.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
 }
/// Registers incoming LSP handlers for the `workspaceSymbol` namespace.
class WorkspaceSymbolHandlers {WorkspaceSymbolHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `workspaceSymbol/resolve`.
void onResolve(Future<WorkspaceSymbol> Function(WorkspaceSymbol params) handler) { _connection.registerRequestHandler('workspaceSymbol/resolve', (json) async {
  final p = WorkspaceSymbol.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
 }
/// Registers incoming LSP handlers for the `codeLens` namespace.
class CodeLensHandlers {CodeLensHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `codeLens/resolve`.
void onResolve(Future<CodeLens> Function(CodeLens params) handler) { _connection.registerRequestHandler('codeLens/resolve', (json) async {
  final p = CodeLens.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
 }
/// Registers incoming LSP handlers for the `documentLink` namespace.
class DocumentLinkHandlers {DocumentLinkHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `documentLink/resolve`.
void onResolve(Future<DocumentLink> Function(DocumentLink params) handler) { _connection.registerRequestHandler('documentLink/resolve', (json) async {
  final p = DocumentLink.fromJson(json as Map<String, Object?>);
  final r = await handler(p);
return r.toJson();
}); } 
 }
/// Registers incoming LSP handlers for the `window` namespace.
class WindowHandlers {WindowHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `window/workDoneProgress/cancel`.
void onWorkDoneProgressCancel(Future<void> Function(WorkDoneProgressCancelParams params) handler) { _connection.registerNotificationHandler('window/workDoneProgress/cancel', (json) async {
  final p = WorkDoneProgressCancelParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
 }
/// Registers incoming LSP handlers for the `notebookDocument` namespace.
class NotebookDocumentHandlers {NotebookDocumentHandlers(this._connection);

final LspConnection _connection;

/// Registers handler for `notebookDocument/didOpen`.
void onDidOpen(Future<void> Function(DidOpenNotebookDocumentParams params) handler) { _connection.registerNotificationHandler('notebookDocument/didOpen', (json) async {
  final p = DidOpenNotebookDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `notebookDocument/didChange`.
void onDidChange(Future<void> Function(DidChangeNotebookDocumentParams params) handler) { _connection.registerNotificationHandler('notebookDocument/didChange', (json) async {
  final p = DidChangeNotebookDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `notebookDocument/didSave`.
void onDidSave(Future<void> Function(DidSaveNotebookDocumentParams params) handler) { _connection.registerNotificationHandler('notebookDocument/didSave', (json) async {
  final p = DidSaveNotebookDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
/// Registers handler for `notebookDocument/didClose`.
void onDidClose(Future<void> Function(DidCloseNotebookDocumentParams params) handler) { _connection.registerNotificationHandler('notebookDocument/didClose', (json) async {
  final p = DidCloseNotebookDocumentParams.fromJson(json as Map<String, Object?>);
  await handler(p);
}); } 
 }
/// Sends LSP messages to the client for the `workspace` namespace.
class WorkspaceSender {WorkspaceSender(this._connection);

final LspConnection _connection;

/// Sends the `workspace/workspaceFolders` request to the client.
Future<List<WorkspaceFolder>?> workspaceFolders() async  { final raw = await _connection.sendRequest('workspace/workspaceFolders');
return (raw as List).cast<Map<String, Object?>>().map(List<WorkspaceFolder>.fromJson).toList(); } 
/// Sends the `workspace/configuration` request to the client.
Future<List<LSPAny>> configuration(ConfigurationParams params) async  { final raw = await _connection.sendRequest('workspace/configuration', params.toJson());
return (raw as List).cast<Map<String, Object?>>().map(List<LSPAny>.fromJson).toList(); } 
/// Sends the `workspace/foldingRange/refresh` request to the client.
Future<void> foldingRangeRefresh() async  { await _connection.sendRequest('workspace/foldingRange/refresh'); } 
/// Sends the `workspace/semanticTokens/refresh` request to the client.
Future<void> semanticTokensRefresh() async  { await _connection.sendRequest('workspace/semanticTokens/refresh'); } 
/// Sends the `workspace/inlineValue/refresh` request to the client.
Future<void> inlineValueRefresh() async  { await _connection.sendRequest('workspace/inlineValue/refresh'); } 
/// Sends the `workspace/inlayHint/refresh` request to the client.
Future<void> inlayHintRefresh() async  { await _connection.sendRequest('workspace/inlayHint/refresh'); } 
/// Sends the `workspace/diagnostic/refresh` request to the client.
Future<void> diagnosticRefresh() async  { await _connection.sendRequest('workspace/diagnostic/refresh'); } 
/// Sends the `workspace/codeLens/refresh` request to the client.
Future<void> codeLensRefresh() async  { await _connection.sendRequest('workspace/codeLens/refresh'); } 
/// Sends the `workspace/applyEdit` request to the client.
Future<ApplyWorkspaceEditResult> applyEdit(ApplyWorkspaceEditParams params) async  { final raw = await _connection.sendRequest('workspace/applyEdit', params.toJson());
return ApplyWorkspaceEditResult.fromJson(raw as Map<String, Object?>); } 
 }
/// Sends LSP messages to the client for the `window` namespace.
class WindowSender {WindowSender(this._connection);

final LspConnection _connection;

/// Sends the `window/workDoneProgress/create` request to the client.
Future<void> workDoneProgressCreate(WorkDoneProgressCreateParams params) async  { await _connection.sendRequest('window/workDoneProgress/create', params.toJson()); } 
/// Sends the `window/showDocument` request to the client.
Future<ShowDocumentResult> showDocument(ShowDocumentParams params) async  { final raw = await _connection.sendRequest('window/showDocument', params.toJson());
return ShowDocumentResult.fromJson(raw as Map<String, Object?>); } 
/// Sends the `window/showMessageRequest` request to the client.
Future<MessageActionItem?> showMessageRequest(ShowMessageRequestParams params) async  { final raw = await _connection.sendRequest('window/showMessageRequest', params.toJson());
return raw == null ? null : MessageActionItem.fromJson(raw as Map<String, Object?>); } 
/// Sends the `window/showMessage` notification to the client.
void showMessage(ShowMessageParams params) => _connection.sendNotification('window/showMessage', params.toJson());;

/// Sends the `window/logMessage` notification to the client.
void logMessage(LogMessageParams params) => _connection.sendNotification('window/logMessage', params.toJson());;

 }
/// Sends LSP messages to the client for the `client` namespace.
class ClientSender {ClientSender(this._connection);

final LspConnection _connection;

/// Sends the `client/registerCapability` request to the client.
Future<void> registerCapability(RegistrationParams params) async  { await _connection.sendRequest('client/registerCapability', params.toJson()); } 
/// Sends the `client/unregisterCapability` request to the client.
Future<void> unregisterCapability(UnregistrationParams params) async  { await _connection.sendRequest('client/unregisterCapability', params.toJson()); } 
 }
/// Sends LSP messages to the client for the `telemetry` namespace.
class TelemetrySender {TelemetrySender(this._connection);

final LspConnection _connection;

/// Sends the `telemetry/event` notification to the client.
void event(Object? params) => _connection.sendNotification('telemetry/event', params.toJson());;

 }
/// Sends LSP messages to the client for the `textDocument` namespace.
class TextDocumentSender {TextDocumentSender(this._connection);

final LspConnection _connection;

/// Sends the `textDocument/publishDiagnostics` notification to the client.
void publishDiagnostics(PublishDiagnosticsParams params) => _connection.sendNotification('textDocument/publishDiagnostics', params.toJson());;

 }
/// Sends LSP messages to the client for the `general` namespace.
class GeneralSender {GeneralSender(this._connection);

final LspConnection _connection;

/// Sends the `$/logTrace` notification to the client.
void logTrace(LogTraceParams params) => _connection.sendNotification('$/logTrace', params.toJson());;

/// Sends the `$/cancelRequest` notification to the client.
void cancelRequest(CancelParams params) => _connection.sendNotification('$/cancelRequest', params.toJson());;

/// Sends the `$/progress` notification to the client.
void progress(ProgressParams params) => _connection.sendNotification('$/progress', params.toJson());;

 }
/// Aggregates all outgoing sender classes.
///
/// Access via [LspServer.client]:
/// ```dart
/// server.client.window.logMessage(LogMessageParams(...));
/// ```
class ServerToClientProxy {ServerToClientProxy(this._connection);

final LspConnection _connection;

late final workspace = WorkspaceSender(_connection);

late final window = WindowSender(_connection);

late final client = ClientSender(_connection);

late final telemetry = TelemetrySender(_connection);

late final textDocument = TextDocumentSender(_connection);

late final general = GeneralSender(_connection);

 }
