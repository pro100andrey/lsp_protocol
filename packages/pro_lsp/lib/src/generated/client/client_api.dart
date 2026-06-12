// ignore_for_file: type=lint

// ignore_for_file: unused_import
//
// GENERATED — do not edit.

import 'dart:async';

import '../../connection/lsp_connection.dart';
import '../../connection/lsp_exception.dart';
import '../../server/lsp_request.dart';
import '../models/enumerations.dart';
import '../models/methods.dart';
import '../models/scalar_unions.dart';
import '../models/structures.dart';
import '../models/type_aliases.dart';
import '../models/unions.dart';

/// Registers incoming LSP handlers for the `workspace` namespace.
class WorkspaceHandlers {
  WorkspaceHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `workspace/workspaceFolders`.
  void onWorkspaceFolders(
    Future<List<WorkspaceFolder>?> Function(LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(.workspaceFolders, (
      dynamic json,
      LspRequest context,
    ) async {
      final r = await handler(context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `workspace/configuration`.
  void onConfiguration(
    Future<List<Object?>> Function(
      ConfigurationParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(.configuration, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, ConfigurationParams.fromJson);
      final r = await handler(p, context);
      return r.map((e) => (e as dynamic).toJson()).toList();
    });
  }

  /// Registers handler for `workspace/foldingRange/refresh`.
  void onFoldingRangeRefresh(
    Future<void> Function(LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(.workspaceFoldingRangeRefresh, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `workspace/semanticTokens/refresh`.
  void onSemanticTokensRefresh(
    Future<void> Function(LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(.workspaceSemanticTokensRefresh, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `workspace/inlineValue/refresh`.
  void onInlineValueRefresh(Future<void> Function(LspRequest context) handler) {
    _connection.registerRequestHandler(.workspaceInlineValueRefresh, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `workspace/inlayHint/refresh`.
  void onInlayHintRefresh(Future<void> Function(LspRequest context) handler) {
    _connection.registerRequestHandler(.workspaceInlayHintRefresh, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `workspace/diagnostic/refresh`.
  void onDiagnosticRefresh(Future<void> Function(LspRequest context) handler) {
    _connection.registerRequestHandler(.workspaceDiagnosticRefresh, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `workspace/codeLens/refresh`.
  void onCodeLensRefresh(Future<void> Function(LspRequest context) handler) {
    _connection.registerRequestHandler(.workspaceCodeLensRefresh, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `workspace/applyEdit`.
  void onApplyEdit(
    Future<ApplyWorkspaceEditResult> Function(
      ApplyWorkspaceEditParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(.applyEdit, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, ApplyWorkspaceEditParams.fromJson);
      final r = await handler(p, context);
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
    Future<void> Function(
      WorkDoneProgressCreateParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(.create, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, WorkDoneProgressCreateParams.fromJson);
      await handler(p, context);
      return null;
    });
  }

  /// Registers handler for `window/showDocument`.
  void onShowDocument(
    Future<ShowDocumentResult> Function(
      ShowDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(.showDocument, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, ShowDocumentParams.fromJson);
      final r = await handler(p, context);
      return r.toJson();
    });
  }

  /// Registers handler for `window/showMessageRequest`.
  void onShowMessageRequest(
    Future<MessageActionItem?> Function(
      ShowMessageRequestParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(.showMessageRequest, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, ShowMessageRequestParams.fromJson);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `window/showMessage`.
  void onShowMessage(
    Future<void> Function(ShowMessageParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(.showMessage, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, ShowMessageParams.fromJson);
      await handler(p, context);
    });
  }

  /// Registers handler for `window/logMessage`.
  void onLogMessage(
    Future<void> Function(LogMessageParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(.logMessage, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, LogMessageParams.fromJson);
      await handler(p, context);
    });
  }
}

/// Registers incoming LSP handlers for the `client` namespace.
class ClientHandlers {
  ClientHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `client/registerCapability`.
  void onRegisterCapability(
    Future<void> Function(RegistrationParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(.registerCapability, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, RegistrationParams.fromJson);
      await handler(p, context);
      return null;
    });
  }

  /// Registers handler for `client/unregisterCapability`.
  void onUnregisterCapability(
    Future<void> Function(UnregistrationParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(.unregisterCapability, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, UnregistrationParams.fromJson);
      await handler(p, context);
      return null;
    });
  }
}

/// Registers incoming LSP handlers for the `telemetry` namespace.
class TelemetryHandlers {
  TelemetryHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `telemetry/event`.
  void onEvent(
    Future<void> Function(Object? params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(.event, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = json;
      await handler(p, context);
    });
  }
}

/// Registers incoming LSP handlers for the `textDocument` namespace.
class TextDocumentHandlers {
  TextDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `textDocument/publishDiagnostics`.
  void onPublishDiagnostics(
    Future<void> Function(PublishDiagnosticsParams params, LspRequest context)
    handler,
  ) {
    _connection.registerNotificationHandler(.publishDiagnostics, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, PublishDiagnosticsParams.fromJson);
      await handler(p, context);
    });
  }
}

/// Registers incoming LSP handlers for the `general` namespace.
class GeneralHandlers {
  GeneralHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `$/logTrace`.
  void onLogTrace(
    Future<void> Function(LogTraceParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(.logTrace, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, LogTraceParams.fromJson);
      await handler(p, context);
    });
  }

  /// Registers handler for `$/cancelRequest`.
  void onCancelRequest(
    Future<void> Function(CancelParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(.cancelRequest, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, CancelParams.fromJson);
      await handler(p, context);
    });
  }

  /// Registers handler for `$/progress`.
  void onProgress(
    Future<void> Function(ProgressParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(.progress, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = parseParams(json, ProgressParams.fromJson);
      await handler(p, context);
    });
  }
}

/// Sends LSP messages to the server for the `textDocument` namespace.
class TextDocumentSender {
  TextDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `textDocument/implementation` request to the server.
  Future<ImplementationResult?> implementation(
    ImplementationParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .implementation,
      params.toJson(),
    );
    return raw == null ? null : ImplementationResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/typeDefinition` request to the server.
  Future<TypeDefinitionResult?> typeDefinition(
    TypeDefinitionParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .typeDefinition,
      params.toJson(),
    );
    return raw == null ? null : TypeDefinitionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/documentColor` request to the server.
  Future<List<ColorInformation>> documentColor(
    DocumentColorParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .documentColor,
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
    final dynamic raw = await _connection.sendRequest(
      .foldingRange,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(FoldingRange.fromJson)
        .toList();
  }

  /// Sends the `textDocument/declaration` request to the server.
  Future<DeclarationResult?> declaration(DeclarationParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .declaration,
      params.toJson(),
    );
    return raw == null ? null : DeclarationResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/selectionRange` request to the server.
  Future<List<SelectionRange>?> selectionRange(
    SelectionRangeParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .selectionRange,
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
      .prepareCallHierarchy,
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
    final dynamic raw = await _connection.sendRequest(.full, params.toJson());
    return raw == null
        ? null
        : SemanticTokens.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/semanticTokens/full/delta` request to the server.
  Future<SemanticTokensFullDeltaResult?> semanticTokensFullDelta(
    SemanticTokensDeltaParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(.delta, params.toJson());
    return raw == null
        ? null
        : SemanticTokensFullDeltaResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/semanticTokens/range` request to the server.
  Future<SemanticTokens?> semanticTokensRange(
    SemanticTokensRangeParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(.range, params.toJson());
    return raw == null
        ? null
        : SemanticTokens.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/linkedEditingRange` request to the server.
  Future<LinkedEditingRanges?> linkedEditingRange(
    LinkedEditingRangeParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .linkedEditingRange,
      params.toJson(),
    );
    return raw == null
        ? null
        : LinkedEditingRanges.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/moniker` request to the server.
  Future<List<Moniker>?> moniker(MonikerParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .moniker,
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
      .prepareTypeHierarchy,
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
      .inlineValue,
      params.toJson(),
    );
    return (raw as List)
        .map((e) => InlineValue.fromJson((e as Object)))
        .toList();
  }

  /// Sends the `textDocument/inlayHint` request to the server.
  Future<List<InlayHint>?> inlayHint(InlayHintParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .inlayHint,
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
      .textDocumentDiagnostic,
      params.toJson(),
    );
    return DocumentDiagnosticReport.fromJson(raw as Object);
  }

  /// Sends the `textDocument/inlineCompletion` request to the server.
  Future<InlineCompletionResult?> inlineCompletion(
    InlineCompletionParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .inlineCompletion,
      params.toJson(),
    );
    return raw == null ? null : InlineCompletionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/willSaveWaitUntil` request to the server.
  Future<List<TextEdit>?> willSaveWaitUntil(
    WillSaveTextDocumentParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .willSaveWaitUntil,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/completion` request to the server.
  Future<CompletionResult?> completion(CompletionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .completion,
      params.toJson(),
    );
    return raw == null ? null : CompletionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/hover` request to the server.
  Future<Hover?> hover(HoverParams params) async {
    final dynamic raw = await _connection.sendRequest(.hover, params.toJson());
    return raw == null ? null : Hover.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/signatureHelp` request to the server.
  Future<SignatureHelp?> signatureHelp(SignatureHelpParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .signatureHelp,
      params.toJson(),
    );
    return raw == null
        ? null
        : SignatureHelp.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/definition` request to the server.
  Future<DefinitionResult?> definition(DefinitionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .definition,
      params.toJson(),
    );
    return raw == null ? null : DefinitionResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/references` request to the server.
  Future<List<Location>?> references(ReferenceParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .references,
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
      .documentHighlight,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(DocumentHighlight.fromJson)
        .toList();
  }

  /// Sends the `textDocument/documentSymbol` request to the server.
  Future<DocumentSymbolResult?> documentSymbol(
    DocumentSymbolParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      .documentSymbol,
      params.toJson(),
    );
    return raw == null ? null : DocumentSymbolResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/codeAction` request to the server.
  Future<List<Object>?> codeAction(CodeActionParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .codeAction,
      params.toJson(),
    );
    return (raw as List).cast<Object>().toList();
  }

  /// Sends the `textDocument/codeLens` request to the server.
  Future<List<CodeLens>?> codeLens(CodeLensParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .codeLens,
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
      .documentLink,
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
      .formatting,
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
      .rangeFormatting,
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
      .rangesFormatting,
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
      .onTypeFormatting,
      params.toJson(),
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(TextEdit.fromJson)
        .toList();
  }

  /// Sends the `textDocument/rename` request to the server.
  Future<WorkspaceEdit?> rename(RenameParams params) async {
    final dynamic raw = await _connection.sendRequest(.rename, params.toJson());
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `textDocument/prepareRename` request to the server.
  Future<PrepareRenameResult?> prepareRename(PrepareRenameParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .prepareRename,
      params.toJson(),
    );
    return raw == null ? null : PrepareRenameResult.fromJson(raw as Object);
  }

  /// Sends the `textDocument/didOpen` notification to the server.
  void didOpen(DidOpenTextDocumentParams params) =>
      _connection.sendNotification(.textDocumentDidOpen, params.toJson());

  /// Sends the `textDocument/didChange` notification to the server.
  void didChange(DidChangeTextDocumentParams params) =>
      _connection.sendNotification(.textDocumentDidChange, params.toJson());

  /// Sends the `textDocument/didClose` notification to the server.
  void didClose(DidCloseTextDocumentParams params) =>
      _connection.sendNotification(.textDocumentDidClose, params.toJson());

  /// Sends the `textDocument/didSave` notification to the server.
  void didSave(DidSaveTextDocumentParams params) =>
      _connection.sendNotification(.textDocumentDidSave, params.toJson());

  /// Sends the `textDocument/willSave` notification to the server.
  void willSave(WillSaveTextDocumentParams params) =>
      _connection.sendNotification(.willSave, params.toJson());
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
      .incomingCalls,
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
      .outgoingCalls,
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
      .willCreateFiles,
      params.toJson(),
    );
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/willRenameFiles` request to the server.
  Future<WorkspaceEdit?> willRenameFiles(RenameFilesParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .willRenameFiles,
      params.toJson(),
    );
    return raw == null
        ? null
        : WorkspaceEdit.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/willDeleteFiles` request to the server.
  Future<WorkspaceEdit?> willDeleteFiles(DeleteFilesParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .willDeleteFiles,
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
      .workspaceDiagnostic,
      params.toJson(),
    );
    return WorkspaceDiagnosticReport.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `workspace/symbol` request to the server.
  Future<SymbolResult?> symbol(WorkspaceSymbolParams params) async {
    final dynamic raw = await _connection.sendRequest(.symbol, params.toJson());
    return raw == null ? null : SymbolResult.fromJson(raw as Object);
  }

  /// Sends the `workspace/executeCommand` request to the server.
  Future<Object?> executeCommand(ExecuteCommandParams params) async {
    final dynamic raw = await _connection.sendRequest(
      .executeCommand,
      params.toJson(),
    );
    return raw;
  }

  /// Sends the `workspace/didChangeWorkspaceFolders` notification to the server.
  void didChangeWorkspaceFolders(DidChangeWorkspaceFoldersParams params) =>
      _connection.sendNotification(.didChangeWorkspaceFolders, params.toJson());

  /// Sends the `workspace/didCreateFiles` notification to the server.
  void didCreateFiles(CreateFilesParams params) =>
      _connection.sendNotification(.didCreateFiles, params.toJson());

  /// Sends the `workspace/didRenameFiles` notification to the server.
  void didRenameFiles(RenameFilesParams params) =>
      _connection.sendNotification(.didRenameFiles, params.toJson());

  /// Sends the `workspace/didDeleteFiles` notification to the server.
  void didDeleteFiles(DeleteFilesParams params) =>
      _connection.sendNotification(.didDeleteFiles, params.toJson());

  /// Sends the `workspace/didChangeConfiguration` notification to the server.
  void didChangeConfiguration(DidChangeConfigurationParams params) =>
      _connection.sendNotification(.didChangeConfiguration, params.toJson());

  /// Sends the `workspace/didChangeWatchedFiles` notification to the server.
  void didChangeWatchedFiles(DidChangeWatchedFilesParams params) =>
      _connection.sendNotification(.didChangeWatchedFiles, params.toJson());
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
      .supertypes,
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
      .subtypes,
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
      .inlayHintResolve,
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
      .initialize,
      params.toJson(),
    );
    return InitializeResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `shutdown` request to the server.
  Future<void> shutdown() async {
    await _connection.sendRequest(.shutdown);
  }

  /// Sends the `initialized` notification to the server.
  void initialized(InitializedParams params) =>
      _connection.sendNotification(.initialized, params.toJson());

  /// Sends the `exit` notification to the server.
  void exit() => _connection.sendNotification(.exit);

  /// Sends the `$/setTrace` notification to the server.
  void setTrace(SetTraceParams params) =>
      _connection.sendNotification(.setTrace, params.toJson());

  /// Sends the `$/cancelRequest` notification to the server.
  void cancelRequest(CancelParams params) =>
      _connection.sendNotification(.cancelRequest, params.toJson());

  /// Sends the `$/progress` notification to the server.
  void progress(ProgressParams params) =>
      _connection.sendNotification(.progress, params.toJson());
}

/// Sends LSP messages to the server for the `completionItem` namespace.
class CompletionItemSender {
  CompletionItemSender(this._connection);

  final LspConnection _connection;

  /// Sends the `completionItem/resolve` request to the server.
  Future<CompletionItem> resolve(CompletionItem params) async {
    final dynamic raw = await _connection.sendRequest(
      .completionItemResolve,
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
      .codeActionResolve,
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
      .workspaceSymbolResolve,
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
      .codeLensResolve,
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
      .documentLinkResolve,
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
      _connection.sendNotification(.cancel, params.toJson());
}

/// Sends LSP messages to the server for the `notebookDocument` namespace.
class NotebookDocumentSender {
  NotebookDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `notebookDocument/didOpen` notification to the server.
  void didOpen(DidOpenNotebookDocumentParams params) =>
      _connection.sendNotification(.notebookDocumentDidOpen, params.toJson());

  /// Sends the `notebookDocument/didChange` notification to the server.
  void didChange(DidChangeNotebookDocumentParams params) =>
      _connection.sendNotification(.notebookDocumentDidChange, params.toJson());

  /// Sends the `notebookDocument/didSave` notification to the server.
  void didSave(DidSaveNotebookDocumentParams params) =>
      _connection.sendNotification(.notebookDocumentDidSave, params.toJson());

  /// Sends the `notebookDocument/didClose` notification to the server.
  void didClose(DidCloseNotebookDocumentParams params) =>
      _connection.sendNotification(.notebookDocumentDidClose, params.toJson());
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
