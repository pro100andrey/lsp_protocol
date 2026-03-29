import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:stream_channel/stream_channel.dart';

import '../generated/connection.dart';
import '../generated/models.dart';
import 'console.dart';

/// LSP connection implementation.
///
/// Wraps a raw byte stream/sink with Content-Length–framed LSP transport and
/// implements every method from the generated [LspConnection] interface.
class Connection implements LspConnection {
  Connection(Stream<List<int>> stream, StreamSink<List<int>> sink) {
    final parser = _Parser(stream);
    final outSink = StreamSinkTransformer.fromHandlers(
      handleData: _serialize,
      handleDone: (out) async {
        await parser.close();
        out.close();
      },
    ).bind(sink);
    _peer = Peer(StreamChannel.withGuarantees(parser.stream, outSink));
    console = Console(this);
  }

  late final Peer _peer;

  /// High-level console for sending log messages to the client.
  late final Console console;

  /// Start listening for incoming messages.
  Future<dynamic> listen() => _peer.listen();

  /// Close the connection.
  Future<void> close() => _peer.close();

  // ----------------------------------------------------------------
  //  clientToServer requests
  // ----------------------------------------------------------------

  @override
  void onInitializeRequest(
    Future<InitializeResult?> Function(InitializeParams params) handler,
  ) {
    _peer.registerMethod('initialize', (p) async {
      final result = await handler(
        InitializeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onShutdownRequest(Future<void> Function() handler) =>
      _peer.registerMethod('shutdown', (_) => handler());

  @override
  void onTextDocumentImplementationRequest(
    Future<Object?> Function(ImplementationParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/implementation',
      (p) => handler(
        ImplementationParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentTypeDefinitionRequest(
    Future<Object?> Function(TypeDefinitionParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/typeDefinition',
      (p) => handler(
        TypeDefinitionParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentDocumentColorRequest(
    Future<List<ColorInformation>?> Function(DocumentColorParams params)
    handler,
  ) {
    _peer.registerMethod('textDocument/documentColor', (p) async {
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
    _peer.registerMethod('textDocument/colorPresentation', (p) async {
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
    _peer.registerMethod('textDocument/foldingRange', (p) async {
      final result = await handler(
        FoldingRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentDeclarationRequest(
    Future<Object?> Function(DeclarationParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/declaration',
      (p) => handler(
        DeclarationParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentSelectionRangeRequest(
    Future<List<SelectionRange>?> Function(SelectionRangeParams params) handler,
  ) {
    _peer.registerMethod('textDocument/selectionRange', (p) async {
      final result = await handler(
        SelectionRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentPrepareCallHierarchyRequest(
    Future<List<CallHierarchyItem>?> Function(
      CallHierarchyPrepareParams params,
    )
    handler,
  ) {
    _peer.registerMethod('textDocument/prepareCallHierarchy', (p) async {
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
    _peer.registerMethod('callHierarchy/incomingCalls', (p) async {
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
    _peer.registerMethod('callHierarchy/outgoingCalls', (p) async {
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
    _peer.registerMethod('textDocument/semanticTokens/full', (p) async {
      final result = await handler(
        SemanticTokensParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentSemanticTokensFullDeltaRequest(
    Future<Object?> Function(SemanticTokensDeltaParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/semanticTokens/full/delta',
      (p) => handler(
        SemanticTokensDeltaParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentSemanticTokensRangeRequest(
    Future<SemanticTokens?> Function(SemanticTokensRangeParams params) handler,
  ) {
    _peer.registerMethod('textDocument/semanticTokens/range', (p) async {
      final result = await handler(
        SemanticTokensRangeParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentLinkedEditingRangeRequest(
    Future<LinkedEditingRanges?> Function(LinkedEditingRangeParams params)
    handler,
  ) {
    _peer.registerMethod('textDocument/linkedEditingRange', (p) async {
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
    _peer.registerMethod('workspace/willCreateFiles', (p) async {
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
    _peer.registerMethod('workspace/willRenameFiles', (p) async {
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
    _peer.registerMethod('workspace/willDeleteFiles', (p) async {
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
    _peer.registerMethod('textDocument/moniker', (p) async {
      final result = await handler(
        MonikerParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentPrepareTypeHierarchyRequest(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchyPrepareParams params,
    )
    handler,
  ) {
    _peer.registerMethod('textDocument/prepareTypeHierarchy', (p) async {
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
    _peer.registerMethod('typeHierarchy/supertypes', (p) async {
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
    _peer.registerMethod('typeHierarchy/subtypes', (p) async {
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
    _peer.registerMethod(
      'textDocument/inlineValue',
      // InlineValue = Object?, pass through as-is
      (p) => handler(
        InlineValueParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentInlayHintRequest(
    Future<List<InlayHint>?> Function(InlayHintParams params) handler,
  ) {
    _peer.registerMethod('textDocument/inlayHint', (p) async {
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
    _peer.registerMethod('inlayHint/resolve', (p) async {
      final result = await handler(
        InlayHint.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentDiagnosticRequest(
    Future<DocumentDiagnosticReport?> Function(DocumentDiagnosticParams params)
    handler,
  ) {
    _peer.registerMethod(
      'textDocument/diagnostic',
      // DocumentDiagnosticReport = Object?, pass through as-is
      (p) => handler(
        DocumentDiagnosticParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceDiagnosticRequest(
    Future<WorkspaceDiagnosticReport?> Function(
      WorkspaceDiagnosticParams params,
    )
    handler,
  ) {
    _peer.registerMethod(
      'workspace/diagnostic',
      // WorkspaceDiagnosticReport = Object?, pass through as-is
      (p) => handler(
        WorkspaceDiagnosticParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentInlineCompletionRequest(
    Future<Object?> Function(InlineCompletionParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/inlineCompletion',
      (p) => handler(
        InlineCompletionParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentWillSaveWaitUntilRequest(
    Future<List<TextEdit>?> Function(WillSaveTextDocumentParams params) handler,
  ) {
    _peer.registerMethod('textDocument/willSaveWaitUntil', (p) async {
      final result = await handler(
        WillSaveTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentCompletionRequest(
    Future<Object?> Function(CompletionParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/completion',
      (p) => handler(
        CompletionParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onCompletionItemResolveRequest(
    Future<CompletionItem?> Function(CompletionItem params) handler,
  ) {
    _peer.registerMethod('completionItem/resolve', (p) async {
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
    _peer.registerMethod('textDocument/hover', (p) async {
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
    _peer.registerMethod('textDocument/signatureHelp', (p) async {
      final result = await handler(
        SignatureHelpParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentDefinitionRequest(
    Future<Object?> Function(DefinitionParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/definition',
      (p) => handler(
        DefinitionParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentReferencesRequest(
    Future<List<Location>?> Function(ReferenceParams params) handler,
  ) {
    _peer.registerMethod('textDocument/references', (p) async {
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
    _peer.registerMethod('textDocument/documentHighlight', (p) async {
      final result = await handler(
        DocumentHighlightParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentDocumentSymbolRequest(
    Future<Object?> Function(DocumentSymbolParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/documentSymbol',
      (p) => handler(
        DocumentSymbolParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentCodeActionRequest(
    Future<List<Object?>?> Function(CodeActionParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/codeAction',
      (p) => handler(
        CodeActionParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onCodeActionResolveRequest(
    Future<CodeAction?> Function(CodeAction params) handler,
  ) {
    _peer.registerMethod('codeAction/resolve', (p) async {
      final result = await handler(
        CodeAction.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onWorkspaceSymbolRequest(
    Future<Object?> Function(WorkspaceSymbolParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/symbol',
      (p) => handler(
        WorkspaceSymbolParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceSymbolResolveRequest(
    Future<WorkspaceSymbol?> Function(WorkspaceSymbol params) handler,
  ) {
    _peer.registerMethod('workspaceSymbol/resolve', (p) async {
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
    _peer.registerMethod('textDocument/codeLens', (p) async {
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
    _peer.registerMethod('codeLens/resolve', (p) async {
      final result = await handler(
        CodeLens.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentDocumentLinkRequest(
    Future<List<DocumentLink>?> Function(DocumentLinkParams params) handler,
  ) {
    _peer.registerMethod('textDocument/documentLink', (p) async {
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
    _peer.registerMethod('documentLink/resolve', (p) async {
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
    _peer.registerMethod('textDocument/formatting', (p) async {
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
    _peer.registerMethod('textDocument/rangeFormatting', (p) async {
      final result = await handler(
        DocumentRangeFormattingParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      );
      return result?.map((e) => e.toJson()).toList();
    });
  }

  @override
  void onTextDocumentRangesFormattingRequest(
    Future<List<TextEdit>?> Function(DocumentRangesFormattingParams params)
    handler,
  ) {
    _peer.registerMethod('textDocument/rangesFormatting', (p) async {
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
    _peer.registerMethod('textDocument/onTypeFormatting', (p) async {
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
    _peer.registerMethod('textDocument/rename', (p) async {
      final result = await handler(
        RenameParams.fromJson(p.value as Map<String, dynamic>),
      );
      return result?.toJson();
    });
  }

  @override
  void onTextDocumentPrepareRenameRequest(
    Future<PrepareRenameResult?> Function(PrepareRenameParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/prepareRename',
      // PrepareRenameResult = Object?, pass through as-is
      (p) => handler(
        PrepareRenameParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceExecuteCommandRequest(
    Future<LSPAny?> Function(ExecuteCommandParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/executeCommand',
      // LSPAny = Object?, pass through as-is
      (p) => handler(
        ExecuteCommandParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  // ----------------------------------------------------------------
  //  clientToServer notifications
  // ----------------------------------------------------------------

  @override
  void onInitializedNotification(
    Future<void> Function(InitializedParams params) handler,
  ) {
    _peer.registerMethod(
      'initialized',
      (p) => handler(
        InitializedParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onExitNotification(Future<void> Function() handler) =>
      _peer.registerMethod('exit', (_) => handler());

  @override
  void onWorkspaceDidChangeConfigurationNotification(
    Future<void> Function(DidChangeConfigurationParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/didChangeConfiguration',
      (p) => handler(
        DidChangeConfigurationParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentDidOpenNotification(
    Future<void> Function(DidOpenTextDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/didOpen',
      (p) => handler(
        DidOpenTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentDidChangeNotification(
    Future<void> Function(DidChangeTextDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/didChange',
      (p) => handler(
        DidChangeTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentDidCloseNotification(
    Future<void> Function(DidCloseTextDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/didClose',
      (p) => handler(
        DidCloseTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentDidSaveNotification(
    Future<void> Function(DidSaveTextDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/didSave',
      (p) => handler(
        DidSaveTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onTextDocumentWillSaveNotification(
    Future<void> Function(WillSaveTextDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'textDocument/willSave',
      (p) => handler(
        WillSaveTextDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceDidChangeWatchedFilesNotification(
    Future<void> Function(DidChangeWatchedFilesParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/didChangeWatchedFiles',
      (p) => handler(
        DidChangeWatchedFilesParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceDidChangeWorkspaceFoldersNotification(
    Future<void> Function(DidChangeWorkspaceFoldersParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/didChangeWorkspaceFolders',
      (p) => handler(
        DidChangeWorkspaceFoldersParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      ),
    );
  }

  @override
  void onWindowWorkDoneProgressCancelNotification(
    Future<void> Function(WorkDoneProgressCancelParams params) handler,
  ) {
    _peer.registerMethod(
      'window/workDoneProgress/cancel',
      (p) => handler(
        WorkDoneProgressCancelParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceDidCreateFilesNotification(
    Future<void> Function(CreateFilesParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/didCreateFiles',
      (p) => handler(
        CreateFilesParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceDidRenameFilesNotification(
    Future<void> Function(RenameFilesParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/didRenameFiles',
      (p) => handler(
        RenameFilesParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onWorkspaceDidDeleteFilesNotification(
    Future<void> Function(DeleteFilesParams params) handler,
  ) {
    _peer.registerMethod(
      'workspace/didDeleteFiles',
      (p) => handler(
        DeleteFilesParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onNotebookDocumentDidOpenNotification(
    Future<void> Function(DidOpenNotebookDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'notebookDocument/didOpen',
      (p) => handler(
        DidOpenNotebookDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onNotebookDocumentDidChangeNotification(
    Future<void> Function(DidChangeNotebookDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'notebookDocument/didChange',
      (p) => handler(
        DidChangeNotebookDocumentParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      ),
    );
  }

  @override
  void onNotebookDocumentDidSaveNotification(
    Future<void> Function(DidSaveNotebookDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'notebookDocument/didSave',
      (p) => handler(
        DidSaveNotebookDocumentParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onNotebookDocumentDidCloseNotification(
    Future<void> Function(DidCloseNotebookDocumentParams params) handler,
  ) {
    _peer.registerMethod(
      'notebookDocument/didClose',
      (p) => handler(
        DidCloseNotebookDocumentParams.fromJson(
          p.value as Map<String, dynamic>,
        ),
      ),
    );
  }

  @override
  void onSetTraceNotification(
    Future<void> Function(SetTraceParams params) handler,
  ) {
    _peer.registerMethod(
      r'$/setTrace',
      (p) => handler(
        SetTraceParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onCancelRequestNotification(
    Future<void> Function(CancelParams params) handler,
  ) {
    _peer.registerMethod(
      r'$/cancelRequest',
      (p) => handler(
        CancelParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  void onProgressNotification(
    Future<void> Function(ProgressParams params) handler,
  ) {
    _peer.registerMethod(
      r'$/progress',
      (p) => handler(
        ProgressParams.fromJson(p.value as Map<String, dynamic>),
      ),
    );
  }

  // ----------------------------------------------------------------
  //  serverToClient notifications (send)
  // ----------------------------------------------------------------

  @override
  void sendWindowShowMessageNotification(ShowMessageParams params) =>
      _peer.sendNotification('window/showMessage', params.toJson());

  @override
  void sendWindowLogMessageNotification(LogMessageParams params) =>
      _peer.sendNotification('window/logMessage', params.toJson());

  @override
  void sendTelemetryEventNotification(LSPAny params) =>
      _peer.sendNotification('telemetry/event', params);

  @override
  void sendTextDocumentPublishDiagnosticsNotification(
    PublishDiagnosticsParams params,
  ) => _peer.sendNotification(
    'textDocument/publishDiagnostics',
    params.toJson(),
  );

  @override
  void sendLogTraceNotification(LogTraceParams params) =>
      _peer.sendNotification(r'$/logTrace', params.toJson());

  @override
  void sendCancelRequestNotification(CancelParams params) =>
      _peer.sendNotification(r'$/cancelRequest', params.toJson());

  @override
  void sendProgressNotification(ProgressParams params) =>
      _peer.sendNotification(r'$/progress', params.toJson());

  // ----------------------------------------------------------------
  //  serverToClient requests (send)
  // ----------------------------------------------------------------

  @override
  Future<List<WorkspaceFolder>?> sendWorkspaceWorkspaceFoldersRequest() async {
    final result = await _peer.sendRequest('workspace/workspaceFolders');
    if (result == null) return null;
    return (result as List)
        .map((e) => WorkspaceFolder.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<LSPAny>?> sendWorkspaceConfigurationRequest(
    ConfigurationParams params,
  ) async {
    final result = await _peer.sendRequest(
      'workspace/configuration',
      params.toJson(),
    );
    if (result == null) return null;
    return (result as List).cast<LSPAny>();
  }

  @override
  Future<void> sendWorkspaceFoldingRangeRefreshRequest() =>
      _peer.sendRequest('workspace/foldingRange/refresh');

  @override
  Future<void> sendWindowWorkDoneProgressCreateRequest(
    WorkDoneProgressCreateParams params,
  ) => _peer.sendRequest(
    'window/workDoneProgress/create',
    params.toJson(),
  );

  @override
  Future<void> sendWorkspaceSemanticTokensRefreshRequest() =>
      _peer.sendRequest('workspace/semanticTokens/refresh');

  @override
  Future<ShowDocumentResult?> sendWindowShowDocumentRequest(
    ShowDocumentParams params,
  ) async {
    final result = await _peer.sendRequest(
      'window/showDocument',
      params.toJson(),
    );
    if (result == null) return null;
    return ShowDocumentResult.fromJson(result as Map<String, dynamic>);
  }

  @override
  Future<void> sendWorkspaceInlineValueRefreshRequest() =>
      _peer.sendRequest('workspace/inlineValue/refresh');

  @override
  Future<void> sendWorkspaceInlayHintRefreshRequest() =>
      _peer.sendRequest('workspace/inlayHint/refresh');

  @override
  Future<void> sendWorkspaceDiagnosticRefreshRequest() =>
      _peer.sendRequest('workspace/diagnostic/refresh');

  @override
  Future<void> sendClientRegisterCapabilityRequest(
    RegistrationParams params,
  ) => _peer.sendRequest('client/registerCapability', params.toJson());

  @override
  Future<void> sendClientUnregisterCapabilityRequest(
    UnregistrationParams params,
  ) => _peer.sendRequest('client/unregisterCapability', params.toJson());

  @override
  Future<MessageActionItem?> sendWindowShowMessageRequestRequest(
    ShowMessageRequestParams params,
  ) async {
    final result = await _peer.sendRequest(
      'window/showMessageRequest',
      params.toJson(),
    );
    if (result == null) return null;
    return MessageActionItem.fromJson(result as Map<String, dynamic>);
  }

  @override
  Future<void> sendWorkspaceCodeLensRefreshRequest() =>
      _peer.sendRequest('workspace/codeLens/refresh');

  @override
  Future<ApplyWorkspaceEditResult?> sendWorkspaceApplyEditRequest(
    ApplyWorkspaceEditParams params,
  ) async {
    final result = await _peer.sendRequest(
      'workspace/applyEdit',
      params.toJson(),
    );
    if (result == null) return null;
    return ApplyWorkspaceEditResult.fromJson(result as Map<String, dynamic>);
  }
}

void _serialize(String data, EventSink<List<int>> sink) {
  final message = utf8.encode(data);
  final header = 'Content-Length: ${message.length}\r\n\r\n';
  sink.add(ascii.encode(header));

  const chunkSize = 1024;
  _chunks(message, chunkSize).forEach(sink.add);
}

class _Parser {
  _Parser(Stream<List<int>> stream) {
    _subscription = stream
        .expand((bytes) => bytes)
        .listen(
          _handleByte,
          onDone: _streamCtl.close,
        );
  }

  final _streamCtl = StreamController<String>();
  Stream<String> get stream => _streamCtl.stream;

  final _buffer = <int>[];
  var _headerMode = true;
  var _contentLength = -1;

  late StreamSubscription _subscription;

  Future<void> close() => _subscription.cancel();

  void _handleByte(int byte) {
    _buffer.add(byte);
    if (_headerMode && _headerComplete) {
      _contentLength = _parseContentLength();
      _buffer.clear();
      _headerMode = false;
    } else if (!_headerMode && _messageComplete) {
      _streamCtl.add(utf8.decode(_buffer));
      _buffer.clear();
      _headerMode = true;
    }
  }

  /// Whether the entire message is in [_buffer].
  bool get _messageComplete => _buffer.length >= _contentLength;

  /// Decodes [_buffer] into a String and looks for the 'Content-Length' header.
  int _parseContentLength() {
    final asString = ascii.decode(_buffer);
    final headers = asString.split('\r\n');
    final lengthHeader = headers.firstWhere(
      (h) => h.startsWith('Content-Length'),
    );
    final length = lengthHeader.split(':').last.trim();

    return int.parse(length);
  }

  /// Whether [_buffer] ends in '\r\n\r\n'.
  bool get _headerComplete {
    final l = _buffer.length;

    return l > 4 &&
        _buffer[l - 1] == 10 &&
        _buffer[l - 2] == 13 &&
        _buffer[l - 3] == 10 &&
        _buffer[l - 4] == 13;
  }
}

Iterable<List<T>> _chunks<T>(List<T> data, int chunkSize) sync* {
  if (data.length <= chunkSize) {
    yield data;
    return;
  }

  var low = 0;
  while (low < data.length) {
    if (data.length > low + chunkSize) {
      yield data.sublist(low, low + chunkSize);
    } else {
      yield data.sublist(low);
    }

    low += chunkSize;
  }
}
