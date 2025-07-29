import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:stream_channel/stream_channel.dart';

import '../generated/protocol.dart';
import 'console.dart';

class Connection {
  Connection(
    Stream<List<int>> stream,
    StreamSink<List<int>> sink,
  ) {
    final parser = _Parser(stream);
    final outSink = StreamSinkTransformer.fromHandlers(
      handleData: _serialize,
      handleDone: (sink) async {
        await parser.close();
        sink.close();
      },
    ).bind(sink);

    final channel = StreamChannel.withGuarantees(parser.stream, outSink);

    _peer = Peer(channel);
    console = Console(this);
  }

  late final Peer _peer;
  late final Console console;

  Future<dynamic> listen() => _peer.listen();

  Future<void> close() => _peer.close();

  // Initialization
  
  void onInitializeRequest(
    Future<InitializeResult> Function(InitializeParams) handler,
  ) {
    onRequest(RequestMethod.initialize, (params) async {
      final initParams = InitializeParams.fromJson(params.value);
      final result = await handler(initParams);

      return result.toJson();
    });
  }

  /// A request to resolve the implementation locations of a symbol at
  /// a given text document position. The request's parameter is of
  /// type {@link TextDocumentPositionParams} the response is of type
  /// {Definition} or a Thenable that resolves to such.
  void onTextDocumentImplementationRequest(
    Future<Location> Function(ImplementationParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentImplementation, (params) async {
      final implParams = ImplementationParams.fromJson(params.value);
      final location = await handler(implParams);

      return location.toJson();
    });
  } 

  void onInitializedNotification(
    Future<void> Function(InitializedParams) handler,
  ) {
    onNotification(
      NotificationMethod.initialized,
      (params) async {
        final initParams = InitializedParams.fromJson(params.value);

        await handler(initParams);
      },
    );
  }

  void onShutdownRequest(Future<void> Function() handler) {
    onRequest(RequestMethod.shutdown, (params) async {
      await handler();
    });
  }

  void onExitNotification(Future<void> Function() handler) {
    _peer.registerMethod(NotificationMethod.exit.value, (params) async {
      await handler();
    });
  }

  void onSetTraceNotification(
    Future<void> Function(SetTraceParams) handler,
  ) {
    onNotification(
      NotificationMethod.setTrace,
      (params) async {
        final traceParams = SetTraceParams.fromJson(params.value);
        await handler(traceParams);
      },
    );
  }

  // Text Document

  void onDidOpenTextDocumentNotification(
    Future<void> Function(DidOpenTextDocumentParams) handler,
  ) {
    onNotification(
      NotificationMethod.textDocumentDidOpen,
      (params) async {
        final openParams = DidOpenTextDocumentParams.fromJson(params.value);

        await handler(openParams);
      },
    );
  }

  void onDidChangeTextDocumentNotification(
    Future<void> Function(DidChangeTextDocumentParams) handler,
  ) {
    onNotification(
      NotificationMethod.textDocumentDidChange,
      (params) async {
        final changeParams = DidChangeTextDocumentParams.fromJson(params.value);
        await handler(changeParams);
      },
    );
  }

  void onDidCloseTextDocumentNotification(
    Future<void> Function(DidCloseTextDocumentParams) handler,
  ) {
    onNotification(
      NotificationMethod.textDocumentDidClose,
      (params) async {
        final closeParams = DidCloseTextDocumentParams.fromJson(params.value);
        await handler(closeParams);
      },
    );
  }

  void onWillSaveTextDocumentNotification(
    Future<void> Function(WillSaveTextDocumentParams) handler,
  ) {
    onNotification(
      NotificationMethod.textDocumentWillSave,
      (params) async {
        final willSaveParams = WillSaveTextDocumentParams.fromJson(
          params.value,
        );

        await handler(willSaveParams);
      },
    );
  }

  void onWillSaveWaitUntilTextDocumentRequest(
    Future<List<TextEdit>> Function(WillSaveTextDocumentParams) handler,
  ) {
    onRequest(
      RequestMethod.textDocumentWillSaveWaitUntil,
      (params) async {
        final willSaveParams = WillSaveTextDocumentParams.fromJson(
          params.value,
        );

        final edits = await handler(willSaveParams);

        return edits;
      },
    );
  }

  void onDidSaveTextDocumentNotification(
    Future<void> Function(DidSaveTextDocumentParams) handler,
  ) {
    onNotification(
      NotificationMethod.textDocumentDidSave,
      (params) async {
        final saveParams = DidSaveTextDocumentParams.fromJson(params.value);
        await handler(saveParams);
      },
    );
  }

  void onHoverRequest(
    Future<Hover> Function(HoverParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentHover, (params) async {
      final hoverParams = HoverParams.fromJson(params.value);
      final hover = await handler(hoverParams);

      return hover.toJson();
    });
  }

