import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Helper to interact with the client IDE's UI for showing messages,
/// asking for confirmation/input, or opening files.
final class LspDialogHelper extends LspFeature {
  LspDialogHelper([LspServer? server]) : _server = server;

  LspServer? _server;

  @override
  void register(LspServer server) {
    _server = server;
  }

  /// Shows a simple notification message in the editor UI.
  void showMessage({
    required MessageType type,
    required String message,
  }) {
    final server = _server;
    if (server == null) {
      throw StateError('LspDialogHelper is not registered on any server.');
    }

    server.client.window.showMessage(
      .new(type: type, message: message),
    );
  }

  /// Displays a message request modal/notification with actions and returns
  /// the action the user clicked, or `null` if closed/cancelled.
  ///
  /// Example:
  /// ```dart
  /// final choice = await dialogs.showMessageRequest(
  ///   type: MessageType.warning,
  ///   message: 'Restart analysis server?',
  ///   actions: ['Yes', 'No'],
  /// );
  /// if (choice == 'Yes') { ... }
  /// ```
  Future<String?> showMessageRequest({
    required MessageType type,
    required String message,
    required List<String> actions,
  }) async {
    final server = _server;
    if (server == null) {
      throw StateError('LspDialogHelper is not registered on any server.');
    }

    final actionItems = actions
        .map((title) => MessageActionItem(title: title))
        .toList(growable: false);

    final response = await server.client.window.showMessageRequest(
      .new(type: type, message: message, actions: actionItems),
    );

    return response?.title;
  }

  /// Requests the client editor to open a document at a specific [uri].
  ///
  /// [external] suggests opening the document in an external program instead of
  ///   the editor.
  /// [takeFocus] whether the editor should focus the opened document.
  /// [selection] optionally highlights a specific range in the document.
  Future<ShowDocumentResult> showDocument({
    required String uri,
    bool? external,
    bool? takeFocus,
    Range? selection,
  }) {
    final server = _server;
    if (server == null) {
      throw StateError('LspDialogHelper is not registered on any server.');
    }

    return server.client.window.showDocument(
      .new(
        uri: uri,
        external: external,
        takeFocus: takeFocus,
        selection: selection,
      ),
    );
  }

  @override
  FutureOr<void> dispose() {
    _server = null;
  }
}
