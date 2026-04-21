import '../common/base_action.dart';

/// Handles `textDocument/didOpen` — stores document content in state.
final class DidOpenAction extends BaseAction {
  DidOpenAction({required this.uri, required this.text});

  final String uri;
  final String text;

  @override
  AppState reduce() =>
      state.copyWith(documentContents: {...state.documentContents, uri: text});
}

/// Handles `textDocument/didChange` — updates document content in state.
final class DidChangeAction extends BaseAction {
  DidChangeAction({required this.uri, required this.text});

  final String uri;
  final String text;

  @override
  AppState reduce() =>
      state.copyWith(documentContents: {...state.documentContents, uri: text});
}

/// Handles `textDocument/didClose` — removes document from state.
final class DidCloseAction extends BaseAction {
  DidCloseAction({required this.uri});

  final String uri;

  @override
  AppState reduce() {
    final updated = Map<String, String>.from(state.documentContents)
      ..remove(uri);
    return state.copyWith(documentContents: updated);
  }
}
