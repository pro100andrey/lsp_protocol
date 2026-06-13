// GENERATED — do not edit.

import 'dart:async';

import '../../connection/lsp_connection.dart';
import '../../connection/lsp_exception.dart';
import '../../server/lsp_request.dart';
import '../models/structures.dart';
import '../models/unions.dart';

/// Registers incoming LSP handlers for the `textDocument` namespace.
class ServerTextDocumentHandlers {
  ServerTextDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `textDocument/implementation`.
  void onImplementation(
    Future<ImplementationResult?> Function(
      ImplementationParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.implementation, (
    json,
    context,
  ) async {
    final p = parseParams(json, ImplementationParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/typeDefinition`.
  void onTypeDefinition(
    Future<TypeDefinitionResult?> Function(
      TypeDefinitionParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.typeDefinition, (
    json,
    context,
  ) async {
    final p = parseParams(json, TypeDefinitionParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/documentColor`.
  void onDocumentColor(
    Future<List<ColorInformation>> Function(
      DocumentColorParams params,
      LspRequest context,
    )
    handler,
  ) =>
      _connection.registerRequestHandler(.documentColor, (json, context) async {
        final p = parseParams(json, DocumentColorParams.fromJson);
        final r = await handler(p, context);
        return r.map((e) => e.toJson()).toList();
      });

  /// Registers handler for `textDocument/colorPresentation`.
  void onColorPresentation(
    Future<List<ColorPresentation>> Function(
      ColorPresentationParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.colorPresentation, (
    json,
    context,
  ) async {
    final p = parseParams(json, ColorPresentationParams.fromJson);
    final r = await handler(p, context);
    return r.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/foldingRange`.
  void onFoldingRange(
    Future<List<FoldingRange>?> Function(
      FoldingRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.foldingRange, (json, context) async {
    final p = parseParams(json, FoldingRangeParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/declaration`.
  void onDeclaration(
    Future<DeclarationResult?> Function(
      DeclarationParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.declaration, (json, context) async {
    final p = parseParams(json, DeclarationParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/selectionRange`.
  void onSelectionRange(
    Future<List<SelectionRange>?> Function(
      SelectionRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.selectionRange, (
    json,
    context,
  ) async {
    final p = parseParams(json, SelectionRangeParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/prepareCallHierarchy`.
  void onPrepareCallHierarchy(
    Future<List<CallHierarchyItem>?> Function(
      CallHierarchyPrepareParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.prepareCallHierarchy, (
    json,
    context,
  ) async {
    final p = parseParams(json, CallHierarchyPrepareParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/semanticTokens/full`.
  void onSemanticTokensFull(
    Future<SemanticTokens?> Function(
      SemanticTokensParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.full, (json, context) async {
    final p = parseParams(json, SemanticTokensParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/semanticTokens/full/delta`.
  void onSemanticTokensFullDelta(
    Future<SemanticTokensFullDeltaResult?> Function(
      SemanticTokensDeltaParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.delta, (json, context) async {
    final p = parseParams(json, SemanticTokensDeltaParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/semanticTokens/range`.
  void onSemanticTokensRange(
    Future<SemanticTokens?> Function(
      SemanticTokensRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.range, (json, context) async {
    final p = parseParams(json, SemanticTokensRangeParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/linkedEditingRange`.
  void onLinkedEditingRange(
    Future<LinkedEditingRanges?> Function(
      LinkedEditingRangeParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.linkedEditingRange, (
    json,
    context,
  ) async {
    final p = parseParams(json, LinkedEditingRangeParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/moniker`.
  void onMoniker(
    Future<List<Moniker>?> Function(MonikerParams params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.moniker, (json, context) async {
    final p = parseParams(json, MonikerParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/prepareTypeHierarchy`.
  void onPrepareTypeHierarchy(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchyPrepareParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.prepareTypeHierarchy, (
    json,
    context,
  ) async {
    final p = parseParams(json, TypeHierarchyPrepareParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/inlineValue`.
  void onInlineValue(
    Future<List<InlineValue>?> Function(
      InlineValueParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.inlineValue, (json, context) async {
    final p = parseParams(json, InlineValueParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/inlayHint`.
  void onInlayHint(
    Future<List<InlayHint>?> Function(
      InlayHintParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.inlayHint, (json, context) async {
    final p = parseParams(json, InlayHintParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/diagnostic`.
  void onDiagnostic(
    Future<DocumentDiagnosticReport> Function(
      DocumentDiagnosticParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.textDocumentDiagnostic, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentDiagnosticParams.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });

  /// Registers handler for `textDocument/inlineCompletion`.
  void onInlineCompletion(
    Future<InlineCompletionResult?> Function(
      InlineCompletionParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.inlineCompletion, (
    json,
    context,
  ) async {
    final p = parseParams(json, InlineCompletionParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/willSaveWaitUntil`.
  void onWillSaveWaitUntil(
    Future<List<TextEdit>?> Function(
      WillSaveTextDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.willSaveWaitUntil, (
    json,
    context,
  ) async {
    final p = parseParams(json, WillSaveTextDocumentParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/completion`.
  void onCompletion(
    Future<CompletionResult?> Function(
      CompletionParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.completion, (json, context) async {
    final p = parseParams(json, CompletionParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/hover`.
  void onHover(
    Future<Hover?> Function(HoverParams params, LspRequest context) handler,
  ) => _connection.registerRequestHandler(.hover, (json, context) async {
    final p = parseParams(json, HoverParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/signatureHelp`.
  void onSignatureHelp(
    Future<SignatureHelp?> Function(
      SignatureHelpParams params,
      LspRequest context,
    )
    handler,
  ) =>
      _connection.registerRequestHandler(.signatureHelp, (json, context) async {
        final p = parseParams(json, SignatureHelpParams.fromJson);
        final r = await handler(p, context);
        return r?.toJson();
      });

  /// Registers handler for `textDocument/definition`.
  void onDefinition(
    Future<DefinitionResult?> Function(
      DefinitionParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.definition, (json, context) async {
    final p = parseParams(json, DefinitionParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/references`.
  void onReferences(
    Future<List<Location>?> Function(ReferenceParams params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.references, (json, context) async {
    final p = parseParams(json, ReferenceParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/documentHighlight`.
  void onDocumentHighlight(
    Future<List<DocumentHighlight>?> Function(
      DocumentHighlightParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.documentHighlight, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentHighlightParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/documentSymbol`.
  void onDocumentSymbol(
    Future<DocumentSymbolResult?> Function(
      DocumentSymbolParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.documentSymbol, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentSymbolParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/codeAction`.
  void onCodeAction(
    Future<List<Object>?> Function(CodeActionParams params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.codeAction, (json, context) async {
    final p = parseParams(json, CodeActionParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => (e as dynamic).toJson()).toList();
  });

  /// Registers handler for `textDocument/codeLens`.
  void onCodeLens(
    Future<List<CodeLens>?> Function(CodeLensParams params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.codeLens, (json, context) async {
    final p = parseParams(json, CodeLensParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/documentLink`.
  void onDocumentLink(
    Future<List<DocumentLink>?> Function(
      DocumentLinkParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.documentLink, (json, context) async {
    final p = parseParams(json, DocumentLinkParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/formatting`.
  void onFormatting(
    Future<List<TextEdit>?> Function(
      DocumentFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.formatting, (json, context) async {
    final p = parseParams(json, DocumentFormattingParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/rangeFormatting`.
  void onRangeFormatting(
    Future<List<TextEdit>?> Function(
      DocumentRangeFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.rangeFormatting, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentRangeFormattingParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/rangesFormatting`.
  void onRangesFormatting(
    Future<List<TextEdit>?> Function(
      DocumentRangesFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.rangesFormatting, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentRangesFormattingParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/onTypeFormatting`.
  void onOnTypeFormatting(
    Future<List<TextEdit>?> Function(
      DocumentOnTypeFormattingParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.onTypeFormatting, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentOnTypeFormattingParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `textDocument/rename`.
  void onRename(
    Future<WorkspaceEdit?> Function(RenameParams params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.rename, (json, context) async {
    final p = parseParams(json, RenameParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `textDocument/prepareRename`.
  void onPrepareRename(
    Future<PrepareRenameResult?> Function(
      PrepareRenameParams params,
      LspRequest context,
    )
    handler,
  ) =>
      _connection.registerRequestHandler(.prepareRename, (json, context) async {
        final p = parseParams(json, PrepareRenameParams.fromJson);
        final r = await handler(p, context);
        return r?.toJson();
      });

  /// Registers handler for `textDocument/didOpen`.
  void Function() onDidOpen(
    Future<void> Function(DidOpenTextDocumentParams params, LspRequest context)
    handler,
  ) => _connection.registerNotificationHandler(.textDocumentDidOpen, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidOpenTextDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `textDocument/didChange`.
  void Function() onDidChange(
    Future<void> Function(
      DidChangeTextDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.textDocumentDidChange, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidChangeTextDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `textDocument/didClose`.
  void Function() onDidClose(
    Future<void> Function(DidCloseTextDocumentParams params, LspRequest context)
    handler,
  ) => _connection.registerNotificationHandler(.textDocumentDidClose, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidCloseTextDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `textDocument/didSave`.
  void Function() onDidSave(
    Future<void> Function(DidSaveTextDocumentParams params, LspRequest context)
    handler,
  ) => _connection.registerNotificationHandler(.textDocumentDidSave, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidSaveTextDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `textDocument/willSave`.
  void Function() onWillSave(
    Future<void> Function(WillSaveTextDocumentParams params, LspRequest context)
    handler,
  ) =>
      _connection.registerNotificationHandler(.willSave, (json, context) async {
        final p = parseParams(json, WillSaveTextDocumentParams.fromJson);
        await handler(p, context);
      });
}

/// Registers incoming LSP handlers for the `callHierarchy` namespace.
class ServerCallHierarchyHandlers {
  ServerCallHierarchyHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `callHierarchy/incomingCalls`.
  void onIncomingCalls(
    Future<List<CallHierarchyIncomingCall>?> Function(
      CallHierarchyIncomingCallsParams params,
      LspRequest context,
    )
    handler,
  ) =>
      _connection.registerRequestHandler(.incomingCalls, (json, context) async {
        final p = parseParams(json, CallHierarchyIncomingCallsParams.fromJson);
        final r = await handler(p, context);
        return r?.map((e) => e.toJson()).toList();
      });

  /// Registers handler for `callHierarchy/outgoingCalls`.
  void onOutgoingCalls(
    Future<List<CallHierarchyOutgoingCall>?> Function(
      CallHierarchyOutgoingCallsParams params,
      LspRequest context,
    )
    handler,
  ) =>
      _connection.registerRequestHandler(.outgoingCalls, (json, context) async {
        final p = parseParams(json, CallHierarchyOutgoingCallsParams.fromJson);
        final r = await handler(p, context);
        return r?.map((e) => e.toJson()).toList();
      });
}

/// Registers incoming LSP handlers for the `workspace` namespace.
class ServerWorkspaceHandlers {
  ServerWorkspaceHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `workspace/willCreateFiles`.
  void onWillCreateFiles(
    Future<WorkspaceEdit?> Function(
      CreateFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.willCreateFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, CreateFilesParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `workspace/willRenameFiles`.
  void onWillRenameFiles(
    Future<WorkspaceEdit?> Function(
      RenameFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.willRenameFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, RenameFilesParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `workspace/willDeleteFiles`.
  void onWillDeleteFiles(
    Future<WorkspaceEdit?> Function(
      DeleteFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.willDeleteFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, DeleteFilesParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `workspace/diagnostic`.
  void onDiagnostic(
    Future<WorkspaceDiagnosticReport> Function(
      WorkspaceDiagnosticParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.workspaceDiagnostic, (
    json,
    context,
  ) async {
    final p = parseParams(json, WorkspaceDiagnosticParams.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });

  /// Registers handler for `workspace/symbol`.
  void onSymbol(
    Future<SymbolResult?> Function(
      WorkspaceSymbolParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.symbol, (json, context) async {
    final p = parseParams(json, WorkspaceSymbolParams.fromJson);
    final r = await handler(p, context);
    return r?.toJson();
  });

  /// Registers handler for `workspace/executeCommand`.
  void onExecuteCommand(
    Future<Object?> Function(ExecuteCommandParams params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.executeCommand, (json, context) {
    final p = parseParams(json, ExecuteCommandParams.fromJson);
    return handler(p, context);
  });

  /// Registers handler for `workspace/didChangeWorkspaceFolders`.
  void Function() onDidChangeWorkspaceFolders(
    Future<void> Function(
      DidChangeWorkspaceFoldersParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.didChangeWorkspaceFolders, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidChangeWorkspaceFoldersParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `workspace/didCreateFiles`.
  void Function() onDidCreateFiles(
    Future<void> Function(CreateFilesParams params, LspRequest context) handler,
  ) => _connection.registerNotificationHandler(.didCreateFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, CreateFilesParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `workspace/didRenameFiles`.
  void Function() onDidRenameFiles(
    Future<void> Function(RenameFilesParams params, LspRequest context) handler,
  ) => _connection.registerNotificationHandler(.didRenameFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, RenameFilesParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `workspace/didDeleteFiles`.
  void Function() onDidDeleteFiles(
    Future<void> Function(DeleteFilesParams params, LspRequest context) handler,
  ) => _connection.registerNotificationHandler(.didDeleteFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, DeleteFilesParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `workspace/didChangeConfiguration`.
  void Function() onDidChangeConfiguration(
    Future<void> Function(
      DidChangeConfigurationParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.didChangeConfiguration, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidChangeConfigurationParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `workspace/didChangeWatchedFiles`.
  void Function() onDidChangeWatchedFiles(
    Future<void> Function(
      DidChangeWatchedFilesParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.didChangeWatchedFiles, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidChangeWatchedFilesParams.fromJson);
    await handler(p, context);
  });
}

/// Registers incoming LSP handlers for the `typeHierarchy` namespace.
class ServerTypeHierarchyHandlers {
  ServerTypeHierarchyHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `typeHierarchy/supertypes`.
  void onSupertypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySupertypesParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.supertypes, (json, context) async {
    final p = parseParams(json, TypeHierarchySupertypesParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `typeHierarchy/subtypes`.
  void onSubtypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySubtypesParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.subtypes, (json, context) async {
    final p = parseParams(json, TypeHierarchySubtypesParams.fromJson);
    final r = await handler(p, context);
    return r?.map((e) => e.toJson()).toList();
  });
}

/// Registers incoming LSP handlers for the `inlayHint` namespace.
class ServerInlayHintHandlers {
  ServerInlayHintHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `inlayHint/resolve`.
  void onResolve(
    Future<InlayHint> Function(InlayHint params, LspRequest context) handler,
  ) => _connection.registerRequestHandler(.inlayHintResolve, (
    json,
    context,
  ) async {
    final p = parseParams(json, InlayHint.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });
}

/// Registers incoming LSP handlers for the `general` namespace.
class ServerGeneralHandlers {
  ServerGeneralHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `initialize`.
  void onInitialize(
    Future<InitializeResult> Function(
      InitializeParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerRequestHandler(.initialize, (json, context) async {
    final p = parseParams(json, InitializeParams.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });

  /// Registers handler for `shutdown`.
  void onShutdown(Future<void> Function(LspRequest context) handler) =>
      _connection.registerRequestHandler(.shutdown, (json, context) async {
        await handler(context);
        return null;
      });

  /// Registers handler for `initialized`.
  void Function() onInitialized(
    Future<void> Function(InitializedParams params, LspRequest context) handler,
  ) => _connection.registerNotificationHandler(.initialized, (
    json,
    context,
  ) async {
    final p = parseParams(json, InitializedParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `exit`.
  void Function() onExit(Future<void> Function(LspRequest context) handler) =>
      _connection.registerNotificationHandler(.exit, (json, context) async {
        await handler(context);
      });

  /// Registers handler for `$/setTrace`.
  void Function() onSetTrace(
    Future<void> Function(SetTraceParams params, LspRequest context) handler,
  ) =>
      _connection.registerNotificationHandler(.setTrace, (json, context) async {
        final p = parseParams(json, SetTraceParams.fromJson);
        await handler(p, context);
      });

  /// Registers handler for `$/cancelRequest`.
  void Function() onCancelRequest(
    Future<void> Function(CancelParams params, LspRequest context) handler,
  ) => _connection.registerNotificationHandler(.cancelRequest, (
    json,
    context,
  ) async {
    final p = parseParams(json, CancelParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `$/progress`.
  void Function() onProgress(
    Future<void> Function(ProgressParams params, LspRequest context) handler,
  ) =>
      _connection.registerNotificationHandler(.progress, (json, context) async {
        final p = parseParams(json, ProgressParams.fromJson);
        await handler(p, context);
      });
}

/// Registers incoming LSP handlers for the `completionItem` namespace.
class ServerCompletionItemHandlers {
  ServerCompletionItemHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `completionItem/resolve`.
  void onResolve(
    Future<CompletionItem> Function(CompletionItem params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.completionItemResolve, (
    json,
    context,
  ) async {
    final p = parseParams(json, CompletionItem.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });
}

/// Registers incoming LSP handlers for the `codeAction` namespace.
class ServerCodeActionHandlers {
  ServerCodeActionHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `codeAction/resolve`.
  void onResolve(
    Future<CodeAction> Function(CodeAction params, LspRequest context) handler,
  ) => _connection.registerRequestHandler(.codeActionResolve, (
    json,
    context,
  ) async {
    final p = parseParams(json, CodeAction.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });
}

/// Registers incoming LSP handlers for the `workspaceSymbol` namespace.
class ServerWorkspaceSymbolHandlers {
  ServerWorkspaceSymbolHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `workspaceSymbol/resolve`.
  void onResolve(
    Future<WorkspaceSymbol> Function(WorkspaceSymbol params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.workspaceSymbolResolve, (
    json,
    context,
  ) async {
    final p = parseParams(json, WorkspaceSymbol.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });
}

/// Registers incoming LSP handlers for the `codeLens` namespace.
class ServerCodeLensHandlers {
  ServerCodeLensHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `codeLens/resolve`.
  void onResolve(
    Future<CodeLens> Function(CodeLens params, LspRequest context) handler,
  ) => _connection.registerRequestHandler(.codeLensResolve, (
    json,
    context,
  ) async {
    final p = parseParams(json, CodeLens.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });
}

/// Registers incoming LSP handlers for the `documentLink` namespace.
class ServerDocumentLinkHandlers {
  ServerDocumentLinkHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `documentLink/resolve`.
  void onResolve(
    Future<DocumentLink> Function(DocumentLink params, LspRequest context)
    handler,
  ) => _connection.registerRequestHandler(.documentLinkResolve, (
    json,
    context,
  ) async {
    final p = parseParams(json, DocumentLink.fromJson);
    final r = await handler(p, context);
    return r.toJson();
  });
}

/// Registers incoming LSP handlers for the `window` namespace.
class ServerWindowHandlers {
  ServerWindowHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `window/workDoneProgress/cancel`.
  void Function() onWorkDoneProgressCancel(
    Future<void> Function(
      WorkDoneProgressCancelParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.cancel, (json, context) async {
    final p = parseParams(json, WorkDoneProgressCancelParams.fromJson);
    await handler(p, context);
  });
}

/// Registers incoming LSP handlers for the `notebookDocument` namespace.
class ServerNotebookDocumentHandlers {
  ServerNotebookDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `notebookDocument/didOpen`.
  void Function() onDidOpen(
    Future<void> Function(
      DidOpenNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.notebookDocumentDidOpen, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidOpenNotebookDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `notebookDocument/didChange`.
  void Function() onDidChange(
    Future<void> Function(
      DidChangeNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.notebookDocumentDidChange, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidChangeNotebookDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `notebookDocument/didSave`.
  void Function() onDidSave(
    Future<void> Function(
      DidSaveNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.notebookDocumentDidSave, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidSaveNotebookDocumentParams.fromJson);
    await handler(p, context);
  });

  /// Registers handler for `notebookDocument/didClose`.
  void Function() onDidClose(
    Future<void> Function(
      DidCloseNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _connection.registerNotificationHandler(.notebookDocumentDidClose, (
    json,
    context,
  ) async {
    final p = parseParams(json, DidCloseNotebookDocumentParams.fromJson);
    await handler(p, context);
  });
}

/// Sends LSP messages to the client for the `workspace` namespace.
class ServerWorkspaceSender {
  ServerWorkspaceSender(this._connection);

  final LspConnection _connection;

  /// Sends the `workspace/workspaceFolders` request to the client.
  Future<List<WorkspaceFolder>?> workspaceFolders() async {
    final dynamic raw = await _connection.sendRequest(.workspaceFolders);
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(WorkspaceFolder.fromJson)
              .toList();
  }

  /// Sends the `workspace/configuration` request to the client.
  Future<List<Object?>> configuration(ConfigurationParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .configuration,
      params.toJson(),
    );
    return (raw as List).cast<Object>().toList();
  }

  /// Sends the `workspace/foldingRange/refresh` request to the client.
  Future<void> foldingRangeRefresh() async {
    await _connection.sendRequest(.workspaceFoldingRangeRefresh);
  }

  /// Sends the `workspace/semanticTokens/refresh` request to the client.
  Future<void> semanticTokensRefresh() async {
    await _connection.sendRequest(.workspaceSemanticTokensRefresh);
  }

  /// Sends the `workspace/inlineValue/refresh` request to the client.
  Future<void> inlineValueRefresh() async {
    await _connection.sendRequest(.workspaceInlineValueRefresh);
  }

  /// Sends the `workspace/inlayHint/refresh` request to the client.
  Future<void> inlayHintRefresh() async {
    await _connection.sendRequest(.workspaceInlayHintRefresh);
  }

  /// Sends the `workspace/diagnostic/refresh` request to the client.
  Future<void> diagnosticRefresh() async {
    await _connection.sendRequest(.workspaceDiagnosticRefresh);
  }

  /// Sends the `workspace/codeLens/refresh` request to the client.
  Future<void> codeLensRefresh() async {
    await _connection.sendRequest(.workspaceCodeLensRefresh);
  }

  /// Sends the `workspace/applyEdit` request to the client.
  Future<ApplyWorkspaceEditResult> applyEdit(
    ApplyWorkspaceEditParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .applyEdit,
      params.toJson(),
    );
    return ApplyWorkspaceEditResult.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the client for the `window` namespace.
class ServerWindowSender {
  ServerWindowSender(this._connection);

  final LspConnection _connection;

  /// Sends the `window/workDoneProgress/create` request to the client.
  Future<void> workDoneProgressCreate(
    WorkDoneProgressCreateParams params,
  ) async {
    await _connection.sendRequest(.create, params.toJson());
  }

  /// Sends the `window/showDocument` request to the client.
  Future<ShowDocumentResult> showDocument(ShowDocumentParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .showDocument,
      params.toJson(),
    );
    return ShowDocumentResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessageRequest` request to the client.
  Future<MessageActionItem?> showMessageRequest(
    ShowMessageRequestParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .showMessageRequest,
      params.toJson(),
    );
    return raw == null
        ? null
        : MessageActionItem.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessage` notification to the client.
  void showMessage(ShowMessageParams params) =>
      _connection.sendNotification(.showMessage, params.toJson());

  /// Sends the `window/logMessage` notification to the client.
  void logMessage(LogMessageParams params) =>
      _connection.sendNotification(.logMessage, params.toJson());
}

/// Sends LSP messages to the client for the `client` namespace.
class ServerClientSender {
  ServerClientSender(this._connection);

  final LspConnection _connection;

  /// Sends the `client/registerCapability` request to the client.
  Future<void> registerCapability(RegistrationParams params) async {
    await _connection.sendRequest(.registerCapability, params.toJson());
  }

  /// Sends the `client/unregisterCapability` request to the client.
  Future<void> unregisterCapability(UnregistrationParams params) async {
    await _connection.sendRequest(.unregisterCapability, params.toJson());
  }
}

/// Sends LSP messages to the client for the `telemetry` namespace.
class ServerTelemetrySender {
  ServerTelemetrySender(this._connection);

  final LspConnection _connection;

  /// Sends the `telemetry/event` notification to the client.
  void event(Object? params) => _connection.sendNotification(.event, params);
}

/// Sends LSP messages to the client for the `textDocument` namespace.
class ServerTextDocumentSender {
  ServerTextDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `textDocument/publishDiagnostics` notification to the client.
  void publishDiagnostics(PublishDiagnosticsParams params) =>
      _connection.sendNotification(.publishDiagnostics, params.toJson());
}

/// Sends LSP messages to the client for the `general` namespace.
class ServerGeneralSender {
  ServerGeneralSender(this._connection);

  final LspConnection _connection;

  /// Sends the `$/logTrace` notification to the client.
  void logTrace(LogTraceParams params) =>
      _connection.sendNotification(.logTrace, params.toJson());

  /// Sends the `$/cancelRequest` notification to the client.
  void cancelRequest(CancelParams params) =>
      _connection.sendNotification(.cancelRequest, params.toJson());

  /// Sends the `$/progress` notification to the client.
  void progress(ProgressParams params) =>
      _connection.sendNotification(.progress, params.toJson());
}

/// Aggregates all outgoing sender classes.
///
/// Access via `LspServer.client`:
/// ```dart
/// server.client.window.logMessage(LogMessageParams(...));
/// ```
class ServerToClientProxy {
  ServerToClientProxy(this._connection);

  final LspConnection _connection;

  late final workspace = ServerWorkspaceSender(_connection);

  late final window = ServerWindowSender(_connection);

  late final client = ServerClientSender(_connection);

  late final telemetry = ServerTelemetrySender(_connection);

  late final textDocument = ServerTextDocumentSender(_connection);

  late final general = ServerGeneralSender(_connection);
}