  void onCompletionRequest(
    Future<CompletionList> Function(CompletionParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentCompletion, (params) async {
      final completionParams = CompletionParams.fromJson(params.value);
      final completionList = await handler(completionParams);

      return completionList.toJson();
    });
  }

  void onCompletionItemResolveRequest(
    Future<CompletionItem> Function(CompletionItem) handler,
  ) {
    onRequest(RequestMethod.completionItemResolve, (params) async {
      final completionItem = CompletionItem.fromJson(params.value);
      final resolvedItem = await handler(completionItem);

      return resolvedItem.toJson();
    });
  }

  void onSignatureHelpRequest(
    Future<SignatureHelp> Function(SignatureHelpParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentSignatureHelp, (params) async {
      final signatureHelpParams = SignatureHelpParams.fromJson(params.value);
      final signatureHelp = await handler(signatureHelpParams);

      return signatureHelp.toJson();
    });
  }

  void onDeclarationRequest(
    Future<Location> Function(DeclarationParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDeclaration, (params) async {
      final declarationParams = DeclarationParams.fromJson(params.value);
      final location = await handler(declarationParams);

      return location.toJson();
    });
  }

  void onDefinitionRequest(
    Future<Location> Function(DefinitionParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDefinition, (params) async {
      final definitionParams = DefinitionParams.fromJson(params.value);
      final location = await handler(definitionParams);

      return location.toJson();
    });
  }

  void onTypeDefinitionRequest(
    Future<Location> Function(TypeDefinitionParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentTypeDefinition, (params) async {
      final typeDefParams = TypeDefinitionParams.fromJson(params.value);
      final location = await handler(typeDefParams);

      return location.toJson();
    });
  }

  void onImplementationRequest(
    Future<Location> Function(ImplementationParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentImplementation, (params) async {
      final implParams = ImplementationParams.fromJson(params.value);
      final location = await handler(implParams);

      return location.toJson();
    });
  }

  void onReferencesRequest(
    Future<List<Location>> Function(ReferenceParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentReferences, (params) async {
      final referenceParams = ReferenceParams.fromJson(params.value);
      final locations = await handler(referenceParams);

      return locations.map((l) => l.toJson()).toList();
    });
  }

  void onDocumentHighlightRequest(
    Future<List<DocumentHighlight>> Function(DocumentHighlightParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDocumentHighlight, (params) async {
      final highlightParams = DocumentHighlightParams.fromJson(params.value);
      final highlights = await handler(highlightParams);

      return highlights.map((h) => h.toJson()).toList();
    });
  }

  void onDocumentSymbolRequest(
    Future<List<SymbolInformation>> Function(DocumentSymbolParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDocumentSymbol, (params) async {
      final symbolParams = DocumentSymbolParams.fromJson(params.value);
      final symbols = await handler(symbolParams);

      return symbols.map((s) => s.toJson()).toList();
    });
  }

  void onWorkspaceSymbolRequest(
    Future<List<SymbolInformation>> Function(WorkspaceSymbolParams) handler,
  ) {
    onRequest(RequestMethod.workspaceSymbol, (params) async {
      final workspaceSymbolParams = WorkspaceSymbolParams.fromJson(
        params.value,
      );
      final symbols = await handler(workspaceSymbolParams);

      return symbols.map((s) => s.toJson()).toList();
    });
  }

  void onWorkspaceSymbolResolveRequest(
    Future<SymbolInformation> Function(SymbolInformation) handler,
  ) {
    onRequest(RequestMethod.workspaceSymbolResolve, (params) async {
      final symbolInfo = SymbolInformation.fromJson(params.value);
      final resolvedSymbol = await handler(symbolInfo);

      return resolvedSymbol.toJson();
    });
  }

  void onCodeActionRequest(
    Future<List<CodeAction>> Function(CodeActionParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentCodeAction, (params) async {
      final codeActionParams = CodeActionParams.fromJson(params.value);
      final codeActions = await handler(codeActionParams);

      return codeActions.map((c) => c.toJson()).toList();
    });
  }

  void onCodeActionResolveRequest(
    Future<CodeAction> Function(CodeAction) handler,
  ) {
    onRequest(RequestMethod.codeActionResolve, (params) async {
      final codeAction = CodeAction.fromJson(params.value);
      final resolvedAction = await handler(codeAction);

      return resolvedAction.toJson();
    });
  }

  void onCodeLensRequest(
    Future<List<CodeLens>> Function(CodeLensParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentCodeLens, (params) async {
      final codeLensParams = CodeLensParams.fromJson(params.value);
      final codeLenses = await handler(codeLensParams);

      return codeLenses.map((c) => c.toJson()).toList();
    });
  }

