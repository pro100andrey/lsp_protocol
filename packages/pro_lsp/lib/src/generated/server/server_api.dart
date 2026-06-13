// GENERATED — do not edit.

import 'dart:async';

import '../../connection/lsp_connection.dart';
import '../../connection/lsp_exception.dart';
import '../../server/lsp_request.dart';
import '../models/structures.dart';
import '../models/unions.dart';

/// Aggregates all outgoing sender classes.
///
/// Access via `LspServer.server.client`:
/// ```dart
/// server.client.window.logMessage(LogMessageParams(...));
/// ```
extension type ServerToClientProxy(LspConnection _c) {
  ServerWorkspaceSender get workspace => ServerWorkspaceSender(_c);

  ServerWindowSender get window => ServerWindowSender(_c);

  ServerClientSender get client => ServerClientSender(_c);

  ServerTelemetrySender get telemetry => ServerTelemetrySender(_c);

  ServerTextDocumentSender get textDocument => ServerTextDocumentSender(_c);

  ServerGeneralSender get general => ServerGeneralSender(_c);
}

/// Registers incoming LSP handlers for the `textDocument` namespace.
extension type ServerTextDocumentHandlers(LspConnection _c) {
  /// Registers handler for `textDocument/implementation`.
  void onImplementation(
    Future<ImplementationResult?> Function(
      ImplementationParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.implementation, (j, c) async {
    final params = parseParams(j, ImplementationParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/typeDefinition`.
  void onTypeDefinition(
    Future<TypeDefinitionResult?> Function(
      TypeDefinitionParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.typeDefinition, (j, c) async {
    final params = parseParams(j, TypeDefinitionParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/documentColor`.
  void onDocumentColor(
    Future<List<ColorInformation>> Function(
      DocumentColorParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.documentColor, (j, c) async {
    final params = parseParams(j, DocumentColorParams.fromJson);
    final result = await handler(params, c);
    return result.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/colorPresentation`.
  void onColorPresentation(
    Future<List<ColorPresentation>> Function(
      ColorPresentationParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.colorPresentation, (j, c) async {
    final params = parseParams(j, ColorPresentationParams.fromJson);
    final result = await handler(params, c);
    return result.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/foldingRange`.
  void onFoldingRange(
    Future<List<FoldingRange>?> Function(
      FoldingRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.foldingRange, (j, c) async {
    final params = parseParams(j, FoldingRangeParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/declaration`.
  void onDeclaration(
    Future<DeclarationResult?> Function(
      DeclarationParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.declaration, (j, c) async {
    final params = parseParams(j, DeclarationParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/selectionRange`.
  void onSelectionRange(
    Future<List<SelectionRange>?> Function(
      SelectionRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.selectionRange, (j, c) async {
    final params = parseParams(j, SelectionRangeParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/prepareCallHierarchy`.
  void onPrepareCallHierarchy(
    Future<List<CallHierarchyItem>?> Function(
      CallHierarchyPrepareParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.prepareCallHierarchy, (j, c) async {
    final params = parseParams(j, CallHierarchyPrepareParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/semanticTokens/full`.
  void onSemanticTokensFull(
    Future<SemanticTokens?> Function(
      SemanticTokensParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.full, (j, c) async {
    final params = parseParams(j, SemanticTokensParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/semanticTokens/full/delta`.
  void onSemanticTokensFullDelta(
    Future<SemanticTokensFullDeltaResult?> Function(
      SemanticTokensDeltaParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.delta, (j, c) async {
    final params = parseParams(j, SemanticTokensDeltaParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/semanticTokens/range`.
  void onSemanticTokensRange(
    Future<SemanticTokens?> Function(
      SemanticTokensRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.range, (j, c) async {
    final params = parseParams(j, SemanticTokensRangeParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/linkedEditingRange`.
  void onLinkedEditingRange(
    Future<LinkedEditingRanges?> Function(
      LinkedEditingRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.linkedEditingRange, (j, c) async {
    final params = parseParams(j, LinkedEditingRangeParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/moniker`.
  void onMoniker(
    Future<List<Moniker>?> Function(MonikerParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.moniker, (j, c) async {
    final params = parseParams(j, MonikerParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/prepareTypeHierarchy`.
  void onPrepareTypeHierarchy(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchyPrepareParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.prepareTypeHierarchy, (j, c) async {
    final params = parseParams(j, TypeHierarchyPrepareParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/inlineValue`.
  void onInlineValue(
    Future<List<InlineValue>?> Function(
      InlineValueParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.inlineValue, (j, c) async {
    final params = parseParams(j, InlineValueParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/inlayHint`.
  void onInlayHint(
    Future<List<InlayHint>?> Function(
      InlayHintParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.inlayHint, (j, c) async {
    final params = parseParams(j, InlayHintParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/diagnostic`.
  void onDiagnostic(
    Future<DocumentDiagnosticReport> Function(
      DocumentDiagnosticParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.textDocumentDiagnostic, (j, c) async {
    final params = parseParams(j, DocumentDiagnosticParams.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });

  /// Registers handler for `textDocument/inlineCompletion`.
  void onInlineCompletion(
    Future<InlineCompletionResult?> Function(
      InlineCompletionParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.inlineCompletion, (j, c) async {
    final params = parseParams(j, InlineCompletionParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/willSaveWaitUntil`.
  void onWillSaveWaitUntil(
    Future<List<TextEdit>?> Function(
      WillSaveTextDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.willSaveWaitUntil, (j, c) async {
    final params = parseParams(j, WillSaveTextDocumentParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/completion`.
  void onCompletion(
    Future<CompletionResult?> Function(
      CompletionParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.completion, (j, c) async {
    final params = parseParams(j, CompletionParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/hover`.
  void onHover(
    Future<Hover?> Function(HoverParams params, LspRequest context) handler,
  ) => _c.registerRequestHandler(.hover, (j, c) async {
    final params = parseParams(j, HoverParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/signatureHelp`.
  void onSignatureHelp(
    Future<SignatureHelp?> Function(
      SignatureHelpParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.signatureHelp, (j, c) async {
    final params = parseParams(j, SignatureHelpParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/definition`.
  void onDefinition(
    Future<DefinitionResult?> Function(
      DefinitionParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.definition, (j, c) async {
    final params = parseParams(j, DefinitionParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/references`.
  void onReferences(
    Future<List<Location>?> Function(ReferenceParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.references, (j, c) async {
    final params = parseParams(j, ReferenceParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/documentHighlight`.
  void onDocumentHighlight(
    Future<List<DocumentHighlight>?> Function(
      DocumentHighlightParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.documentHighlight, (j, c) async {
    final params = parseParams(j, DocumentHighlightParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/documentSymbol`.
  void onDocumentSymbol(
    Future<DocumentSymbolResult?> Function(
      DocumentSymbolParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.documentSymbol, (j, c) async {
    final params = parseParams(j, DocumentSymbolParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/codeAction`.
  void onCodeAction(
    Future<List<Object>?> Function(CodeActionParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.codeAction, (j, c) async {
    final params = parseParams(j, CodeActionParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => (e as dynamic).toJson()).toList();
  });

  /// Registers handler for `textDocument/codeLens`.
  void onCodeLens(
    Future<List<CodeLens>?> Function(CodeLensParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.codeLens, (j, c) async {
    final params = parseParams(j, CodeLensParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/documentLink`.
  void onDocumentLink(
    Future<List<DocumentLink>?> Function(
      DocumentLinkParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.documentLink, (j, c) async {
    final params = parseParams(j, DocumentLinkParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/formatting`.
  void onFormatting(
    Future<List<TextEdit>?> Function(
      DocumentFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.formatting, (j, c) async {
    final params = parseParams(j, DocumentFormattingParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/rangeFormatting`.
  void onRangeFormatting(
    Future<List<TextEdit>?> Function(
      DocumentRangeFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.rangeFormatting, (j, c) async {
    final params = parseParams(j, DocumentRangeFormattingParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/rangesFormatting`.
  void onRangesFormatting(
    Future<List<TextEdit>?> Function(
      DocumentRangesFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.rangesFormatting, (j, c) async {
    final params = parseParams(j, DocumentRangesFormattingParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/onTypeFormatting`.
  void onOnTypeFormatting(
    Future<List<TextEdit>?> Function(
      DocumentOnTypeFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.onTypeFormatting, (j, c) async {
    final params = parseParams(j, DocumentOnTypeFormattingParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/rename`.
  void onRename(
    Future<WorkspaceEdit?> Function(RenameParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.rename, (j, c) async {
    final params = parseParams(j, RenameParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/prepareRename`.
  void onPrepareRename(
    Future<PrepareRenameResult?> Function(
      PrepareRenameParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.prepareRename, (j, c) async {
    final params = parseParams(j, PrepareRenameParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `textDocument/didOpen`.
  void Function() onDidOpen(
    Future<void> Function(DidOpenTextDocumentParams params, LspRequest context)
    handler,
  ) => _c.registerNotificationHandler(.textDocumentDidOpen, (j, c) async {
    final params = parseParams(j, DidOpenTextDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `textDocument/didChange`.
  void Function() onDidChange(
    Future<void> Function(
      DidChangeTextDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.textDocumentDidChange, (j, c) async {
    final params = parseParams(j, DidChangeTextDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `textDocument/didClose`.
  void Function() onDidClose(
    Future<void> Function(DidCloseTextDocumentParams params, LspRequest context)
    handler,
  ) => _c.registerNotificationHandler(.textDocumentDidClose, (j, c) async {
    final params = parseParams(j, DidCloseTextDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `textDocument/didSave`.
  void Function() onDidSave(
    Future<void> Function(DidSaveTextDocumentParams params, LspRequest context)
    handler,
  ) => _c.registerNotificationHandler(.textDocumentDidSave, (j, c) async {
    final params = parseParams(j, DidSaveTextDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `textDocument/willSave`.
  void Function() onWillSave(
    Future<void> Function(WillSaveTextDocumentParams params, LspRequest context)
    handler,
  ) => _c.registerNotificationHandler(.willSave, (j, c) async {
    final params = parseParams(j, WillSaveTextDocumentParams.fromJson);
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `callHierarchy` namespace.
extension type ServerCallHierarchyHandlers(LspConnection _c) {
  /// Registers handler for `callHierarchy/incomingCalls`.
  void onIncomingCalls(
    Future<List<CallHierarchyIncomingCall>?> Function(
      CallHierarchyIncomingCallsParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.incomingCalls, (j, c) async {
    final params = parseParams(j, CallHierarchyIncomingCallsParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `callHierarchy/outgoingCalls`.
  void onOutgoingCalls(
    Future<List<CallHierarchyOutgoingCall>?> Function(
      CallHierarchyOutgoingCallsParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.outgoingCalls, (j, c) async {
    final params = parseParams(j, CallHierarchyOutgoingCallsParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });
}

/// Registers incoming LSP handlers for the `workspace` namespace.
extension type ServerWorkspaceHandlers(LspConnection _c) {
  /// Registers handler for `workspace/willCreateFiles`.
  void onWillCreateFiles(
    Future<WorkspaceEdit?> Function(
      CreateFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.willCreateFiles, (j, c) async {
    final params = parseParams(j, CreateFilesParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `workspace/willRenameFiles`.
  void onWillRenameFiles(
    Future<WorkspaceEdit?> Function(
      RenameFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.willRenameFiles, (j, c) async {
    final params = parseParams(j, RenameFilesParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `workspace/willDeleteFiles`.
  void onWillDeleteFiles(
    Future<WorkspaceEdit?> Function(
      DeleteFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.willDeleteFiles, (j, c) async {
    final params = parseParams(j, DeleteFilesParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `workspace/diagnostic`.
  void onDiagnostic(
    Future<WorkspaceDiagnosticReport> Function(
      WorkspaceDiagnosticParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.workspaceDiagnostic, (j, c) async {
    final params = parseParams(j, WorkspaceDiagnosticParams.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });

  /// Registers handler for `workspace/symbol`.
  void onSymbol(
    Future<SymbolResult?> Function(
      WorkspaceSymbolParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.symbol, (j, c) async {
    final params = parseParams(j, WorkspaceSymbolParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `workspace/executeCommand`.
  void onExecuteCommand(
    Future<Object?> Function(ExecuteCommandParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.executeCommand, (j, c) {
    final params = parseParams(j, ExecuteCommandParams.fromJson);
    return handler(params, c);
  });

  /// Registers handler for `workspace/didChangeWorkspaceFolders`.
  void Function() onDidChangeWorkspaceFolders(
    Future<void> Function(
      DidChangeWorkspaceFoldersParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.didChangeWorkspaceFolders, (j, c) async {
    final params = parseParams(j, DidChangeWorkspaceFoldersParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `workspace/didCreateFiles`.
  void Function() onDidCreateFiles(
    Future<void> Function(CreateFilesParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.didCreateFiles, (j, c) async {
    final params = parseParams(j, CreateFilesParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `workspace/didRenameFiles`.
  void Function() onDidRenameFiles(
    Future<void> Function(RenameFilesParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.didRenameFiles, (j, c) async {
    final params = parseParams(j, RenameFilesParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `workspace/didDeleteFiles`.
  void Function() onDidDeleteFiles(
    Future<void> Function(DeleteFilesParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.didDeleteFiles, (j, c) async {
    final params = parseParams(j, DeleteFilesParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `workspace/didChangeConfiguration`.
  void Function() onDidChangeConfiguration(
    Future<void> Function(
      DidChangeConfigurationParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.didChangeConfiguration, (j, c) async {
    final params = parseParams(j, DidChangeConfigurationParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `workspace/didChangeWatchedFiles`.
  void Function() onDidChangeWatchedFiles(
    Future<void> Function(
      DidChangeWatchedFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.didChangeWatchedFiles, (j, c) async {
    final params = parseParams(j, DidChangeWatchedFilesParams.fromJson);
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `typeHierarchy` namespace.
extension type ServerTypeHierarchyHandlers(LspConnection _c) {
  /// Registers handler for `typeHierarchy/supertypes`.
  void onSupertypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySupertypesParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.supertypes, (j, c) async {
    final params = parseParams(j, TypeHierarchySupertypesParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `typeHierarchy/subtypes`.
  void onSubtypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySubtypesParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.subtypes, (j, c) async {
    final params = parseParams(j, TypeHierarchySubtypesParams.fromJson);
    final result = await handler(params, c);
    return result?.map((e) => e.toJson()).toList();
  });
}

/// Registers incoming LSP handlers for the `inlayHint` namespace.
extension type ServerInlayHintHandlers(LspConnection _c) {
  /// Registers handler for `inlayHint/resolve`.
  void onResolve(
    Future<InlayHint> Function(InlayHint params, LspRequest context) handler,
  ) => _c.registerRequestHandler(.inlayHintResolve, (j, c) async {
    final params = parseParams(j, InlayHint.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `general` namespace.
extension type ServerGeneralHandlers(LspConnection _c) {
  /// Registers handler for `initialize`.
  void onInitialize(
    Future<InitializeResult> Function(
      InitializeParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.initialize, (j, c) async {
    final params = parseParams(j, InitializeParams.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });

  /// Registers handler for `shutdown`.
  void onShutdown(Future<void> Function(LspRequest context) handler) =>
      _c.registerRequestHandler(.shutdown, (j, c) async {
        await handler(c);
        return null;
      });

  /// Registers handler for `initialized`.
  void Function() onInitialized(
    Future<void> Function(InitializedParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.initialized, (j, c) async {
    final params = parseParams(j, InitializedParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `exit`.
  void Function() onExit(Future<void> Function(LspRequest context) handler) =>
      _c.registerNotificationHandler(.exit, (j, c) async {
        await handler(c);
      });

  /// Registers handler for `$/setTrace`.
  void Function() onSetTrace(
    Future<void> Function(SetTraceParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.setTrace, (j, c) async {
    final params = parseParams(j, SetTraceParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `$/cancelRequest`.
  void Function() onCancelRequest(
    Future<void> Function(CancelParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.cancelRequest, (j, c) async {
    final params = parseParams(j, CancelParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `$/progress`.
  void Function() onProgress(
    Future<void> Function(ProgressParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.progress, (j, c) async {
    final params = parseParams(j, ProgressParams.fromJson);
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `completionItem` namespace.
extension type ServerCompletionItemHandlers(LspConnection _c) {
  /// Registers handler for `completionItem/resolve`.
  void onResolve(
    Future<CompletionItem> Function(CompletionItem params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.completionItemResolve, (j, c) async {
    final params = parseParams(j, CompletionItem.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `codeAction` namespace.
extension type ServerCodeActionHandlers(LspConnection _c) {
  /// Registers handler for `codeAction/resolve`.
  void onResolve(
    Future<CodeAction> Function(CodeAction params, LspRequest context) handler,
  ) => _c.registerRequestHandler(.codeActionResolve, (j, c) async {
    final params = parseParams(j, CodeAction.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `workspaceSymbol` namespace.
extension type ServerWorkspaceSymbolHandlers(LspConnection _c) {
  /// Registers handler for `workspaceSymbol/resolve`.
  void onResolve(
    Future<WorkspaceSymbol> Function(WorkspaceSymbol params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.workspaceSymbolResolve, (j, c) async {
    final params = parseParams(j, WorkspaceSymbol.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `codeLens` namespace.
extension type ServerCodeLensHandlers(LspConnection _c) {
  /// Registers handler for `codeLens/resolve`.
  void onResolve(
    Future<CodeLens> Function(CodeLens params, LspRequest context) handler,
  ) => _c.registerRequestHandler(.codeLensResolve, (j, c) async {
    final params = parseParams(j, CodeLens.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `documentLink` namespace.
extension type ServerDocumentLinkHandlers(LspConnection _c) {
  /// Registers handler for `documentLink/resolve`.
  void onResolve(
    Future<DocumentLink> Function(DocumentLink params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.documentLinkResolve, (j, c) async {
    final params = parseParams(j, DocumentLink.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `window` namespace.
extension type ServerWindowHandlers(LspConnection _c) {
  /// Registers handler for `window/workDoneProgress/cancel`.
  void Function() onWorkDoneProgressCancel(
    Future<void> Function(
      WorkDoneProgressCancelParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.cancel, (j, c) async {
    final params = parseParams(j, WorkDoneProgressCancelParams.fromJson);
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `notebookDocument` namespace.
extension type ServerNotebookDocumentHandlers(LspConnection _c) {
  /// Registers handler for `notebookDocument/didOpen`.
  void Function() onDidOpen(
    Future<void> Function(
      DidOpenNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.notebookDocumentDidOpen, (j, c) async {
    final params = parseParams(j, DidOpenNotebookDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `notebookDocument/didChange`.
  void Function() onDidChange(
    Future<void> Function(
      DidChangeNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.notebookDocumentDidChange, (j, c) async {
    final params = parseParams(j, DidChangeNotebookDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `notebookDocument/didSave`.
  void Function() onDidSave(
    Future<void> Function(
      DidSaveNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.notebookDocumentDidSave, (j, c) async {
    final params = parseParams(j, DidSaveNotebookDocumentParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `notebookDocument/didClose`.
  void Function() onDidClose(
    Future<void> Function(
      DidCloseNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerNotificationHandler(.notebookDocumentDidClose, (j, c) async {
    final params = parseParams(j, DidCloseNotebookDocumentParams.fromJson);
    await handler(params, c);
  });
}

/// Sends LSP messages to the client for the `workspace` namespace.
extension type ServerWorkspaceSender(LspConnection _c) {
  /// Sends the `workspace/workspaceFolders` request to the client.
  Future<List<WorkspaceFolder>?> workspaceFolders() async {
    final dynamic raw = await _c.sendRequest(.workspaceFolders);
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(WorkspaceFolder.fromJson)
              .toList();
  }

  /// Sends the `workspace/configuration` request to the client.
  Future<List<Object?>> configuration(ConfigurationParams params) async {
    final dynamic raw = await _c.sendRequest(.configuration, params.toJson());
    return (raw as List).cast<Object>().toList();
  }

  /// Sends the `workspace/foldingRange/refresh` request to the client.
  Future<void> foldingRangeRefresh() async {
    await _c.sendRequest(.workspaceFoldingRangeRefresh);
  }

  /// Sends the `workspace/semanticTokens/refresh` request to the client.
  Future<void> semanticTokensRefresh() async {
    await _c.sendRequest(.workspaceSemanticTokensRefresh);
  }

  /// Sends the `workspace/inlineValue/refresh` request to the client.
  Future<void> inlineValueRefresh() async {
    await _c.sendRequest(.workspaceInlineValueRefresh);
  }

  /// Sends the `workspace/inlayHint/refresh` request to the client.
  Future<void> inlayHintRefresh() async {
    await _c.sendRequest(.workspaceInlayHintRefresh);
  }

  /// Sends the `workspace/diagnostic/refresh` request to the client.
  Future<void> diagnosticRefresh() async {
    await _c.sendRequest(.workspaceDiagnosticRefresh);
  }

  /// Sends the `workspace/codeLens/refresh` request to the client.
  Future<void> codeLensRefresh() async {
    await _c.sendRequest(.workspaceCodeLensRefresh);
  }

  /// Sends the `workspace/applyEdit` request to the client.
  Future<ApplyWorkspaceEditResult> applyEdit(
    ApplyWorkspaceEditParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.applyEdit, params.toJson());
    return ApplyWorkspaceEditResult.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the client for the `window` namespace.
extension type ServerWindowSender(LspConnection _c) {
  /// Sends the `window/workDoneProgress/create` request to the client.
  Future<void> workDoneProgressCreate(
    WorkDoneProgressCreateParams params,
  ) async {
    await _c.sendRequest(.create, params.toJson());
  }

  /// Sends the `window/showDocument` request to the client.
  Future<ShowDocumentResult> showDocument(ShowDocumentParams params) async {
    final dynamic raw = await _c.sendRequest(.showDocument, params.toJson());
    return ShowDocumentResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessageRequest` request to the client.
  Future<MessageActionItem?> showMessageRequest(
    ShowMessageRequestParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .showMessageRequest,
      params.toJson(),
    );
    return raw == null
        ? null
        : MessageActionItem.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessage` notification to the client.
  void showMessage(ShowMessageParams params) =>
      _c.sendNotification(.showMessage, params.toJson());

  /// Sends the `window/logMessage` notification to the client.
  void logMessage(LogMessageParams params) =>
      _c.sendNotification(.logMessage, params.toJson());
}

/// Sends LSP messages to the client for the `client` namespace.
extension type ServerClientSender(LspConnection _c) {
  /// Sends the `client/registerCapability` request to the client.
  Future<void> registerCapability(RegistrationParams params) async {
    await _c.sendRequest(.registerCapability, params.toJson());
  }

  /// Sends the `client/unregisterCapability` request to the client.
  Future<void> unregisterCapability(UnregistrationParams params) async {
    await _c.sendRequest(.unregisterCapability, params.toJson());
  }
}

/// Sends LSP messages to the client for the `telemetry` namespace.
extension type ServerTelemetrySender(LspConnection _c) {
  /// Sends the `telemetry/event` notification to the client.
  void event(Object? params) => _c.sendNotification(.event, params);
}

/// Sends LSP messages to the client for the `textDocument` namespace.
extension type ServerTextDocumentSender(LspConnection _c) {
  /// Sends the `textDocument/publishDiagnostics` notification to the client.
  void publishDiagnostics(PublishDiagnosticsParams params) =>
      _c.sendNotification(.publishDiagnostics, params.toJson());
}

/// Sends LSP messages to the client for the `general` namespace.
extension type ServerGeneralSender(LspConnection _c) {
  /// Sends the `$/logTrace` notification to the client.
  void logTrace(LogTraceParams params) =>
      _c.sendNotification(.logTrace, params.toJson());

  /// Sends the `$/cancelRequest` notification to the client.
  void cancelRequest(CancelParams params) =>
      _c.sendNotification(.cancelRequest, params.toJson());

  /// Sends the `$/progress` notification to the client.
  void progress(ProgressParams params) =>
      _c.sendNotification(.progress, params.toJson());
}
