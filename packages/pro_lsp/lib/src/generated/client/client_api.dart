// ignore_for_file: type=lint

// GENERATED — do not edit.

import 'dart:async';

import '../../../pro_lsp.dart';

/// Registers incoming LSP handlers for the `workspace` namespace.
class WorkspaceHandlers {
  WorkspaceHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `workspace/workspaceFolders`.
  void onWorkspaceFolders(Future<List<WorkspaceFolder>?> Function() handler) {
    _connection.registerRequestHandler(RequestMethod.workspaceFolders.value, (
      dynamic json,
    ) async {
      final r = await handler();
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `workspace/configuration`.
  void onConfiguration(
    Future<List<Object?>> Function(ConfigurationParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.configuration.value, (
      dynamic json,
    ) async {
      final p = ConfigurationParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.map((e) => (e as dynamic).toJson()).toList();
    });
  }

  /// Registers handler for `workspace/foldingRange/refresh`.
  void onFoldingRangeRefresh(Future<void> Function() handler) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceFoldingRangeRefresh.value,
      (dynamic json) async {
        await handler();
        return null;
      },
    );
  }

  /// Registers handler for `workspace/semanticTokens/refresh`.
  void onSemanticTokensRefresh(Future<void> Function() handler) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceSemanticTokensRefresh.value,
      (dynamic json) async {
        await handler();
        return null;
      },
    );
  }

  /// Registers handler for `workspace/inlineValue/refresh`.
  void onInlineValueRefresh(Future<void> Function() handler) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceInlineValueRefresh.value,
      (dynamic json) async {
        await handler();
        return null;
      },
    );
  }

  /// Registers handler for `workspace/inlayHint/refresh`.
  void onInlayHintRefresh(Future<void> Function() handler) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceInlayHintRefresh.value,
      (dynamic json) async {
        await handler();
        return null;
      },
    );
  }

  /// Registers handler for `workspace/diagnostic/refresh`.
  void onDiagnosticRefresh(Future<void> Function() handler) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceDiagnosticRefresh.value,
      (dynamic json) async {
        await handler();
        return null;
      },
    );
  }

  /// Registers handler for `workspace/codeLens/refresh`.
  void onCodeLensRefresh(Future<void> Function() handler) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceCodeLensRefresh.value,
      (dynamic json) async {
        await handler();
        return null;
      },
    );
  }

  /// Registers handler for `workspace/applyEdit`.
  void onApplyEdit(
    Future<ApplyWorkspaceEditResult> Function(ApplyWorkspaceEditParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.applyEdit.value, (
      dynamic json,
    ) async {
      final p = ApplyWorkspaceEditParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `window` namespace.
class WindowHandlers {
  WindowHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `window/workDoneProgress/create`.
  void onWorkDoneProgressCreate(
    Future<void> Function(WorkDoneProgressCreateParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.create.value, (
      dynamic json,
    ) async {
      final p = WorkDoneProgressCreateParams.fromJson(
        json as Map<String, dynamic>,
      );
      await handler(p);
      return null;
    });
  }

  /// Registers handler for `window/showDocument`.
  void onShowDocument(
    Future<ShowDocumentResult> Function(ShowDocumentParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.showDocument.value, (
      dynamic json,
    ) async {
      final p = ShowDocumentParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.toJson();
    });
  }

  /// Registers handler for `window/showMessageRequest`.
  void onShowMessageRequest(
    Future<MessageActionItem?> Function(ShowMessageRequestParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.showMessageRequest.value, (
      dynamic json,
    ) async {
      final p = ShowMessageRequestParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `window/showMessage`.
  void onShowMessage(Future<void> Function(ShowMessageParams params) handler) {
    _connection.registerNotificationHandler(
      NotificationMethod.showMessage.value,
      (dynamic json) async {
        final p = ShowMessageParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }

  /// Registers handler for `window/logMessage`.
  void onLogMessage(Future<void> Function(LogMessageParams params) handler) {
    _connection.registerNotificationHandler(
      NotificationMethod.logMessage.value,
      (dynamic json) async {
        final p = LogMessageParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }
}

/// Registers incoming LSP handlers for the `client` namespace.
class ClientHandlers {
  ClientHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `client/registerCapability`.
  void onRegisterCapability(
    Future<void> Function(RegistrationParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.registerCapability.value, (
      dynamic json,
    ) async {
      final p = RegistrationParams.fromJson(json as Map<String, dynamic>);
      await handler(p);
      return null;
    });
  }

  /// Registers handler for `client/unregisterCapability`.
  void onUnregisterCapability(
    Future<void> Function(UnregistrationParams params) handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.unregisterCapability.value,
      (dynamic json) async {
        final p = UnregistrationParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
        return null;
      },
    );
  }
}

/// Registers incoming LSP handlers for the `telemetry` namespace.
class TelemetryHandlers {
  TelemetryHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `telemetry/event`.
  void onEvent(Future<void> Function(Object? params) handler) {
    _connection.registerNotificationHandler(NotificationMethod.event.value, (
      dynamic json,
    ) async {
      final p = json;
      await handler(p);
    });
  }
}

/// Registers incoming LSP handlers for the `textDocument` namespace.
class TextDocumentHandlers {
  TextDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `textDocument/publishDiagnostics`.
  void onPublishDiagnostics(
    Future<void> Function(PublishDiagnosticsParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.publishDiagnostics.value,
      (dynamic json) async {
        final p = PublishDiagnosticsParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }
}

/// Registers incoming LSP handlers for the `general` namespace.
class GeneralHandlers {
  GeneralHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `$/logTrace`.
  void onLogTrace(Future<void> Function(LogTraceParams params) handler) {
    _connection.registerNotificationHandler(NotificationMethod.logTrace.value, (
      dynamic json,
    ) async {
      final p = LogTraceParams.fromJson(json as Map<String, dynamic>);
      await handler(p);
    });
  }

  /// Registers handler for `$/cancelRequest`.
  void onCancelRequest(Future<void> Function(CancelParams params) handler) {
    _connection.registerNotificationHandler(
      NotificationMethod.cancelRequest.value,
      (dynamic json) async {
        final p = CancelParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }

  /// Registers handler for `$/progress`.
  void onProgress(Future<void> Function(ProgressParams params) handler) {
    _connection.registerNotificationHandler(NotificationMethod.progress.value, (
      dynamic json,
    ) async {
      final p = ProgressParams.fromJson(json as Map<String, dynamic>);
      await handler(p);
    });
  }
}

/// Sends LSP messages to the server for the `textDocument` namespace.
class TextDocumentSender {
  TextDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `textDocument/implementation` request to the server.
  Future<Object?> implementation(ImplementationParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.implementation.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/typeDefinition` request to the server.
  Future<Object?> typeDefinition(TypeDefinitionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.typeDefinition.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/documentColor` request to the server.
  Future<List<ColorInformation>> documentColor(
    DocumentColorParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.documentColor.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(ColorInformation.fromJson)
        .toList();
  }

  /// Sends the `textDocument/colorPresentation` request to the server.
  Future<List<ColorPresentation>> colorPresentation(
    ColorPresentationParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.colorPresentation.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(ColorPresentation.fromJson)
        .toList();
  }

  /// Sends the `textDocument/foldingRange` request to the server.
  Future<List<FoldingRange>?> foldingRange(FoldingRangeParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.foldingRange.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(FoldingRange.fromJson)
        .toList();
  }

  /// Sends the `textDocument/declaration` request to the server.
  Future<Object?> declaration(DeclarationParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.declaration.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/selectionRange` request to the server.
  Future<List<SelectionRange>?> selectionRange(
    SelectionRangeParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.selectionRange.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(SelectionRange.fromJson)
        .toList();
  }

  /// Sends the `textDocument/prepareCallHierarchy` request to the server.
  Future<List<CallHierarchyItem>?> prepareCallHierarchy(
    CallHierarchyPrepareParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.prepareCallHierarchy.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(CallHierarchyItem.fromJson)
        .toList();
  }

  /// Sends the `textDocument/semanticTokens/full` request to the server.
  Future<SemanticTokens?> semanticTokensFull(
    SemanticTokensParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.full.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : SemanticTokens.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/semanticTokens/full/delta` request to the server.
  Future<Object?> semanticTokensFullDelta(
    SemanticTokensDeltaParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.delta.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/semanticTokens/range` request to the server.
  Future<SemanticTokens?> semanticTokensRange(
    SemanticTokensRangeParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.range.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : SemanticTokens.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/linkedEditingRange` request to the server.
  Future<LinkedEditingRanges?> linkedEditingRange(
    LinkedEditingRangeParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.linkedEditingRange.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : LinkedEditingRanges.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/moniker` request to the server.
  Future<List<Moniker>?> moniker(MonikerParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.moniker.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(Moniker.fromJson)
        .toList();
  }

  /// Sends the `textDocument/prepareTypeHierarchy` request to the server.
  Future<List<TypeHierarchyItem>?> prepareTypeHierarchy(
    TypeHierarchyPrepareParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.prepareTypeHierarchy.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TypeHierarchyItem.fromJson)
        .toList();
  }

  /// Sends the `textDocument/inlineValue` request to the server.
  Future<List<InlineValue>?> inlineValue(InlineValueParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.inlineValue.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(InlineValue.fromJson)
        .toList();
  }

  /// Sends the `textDocument/inlayHint` request to the server.
  Future<List<InlayHint>?> inlayHint(InlayHintParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.inlayHint.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(InlayHint.fromJson)
        .toList();
  }

  /// Sends the `textDocument/diagnostic` request to the server.
  Future<DocumentDiagnosticReport> diagnostic(
    DocumentDiagnosticParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.textDocumentDiagnostic.value,
      params.toJson(),
    );
    return DocumentDiagnosticReport.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/inlineCompletion` request to the server.
  Future<Object?> inlineCompletion(InlineCompletionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.inlineCompletion.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/willSaveWaitUntil` request to the server.
  Future<List<TextEdit>?> willSaveWaitUntil(
    WillSaveTextDocumentParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.willSaveWaitUntil.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/completion` request to the server.
  Future<Object?> completion(CompletionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.completion.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/hover` request to the server.
  Future<Hover?> hover(HoverParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.hover.value,
      params.toJson(),
    );
    return raw == null ? null : Hover.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/signatureHelp` request to the server.
  Future<SignatureHelp?> signatureHelp(SignatureHelpParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.signatureHelp.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : SignatureHelp.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/definition` request to the server.
  Future<Object?> definition(DefinitionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.definition.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/references` request to the server.
  Future<List<Location>?> references(ReferenceParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.references.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(Location.fromJson)
        .toList();
  }

  /// Sends the `textDocument/documentHighlight` request to the server.
  Future<List<DocumentHighlight>?> documentHighlight(
    DocumentHighlightParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.documentHighlight.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(DocumentHighlight.fromJson)
        .toList();
  }

  /// Sends the `textDocument/documentSymbol` request to the server.
  Future<Object?> documentSymbol(DocumentSymbolParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.documentSymbol.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `textDocument/codeAction` request to the server.
  Future<List<Object>?> codeAction(CodeActionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.codeAction.value,
      params.toJson(),
    );
    return (raw as List).cast<Object>().toList();
  }

  /// Sends the `textDocument/codeLens` request to the server.
  Future<List<CodeLens>?> codeLens(CodeLensParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.codeLens.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(CodeLens.fromJson)
        .toList();
  }

  /// Sends the `textDocument/documentLink` request to the server.
  Future<List<DocumentLink>?> documentLink(DocumentLinkParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.documentLink.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(DocumentLink.fromJson)
        .toList();
  }

  /// Sends the `textDocument/formatting` request to the server.
  Future<List<TextEdit>?> formatting(DocumentFormattingParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.formatting.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/rangeFormatting` request to the server.
  Future<List<TextEdit>?> rangeFormatting(
    DocumentRangeFormattingParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.rangeFormatting.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/rangesFormatting` request to the server.
  Future<List<TextEdit>?> rangesFormatting(
    DocumentRangesFormattingParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.rangesFormatting.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/onTypeFormatting` request to the server.
  Future<List<TextEdit>?> onTypeFormatting(
    DocumentOnTypeFormattingParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.onTypeFormatting.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/rename` request to the server.
  Future<WorkspaceEdit?> rename(RenameParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.rename.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/prepareRename` request to the server.
  Future<PrepareRenameResult?> prepareRename(PrepareRenameParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.prepareRename.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : PrepareRenameResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/didOpen` notification to the server.
  void didOpen(DidOpenTextDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.textDocumentDidOpen.value,
        params.toJson(),
      );

  /// Sends the `textDocument/didChange` notification to the server.
  void didChange(DidChangeTextDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.textDocumentDidChange.value,
        params.toJson(),
      );

  /// Sends the `textDocument/didClose` notification to the server.
  void didClose(DidCloseTextDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.textDocumentDidClose.value,
        params.toJson(),
      );

  /// Sends the `textDocument/didSave` notification to the server.
  void didSave(DidSaveTextDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.textDocumentDidSave.value,
        params.toJson(),
      );

  /// Sends the `textDocument/willSave` notification to the server.
  void willSave(WillSaveTextDocumentParams params) => _connection
      .sendNotification(NotificationMethod.willSave.value, params.toJson());
}

/// Sends LSP messages to the server for the `callHierarchy` namespace.
class CallHierarchySender {
  CallHierarchySender(this._connection);

  final LspConnection _connection;

  /// Sends the `callHierarchy/incomingCalls` request to the server.
  Future<List<CallHierarchyIncomingCall>?> incomingCalls(
    CallHierarchyIncomingCallsParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.incomingCalls.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(CallHierarchyIncomingCall.fromJson)
        .toList();
  }

  /// Sends the `callHierarchy/outgoingCalls` request to the server.
  Future<List<CallHierarchyOutgoingCall>?> outgoingCalls(
    CallHierarchyOutgoingCallsParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.outgoingCalls.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(CallHierarchyOutgoingCall.fromJson)
        .toList();
  }
}

/// Sends LSP messages to the server for the `workspace` namespace.
class WorkspaceSender {
  WorkspaceSender(this._connection);

  final LspConnection _connection;

  /// Sends the `workspace/willCreateFiles` request to the server.
  Future<WorkspaceEdit?> willCreateFiles(CreateFilesParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.willCreateFiles.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/willRenameFiles` request to the server.
  Future<WorkspaceEdit?> willRenameFiles(RenameFilesParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.willRenameFiles.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/willDeleteFiles` request to the server.
  Future<WorkspaceEdit?> willDeleteFiles(DeleteFilesParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.willDeleteFiles.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/diagnostic` request to the server.
  Future<WorkspaceDiagnosticReport> diagnostic(
    WorkspaceDiagnosticParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.workspaceDiagnostic.value,
      params.toJson(),
    );
    return WorkspaceDiagnosticReport.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/symbol` request to the server.
  Future<Object?> symbol(WorkspaceSymbolParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.symbol.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `workspace/executeCommand` request to the server.
  Future<Object?> executeCommand(ExecuteCommandParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.executeCommand.value,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `workspace/didChangeWorkspaceFolders` notification to the server.
  void didChangeWorkspaceFolders(DidChangeWorkspaceFoldersParams params) =>
      _connection.sendNotification(
        NotificationMethod.didChangeWorkspaceFolders.value,
        params.toJson(),
      );

  /// Sends the `workspace/didCreateFiles` notification to the server.
  void didCreateFiles(CreateFilesParams params) => _connection.sendNotification(
    NotificationMethod.didCreateFiles.value,
    params.toJson(),
  );

  /// Sends the `workspace/didRenameFiles` notification to the server.
  void didRenameFiles(RenameFilesParams params) => _connection.sendNotification(
    NotificationMethod.didRenameFiles.value,
    params.toJson(),
  );

  /// Sends the `workspace/didDeleteFiles` notification to the server.
  void didDeleteFiles(DeleteFilesParams params) => _connection.sendNotification(
    NotificationMethod.didDeleteFiles.value,
    params.toJson(),
  );

  /// Sends the `workspace/didChangeConfiguration` notification to the server.
  void didChangeConfiguration(DidChangeConfigurationParams params) =>
      _connection.sendNotification(
        NotificationMethod.didChangeConfiguration.value,
        params.toJson(),
      );

  /// Sends the `workspace/didChangeWatchedFiles` notification to the server.
  void didChangeWatchedFiles(DidChangeWatchedFilesParams params) =>
      _connection.sendNotification(
        NotificationMethod.didChangeWatchedFiles.value,
        params.toJson(),
      );
}

/// Sends LSP messages to the server for the `typeHierarchy` namespace.
class TypeHierarchySender {
  TypeHierarchySender(this._connection);

  final LspConnection _connection;

  /// Sends the `typeHierarchy/supertypes` request to the server.
  Future<List<TypeHierarchyItem>?> supertypes(
    TypeHierarchySupertypesParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.supertypes.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TypeHierarchyItem.fromJson)
        .toList();
  }

  /// Sends the `typeHierarchy/subtypes` request to the server.
  Future<List<TypeHierarchyItem>?> subtypes(
    TypeHierarchySubtypesParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.subtypes.value,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TypeHierarchyItem.fromJson)
        .toList();
  }
}

/// Sends LSP messages to the server for the `inlayHint` namespace.
class InlayHintSender {
  InlayHintSender(this._connection);

  final LspConnection _connection;

  /// Sends the `inlayHint/resolve` request to the server.
  Future<InlayHint> resolve(InlayHint params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.inlayHintResolve.value,
      params.toJson(),
    );
    return InlayHint.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `general` namespace.
class GeneralSender {
  GeneralSender(this._connection);

  final LspConnection _connection;

  /// Sends the `initialize` request to the server.
  Future<InitializeResult> initialize(InitializeParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.initialize.value,
      params.toJson(),
    );
    return InitializeResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `shutdown` request to the server.
  Future<void> shutdown() async {
    await _connection.sendRequest(RequestMethod.shutdown.value);
  }

  /// Sends the `initialized` notification to the server.
  void initialized(InitializedParams params) => _connection.sendNotification(
    NotificationMethod.initialized.value,
    params.toJson(),
  );

  /// Sends the `exit` notification to the server.
  void exit() => _connection.sendNotification(NotificationMethod.exit.value);

  /// Sends the `$/setTrace` notification to the server.
  void setTrace(SetTraceParams params) => _connection.sendNotification(
    NotificationMethod.setTrace.value,
    params.toJson(),
  );

  /// Sends the `$/cancelRequest` notification to the server.
  void cancelRequest(CancelParams params) => _connection.sendNotification(
    NotificationMethod.cancelRequest.value,
    params.toJson(),
  );

  /// Sends the `$/progress` notification to the server.
  void progress(ProgressParams params) => _connection.sendNotification(
    NotificationMethod.progress.value,
    params.toJson(),
  );
}

/// Sends LSP messages to the server for the `completionItem` namespace.
class CompletionItemSender {
  CompletionItemSender(this._connection);

  final LspConnection _connection;

  /// Sends the `completionItem/resolve` request to the server.
  Future<CompletionItem> resolve(CompletionItem params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.completionItemResolve.value,
      params.toJson(),
    );
    return CompletionItem.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `codeAction` namespace.
class CodeActionSender {
  CodeActionSender(this._connection);

  final LspConnection _connection;

  /// Sends the `codeAction/resolve` request to the server.
  Future<CodeAction> resolve(CodeAction params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.codeActionResolve.value,
      params.toJson(),
    );
    return CodeAction.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `workspaceSymbol` namespace.
class WorkspaceSymbolSender {
  WorkspaceSymbolSender(this._connection);

  final LspConnection _connection;

  /// Sends the `workspaceSymbol/resolve` request to the server.
  Future<WorkspaceSymbol> resolve(WorkspaceSymbol params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.workspaceSymbolResolve.value,
      params.toJson(),
    );
    return WorkspaceSymbol.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `codeLens` namespace.
class CodeLensSender {
  CodeLensSender(this._connection);

  final LspConnection _connection;

  /// Sends the `codeLens/resolve` request to the server.
  Future<CodeLens> resolve(CodeLens params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.codeLensResolve.value,
      params.toJson(),
    );
    return CodeLens.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `documentLink` namespace.
class DocumentLinkSender {
  DocumentLinkSender(this._connection);

  final LspConnection _connection;

  /// Sends the `documentLink/resolve` request to the server.
  Future<DocumentLink> resolve(DocumentLink params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.documentLinkResolve.value,
      params.toJson(),
    );
    return DocumentLink.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the server for the `window` namespace.
class WindowSender {
  WindowSender(this._connection);

  final LspConnection _connection;

  /// Sends the `window/workDoneProgress/cancel` notification to the server.
  void workDoneProgressCancel(WorkDoneProgressCancelParams params) =>
      _connection.sendNotification(
        NotificationMethod.cancel.value,
        params.toJson(),
      );
}

/// Sends LSP messages to the server for the `notebookDocument` namespace.
class NotebookDocumentSender {
  NotebookDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `notebookDocument/didOpen` notification to the server.
  void didOpen(DidOpenNotebookDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.notebookDocumentDidOpen.value,
        params.toJson(),
      );

  /// Sends the `notebookDocument/didChange` notification to the server.
  void didChange(DidChangeNotebookDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.notebookDocumentDidChange.value,
        params.toJson(),
      );

  /// Sends the `notebookDocument/didSave` notification to the server.
  void didSave(DidSaveNotebookDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.notebookDocumentDidSave.value,
        params.toJson(),
      );

  /// Sends the `notebookDocument/didClose` notification to the server.
  void didClose(DidCloseNotebookDocumentParams params) =>
      _connection.sendNotification(
        NotificationMethod.notebookDocumentDidClose.value,
        params.toJson(),
      );
}

/// Aggregates all outgoing sender classes.
///
/// Access via [LspClient.server]:
/// ```dart
/// client.server.textDocument.completion(CompletionParams(...));
/// ```
class ClientToServerProxy {
  ClientToServerProxy(this._connection);

  final LspConnection _connection;

  late final textDocument = TextDocumentSender(_connection);

  late final callHierarchy = CallHierarchySender(_connection);

  late final workspace = WorkspaceSender(_connection);

  late final typeHierarchy = TypeHierarchySender(_connection);

  late final inlayHint = InlayHintSender(_connection);

  late final general = GeneralSender(_connection);

  late final completionItem = CompletionItemSender(_connection);

  late final codeAction = CodeActionSender(_connection);

  late final workspaceSymbol = WorkspaceSymbolSender(_connection);

  late final codeLens = CodeLensSender(_connection);

  late final documentLink = DocumentLinkSender(_connection);

  late final window = WindowSender(_connection);

  late final notebookDocument = NotebookDocumentSender(_connection);
}
