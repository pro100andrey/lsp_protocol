import 'package:pro_lsp/pro_lsp.dart';
import 'package:pro_lsp/pro_lsp_client.dart';

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
    server.textDocument.onDidOpen((params, context) async {
      final item = params.textDocument;
      _documents[item.uri] = LspDocument(
        uri: item.uri,
        languageId: item.languageId,
        version: item.version,
        text: item.text,
      );
    });

    server.textDocument.onDidChange((params, context) async {
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

    server.textDocument.onDidClose((params, context) async {
      _documents.remove(params.textDocument.uri);
    });
  }

  /// Retrieves the document matching the given [uri].
  LspDocument? get(String uri) => _documents[uri];

  /// Returns all currently open documents.
  List<LspDocument> get all => _documents.values.toList();
}

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
          .text(text: text),
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
