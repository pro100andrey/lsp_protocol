// GENERATED — do not edit.

import 'dart:async';

import '../../connection/lsp_connection.dart';
import '../../connection/lsp_exception.dart';
import '../../server/lsp_request.dart';
import '../models/structures.dart';
import '../models/unions.dart';

/// Aggregates all outgoing sender classes.
///
/// Access via `LspClient.client.server`:
/// ```dart
/// client.server.workspace.didChangeConfiguration(...);
/// ```
extension type ClientToServerProxy(LspConnection _c) {
  ClientTextDocumentSender get textDocument => ClientTextDocumentSender(_c);

  ClientCallHierarchySender get callHierarchy => ClientCallHierarchySender(_c);

  ClientWorkspaceSender get workspace => ClientWorkspaceSender(_c);

  ClientTypeHierarchySender get typeHierarchy => ClientTypeHierarchySender(_c);

  ClientInlayHintSender get inlayHint => ClientInlayHintSender(_c);

  ClientGeneralSender get general => ClientGeneralSender(_c);

  ClientCompletionItemSender get completionItem =>
      ClientCompletionItemSender(_c);

  ClientCodeActionSender get codeAction => ClientCodeActionSender(_c);

  ClientWorkspaceSymbolSender get workspaceSymbol =>
      ClientWorkspaceSymbolSender(_c);

  ClientCodeLensSender get codeLens => ClientCodeLensSender(_c);

  ClientDocumentLinkSender get documentLink => ClientDocumentLinkSender(_c);

  ClientWindowSender get window => ClientWindowSender(_c);

  ClientNotebookDocumentSender get notebookDocument =>
      ClientNotebookDocumentSender(_c);
}

/// Registers incoming LSP handlers for the `workspace` namespace.
extension type ClientWorkspaceHandlers(LspConnection _c) {
  /// Registers handler for `workspace/workspaceFolders`.
  void onWorkspaceFolders(
    Future<List<WorkspaceFolder>?> Function(LspRequest context) handler,
  ) => _c.registerRequestHandler(.workspaceFolders, (j, c) async {
    final result = await handler(c);
    return result?.map((e) => e.toJson()).toList();
  });

