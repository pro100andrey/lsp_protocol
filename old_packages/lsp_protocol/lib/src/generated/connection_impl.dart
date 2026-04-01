//  GENERATED CODE – DO NOT MODIFY BY HAND
//  LSP Version: 3.17.0
//  ignore_for_file: avoid_dynamic_calls, always_put_control_body_on_new_line

import 'package:json_rpc_2/json_rpc_2.dart';

import 'connection.dart';
import 'methods.dart';
import 'models.dart';

mixin class LspConnectionMixin implements LspConnection {
  Peer get peer => throw UnimplementedError();

  @override
  void onTextDocumentImplementationRequest(
    Future<Object?> Function(ImplementationParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentImplementation.value,
    (p) =>
        handler(ImplementationParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onTextDocumentTypeDefinitionRequest(
    Future<Object?> Function(TypeDefinitionParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentTypeDefinition.value,
    (p) =>
        handler(TypeDefinitionParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  Future<List<WorkspaceFolder>?> sendWorkspaceWorkspaceFoldersRequest() async {
    final result = await peer.sendRequest(
      LspMethod.workspaceWorkspaceFolders.value,
    );
    if (result == null) return null;
    return (result as List)
        .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<LSPAny>?> sendWorkspaceConfigurationRequest(
    ConfigurationParams params,
  ) async {
    final result = await peer.sendRequest(
      LspMethod.workspaceConfiguration.value,
      params.toJson(),
    );
    if (result == null) return null;
    return (result as List).cast<LSPAny>();
  }

  @override
  void onTextDocumentDocumentColorRequest(
    Future<List<ColorInformation>?> Function(DocumentColorParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentDocumentColor.value, (p) async {
      final result = await handler(
        DocumentColorParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentColorPresentationRequest(
    Future<List<ColorPresentation>?> Function(ColorPresentationParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentColorPresentation.value, (
      p,
    ) async {
      final result = await handler(
        ColorPresentationParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentFoldingRangeRequest(
    Future<List<FoldingRange>?> Function(FoldingRangeParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentFoldingRange.value, (p) async {
      final result = await handler(
        FoldingRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  Future<void> sendWorkspaceFoldingRangeRefreshRequest() =>
      peer.sendRequest(LspMethod.workspaceFoldingRangeRefresh.value);

  @override
  void onTextDocumentDeclarationRequest(
    Future<Object?> Function(DeclarationParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDeclaration.value,
    (p) => handler(DeclarationParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onTextDocumentSelectionRangeRequest(
    Future<List<SelectionRange>?> Function(SelectionRangeParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentSelectionRange.value, (p) async {
      final result = await handler(
        SelectionRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  Future<void> sendWindowWorkDoneProgressCreateRequest(
    WorkDoneProgressCreateParams params,
  ) => peer.sendRequest(
    LspMethod.windowWorkDoneProgressCreate.value,
    params.toJson(),
  );

  @override
  void onTextDocumentPrepareCallHierarchyRequest(
    Future<List<CallHierarchyItem>?> Function(CallHierarchyPrepareParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentPrepareCallHierarchy.value, (
      p,
    ) async {
      final result = await handler(
        CallHierarchyPrepareParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onCallHierarchyIncomingCallsRequest(
    Future<List<CallHierarchyIncomingCall>?> Function(
      CallHierarchyIncomingCallsParams params,
    )
    handler,
  ) {
    peer.registerMethod(LspMethod.callHierarchyIncomingCalls.value, (p) async {
      final result = await handler(
        CallHierarchyIncomingCallsParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onCallHierarchyOutgoingCallsRequest(
    Future<List<CallHierarchyOutgoingCall>?> Function(
      CallHierarchyOutgoingCallsParams params,
    )
    handler,
  ) {
    peer.registerMethod(LspMethod.callHierarchyOutgoingCalls.value, (p) async {
      final result = await handler(
        CallHierarchyOutgoingCallsParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentSemanticTokensFullRequest(
    Future<SemanticTokens?> Function(SemanticTokensParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentSemanticTokensFull.value, (
      p,
    ) async {
      final result = await handler(
        SemanticTokensParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentSemanticTokensFullDeltaRequest(
    Future<Object?> Function(SemanticTokensDeltaParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentSemanticTokensFullDelta.value,
    (p) => handler(
      SemanticTokensDeltaParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onTextDocumentSemanticTokensRangeRequest(
    Future<SemanticTokens?> Function(SemanticTokensRangeParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentSemanticTokensRange.value, (
      p,
    ) async {
      final result = await handler(
        SemanticTokensRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  Future<void> sendWorkspaceSemanticTokensRefreshRequest() =>
      peer.sendRequest(LspMethod.workspaceSemanticTokensRefresh.value);

  @override
  Future<ShowDocumentResult?> sendWindowShowDocumentRequest(
    ShowDocumentParams params,
  ) async {
    final result = await peer.sendRequest(
      LspMethod.windowShowDocument.value,
      params.toJson(),
    );
    if (result == null) return null;
    return ShowDocumentResult.fromJson(result as Map<String, dynamic>);
  }

  @override
  void onTextDocumentLinkedEditingRangeRequest(
    Future<LinkedEditingRanges?> Function(LinkedEditingRangeParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentLinkedEditingRange.value, (
      p,
    ) async {
      final result = await handler(
        LinkedEditingRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onWorkspaceWillCreateFilesRequest(
    Future<WorkspaceEdit?> Function(CreateFilesParams params) handler,
  ) {
    peer.registerMethod(LspMethod.workspaceWillCreateFiles.value, (p) async {
      final result = await handler(
        CreateFilesParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onWorkspaceWillRenameFilesRequest(
    Future<WorkspaceEdit?> Function(RenameFilesParams params) handler,
  ) {
    peer.registerMethod(LspMethod.workspaceWillRenameFiles.value, (p) async {
      final result = await handler(
        RenameFilesParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onWorkspaceWillDeleteFilesRequest(
    Future<WorkspaceEdit?> Function(DeleteFilesParams params) handler,
  ) {
    peer.registerMethod(LspMethod.workspaceWillDeleteFiles.value, (p) async {
      final result = await handler(
        DeleteFilesParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentMonikerRequest(
    Future<List<Moniker>?> Function(MonikerParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentMoniker.value, (p) async {
      final result = await handler(
        MonikerParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentPrepareTypeHierarchyRequest(
    Future<List<TypeHierarchyItem>?> Function(TypeHierarchyPrepareParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentPrepareTypeHierarchy.value, (
      p,
    ) async {
      final result = await handler(
        TypeHierarchyPrepareParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTypeHierarchySupertypesRequest(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySupertypesParams params,
    )
    handler,
  ) {
    peer.registerMethod(LspMethod.typeHierarchySupertypes.value, (p) async {
      final result = await handler(
        TypeHierarchySupertypesParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTypeHierarchySubtypesRequest(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySubtypesParams params,
    )
    handler,
  ) {
    peer.registerMethod(LspMethod.typeHierarchySubtypes.value, (p) async {
      final result = await handler(
        TypeHierarchySubtypesParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentInlineValueRequest(
    Future<List<InlineValue>?> Function(InlineValueParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentInlineValue.value, (p) async {
      final result = await handler(
        InlineValueParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result;
    });
  }

  @override
  Future<void> sendWorkspaceInlineValueRefreshRequest() =>
      peer.sendRequest(LspMethod.workspaceInlineValueRefresh.value);

  @override
  void onTextDocumentInlayHintRequest(
    Future<List<InlayHint>?> Function(InlayHintParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentInlayHint.value, (p) async {
      final result = await handler(
        InlayHintParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onInlayHintResolveRequest(
    Future<InlayHint?> Function(InlayHint params) handler,
  ) {
    peer.registerMethod(LspMethod.inlayHintResolve.value, (p) async {
      final result = await handler(
        InlayHint.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  Future<void> sendWorkspaceInlayHintRefreshRequest() =>
      peer.sendRequest(LspMethod.workspaceInlayHintRefresh.value);

  @override
  void onTextDocumentDiagnosticRequest(
    Future<DocumentDiagnosticReport?> Function(DocumentDiagnosticParams params)
    handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDiagnostic.value,
    (p) => handler(
      DocumentDiagnosticParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onWorkspaceDiagnosticRequest(
    Future<WorkspaceDiagnosticReport?> Function(
      WorkspaceDiagnosticParams params,
    )
    handler,
  ) {
    peer.registerMethod(LspMethod.workspaceDiagnostic.value, (p) async {
      final result = await handler(
        WorkspaceDiagnosticParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  Future<void> sendWorkspaceDiagnosticRefreshRequest() =>
      peer.sendRequest(LspMethod.workspaceDiagnosticRefresh.value);

  @override
  void onTextDocumentInlineCompletionRequest(
    Future<Object?> Function(InlineCompletionParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentInlineCompletion.value,
    (p) => handler(
      InlineCompletionParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  Future<void> sendClientRegisterCapabilityRequest(RegistrationParams params) =>
      peer.sendRequest(
        LspMethod.clientRegisterCapability.value,
        params.toJson(),
      );

  @override
  Future<void> sendClientUnregisterCapabilityRequest(
    UnregistrationParams params,
  ) => peer.sendRequest(
    LspMethod.clientUnregisterCapability.value,
    params.toJson(),
  );

  @override
  void onInitializeRequest(
    Future<InitializeResult?> Function(InitializeParams params) handler,
  ) {
    peer.registerMethod(LspMethod.initialize.value, (p) async {
      final result = await handler(
        InitializeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onShutdownRequest(Future<void> Function() handler) =>
      peer.registerMethod(LspMethod.shutdown.value, (_) => handler());

  @override
  Future<MessageActionItem?> sendWindowShowMessageRequestRequest(
    ShowMessageRequestParams params,
  ) async {
    final result = await peer.sendRequest(
      LspMethod.windowShowMessageRequest.value,
      params.toJson(),
    );
    if (result == null) return null;
    return MessageActionItem.fromJson(result as Map<String, dynamic>);
  }

  @override
  void onTextDocumentWillSaveWaitUntilRequest(
    Future<List<TextEdit>?> Function(WillSaveTextDocumentParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentWillSaveWaitUntil.value, (
      p,
    ) async {
      final result = await handler(
        WillSaveTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentCompletionRequest(
    Future<Object?> Function(CompletionParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentCompletion.value,
    (p) => handler(CompletionParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onCompletionItemResolveRequest(
    Future<CompletionItem?> Function(CompletionItem params) handler,
  ) {
    peer.registerMethod(LspMethod.completionItemResolve.value, (p) async {
      final result = await handler(
        CompletionItem.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentHoverRequest(
    Future<Hover?> Function(HoverParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentHover.value, (p) async {
      final result = await handler(
        HoverParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentSignatureHelpRequest(
    Future<SignatureHelp?> Function(SignatureHelpParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentSignatureHelp.value, (p) async {
      final result = await handler(
        SignatureHelpParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentDefinitionRequest(
    Future<Object?> Function(DefinitionParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDefinition.value,
    (p) => handler(DefinitionParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onTextDocumentReferencesRequest(
    Future<List<Location>?> Function(ReferenceParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentReferences.value, (p) async {
      final result = await handler(
        ReferenceParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentDocumentHighlightRequest(
    Future<List<DocumentHighlight>?> Function(DocumentHighlightParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentDocumentHighlight.value, (
      p,
    ) async {
      final result = await handler(
        DocumentHighlightParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentDocumentSymbolRequest(
    Future<Object?> Function(DocumentSymbolParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDocumentSymbol.value,
    (p) =>
        handler(DocumentSymbolParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onTextDocumentCodeActionRequest(
    Future<List<Object?>?> Function(CodeActionParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentCodeAction.value, (p) async {
      final result = await handler(
        CodeActionParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result;
    });
  }

  @override
  void onCodeActionResolveRequest(
    Future<CodeAction?> Function(CodeAction params) handler,
  ) {
    peer.registerMethod(LspMethod.codeActionResolve.value, (p) async {
      final result = await handler(
        CodeAction.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onWorkspaceSymbolRequest(
    Future<Object?> Function(WorkspaceSymbolParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceSymbol.value,
    (p) => handler(
      WorkspaceSymbolParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onWorkspaceSymbolResolveRequest(
    Future<WorkspaceSymbol?> Function(WorkspaceSymbol params) handler,
  ) {
    peer.registerMethod(LspMethod.workspaceSymbolResolve.value, (p) async {
      final result = await handler(
        WorkspaceSymbol.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentCodeLensRequest(
    Future<List<CodeLens>?> Function(CodeLensParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentCodeLens.value, (p) async {
      final result = await handler(
        CodeLensParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onCodeLensResolveRequest(
    Future<CodeLens?> Function(CodeLens params) handler,
  ) {
    peer.registerMethod(LspMethod.codeLensResolve.value, (p) async {
      final result = await handler(
        CodeLens.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  Future<void> sendWorkspaceCodeLensRefreshRequest() =>
      peer.sendRequest(LspMethod.workspaceCodeLensRefresh.value);

  @override
  void onTextDocumentDocumentLinkRequest(
    Future<List<DocumentLink>?> Function(DocumentLinkParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentDocumentLink.value, (p) async {
      final result = await handler(
        DocumentLinkParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onDocumentLinkResolveRequest(
    Future<DocumentLink?> Function(DocumentLink params) handler,
  ) {
    peer.registerMethod(LspMethod.documentLinkResolve.value, (p) async {
      final result = await handler(
        DocumentLink.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentFormattingParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentFormatting.value, (p) async {
      final result = await handler(
        DocumentFormattingParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentRangeFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentRangeFormattingParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentRangeFormatting.value, (p) async {
      final result = await handler(
        DocumentRangeFormattingParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentRangesFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentRangesFormattingParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentRangesFormatting.value, (
      p,
    ) async {
      final result = await handler(
        DocumentRangesFormattingParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentOnTypeFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentOnTypeFormattingParams params)
    handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentOnTypeFormatting.value, (
      p,
    ) async {
      final result = await handler(
        DocumentOnTypeFormattingParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentRenameRequest(
    Future<WorkspaceEdit?> Function(RenameParams params) handler,
  ) {
    peer.registerMethod(LspMethod.textDocumentRename.value, (p) async {
      final result = await handler(
        RenameParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentPrepareRenameRequest(
    Future<PrepareRenameResult?> Function(PrepareRenameParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentPrepareRename.value,
    (p) =>
        handler(PrepareRenameParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onWorkspaceExecuteCommandRequest(
    Future<LSPAny?> Function(ExecuteCommandParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceExecuteCommand.value,
    (p) =>
        handler(ExecuteCommandParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  Future<ApplyWorkspaceEditResult?> sendWorkspaceApplyEditRequest(
    ApplyWorkspaceEditParams params,
  ) async {
    final result = await peer.sendRequest(
      LspMethod.workspaceApplyEdit.value,
      params.toJson(),
    );
    if (result == null) return null;
    return ApplyWorkspaceEditResult.fromJson(result as Map<String, dynamic>);
  }

  @override
  void onWorkspaceDidChangeWorkspaceFoldersNotification(
    Future<void> Function(DidChangeWorkspaceFoldersParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceDidChangeWorkspaceFolders.value,
    (p) => handler(
      DidChangeWorkspaceFoldersParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onWindowWorkDoneProgressCancelNotification(
    Future<void> Function(WorkDoneProgressCancelParams params) handler,
  ) => peer.registerMethod(
    LspMethod.windowWorkDoneProgressCancel.value,
    (p) => handler(
      WorkDoneProgressCancelParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onWorkspaceDidCreateFilesNotification(
    Future<void> Function(CreateFilesParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceDidCreateFiles.value,
    (p) => handler(CreateFilesParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onWorkspaceDidRenameFilesNotification(
    Future<void> Function(RenameFilesParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceDidRenameFiles.value,
    (p) => handler(RenameFilesParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onWorkspaceDidDeleteFilesNotification(
    Future<void> Function(DeleteFilesParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceDidDeleteFiles.value,
    (p) => handler(DeleteFilesParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onNotebookDocumentDidOpenNotification(
    Future<void> Function(DidOpenNotebookDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.notebookDocumentDidOpen.value,
    (p) => handler(
      DidOpenNotebookDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onNotebookDocumentDidChangeNotification(
    Future<void> Function(DidChangeNotebookDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.notebookDocumentDidChange.value,
    (p) => handler(
      DidChangeNotebookDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onNotebookDocumentDidSaveNotification(
    Future<void> Function(DidSaveNotebookDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.notebookDocumentDidSave.value,
    (p) => handler(
      DidSaveNotebookDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onNotebookDocumentDidCloseNotification(
    Future<void> Function(DidCloseNotebookDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.notebookDocumentDidClose.value,
    (p) => handler(
      DidCloseNotebookDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onInitializedNotification(
    Future<void> Function(InitializedParams params) handler,
  ) => peer.registerMethod(
    LspMethod.initialized.value,
    (p) => handler(InitializedParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void onExitNotification(Future<void> Function() handler) =>
      peer.registerMethod(LspMethod.exit.value, (_) => handler());

  @override
  void onWorkspaceDidChangeConfigurationNotification(
    Future<void> Function(DidChangeConfigurationParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceDidChangeConfiguration.value,
    (p) => handler(
      DidChangeConfigurationParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void sendWindowShowMessageNotification(ShowMessageParams params) =>
      peer.sendNotification(LspMethod.windowShowMessage.value, params.toJson());

  @override
  void sendWindowLogMessageNotification(LogMessageParams params) =>
      peer.sendNotification(LspMethod.windowLogMessage.value, params.toJson());

  @override
  void sendTelemetryEventNotification(LSPAny params) =>
      peer.sendNotification(LspMethod.telemetryEvent.value, params);

  @override
  void onTextDocumentDidOpenNotification(
    Future<void> Function(DidOpenTextDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDidOpen.value,
    (p) => handler(
      DidOpenTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onTextDocumentDidChangeNotification(
    Future<void> Function(DidChangeTextDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDidChange.value,
    (p) => handler(
      DidChangeTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onTextDocumentDidCloseNotification(
    Future<void> Function(DidCloseTextDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDidClose.value,
    (p) => handler(
      DidCloseTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onTextDocumentDidSaveNotification(
    Future<void> Function(DidSaveTextDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentDidSave.value,
    (p) => handler(
      DidSaveTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onTextDocumentWillSaveNotification(
    Future<void> Function(WillSaveTextDocumentParams params) handler,
  ) => peer.registerMethod(
    LspMethod.textDocumentWillSave.value,
    (p) => handler(
      WillSaveTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void onWorkspaceDidChangeWatchedFilesNotification(
    Future<void> Function(DidChangeWatchedFilesParams params) handler,
  ) => peer.registerMethod(
    LspMethod.workspaceDidChangeWatchedFiles.value,
    (p) => handler(
      DidChangeWatchedFilesParams.fromJson(p.value as Map<String, dynamic>),
    ),
  );

  @override
  void sendTextDocumentPublishDiagnosticsNotification(
    PublishDiagnosticsParams params,
  ) => peer.sendNotification(
    LspMethod.textDocumentPublishDiagnostics.value,
    params.toJson(),
  );

  @override
  void onSetTraceNotification(
    Future<void> Function(SetTraceParams params) handler,
  ) => peer.registerMethod(
    LspMethod.setTrace.value,
    (p) => handler(SetTraceParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void sendLogTraceNotification(LogTraceParams params) =>
      peer.sendNotification(LspMethod.logTrace.value, params.toJson());

  @override
  void onCancelRequestNotification(
    Future<void> Function(CancelParams params) handler,
  ) => peer.registerMethod(
    LspMethod.cancelRequest.value,
    (p) => handler(CancelParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void sendCancelRequestNotification(CancelParams params) =>
      peer.sendNotification(LspMethod.cancelRequest.value, params.toJson());

  @override
  void onProgressNotification(
    Future<void> Function(ProgressParams params) handler,
  ) => peer.registerMethod(
    LspMethod.progress.value,
    (p) => handler(ProgressParams.fromJson(p.value as Map<String, dynamic>)),
  );

  @override
  void sendProgressNotification(ProgressParams params) =>
      peer.sendNotification(LspMethod.progress.value, params.toJson());
}
