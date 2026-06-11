import 'lsp_server.dart';

/// Represents an open text document in the virtual file system of the LSP
/// server.
final class LspDocument {
  LspDocument({
    required this.uri,
    required this.languageId,
    required this.version,
    required this.text,
  });

  /// The document's associated URI.
  final String uri;

  /// The text document's language identifier (e.g. 'dart', 'rust', 'go').
  final String languageId;

  /// The version number of this document (it will increase after each change).
  final int version;

  /// The content of the document.
  final String text;

  List<String>? _lines;

  /// The lines of code in this document.
  List<String> get lines => _lines ??= text.split('\n');
}

/// Manages active/open text documents synchronized from the client.
final class TextDocumentManager {
  TextDocumentManager();

  final Map<String, LspDocument> _documents = {};

  /// Binds listeners to the server's textDocument handlers to capture updates.
  void bind(LspServer server) {
    server.textDocument.onDidOpen((params) async {
      final item = params.textDocument;
      _documents[item.uri] = LspDocument(
        uri: item.uri,
        languageId: item.languageId,
        version: item.version,
        text: item.text,
      );
    });

    server.textDocument.onDidChange((params) async {
      final uri = params.textDocument.uri;
      final changes = params.contentChanges;
      if (changes.isEmpty) {
        return;
      }

      // Because pro_lsp server defaults to Full Sync, the editor is guaranteed
      // to send the entire content in the change list (usually one item).
      final lastChange = changes.last;

      final lastChangeText =
          lastChange.asText?.text ??
          lastChange.asRangeRangeLengthText?.text ??
          '';

      final existingDoc = _documents[uri];
      if (existingDoc != null) {
        _documents[uri] = LspDocument(
          uri: uri,
          languageId: existingDoc.languageId,
          version: params.textDocument.version,
          text: lastChangeText,
        );
      }
    });

    server.textDocument.onDidClose((params) async {
      _documents.remove(params.textDocument.uri);
    });
  }

  /// Retrieves the document matching the given [uri].
  LspDocument? get(String uri) => _documents[uri];

  /// Returns all currently open documents.
  List<LspDocument> get all => _documents.values.toList();
}
