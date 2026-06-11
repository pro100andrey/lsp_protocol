// ignore_for_file: type=lint

// GENERATED — do not edit.

import 'dart:async';

import '../../../pro_lsp.dart';

/// Registers incoming LSP handlers for the `textDocument` namespace.
class TextDocumentHandlers {
  TextDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `textDocument/implementation`.
  void onImplementation(
    Future<Object?> Function(ImplementationParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.implementation.value, (
      dynamic json,
    ) {
      final p = ImplementationParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/typeDefinition`.
  void onTypeDefinition(
    Future<Object?> Function(TypeDefinitionParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.typeDefinition.value, (
      dynamic json,
    ) {
      final p = TypeDefinitionParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/documentColor`.
  void onDocumentColor(
    Future<List<ColorInformation>> Function(DocumentColorParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentColor.value, (
      dynamic json,
    ) async {
      final p = DocumentColorParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/colorPresentation`.
  void onColorPresentation(
    Future<List<ColorPresentation>> Function(ColorPresentationParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.colorPresentation.value, (
      dynamic json,
    ) async {
      final p = ColorPresentationParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/foldingRange`.
  void onFoldingRange(
    Future<List<FoldingRange>?> Function(FoldingRangeParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.foldingRange.value, (
      dynamic json,
    ) async {
      final p = FoldingRangeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/declaration`.
  void onDeclaration(
    Future<Object?> Function(DeclarationParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.declaration.value, (
      dynamic json,
    ) {
      final p = DeclarationParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/selectionRange`.
  void onSelectionRange(
    Future<List<SelectionRange>?> Function(SelectionRangeParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.selectionRange.value, (
      dynamic json,
    ) async {
      final p = SelectionRangeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/prepareCallHierarchy`.
  void onPrepareCallHierarchy(
    Future<List<CallHierarchyItem>?> Function(CallHierarchyPrepareParams params)
    handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.prepareCallHierarchy.value,
      (dynamic json) async {
        final p = CallHierarchyPrepareParams.fromJson(
          json as Map<String, dynamic>,
        );
        final r = await handler(p);
        return r?.map((e) => e.toJson()).toList();
      },
    );
  }

  /// Registers handler for `textDocument/semanticTokens/full`.
  void onSemanticTokensFull(
    Future<SemanticTokens?> Function(SemanticTokensParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.full.value, (
      dynamic json,
    ) async {
      final p = SemanticTokensParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/semanticTokens/full/delta`.
  void onSemanticTokensFullDelta(
    Future<Object?> Function(SemanticTokensDeltaParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.delta.value, (
      dynamic json,
    ) {
      final p = SemanticTokensDeltaParams.fromJson(
        json as Map<String, dynamic>,
      );
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/semanticTokens/range`.
  void onSemanticTokensRange(
    Future<SemanticTokens?> Function(SemanticTokensRangeParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.range.value, (
      dynamic json,
    ) async {
      final p = SemanticTokensRangeParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/linkedEditingRange`.
  void onLinkedEditingRange(
    Future<LinkedEditingRanges?> Function(LinkedEditingRangeParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.linkedEditingRange.value, (
      dynamic json,
    ) async {
      final p = LinkedEditingRangeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/moniker`.
  void onMoniker(
    Future<List<Moniker>?> Function(MonikerParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.moniker.value, (
      dynamic json,
    ) async {
      final p = MonikerParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/prepareTypeHierarchy`.
  void onPrepareTypeHierarchy(
    Future<List<TypeHierarchyItem>?> Function(TypeHierarchyPrepareParams params)
    handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.prepareTypeHierarchy.value,
      (dynamic json) async {
        final p = TypeHierarchyPrepareParams.fromJson(
          json as Map<String, dynamic>,
        );
        final r = await handler(p);
        return r?.map((e) => e.toJson()).toList();
      },
    );
  }

  /// Registers handler for `textDocument/inlineValue`.
  void onInlineValue(
    Future<List<InlineValue>?> Function(InlineValueParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlineValue.value, (
      dynamic json,
    ) async {
      final p = InlineValueParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/inlayHint`.
  void onInlayHint(
    Future<List<InlayHint>?> Function(InlayHintParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlayHint.value, (
      dynamic json,
    ) async {
      final p = InlayHintParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/diagnostic`.
  void onDiagnostic(
    Future<DocumentDiagnosticReport> Function(DocumentDiagnosticParams params)
    handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.textDocumentDiagnostic.value,
      (dynamic json) async {
        final p = DocumentDiagnosticParams.fromJson(
          json as Map<String, dynamic>,
        );
        final r = await handler(p);
        return r.toJson();
      },
    );
  }

  /// Registers handler for `textDocument/inlineCompletion`.
  void onInlineCompletion(
    Future<Object?> Function(InlineCompletionParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlineCompletion.value, (
      dynamic json,
    ) {
      final p = InlineCompletionParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/willSaveWaitUntil`.
  void onWillSaveWaitUntil(
    Future<List<TextEdit>?> Function(WillSaveTextDocumentParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willSaveWaitUntil.value, (
      dynamic json,
    ) async {
      final p = WillSaveTextDocumentParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/completion`.
  void onCompletion(Future<Object?> Function(CompletionParams params) handler) {
    _connection.registerRequestHandler(RequestMethod.completion.value, (
      dynamic json,
    ) {
      final p = CompletionParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/hover`.
  void onHover(Future<Hover?> Function(HoverParams params) handler) {
    _connection.registerRequestHandler(RequestMethod.hover.value, (
      dynamic json,
    ) async {
      final p = HoverParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/signatureHelp`.
  void onSignatureHelp(
    Future<SignatureHelp?> Function(SignatureHelpParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.signatureHelp.value, (
      dynamic json,
    ) async {
      final p = SignatureHelpParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/definition`.
  void onDefinition(Future<Object?> Function(DefinitionParams params) handler) {
    _connection.registerRequestHandler(RequestMethod.definition.value, (
      dynamic json,
    ) {
      final p = DefinitionParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/references`.
  void onReferences(
    Future<List<Location>?> Function(ReferenceParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.references.value, (
      dynamic json,
    ) async {
      final p = ReferenceParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/documentHighlight`.
  void onDocumentHighlight(
    Future<List<DocumentHighlight>?> Function(DocumentHighlightParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentHighlight.value, (
      dynamic json,
    ) async {
      final p = DocumentHighlightParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/documentSymbol`.
  void onDocumentSymbol(
    Future<Object?> Function(DocumentSymbolParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentSymbol.value, (
      dynamic json,
    ) {
      final p = DocumentSymbolParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `textDocument/codeAction`.
  void onCodeAction(
    Future<List<Object>?> Function(CodeActionParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.codeAction.value, (
      dynamic json,
    ) async {
      final p = CodeActionParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => (e as dynamic).toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/codeLens`.
  void onCodeLens(
    Future<List<CodeLens>?> Function(CodeLensParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.codeLens.value, (
      dynamic json,
    ) async {
      final p = CodeLensParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/documentLink`.
  void onDocumentLink(
    Future<List<DocumentLink>?> Function(DocumentLinkParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentLink.value, (
      dynamic json,
    ) async {
      final p = DocumentLinkParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/formatting`.
  void onFormatting(
    Future<List<TextEdit>?> Function(DocumentFormattingParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.formatting.value, (
      dynamic json,
    ) async {
      final p = DocumentFormattingParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/rangeFormatting`.
  void onRangeFormatting(
    Future<List<TextEdit>?> Function(DocumentRangeFormattingParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.rangeFormatting.value, (
      dynamic json,
    ) async {
      final p = DocumentRangeFormattingParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/rangesFormatting`.
  void onRangesFormatting(
    Future<List<TextEdit>?> Function(DocumentRangesFormattingParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.rangesFormatting.value, (
      dynamic json,
    ) async {
      final p = DocumentRangesFormattingParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/onTypeFormatting`.
  void onOnTypeFormatting(
    Future<List<TextEdit>?> Function(DocumentOnTypeFormattingParams params)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.onTypeFormatting.value, (
      dynamic json,
    ) async {
      final p = DocumentOnTypeFormattingParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/rename`.
  void onRename(Future<WorkspaceEdit?> Function(RenameParams params) handler) {
    _connection.registerRequestHandler(RequestMethod.rename.value, (
      dynamic json,
    ) async {
      final p = RenameParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/prepareRename`.
  void onPrepareRename(
    Future<PrepareRenameResult?> Function(PrepareRenameParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.prepareRename.value, (
      dynamic json,
    ) async {
      final p = PrepareRenameParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/didOpen`.
  void onDidOpen(
    Future<void> Function(DidOpenTextDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidOpen.value,
      (dynamic json) async {
        final p = DidOpenTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `textDocument/didChange`.
  void onDidChange(
    Future<void> Function(DidChangeTextDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidChange.value,
      (dynamic json) async {
        final p = DidChangeTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `textDocument/didClose`.
  void onDidClose(
    Future<void> Function(DidCloseTextDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidClose.value,
      (dynamic json) async {
        final p = DidCloseTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `textDocument/didSave`.
  void onDidSave(
    Future<void> Function(DidSaveTextDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidSave.value,
      (dynamic json) async {
        final p = DidSaveTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `textDocument/willSave`.
  void onWillSave(
    Future<void> Function(WillSaveTextDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.willSave.value, (
      dynamic json,
    ) async {
      final p = WillSaveTextDocumentParams.fromJson(
        json as Map<String, dynamic>,
      );
      await handler(p);
    });
  }
}

/// Registers incoming LSP handlers for the `callHierarchy` namespace.
class CallHierarchyHandlers {
  CallHierarchyHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `callHierarchy/incomingCalls`.
  void onIncomingCalls(
    Future<List<CallHierarchyIncomingCall>?> Function(
      CallHierarchyIncomingCallsParams params,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.incomingCalls.value, (
      dynamic json,
    ) async {
      final p = CallHierarchyIncomingCallsParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `callHierarchy/outgoingCalls`.
  void onOutgoingCalls(
    Future<List<CallHierarchyOutgoingCall>?> Function(
      CallHierarchyOutgoingCallsParams params,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.outgoingCalls.value, (
      dynamic json,
    ) async {
      final p = CallHierarchyOutgoingCallsParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }
}

/// Registers incoming LSP handlers for the `workspace` namespace.
class WorkspaceHandlers {
  WorkspaceHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `workspace/willCreateFiles`.
  void onWillCreateFiles(
    Future<WorkspaceEdit?> Function(CreateFilesParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willCreateFiles.value, (
      dynamic json,
    ) async {
      final p = CreateFilesParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `workspace/willRenameFiles`.
  void onWillRenameFiles(
    Future<WorkspaceEdit?> Function(RenameFilesParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willRenameFiles.value, (
      dynamic json,
    ) async {
      final p = RenameFilesParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `workspace/willDeleteFiles`.
  void onWillDeleteFiles(
    Future<WorkspaceEdit?> Function(DeleteFilesParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willDeleteFiles.value, (
      dynamic json,
    ) async {
      final p = DeleteFilesParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r?.toJson();
    });
  }

  /// Registers handler for `workspace/diagnostic`.
  void onDiagnostic(
    Future<WorkspaceDiagnosticReport> Function(WorkspaceDiagnosticParams params)
    handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceDiagnostic.value,
      (dynamic json) async {
        final p = WorkspaceDiagnosticParams.fromJson(
          json as Map<String, dynamic>,
        );
        final r = await handler(p);
        return r.toJson();
      },
    );
  }

  /// Registers handler for `workspace/symbol`.
  void onSymbol(
    Future<Object?> Function(WorkspaceSymbolParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.symbol.value, (
      dynamic json,
    ) {
      final p = WorkspaceSymbolParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `workspace/executeCommand`.
  void onExecuteCommand(
    Future<Object?> Function(ExecuteCommandParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.executeCommand.value, (
      dynamic json,
    ) {
      final p = ExecuteCommandParams.fromJson(json as Map<String, dynamic>);
      return handler(p);
    });
  }

  /// Registers handler for `workspace/didChangeWorkspaceFolders`.
  void onDidChangeWorkspaceFolders(
    Future<void> Function(DidChangeWorkspaceFoldersParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didChangeWorkspaceFolders.value,
      (dynamic json) async {
        final p = DidChangeWorkspaceFoldersParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `workspace/didCreateFiles`.
  void onDidCreateFiles(
    Future<void> Function(CreateFilesParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didCreateFiles.value,
      (dynamic json) async {
        final p = CreateFilesParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }

  /// Registers handler for `workspace/didRenameFiles`.
  void onDidRenameFiles(
    Future<void> Function(RenameFilesParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didRenameFiles.value,
      (dynamic json) async {
        final p = RenameFilesParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }

  /// Registers handler for `workspace/didDeleteFiles`.
  void onDidDeleteFiles(
    Future<void> Function(DeleteFilesParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didDeleteFiles.value,
      (dynamic json) async {
        final p = DeleteFilesParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }

  /// Registers handler for `workspace/didChangeConfiguration`.
  void onDidChangeConfiguration(
    Future<void> Function(DidChangeConfigurationParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didChangeConfiguration.value,
      (dynamic json) async {
        final p = DidChangeConfigurationParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `workspace/didChangeWatchedFiles`.
  void onDidChangeWatchedFiles(
    Future<void> Function(DidChangeWatchedFilesParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didChangeWatchedFiles.value,
      (dynamic json) async {
        final p = DidChangeWatchedFilesParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }
}

/// Registers incoming LSP handlers for the `typeHierarchy` namespace.
class TypeHierarchyHandlers {
  TypeHierarchyHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `typeHierarchy/supertypes`.
  void onSupertypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySupertypesParams params,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.supertypes.value, (
      dynamic json,
    ) async {
      final p = TypeHierarchySupertypesParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `typeHierarchy/subtypes`.
  void onSubtypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySubtypesParams params,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.subtypes.value, (
      dynamic json,
    ) async {
      final p = TypeHierarchySubtypesParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p);
      return r?.map((e) => e.toJson()).toList();
    });
  }
}

/// Registers incoming LSP handlers for the `inlayHint` namespace.
class InlayHintHandlers {
  InlayHintHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `inlayHint/resolve`.
  void onResolve(Future<InlayHint> Function(InlayHint params) handler) {
    _connection.registerRequestHandler(RequestMethod.inlayHintResolve.value, (
      dynamic json,
    ) async {
      final p = InlayHint.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `general` namespace.
class GeneralHandlers {
  GeneralHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `initialize`.
  void onInitialize(
    Future<InitializeResult> Function(InitializeParams params) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.initialize.value, (
      dynamic json,
    ) async {
      final p = InitializeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.toJson();
    });
  }

  /// Registers handler for `shutdown`.
  void onShutdown(Future<void> Function() handler) {
    _connection.registerRequestHandler(RequestMethod.shutdown.value, (
      dynamic json,
    ) async {
      await handler();
      return null;
    });
  }

  /// Registers handler for `initialized`.
  void onInitialized(Future<void> Function(InitializedParams params) handler) {
    _connection.registerNotificationHandler(
      NotificationMethod.initialized.value,
      (dynamic json) async {
        final p = InitializedParams.fromJson(json as Map<String, dynamic>);
        await handler(p);
      },
    );
  }

  /// Registers handler for `exit`.
  void onExit(Future<void> Function() handler) {
    _connection.registerNotificationHandler(NotificationMethod.exit.value, (
      dynamic json,
    ) async {
      await handler();
    });
  }

  /// Registers handler for `$/setTrace`.
  void onSetTrace(Future<void> Function(SetTraceParams params) handler) {
    _connection.registerNotificationHandler(NotificationMethod.setTrace.value, (
      dynamic json,
    ) async {
      final p = SetTraceParams.fromJson(json as Map<String, dynamic>);
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

/// Registers incoming LSP handlers for the `completionItem` namespace.
class CompletionItemHandlers {
  CompletionItemHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `completionItem/resolve`.
  void onResolve(
    Future<CompletionItem> Function(CompletionItem params) handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.completionItemResolve.value,
      (dynamic json) async {
        final p = CompletionItem.fromJson(json as Map<String, dynamic>);
        final r = await handler(p);
        return r.toJson();
      },
    );
  }
}

/// Registers incoming LSP handlers for the `codeAction` namespace.
class CodeActionHandlers {
  CodeActionHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `codeAction/resolve`.
  void onResolve(Future<CodeAction> Function(CodeAction params) handler) {
    _connection.registerRequestHandler(RequestMethod.codeActionResolve.value, (
      dynamic json,
    ) async {
      final p = CodeAction.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `workspaceSymbol` namespace.
class WorkspaceSymbolHandlers {
  WorkspaceSymbolHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `workspaceSymbol/resolve`.
  void onResolve(
    Future<WorkspaceSymbol> Function(WorkspaceSymbol params) handler,
  ) {
    _connection.registerRequestHandler(
      RequestMethod.workspaceSymbolResolve.value,
      (dynamic json) async {
        final p = WorkspaceSymbol.fromJson(json as Map<String, dynamic>);
        final r = await handler(p);
        return r.toJson();
      },
    );
  }
}

/// Registers incoming LSP handlers for the `codeLens` namespace.
class CodeLensHandlers {
  CodeLensHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `codeLens/resolve`.
  void onResolve(Future<CodeLens> Function(CodeLens params) handler) {
    _connection.registerRequestHandler(RequestMethod.codeLensResolve.value, (
      dynamic json,
    ) async {
      final p = CodeLens.fromJson(json as Map<String, dynamic>);
      final r = await handler(p);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `documentLink` namespace.
class DocumentLinkHandlers {
  DocumentLinkHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `documentLink/resolve`.
  void onResolve(Future<DocumentLink> Function(DocumentLink params) handler) {
    _connection.registerRequestHandler(
      RequestMethod.documentLinkResolve.value,
      (dynamic json) async {
        final p = DocumentLink.fromJson(json as Map<String, dynamic>);
        final r = await handler(p);
        return r.toJson();
      },
    );
  }
}

/// Registers incoming LSP handlers for the `window` namespace.
class WindowHandlers {
  WindowHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `window/workDoneProgress/cancel`.
  void onWorkDoneProgressCancel(
    Future<void> Function(WorkDoneProgressCancelParams params) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.cancel.value, (
      dynamic json,
    ) async {
      final p = WorkDoneProgressCancelParams.fromJson(
        json as Map<String, dynamic>,
      );
      await handler(p);
    });
  }
}

/// Registers incoming LSP handlers for the `notebookDocument` namespace.
class NotebookDocumentHandlers {
  NotebookDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `notebookDocument/didOpen`.
  void onDidOpen(
    Future<void> Function(DidOpenNotebookDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidOpen.value,
      (dynamic json) async {
        final p = DidOpenNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `notebookDocument/didChange`.
  void onDidChange(
    Future<void> Function(DidChangeNotebookDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidChange.value,
      (dynamic json) async {
        final p = DidChangeNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `notebookDocument/didSave`.
  void onDidSave(
    Future<void> Function(DidSaveNotebookDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidSave.value,
      (dynamic json) async {
        final p = DidSaveNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }

  /// Registers handler for `notebookDocument/didClose`.
  void onDidClose(
    Future<void> Function(DidCloseNotebookDocumentParams params) handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidClose.value,
      (dynamic json) async {
        final p = DidCloseNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p);
      },
    );
  }
}

/// Sends LSP messages to the client for the `workspace` namespace.
class WorkspaceSender {
  WorkspaceSender(this._connection);

  final LspConnection _connection;

  /// Sends the `workspace/workspaceFolders` request to the client.
  Future<List<WorkspaceFolder>?> workspaceFolders() async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.workspaceFolders.value,
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(WorkspaceFolder.fromJson)
        .toList();
  }

  /// Sends the `workspace/configuration` request to the client.
  Future<List<Object?>> configuration(ConfigurationParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.configuration.value,
      params.toJson(),
    );
    return (raw as List).cast<Object>().toList();
  }

  /// Sends the `workspace/foldingRange/refresh` request to the client.
  Future<void> foldingRangeRefresh() async {
    await _connection.sendRequest(
      RequestMethod.workspaceFoldingRangeRefresh.value,
    );
  }

  /// Sends the `workspace/semanticTokens/refresh` request to the client.
  Future<void> semanticTokensRefresh() async {
    await _connection.sendRequest(
      RequestMethod.workspaceSemanticTokensRefresh.value,
    );
  }

  /// Sends the `workspace/inlineValue/refresh` request to the client.
  Future<void> inlineValueRefresh() async {
    await _connection.sendRequest(
      RequestMethod.workspaceInlineValueRefresh.value,
    );
  }

  /// Sends the `workspace/inlayHint/refresh` request to the client.
  Future<void> inlayHintRefresh() async {
    await _connection.sendRequest(
      RequestMethod.workspaceInlayHintRefresh.value,
    );
  }

  /// Sends the `workspace/diagnostic/refresh` request to the client.
  Future<void> diagnosticRefresh() async {
    await _connection.sendRequest(
      RequestMethod.workspaceDiagnosticRefresh.value,
    );
  }

  /// Sends the `workspace/codeLens/refresh` request to the client.
  Future<void> codeLensRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceCodeLensRefresh.value);
  }

  /// Sends the `workspace/applyEdit` request to the client.
  Future<ApplyWorkspaceEditResult> applyEdit(
    ApplyWorkspaceEditParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.applyEdit.value,
      params.toJson(),
    );
    return ApplyWorkspaceEditResult.fromJson(raw as Map<String, dynamic>);
  }
}

/// Sends LSP messages to the client for the `window` namespace.
class WindowSender {
  WindowSender(this._connection);

  final LspConnection _connection;

  /// Sends the `window/workDoneProgress/create` request to the client.
  Future<void> workDoneProgressCreate(
    WorkDoneProgressCreateParams params,
  ) async {
    await _connection.sendRequest(RequestMethod.create.value, params.toJson());
  }

  /// Sends the `window/showDocument` request to the client.
  Future<ShowDocumentResult> showDocument(ShowDocumentParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.showDocument.value,
      params.toJson(),
    );
    return ShowDocumentResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessageRequest` request to the client.
  Future<MessageActionItem?> showMessageRequest(
    ShowMessageRequestParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.showMessageRequest.value,
      params.toJson(),
    );
    return raw == null
        ? null
        : MessageActionItem.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessage` notification to the client.
  void showMessage(ShowMessageParams params) => _connection.sendNotification(
    NotificationMethod.showMessage.value,
    params.toJson(),
  );

  /// Sends the `window/logMessage` notification to the client.
  void logMessage(LogMessageParams params) => _connection.sendNotification(
    NotificationMethod.logMessage.value,
    params.toJson(),
  );
}

/// Sends LSP messages to the client for the `client` namespace.
class ClientSender {
  ClientSender(this._connection);

  final LspConnection _connection;

  /// Sends the `client/registerCapability` request to the client.
  Future<void> registerCapability(RegistrationParams params) async {
    await _connection.sendRequest(
      RequestMethod.registerCapability.value,
      params.toJson(),
    );
  }

  /// Sends the `client/unregisterCapability` request to the client.
  Future<void> unregisterCapability(UnregistrationParams params) async {
    await _connection.sendRequest(
      RequestMethod.unregisterCapability.value,
      params.toJson(),
    );
  }
}

/// Sends LSP messages to the client for the `telemetry` namespace.
class TelemetrySender {
  TelemetrySender(this._connection);

  final LspConnection _connection;

  /// Sends the `telemetry/event` notification to the client.
  void event(Object? params) =>
      _connection.sendNotification(NotificationMethod.event.value, params);
}

/// Sends LSP messages to the client for the `textDocument` namespace.
class TextDocumentSender {
  TextDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `textDocument/publishDiagnostics` notification to the client.
  void publishDiagnostics(PublishDiagnosticsParams params) =>
      _connection.sendNotification(
        NotificationMethod.publishDiagnostics.value,
        params.toJson(),
      );
}

/// Sends LSP messages to the client for the `general` namespace.
class GeneralSender {
  GeneralSender(this._connection);

  final LspConnection _connection;

  /// Sends the `$/logTrace` notification to the client.
  void logTrace(LogTraceParams params) => _connection.sendNotification(
    NotificationMethod.logTrace.value,
    params.toJson(),
  );

  /// Sends the `$/cancelRequest` notification to the client.
  void cancelRequest(CancelParams params) => _connection.sendNotification(
    NotificationMethod.cancelRequest.value,
    params.toJson(),
  );

  /// Sends the `$/progress` notification to the client.
  void progress(ProgressParams params) => _connection.sendNotification(
    NotificationMethod.progress.value,
    params.toJson(),
  );
}

/// Aggregates all outgoing sender classes.
///
/// Access via [LspServer.client]:
/// ```dart
/// server.client.window.logMessage(LogMessageParams(...));
/// ```
class ServerToClientProxy {
  ServerToClientProxy(this._connection);

  final LspConnection _connection;

  late final workspace = WorkspaceSender(_connection);

  late final window = WindowSender(_connection);

  late final client = ClientSender(_connection);

  late final telemetry = TelemetrySender(_connection);

  late final textDocument = TextDocumentSender(_connection);

  late final general = GeneralSender(_connection);
}