  void onCodeLensResolveRequest(
    Future<CodeLens> Function(CodeLens) handler,
  ) {
    onRequest(RequestMethod.codeLensResolve, (params) async {
      final codeLens = CodeLens.fromJson(params.value);
      final resolvedLens = await handler(codeLens);

      return resolvedLens.toJson();
    });
  }

  void onDocumentLinkRequest(
    Future<List<DocumentLink>> Function(DocumentLinkParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDocumentLink, (params) async {
      final linkParams = DocumentLinkParams.fromJson(params.value);
      final links = await handler(linkParams);

      return links.map((l) => l.toJson()).toList();
    });
  }

  void onDocumentRangeFormattingRequest(
    Future<List<TextEdit>> Function(DocumentRangeFormattingParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentRangeFormatting, (params) async {
      final formattingParams = DocumentRangeFormattingParams.fromJson(
        params.value,
      );
      final edits = await handler(formattingParams);

      return edits.map((e) => e.toJson()).toList();
    });
  }

  void onDocumentOnTypeFormattingRequest(
    Future<List<TextEdit>> Function(DocumentOnTypeFormattingParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentOnTypeFormatting, (params) async {
      final onTypeParams = DocumentOnTypeFormattingParams.fromJson(
        params.value,
      );
      final edits = await handler(onTypeParams);

      return edits.map((e) => e.toJson()).toList();
    });
  }

  void onRenameRequest(
    Future<WorkspaceEdit> Function(RenameParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentRename, (params) async {
      final renameParams = RenameParams.fromJson(params.value);
      final renameResult = await handler(renameParams);

      return renameResult.toJson();
    });
  }

  void onPrepareRenameRequest(
    Future<PrepareRenameResult> Function(PrepareRenameParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentPrepareRename, (params) async {
      final prepareParams = PrepareRenameParams.fromJson(params.value);
      final prepareResult = await handler(prepareParams);

      return prepareResult.toJson();
    });
  }

  void onDocumentLinksRequest(
    Future<List<DocumentLink>> Function(DocumentLinkParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDocumentLink, (params) async {
      final linkParams = DocumentLinkParams.fromJson(params.value);
      final links = await handler(linkParams);

      return links.map((l) => l.toJson()).toList();
    });
  }

  void onDocumentLinkResolveRequest(
    Future<DocumentLink> Function(DocumentLink) handler,
  ) {
    onRequest(RequestMethod.documentLinkResolve, (params) async {
      final link = DocumentLink.fromJson(params.value);
      final resolvedLink = await handler(link);

      return resolvedLink.toJson();
    });
  }

  void onDocumentColorRequest(
    Future<List<ColorInformation>> Function(DocumentColorParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentDocumentColor, (params) async {
      final colorParams = DocumentColorParams.fromJson(params.value);
      final colors = await handler(colorParams);

      return colors.map((c) => c.toJson()).toList();
    });
  }

  void onColorPresentationRequest(
    Future<List<ColorPresentation>> Function(ColorPresentationParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentColorPresentation, (params) async {
      final presentationParams = ColorPresentationParams.fromJson(params.value);
      final presentations = await handler(presentationParams);

      return presentations.map((p) => p.toJson()).toList();
    });
  }

  void onFoldingRangeRequest(
    Future<List<FoldingRange>> Function(FoldingRangeParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentFoldingRange, (params) async {
      final foldingParams = FoldingRangeParams.fromJson(params.value);
      final ranges = await handler(foldingParams);

      return ranges.map((r) => r.toJson()).toList();
    });
  }

  void onSelectionRangeRequest(
    Future<List<SelectionRange>> Function(SelectionRangeParams) handler,
  ) {
    onRequest(RequestMethod.textDocumentSelectionRange, (params) async {
      final selectionParams = SelectionRangeParams.fromJson(params.value);
      final ranges = await handler(selectionParams);

      return ranges.map((r) => r.toJson()).toList();
    });
  }

  void onExecuteCommandRequest(
    Future<Object?> Function(ExecuteCommandParams) handler,
  ) {
    onRequest(RequestMethod.workspaceExecuteCommand, (params) async {
      final commandParams = ExecuteCommandParams.fromJson(params.value);
      final result = await handler(commandParams);

      return result;
    });
  }

  void onRequest<R>(
    RequestMethod method,
    Future<R> Function(Parameters) handler,
  ) {
    _peer.registerMethod(method.value, (params) async => handler(params));
  }

  void onNotification<R>(
    NotificationMethod method,
    Future<void> Function(Parameters) handler,
  ) {
    _peer.registerMethod(method.value, (params) async => handler(params));
  }

  void sendNotification(String method, Object? params) =>
      _peer.sendNotification(method, params);

  void sendDiagnostics(PublishDiagnosticsParams params) {
    sendNotification(
      NotificationMethod.textDocumentPublishDiagnostics.value,
      params.toJson(),
    );
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
  bool _headerMode = true;
  int _contentLength = -1;

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
