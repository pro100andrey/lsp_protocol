// ignore_for_file: type=lint

// ignore_for_file: unused_import
//
// GENERATED — do not edit.

import 'dart:async';

import '../../connection/lsp_connection.dart';
import '../../server/lsp_request.dart';
import '../models/enumerations.dart';
import '../models/methods.dart';
import '../models/scalar_unions.dart';
import '../models/structures.dart';
import '../models/type_aliases.dart';
import '../models/unions.dart';

/// Registers incoming LSP handlers for the `textDocument` namespace.
class TextDocumentHandlers {
  TextDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `textDocument/implementation`.
  void onImplementation(
    Future<Object?> Function(ImplementationParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.implementation, (
      dynamic json,
      LspRequest context,
    ) {
      final p = ImplementationParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/typeDefinition`.
  void onTypeDefinition(
    Future<Object?> Function(TypeDefinitionParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.typeDefinition, (
      dynamic json,
      LspRequest context,
    ) {
      final p = TypeDefinitionParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/documentColor`.
  void onDocumentColor(
    Future<List<ColorInformation>> Function(
      DocumentColorParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentColor, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentColorParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/colorPresentation`.
  void onColorPresentation(
    Future<List<ColorPresentation>> Function(
      ColorPresentationParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.colorPresentation, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = ColorPresentationParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/foldingRange`.
  void onFoldingRange(
    Future<List<FoldingRange>?> Function(
      FoldingRangeParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.foldingRange, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = FoldingRangeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/declaration`.
  void onDeclaration(
    Future<Object?> Function(DeclarationParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.declaration, (
      dynamic json,
      LspRequest context,
    ) {
      final p = DeclarationParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/selectionRange`.
  void onSelectionRange(
    Future<List<SelectionRange>?> Function(
      SelectionRangeParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.selectionRange, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = SelectionRangeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/prepareCallHierarchy`.
  void onPrepareCallHierarchy(
    Future<List<CallHierarchyItem>?> Function(
      CallHierarchyPrepareParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.prepareCallHierarchy, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CallHierarchyPrepareParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/semanticTokens/full`.
  void onSemanticTokensFull(
    Future<SemanticTokens?> Function(
      SemanticTokensParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.full, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = SemanticTokensParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/semanticTokens/full/delta`.
  void onSemanticTokensFullDelta(
    Future<Object?> Function(
      SemanticTokensDeltaParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.delta, (
      dynamic json,
      LspRequest context,
    ) {
      final p = SemanticTokensDeltaParams.fromJson(
        json as Map<String, dynamic>,
      );
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/semanticTokens/range`.
  void onSemanticTokensRange(
    Future<SemanticTokens?> Function(
      SemanticTokensRangeParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.range, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = SemanticTokensRangeParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/linkedEditingRange`.
  void onLinkedEditingRange(
    Future<LinkedEditingRanges?> Function(
      LinkedEditingRangeParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.linkedEditingRange, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = LinkedEditingRangeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/moniker`.
  void onMoniker(
    Future<List<Moniker>?> Function(MonikerParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.moniker, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = MonikerParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/prepareTypeHierarchy`.
  void onPrepareTypeHierarchy(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchyPrepareParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.prepareTypeHierarchy, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = TypeHierarchyPrepareParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/inlineValue`.
  void onInlineValue(
    Future<List<InlineValue>?> Function(
      InlineValueParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlineValue, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = InlineValueParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/inlayHint`.
  void onInlayHint(
    Future<List<InlayHint>?> Function(
      InlayHintParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlayHint, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = InlayHintParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/diagnostic`.
  void onDiagnostic(
    Future<DocumentDiagnosticReport> Function(
      DocumentDiagnosticParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.textDocumentDiagnostic, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentDiagnosticParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.toJson();
    });
  }

  /// Registers handler for `textDocument/inlineCompletion`.
  void onInlineCompletion(
    Future<Object?> Function(InlineCompletionParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlineCompletion, (
      dynamic json,
      LspRequest context,
    ) {
      final p = InlineCompletionParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/willSaveWaitUntil`.
  void onWillSaveWaitUntil(
    Future<List<TextEdit>?> Function(
      WillSaveTextDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willSaveWaitUntil, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = WillSaveTextDocumentParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/completion`.
  void onCompletion(
    Future<Object?> Function(CompletionParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.completion, (
      dynamic json,
      LspRequest context,
    ) {
      final p = CompletionParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/hover`.
  void onHover(
    Future<Hover?> Function(HoverParams params, LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.hover, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = HoverParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/signatureHelp`.
  void onSignatureHelp(
    Future<SignatureHelp?> Function(
      SignatureHelpParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.signatureHelp, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = SignatureHelpParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/definition`.
  void onDefinition(
    Future<Object?> Function(DefinitionParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.definition, (
      dynamic json,
      LspRequest context,
    ) {
      final p = DefinitionParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/references`.
  void onReferences(
    Future<List<Location>?> Function(ReferenceParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.references, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = ReferenceParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/documentHighlight`.
  void onDocumentHighlight(
    Future<List<DocumentHighlight>?> Function(
      DocumentHighlightParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentHighlight, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentHighlightParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/documentSymbol`.
  void onDocumentSymbol(
    Future<Object?> Function(DocumentSymbolParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentSymbol, (
      dynamic json,
      LspRequest context,
    ) {
      final p = DocumentSymbolParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `textDocument/codeAction`.
  void onCodeAction(
    Future<List<Object>?> Function(CodeActionParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.codeAction, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CodeActionParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => (e as dynamic).toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/codeLens`.
  void onCodeLens(
    Future<List<CodeLens>?> Function(CodeLensParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.codeLens, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CodeLensParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/documentLink`.
  void onDocumentLink(
    Future<List<DocumentLink>?> Function(
      DocumentLinkParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentLink, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentLinkParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/formatting`.
  void onFormatting(
    Future<List<TextEdit>?> Function(
      DocumentFormattingParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.formatting, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentFormattingParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/rangeFormatting`.
  void onRangeFormatting(
    Future<List<TextEdit>?> Function(
      DocumentRangeFormattingParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.rangeFormatting, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentRangeFormattingParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/rangesFormatting`.
  void onRangesFormatting(
    Future<List<TextEdit>?> Function(
      DocumentRangesFormattingParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.rangesFormatting, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentRangesFormattingParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/onTypeFormatting`.
  void onOnTypeFormatting(
    Future<List<TextEdit>?> Function(
      DocumentOnTypeFormattingParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.onTypeFormatting, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentOnTypeFormattingParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `textDocument/rename`.
  void onRename(
    Future<WorkspaceEdit?> Function(RenameParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.rename, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = RenameParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/prepareRename`.
  void onPrepareRename(
    Future<PrepareRenameResult?> Function(
      PrepareRenameParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.prepareRename, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = PrepareRenameParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `textDocument/didOpen`.
  void onDidOpen(
    Future<void> Function(DidOpenTextDocumentParams params, LspRequest context)
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidOpen,
      (dynamic json, LspRequest context) async {
        final p = DidOpenTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `textDocument/didChange`.
  void onDidChange(
    Future<void> Function(
      DidChangeTextDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidChange,
      (dynamic json, LspRequest context) async {
        final p = DidChangeTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `textDocument/didClose`.
  void onDidClose(
    Future<void> Function(DidCloseTextDocumentParams params, LspRequest context)
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidClose,
      (dynamic json, LspRequest context) async {
        final p = DidCloseTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `textDocument/didSave`.
  void onDidSave(
    Future<void> Function(DidSaveTextDocumentParams params, LspRequest context)
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.textDocumentDidSave,
      (dynamic json, LspRequest context) async {
        final p = DidSaveTextDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `textDocument/willSave`.
  void onWillSave(
    Future<void> Function(WillSaveTextDocumentParams params, LspRequest context)
    handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.willSave, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = WillSaveTextDocumentParams.fromJson(
        json as Map<String, dynamic>,
      );
      await handler(p, context);
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
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.incomingCalls, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CallHierarchyIncomingCallsParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `callHierarchy/outgoingCalls`.
  void onOutgoingCalls(
    Future<List<CallHierarchyOutgoingCall>?> Function(
      CallHierarchyOutgoingCallsParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.outgoingCalls, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CallHierarchyOutgoingCallsParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
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
    Future<WorkspaceEdit?> Function(
      CreateFilesParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willCreateFiles, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CreateFilesParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `workspace/willRenameFiles`.
  void onWillRenameFiles(
    Future<WorkspaceEdit?> Function(
      RenameFilesParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willRenameFiles, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = RenameFilesParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `workspace/willDeleteFiles`.
  void onWillDeleteFiles(
    Future<WorkspaceEdit?> Function(
      DeleteFilesParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.willDeleteFiles, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DeleteFilesParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r?.toJson();
    });
  }

  /// Registers handler for `workspace/diagnostic`.
  void onDiagnostic(
    Future<WorkspaceDiagnosticReport> Function(
      WorkspaceDiagnosticParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.workspaceDiagnostic, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = WorkspaceDiagnosticParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r.toJson();
    });
  }

  /// Registers handler for `workspace/symbol`.
  void onSymbol(
    Future<Object?> Function(WorkspaceSymbolParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.symbol, (
      dynamic json,
      LspRequest context,
    ) {
      final p = WorkspaceSymbolParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `workspace/executeCommand`.
  void onExecuteCommand(
    Future<Object?> Function(ExecuteCommandParams params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.executeCommand, (
      dynamic json,
      LspRequest context,
    ) {
      final p = ExecuteCommandParams.fromJson(json as Map<String, dynamic>);
      return handler(p, context);
    });
  }

  /// Registers handler for `workspace/didChangeWorkspaceFolders`.
  void onDidChangeWorkspaceFolders(
    Future<void> Function(
      DidChangeWorkspaceFoldersParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didChangeWorkspaceFolders,
      (dynamic json, LspRequest context) async {
        final p = DidChangeWorkspaceFoldersParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `workspace/didCreateFiles`.
  void onDidCreateFiles(
    Future<void> Function(CreateFilesParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.didCreateFiles, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CreateFilesParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }

  /// Registers handler for `workspace/didRenameFiles`.
  void onDidRenameFiles(
    Future<void> Function(RenameFilesParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.didRenameFiles, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = RenameFilesParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }

  /// Registers handler for `workspace/didDeleteFiles`.
  void onDidDeleteFiles(
    Future<void> Function(DeleteFilesParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.didDeleteFiles, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DeleteFilesParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }

  /// Registers handler for `workspace/didChangeConfiguration`.
  void onDidChangeConfiguration(
    Future<void> Function(
      DidChangeConfigurationParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didChangeConfiguration,
      (dynamic json, LspRequest context) async {
        final p = DidChangeConfigurationParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `workspace/didChangeWatchedFiles`.
  void onDidChangeWatchedFiles(
    Future<void> Function(
      DidChangeWatchedFilesParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.didChangeWatchedFiles,
      (dynamic json, LspRequest context) async {
        final p = DidChangeWatchedFilesParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
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
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.supertypes, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = TypeHierarchySupertypesParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }

  /// Registers handler for `typeHierarchy/subtypes`.
  void onSubtypes(
    Future<List<TypeHierarchyItem>?> Function(
      TypeHierarchySubtypesParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.subtypes, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = TypeHierarchySubtypesParams.fromJson(
        json as Map<String, dynamic>,
      );
      final r = await handler(p, context);
      return r?.map((e) => e.toJson()).toList();
    });
  }
}

/// Registers incoming LSP handlers for the `inlayHint` namespace.
class InlayHintHandlers {
  InlayHintHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `inlayHint/resolve`.
  void onResolve(
    Future<InlayHint> Function(InlayHint params, LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.inlayHintResolve, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = InlayHint.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
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
    Future<InitializeResult> Function(
      InitializeParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.initialize, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = InitializeParams.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.toJson();
    });
  }

  /// Registers handler for `shutdown`.
  void onShutdown(Future<void> Function(LspRequest context) handler) {
    _connection.registerRequestHandler(RequestMethod.shutdown, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
      return null;
    });
  }

  /// Registers handler for `initialized`.
  void onInitialized(
    Future<void> Function(InitializedParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.initialized, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = InitializedParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }

  /// Registers handler for `exit`.
  void onExit(Future<void> Function(LspRequest context) handler) {
    _connection.registerNotificationHandler(NotificationMethod.exit, (
      dynamic json,
      LspRequest context,
    ) async {
      await handler(context);
    });
  }

  /// Registers handler for `$/setTrace`.
  void onSetTrace(
    Future<void> Function(SetTraceParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.setTrace, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = SetTraceParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }

  /// Registers handler for `$/cancelRequest`.
  void onCancelRequest(
    Future<void> Function(CancelParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.cancelRequest, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CancelParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }

  /// Registers handler for `$/progress`.
  void onProgress(
    Future<void> Function(ProgressParams params, LspRequest context) handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.progress, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = ProgressParams.fromJson(json as Map<String, dynamic>);
      await handler(p, context);
    });
  }
}

/// Registers incoming LSP handlers for the `completionItem` namespace.
class CompletionItemHandlers {
  CompletionItemHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `completionItem/resolve`.
  void onResolve(
    Future<CompletionItem> Function(CompletionItem params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.completionItemResolve, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CompletionItem.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `codeAction` namespace.
class CodeActionHandlers {
  CodeActionHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `codeAction/resolve`.
  void onResolve(
    Future<CodeAction> Function(CodeAction params, LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.codeActionResolve, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CodeAction.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
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
    Future<WorkspaceSymbol> Function(WorkspaceSymbol params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.workspaceSymbolResolve, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = WorkspaceSymbol.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `codeLens` namespace.
class CodeLensHandlers {
  CodeLensHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `codeLens/resolve`.
  void onResolve(
    Future<CodeLens> Function(CodeLens params, LspRequest context) handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.codeLensResolve, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = CodeLens.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `documentLink` namespace.
class DocumentLinkHandlers {
  DocumentLinkHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `documentLink/resolve`.
  void onResolve(
    Future<DocumentLink> Function(DocumentLink params, LspRequest context)
    handler,
  ) {
    _connection.registerRequestHandler(RequestMethod.documentLinkResolve, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = DocumentLink.fromJson(json as Map<String, dynamic>);
      final r = await handler(p, context);
      return r.toJson();
    });
  }
}

/// Registers incoming LSP handlers for the `window` namespace.
class WindowHandlers {
  WindowHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `window/workDoneProgress/cancel`.
  void onWorkDoneProgressCancel(
    Future<void> Function(
      WorkDoneProgressCancelParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(NotificationMethod.cancel, (
      dynamic json,
      LspRequest context,
    ) async {
      final p = WorkDoneProgressCancelParams.fromJson(
        json as Map<String, dynamic>,
      );
      await handler(p, context);
    });
  }
}

/// Registers incoming LSP handlers for the `notebookDocument` namespace.
class NotebookDocumentHandlers {
  NotebookDocumentHandlers(this._connection);

  final LspConnection _connection;

  /// Registers handler for `notebookDocument/didOpen`.
  void onDidOpen(
    Future<void> Function(
      DidOpenNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidOpen,
      (dynamic json, LspRequest context) async {
        final p = DidOpenNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `notebookDocument/didChange`.
  void onDidChange(
    Future<void> Function(
      DidChangeNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidChange,
      (dynamic json, LspRequest context) async {
        final p = DidChangeNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `notebookDocument/didSave`.
  void onDidSave(
    Future<void> Function(
      DidSaveNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidSave,
      (dynamic json, LspRequest context) async {
        final p = DidSaveNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
      },
    );
  }

  /// Registers handler for `notebookDocument/didClose`.
  void onDidClose(
    Future<void> Function(
      DidCloseNotebookDocumentParams params,
      LspRequest context,
    )
    handler,
  ) {
    _connection.registerNotificationHandler(
      NotificationMethod.notebookDocumentDidClose,
      (dynamic json, LspRequest context) async {
        final p = DidCloseNotebookDocumentParams.fromJson(
          json as Map<String, dynamic>,
        );
        await handler(p, context);
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
      RequestMethod.workspaceFolders,
    );
    return (raw as List)
        .cast<Map<String, dynamic>>()
        .map(WorkspaceFolder.fromJson)
        .toList();
  }

  /// Sends the `workspace/configuration` request to the client.
  Future<List<Object?>> configuration(ConfigurationParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.configuration,
      params.toJson(),
    );
    return (raw as List).cast<Object>().toList();
  }

  /// Sends the `workspace/foldingRange/refresh` request to the client.
  Future<void> foldingRangeRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceFoldingRangeRefresh);
  }

  /// Sends the `workspace/semanticTokens/refresh` request to the client.
  Future<void> semanticTokensRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceSemanticTokensRefresh);
  }

  /// Sends the `workspace/inlineValue/refresh` request to the client.
  Future<void> inlineValueRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceInlineValueRefresh);
  }

  /// Sends the `workspace/inlayHint/refresh` request to the client.
  Future<void> inlayHintRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceInlayHintRefresh);
  }

  /// Sends the `workspace/diagnostic/refresh` request to the client.
  Future<void> diagnosticRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceDiagnosticRefresh);
  }

  /// Sends the `workspace/codeLens/refresh` request to the client.
  Future<void> codeLensRefresh() async {
    await _connection.sendRequest(RequestMethod.workspaceCodeLensRefresh);
  }

  /// Sends the `workspace/applyEdit` request to the client.
  Future<ApplyWorkspaceEditResult> applyEdit(
    ApplyWorkspaceEditParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.applyEdit,
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
    await _connection.sendRequest(RequestMethod.create, params.toJson());
  }

  /// Sends the `window/showDocument` request to the client.
  Future<ShowDocumentResult> showDocument(ShowDocumentParams params) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.showDocument,
      params.toJson(),
    );
    return ShowDocumentResult.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessageRequest` request to the client.
  Future<MessageActionItem?> showMessageRequest(
    ShowMessageRequestParams params,
  ) async {
    final dynamic raw = await _connection.sendRequest(
      RequestMethod.showMessageRequest,
      params.toJson(),
    );
    return raw == null
        ? null
        : MessageActionItem.fromJson(raw as Map<String, dynamic>);
  }

  /// Sends the `window/showMessage` notification to the client.
  void showMessage(ShowMessageParams params) => _connection.sendNotification(
    NotificationMethod.showMessage,
    params.toJson(),
  );

  /// Sends the `window/logMessage` notification to the client.
  void logMessage(LogMessageParams params) => _connection.sendNotification(
    NotificationMethod.logMessage,
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
      RequestMethod.registerCapability,
      params.toJson(),
    );
  }

  /// Sends the `client/unregisterCapability` request to the client.
  Future<void> unregisterCapability(UnregistrationParams params) async {
    await _connection.sendRequest(
      RequestMethod.unregisterCapability,
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
      _connection.sendNotification(NotificationMethod.event, params);
}

/// Sends LSP messages to the client for the `textDocument` namespace.
class TextDocumentSender {
  TextDocumentSender(this._connection);

  final LspConnection _connection;

  /// Sends the `textDocument/publishDiagnostics` notification to the client.
  void publishDiagnostics(PublishDiagnosticsParams params) => _connection
      .sendNotification(NotificationMethod.publishDiagnostics, params.toJson());
}

/// Sends LSP messages to the client for the `general` namespace.
class GeneralSender {
  GeneralSender(this._connection);

  final LspConnection _connection;

  /// Sends the `$/logTrace` notification to the client.
  void logTrace(LogTraceParams params) => _connection.sendNotification(
    NotificationMethod.logTrace,
    params.toJson(),
  );

  /// Sends the `$/cancelRequest` notification to the client.
  void cancelRequest(CancelParams params) => _connection.sendNotification(
    NotificationMethod.cancelRequest,
    params.toJson(),
  );

  /// Sends the `$/progress` notification to the client.
  void progress(ProgressParams params) => _connection.sendNotification(
    NotificationMethod.progress,
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