  /// Registers handler for `workspace/configuration`.
  void onConfiguration(
    Future<List<Object?>> Function(
      ConfigurationParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.configuration, (j, c) async {
    final params = parseParams(j, ConfigurationParams.fromJson);
    final result = await handler(params, c);
    return result.map((e) => (e as dynamic).toJson()).toList();
  });

  /// Registers handler for `workspace/foldingRange/refresh`.
  void onFoldingRangeRefresh(
    Future<void> Function(LspRequest context) handler,
  ) => _c.registerRequestHandler(.workspaceFoldingRangeRefresh, (j, c) async {
    await handler(c);
    return null;
  });

  /// Registers handler for `workspace/semanticTokens/refresh`.
  void onSemanticTokensRefresh(
    Future<void> Function(LspRequest context) handler,
  ) => _c.registerRequestHandler(.workspaceSemanticTokensRefresh, (j, c) async {
    await handler(c);
    return null;
  });

  /// Registers handler for `workspace/inlineValue/refresh`.
  void onInlineValueRefresh(
    Future<void> Function(LspRequest context) handler,
  ) => _c.registerRequestHandler(.workspaceInlineValueRefresh, (j, c) async {
    await handler(c);
    return null;
  });

  /// Registers handler for `workspace/inlayHint/refresh`.
  void onInlayHintRefresh(Future<void> Function(LspRequest context) handler) =>
      _c.registerRequestHandler(.workspaceInlayHintRefresh, (j, c) async {
        await handler(c);
        return null;
      });

  /// Registers handler for `workspace/diagnostic/refresh`.
  void onDiagnosticRefresh(Future<void> Function(LspRequest context) handler) =>
      _c.registerRequestHandler(.workspaceDiagnosticRefresh, (j, c) async {
        await handler(c);
        return null;
      });

  /// Registers handler for `workspace/codeLens/refresh`.
  void onCodeLensRefresh(Future<void> Function(LspRequest context) handler) =>
      _c.registerRequestHandler(.workspaceCodeLensRefresh, (j, c) async {
        await handler(c);
        return null;
      });

  /// Registers handler for `workspace/applyEdit`.
  void onApplyEdit(
    Future<ApplyWorkspaceEditResult> Function(
      ApplyWorkspaceEditParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.applyEdit, (j, c) async {
    final params = parseParams(j, ApplyWorkspaceEditParams.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });
}

/// Registers incoming LSP handlers for the `window` namespace.
extension type ClientWindowHandlers(LspConnection _c) {
  /// Registers handler for `window/workDoneProgress/create`.
  void onWorkDoneProgressCreate(
    Future<void> Function(
      WorkDoneProgressCreateParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.create, (j, c) async {
    final params = parseParams(j, WorkDoneProgressCreateParams.fromJson);
    await handler(params, c);
    return null;
  });

  /// Registers handler for `window/showDocument`.
  void onShowDocument(
    Future<ShowDocumentResult> Function(
      ShowDocumentParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.showDocument, (j, c) async {
    final params = parseParams(j, ShowDocumentParams.fromJson);
    final result = await handler(params, c);
    return result.toJson();
  });

  /// Registers handler for `window/showMessageRequest`.
  void onShowMessageRequest(
    Future<MessageActionItem?> Function(
      ShowMessageRequestParams params,
      LspRequest context,
    )
    handler,
  ) => _c.registerRequestHandler(.showMessageRequest, (j, c) async {
    final params = parseParams(j, ShowMessageRequestParams.fromJson);
    final result = await handler(params, c);
    return result?.toJson();
  });

  /// Registers handler for `window/showMessage`.
  void onShowMessage(
    Future<void> Function(ShowMessageParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.showMessage, (j, c) async {
    final params = parseParams(j, ShowMessageParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `window/logMessage`.
  void onLogMessage(
    Future<void> Function(LogMessageParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.logMessage, (j, c) async {
    final params = parseParams(j, LogMessageParams.fromJson);
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `client` namespace.
extension type ClientClientHandlers(LspConnection _c) {
  /// Registers handler for `client/registerCapability`.
  void onRegisterCapability(
    Future<void> Function(RegistrationParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.registerCapability, (j, c) async {
    final params = parseParams(j, RegistrationParams.fromJson);
    await handler(params, c);
    return null;
  });

  /// Registers handler for `client/unregisterCapability`.
  void onUnregisterCapability(
    Future<void> Function(UnregistrationParams params, LspRequest context)
    handler,
  ) => _c.registerRequestHandler(.unregisterCapability, (j, c) async {
    final params = parseParams(j, UnregistrationParams.fromJson);
    await handler(params, c);
    return null;
  });
}

/// Registers incoming LSP handlers for the `telemetry` namespace.
extension type ClientTelemetryHandlers(LspConnection _c) {
  /// Registers handler for `telemetry/event`.
  void onEvent(
    Future<void> Function(Object? params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.event, (j, c) async {
    final params = j;
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `textDocument` namespace.
extension type ClientTextDocumentHandlers(LspConnection _c) {
  /// Registers handler for `textDocument/publishDiagnostics`.
  void onPublishDiagnostics(
    Future<void> Function(PublishDiagnosticsParams params, LspRequest context)
    handler,
  ) => _c.registerNotificationHandler(.publishDiagnostics, (j, c) async {
    final params = parseParams(j, PublishDiagnosticsParams.fromJson);
    await handler(params, c);
  });
}

/// Registers incoming LSP handlers for the `general` namespace.
extension type ClientGeneralHandlers(LspConnection _c) {
  /// Registers handler for `$/logTrace`.
  void onLogTrace(
    Future<void> Function(LogTraceParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.logTrace, (j, c) async {
    final params = parseParams(j, LogTraceParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `$/cancelRequest`.
  void onCancelRequest(
    Future<void> Function(CancelParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.cancelRequest, (j, c) async {
    final params = parseParams(j, CancelParams.fromJson);
    await handler(params, c);
  });

  /// Registers handler for `$/progress`.
  void onProgress(
    Future<void> Function(ProgressParams params, LspRequest context) handler,
  ) => _c.registerNotificationHandler(.progress, (j, c) async {
    final params = parseParams(j, ProgressParams.fromJson);
    await handler(params, c);
  });
}

/// Sends LSP messages to the server for the `textDocument` namespace.
extension type ClientTextDocumentSender(LspConnection _c) {
  /// Sends the `textDocument/implementation` request to the server.
  Future<ImplementationResult?> implementation(
    ImplementationParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.implementation, params.toJson());
    return raw == null ? null : ImplementationResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/typeDefinition` request to the server.
  Future<TypeDefinitionResult?> typeDefinition(
    TypeDefinitionParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.typeDefinition, params.toJson());
    return raw == null ? null : TypeDefinitionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/documentColor` request to the server.
  Future<List<ColorInformation>> documentColor(
    DocumentColorParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.documentColor, params.toJson());
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(ColorInformation.fromJson)
        .toList();
  }

  /// Sends the `textDocument/colorPresentation` request to the server.
  Future<List<ColorPresentation>> colorPresentation(
    ColorPresentationParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .colorPresentation,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(ColorPresentation.fromJson)
        .toList();
  }

  /// Sends the `textDocument/foldingRange` request to the server.
  Future<List<FoldingRange>?> foldingRange(FoldingRangeParams params) async {
    final dynamic raw = await _c.sendRequest(.foldingRange, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(FoldingRange.fromJson)
              .toList();
  }

  /// Sends the `textDocument/declaration` request to the server.
  Future<DeclarationResult?> declaration(DeclarationParams params) async {
    final dynamic raw = await _c.sendRequest(.declaration, params.toJson());
    return raw == null ? null : DeclarationResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/selectionRange` request to the server.
  Future<List<SelectionRange>?> selectionRange(
    SelectionRangeParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.selectionRange, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(SelectionRange.fromJson)
              .toList();
  }

  /// Sends the `textDocument/prepareCallHierarchy` request to the server.
  Future<List<CallHierarchyItem>?> prepareCallHierarchy(
    CallHierarchyPrepareParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .prepareCallHierarchy,
      params.toJson(),
    );
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(CallHierarchyItem.fromJson)
              .toList();
  }

  /// Sends the `textDocument/semanticTokens/full` request to the server.
  Future<SemanticTokens?> semanticTokensFull(
    SemanticTokensParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.full, params.toJson());
    return raw == null
        ? null
        : SemanticTokens.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/semanticTokens/full/delta` request to the server.
  Future<SemanticTokensFullDeltaResult?> semanticTokensFullDelta(
    SemanticTokensDeltaParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.delta, params.toJson());
    return raw == null
        ? null
        : SemanticTokensFullDeltaResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/semanticTokens/range` request to the server.
  Future<SemanticTokens?> semanticTokensRange(
    SemanticTokensRangeParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.range, params.toJson());
    return raw == null
        ? null
        : SemanticTokens.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/linkedEditingRange` request to the server.
  Future<LinkedEditingRanges?> linkedEditingRange(
    LinkedEditingRangeParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .linkedEditingRange,
      params.toJson(),
    );
    return raw == null
        ? null
        : LinkedEditingRanges.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/moniker` request to the server.
  Future<List<Moniker>?> moniker(MonikerParams params) async {
    final dynamic raw = await _c.sendRequest(.moniker, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(Moniker.fromJson)
              .toList();
  }

  /// Sends the `textDocument/prepareTypeHierarchy` request to the server.
  Future<List<TypeHierarchyItem>?> prepareTypeHierarchy(
    TypeHierarchyPrepareParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .prepareTypeHierarchy,
      params.toJson(),
    );
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TypeHierarchyItem.fromJson)
              .toList();
  }

  /// Sends the `textDocument/inlineValue` request to the server.
  Future<List<InlineValue>?> inlineValue(InlineValueParams params) async {
    final dynamic raw = await _c.sendRequest(.inlineValue, params.toJson());
    return raw == null
        ? null
        : (raw as List).map((e) => InlineValue.fromJson(e as Object)).toList();
  }

  /// Sends the `textDocument/inlayHint` request to the server.
  Future<List<InlayHint>?> inlayHint(InlayHintParams params) async {
    final dynamic raw = await _c.sendRequest(.inlayHint, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(InlayHint.fromJson)
              .toList();
  }

  /// Sends the `textDocument/diagnostic` request to the server.
  Future<DocumentDiagnosticReport> diagnostic(
    DocumentDiagnosticParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .textDocumentDiagnostic,
      params.toJson(),
    );
    return DocumentDiagnosticReport.fromJson(raw as Object);
  }

  /// Sends the `textDocument/inlineCompletion` request to the server.
  Future<InlineCompletionResult?> inlineCompletion(
    InlineCompletionParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .inlineCompletion,
      params.toJson(),
    );
    return raw == null ? null : InlineCompletionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/willSaveWaitUntil` request to the server.
  Future<List<TextEdit>?> willSaveWaitUntil(
    WillSaveTextDocumentParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .willSaveWaitUntil,
      params.toJson(),
    );
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TextEdit.fromJson)
              .toList();
  }

  /// Sends the `textDocument/completion` request to the server.
  Future<CompletionResult?> completion(CompletionParams params) async {
    final dynamic raw = await _c.sendRequest(.completion, params.toJson());
    return raw == null ? null : CompletionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/hover` request to the server.
  Future<Hover?> hover(HoverParams params) async {
    final dynamic raw = await _c.sendRequest(.hover, params.toJson());
    return raw == null ? null : Hover.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/signatureHelp` request to the server.
  Future<SignatureHelp?> signatureHelp(SignatureHelpParams params) async {
    final dynamic raw = await _c.sendRequest(.signatureHelp, params.toJson());
    return raw == null
        ? null
        : SignatureHelp.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/definition` request to the server.
  Future<DefinitionResult?> definition(DefinitionParams params) async {
    final dynamic raw = await _c.sendRequest(.definition, params.toJson());
    return raw == null ? null : DefinitionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/references` request to the server.
  Future<List<Location>?> references(ReferenceParams params) async {
    final dynamic raw = await _c.sendRequest(.references, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(Location.fromJson)
              .toList();
  }

  /// Sends the `textDocument/documentHighlight` request to the server.
  Future<List<DocumentHighlight>?> documentHighlight(
    DocumentHighlightParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .documentHighlight,
      params.toJson(),
    );
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(DocumentHighlight.fromJson)
              .toList();
  }

  /// Sends the `textDocument/documentSymbol` request to the server.
  Future<DocumentSymbolResult?> documentSymbol(
    DocumentSymbolParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.documentSymbol, params.toJson());
    return raw == null ? null : DocumentSymbolResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/codeAction` request to the server.
  Future<List<Object>?> codeAction(CodeActionParams params) async {
    final dynamic raw = await _c.sendRequest(.codeAction, params.toJson());
    return raw == null ? null : (raw as List).cast<Object>().toList();
  }

  /// Sends the `textDocument/codeLens` request to the server.
  Future<List<CodeLens>?> codeLens(CodeLensParams params) async {
    final dynamic raw = await _c.sendRequest(.codeLens, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(CodeLens.fromJson)
              .toList();
  }

  /// Sends the `textDocument/documentLink` request to the server.
  Future<List<DocumentLink>?> documentLink(DocumentLinkParams params) async {
    final dynamic raw = await _c.sendRequest(.documentLink, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(DocumentLink.fromJson)
              .toList();
  }

  /// Sends the `textDocument/formatting` request to the server.
  Future<List<TextEdit>?> formatting(DocumentFormattingParams params) async {
    final dynamic raw = await _c.sendRequest(.formatting, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TextEdit.fromJson)
              .toList();
  }

  /// Sends the `textDocument/rangeFormatting` request to the server.
  Future<List<TextEdit>?> rangeFormatting(
    DocumentRangeFormattingParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.rangeFormatting, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TextEdit.fromJson)
              .toList();
  }

  /// Sends the `textDocument/rangesFormatting` request to the server.
  Future<List<TextEdit>?> rangesFormatting(
    DocumentRangesFormattingParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .rangesFormatting,
      params.toJson(),
    );
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TextEdit.fromJson)
              .toList();
  }

  /// Sends the `textDocument/onTypeFormatting` request to the server.
  Future<List<TextEdit>?> onTypeFormatting(
    DocumentOnTypeFormattingParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .onTypeFormatting,
      params.toJson(),
    );
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TextEdit.fromJson)
              .toList();
  }

  /// Sends the `textDocument/rename` request to the server.
  Future<WorkspaceEdit?> rename(RenameParams params) async {
    final dynamic raw = await _c.sendRequest(.rename, params.toJson());
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/prepareRename` request to the server.
  Future<PrepareRenameResult?> prepareRename(PrepareRenameParams params) async {
    final dynamic raw = await _c.sendRequest(.prepareRename, params.toJson());
    return raw == null ? null : PrepareRenameResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/didOpen` notification to the server.
  void didOpen(DidOpenTextDocumentParams params) =>
      _c.sendNotification(.textDocumentDidOpen, params.toJson());

  /// Sends the `textDocument/didChange` notification to the server.
  void didChange(DidChangeTextDocumentParams params) =>
      _c.sendNotification(.textDocumentDidChange, params.toJson());

  /// Sends the `textDocument/didClose` notification to the server.
  void didClose(DidCloseTextDocumentParams params) =>
      _c.sendNotification(.textDocumentDidClose, params.toJson());

  /// Sends the `textDocument/didSave` notification to the server.
  void didSave(DidSaveTextDocumentParams params) =>
      _c.sendNotification(.textDocumentDidSave, params.toJson());

  /// Sends the `textDocument/willSave` notification to the server.
  void willSave(WillSaveTextDocumentParams params) =>
      _c.sendNotification(.willSave, params.toJson());
}

/// Sends LSP messages to the server for the `callHierarchy` namespace.
extension type ClientCallHierarchySender(LspConnection _c) {
  /// Sends the `callHierarchy/incomingCalls` request to the server.
  Future<List<CallHierarchyIncomingCall>?> incomingCalls(
    CallHierarchyIncomingCallsParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.incomingCalls, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(CallHierarchyIncomingCall.fromJson)
              .toList();
  }

  /// Sends the `callHierarchy/outgoingCalls` request to the server.
  Future<List<CallHierarchyOutgoingCall>?> outgoingCalls(
    CallHierarchyOutgoingCallsParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.outgoingCalls, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(CallHierarchyOutgoingCall.fromJson)
              .toList();
  }
}

/// Sends LSP messages to the server for the `workspace` namespace.
extension type ClientWorkspaceSender(LspConnection _c) {
  /// Sends the `workspace/willCreateFiles` request to the server.
  Future<WorkspaceEdit?> willCreateFiles(CreateFilesParams params) async {
    final dynamic raw = await _c.sendRequest(.willCreateFiles, params.toJson());
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/willRenameFiles` request to the server.
  Future<WorkspaceEdit?> willRenameFiles(RenameFilesParams params) async {
    final dynamic raw = await _c.sendRequest(.willRenameFiles, params.toJson());
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/willDeleteFiles` request to the server.
  Future<WorkspaceEdit?> willDeleteFiles(DeleteFilesParams params) async {
    final dynamic raw = await _c.sendRequest(.willDeleteFiles, params.toJson());
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/diagnostic` request to the server.
  Future<WorkspaceDiagnosticReport> diagnostic(
    WorkspaceDiagnosticParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(
      .workspaceDiagnostic,
      params.toJson(),
    );
    return WorkspaceDiagnosticReport.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/symbol` request to the server.
  Future<SymbolResult?> symbol(WorkspaceSymbolParams params) async {
    final dynamic raw = await _c.sendRequest(.symbol, params.toJson());
    return raw == null ? null : SymbolResult.fromJson(raw as Object);
  }

  /// Sends the `workspace/executeCommand` request to the server.
  Future<Object?> executeCommand(ExecuteCommandParams params) async {
    final dynamic raw = await _c.sendRequest(.executeCommand, params.toJson());
    return raw;
  }

  /// Sends the `workspace/didChangeWorkspaceFolders` notification to the server.
  void didChangeWorkspaceFolders(DidChangeWorkspaceFoldersParams params) =>
      _c.sendNotification(.didChangeWorkspaceFolders, params.toJson());

  /// Sends the `workspace/didCreateFiles` notification to the server.
  void didCreateFiles(CreateFilesParams params) =>
      _c.sendNotification(.didCreateFiles, params.toJson());

  /// Sends the `workspace/didRenameFiles` notification to the server.
  void didRenameFiles(RenameFilesParams params) =>
      _c.sendNotification(.didRenameFiles, params.toJson());

  /// Sends the `workspace/didDeleteFiles` notification to the server.
  void didDeleteFiles(DeleteFilesParams params) =>
      _c.sendNotification(.didDeleteFiles, params.toJson());

  /// Sends the `workspace/didChangeConfiguration` notification to the server.
  void didChangeConfiguration(DidChangeConfigurationParams params) =>
      _c.sendNotification(.didChangeConfiguration, params.toJson());

  /// Sends the `workspace/didChangeWatchedFiles` notification to the server.
  void didChangeWatchedFiles(DidChangeWatchedFilesParams params) =>
      _c.sendNotification(.didChangeWatchedFiles, params.toJson());
}

/// Sends LSP messages to the server for the `typeHierarchy` namespace.
extension type ClientTypeHierarchySender(LspConnection _c) {
  /// Sends the `typeHierarchy/supertypes` request to the server.
  Future<List<TypeHierarchyItem>?> supertypes(
    TypeHierarchySupertypesParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.supertypes, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TypeHierarchyItem.fromJson)
              .toList();
  }

  /// Sends the `typeHierarchy/subtypes` request to the server.
  Future<List<TypeHierarchyItem>?> subtypes(
    TypeHierarchySubtypesParams params,
  ) async {
    final dynamic raw = await _c.sendRequest(.subtypes, params.toJson());
    return raw == null
        ? null
        : (raw as List)
              .cast<Map<String, dynamic>>()
              .map(TypeHierarchyItem.fromJson)
              .toList();
  }
}

/// Sends LSP messages to the server for the `inlayHint` namespace.
extension type ClientInlayHintSender(LspConnection _c) {
  /// Sends the `inlayHint/resolve` request to the server.
  Future<InlayHint> resolve(InlayHint params) async {
    final dynamic raw = await _c.sendRequest(
      .inlayHintResolve,
      params.toJson(),
    );
    return InlayHint.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `general` namespace.
extension type ClientGeneralSender(LspConnection _c) {
  /// Sends the `initialize` request to the server.
  Future<InitializeResult> initialize(InitializeParams params) async {
    final dynamic raw = await _c.sendRequest(.initialize, params.toJson());
    return InitializeResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `shutdown` request to the server.
  Future<void> shutdown() async {
    await _c.sendRequest(.shutdown);
  }

  /// Sends the `initialized` notification to the server.
  void initialized(InitializedParams params) =>
      _c.sendNotification(.initialized, params.toJson());

  /// Sends the `exit` notification to the server.
  void exit() => _c.sendNotification(.exit);

  /// Sends the `$/setTrace` notification to the server.
  void setTrace(SetTraceParams params) =>
      _c.sendNotification(.setTrace, params.toJson());

  /// Sends the `$/cancelRequest` notification to the server.
  void cancelRequest(CancelParams params) =>
      _c.sendNotification(.cancelRequest, params.toJson());

  /// Sends the `$/progress` notification to the server.
  void progress(ProgressParams params) =>
      _c.sendNotification(.progress, params.toJson());
}

/// Sends LSP messages to the server for the `completionItem` namespace.
extension type ClientCompletionItemSender(LspConnection _c) {
  /// Sends the `completionItem/resolve` request to the server.
  Future<CompletionItem> resolve(CompletionItem params) async {
    final dynamic raw = await _c.sendRequest(
      .completionItemResolve,
      params.toJson(),
    );
    return CompletionItem.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `codeAction` namespace.
extension type ClientCodeActionSender(LspConnection _c) {
  /// Sends the `codeAction/resolve` request to the server.
  Future<CodeAction> resolve(CodeAction params) async {
    final dynamic raw = await _c.sendRequest(
      .codeActionResolve,
      params.toJson(),
    );
    return CodeAction.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `workspaceSymbol` namespace.
extension type ClientWorkspaceSymbolSender(LspConnection _c) {
  /// Sends the `workspaceSymbol/resolve` request to the server.
  Future<WorkspaceSymbol> resolve(WorkspaceSymbol params) async {
    final dynamic raw = await _c.sendRequest(
      .workspaceSymbolResolve,
      params.toJson(),
    );
    return WorkspaceSymbol.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `codeLens` namespace.
extension type ClientCodeLensSender(LspConnection _c) {
  /// Sends the `codeLens/resolve` request to the server.
  Future<CodeLens> resolve(CodeLens params) async {
    final dynamic raw = await _c.sendRequest(.codeLensResolve, params.toJson());
    return CodeLens.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `documentLink` namespace.
extension type ClientDocumentLinkSender(LspConnection _c) {
  /// Sends the `documentLink/resolve` request to the server.
  Future<DocumentLink> resolve(DocumentLink params) async {
    final dynamic raw = await _c.sendRequest(
      .documentLinkResolve,
      params.toJson(),
    );
    return DocumentLink.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `window` namespace.
extension type ClientWindowSender(LspConnection _c) {
  /// Sends the `window/workDoneProgress/cancel` notification to the server.
  void workDoneProgressCancel(WorkDoneProgressCancelParams params) =>
      _c.sendNotification(.cancel, params.toJson());
}

/// Sends LSP messages to the server for the `notebookDocument` namespace.
extension type ClientNotebookDocumentSender(LspConnection _c) {
  /// Sends the `notebookDocument/didOpen` notification to the server.
  void didOpen(DidOpenNotebookDocumentParams params) =>
      _c.sendNotification(.notebookDocumentDidOpen, params.toJson());

  /// Sends the `notebookDocument/didChange` notification to the server.
  void didChange(DidChangeNotebookDocumentParams params) =>
      _c.sendNotification(.notebookDocumentDidChange, params.toJson());

  /// Sends the `notebookDocument/didSave` notification to the server.
  void didSave(DidSaveNotebookDocumentParams params) =>
      _c.sendNotification(.notebookDocumentDidSave, params.toJson());

  /// Sends the `notebookDocument/didClose` notification to the server.
  void didClose(DidCloseNotebookDocumentParams params) =>
      _c.sendNotification(.notebookDocumentDidClose, params.toJson());
}
