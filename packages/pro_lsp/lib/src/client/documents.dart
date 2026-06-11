import '../generated/models/structures.dart';
import '../generated/models/unions.dart';
import '../server/documents.dart';
import 'lsp_client.dart';

/// Manages text documents on the client side and synchronizes them with the
/// server.
final class ClientDocumentManager {
  ClientDocumentManager();

  final Map<String, LspDocument> _documents = {};
  LspClient? _client;

  /// Binds this manager to an [LspClient] to enable automatic sync.
  void bind(LspClient client) {
    _client = client;
  }

  /// Opens a document and notifies the server via `textDocument/didOpen`.
  void open({
    required String uri,
    required String languageId,
    required String text,
    int version = 1,
  }) {
    if (_documents.containsKey(uri)) {
      return;
    }
    final doc = LspDocument(
      uri: uri,
      languageId: languageId,
      version: version,
      text: text,
    );
    _documents[uri] = doc;

    _client?.server.textDocument.didOpen(
      DidOpenTextDocumentParams(
        textDocument: TextDocumentItem(
          uri: uri,
          languageId: languageId,
          version: version,
          text: text,
        ),
      ),
    );
  }

  /// Updates a document's content and notifies the server via
  /// `textDocument/didChange`.
  ///
  /// Currently performs a Full Sync (sending the entire [text]).
  void update(String uri, String text, {int? version}) {
    final existing = _documents[uri];
    if (existing == null) {
      return;
    }

    final newVersion = version ?? existing.version + 1;

    _documents[uri] = LspDocument(
      uri: uri,
      languageId: existing.languageId,
      version: newVersion,
      text: text,
    );

    _client?.server.textDocument.didChange(
      DidChangeTextDocumentParams(
        textDocument: VersionedTextDocumentIdentifier(
          uri: uri,
          version: newVersion,
        ),
        contentChanges: [
          TextDocumentContentChangeEvent({'text': text}),
        ],
      ),
    );
  }

  /// Closes a document and notifies the server via `textDocument/didClose`.
  void close(String uri) {
    _documents.remove(uri);
    _client?.server.textDocument.didClose(
      DidCloseTextDocumentParams(
        textDocument: TextDocumentIdentifier(uri: uri),
      ),
    );
  }

  /// Retrieves the document matching the given [uri].
  LspDocument? get(String uri) => _documents[uri];

  /// Returns all currently open documents.
  List<LspDocument> get all => _documents.values.toList();
}
