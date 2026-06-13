import 'dart:async';

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
  List<String> get lines =>
      _lines ??= text.replaceAll('\r\n', '\n').split('\n');
}

/// Manages active/open text documents synchronized from the client.
final class TextDocumentManager {
  TextDocumentManager();

  final Map<String, LspDocument> _documents = {};

  final _didOpenController = StreamController<LspDocument>.broadcast();
  final _didChangeController = StreamController<LspDocument>.broadcast();
  final _didCloseController = StreamController<LspDocument>.broadcast();

  final List<void Function()> _registrations = [];

  /// Stream of documents that were opened.
  Stream<LspDocument> get onDidOpen => _didOpenController.stream;

  /// Stream of documents that were changed.
  Stream<LspDocument> get onDidChange => _didChangeController.stream;

  /// Stream of documents that were closed.
  Stream<LspDocument> get onDidClose => _didCloseController.stream;

  /// Binds listeners to the server's textDocument handlers to capture updates.
  void bind(LspServer server) {
    if (_registrations.isNotEmpty) {
      return;
    }
    _registrations
      ..add(
        server.textDocument.onDidOpen((params, context) async {
          final item = params.textDocument;
          final doc = LspDocument(
            uri: item.uri,
            languageId: item.languageId,
            version: item.version,
            text: item.text,
          );
          _documents[item.uri] = doc;
          _didOpenController.add(doc);
        }),
      )
      ..add(
        server.textDocument.onDidChange((params, context) async {
          final uri = params.textDocument.uri;
          final changes = params.contentChanges;
          if (changes.isEmpty) {
            return;
          }

          final existingDoc = _documents[uri];
          if (existingDoc != null) {
            var text = existingDoc.text;
            for (final change in changes) {
              final fullText = change.asText;
              if (fullText != null) {
                text = fullText.text;
              } else {
                final rangeChange = change.asRangeRangeLengthText;
                if (rangeChange != null) {
                  final startOffset = _positionToOffset(
                    text,
                    rangeChange.range.start,
                  );
                  final endOffset = _positionToOffset(
                    text,
                    rangeChange.range.end,
                  );
                  text = text.replaceRange(
                    startOffset,
                    endOffset,
                    rangeChange.text,
                  );
                }
              }
            }

            final updated = LspDocument(
              uri: uri,
              languageId: existingDoc.languageId,
              version: params.textDocument.version,
              text: text,
            );
            _documents[uri] = updated;
            _didChangeController.add(updated);
          }
        }),
      )
      ..add(
        server.textDocument.onDidClose((params, context) async {
          final doc = _documents.remove(params.textDocument.uri);
          if (doc != null) {
            _didCloseController.add(doc);
          }
        }),
      );
  }

  /// Unbinds document manager listeners from the server.
  void unbind() {
    for (final dispose in _registrations) {
      dispose();
    }
    _registrations.clear();
  }

  /// Retrieves the document matching the given [uri].
  LspDocument? get(String uri) => _documents[uri];

  /// Returns all currently open documents.
  List<LspDocument> get all => _documents.values.toList();

  /// Closes all event streams and unbinds listeners.
  void close() {
    unbind();
    unawaited(_didOpenController.close());
    unawaited(_didChangeController.close());
    unawaited(_didCloseController.close());
  }
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

  /// Unbinds this manager from the client.
  void unbind() {
    _client = null;
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

int _positionToOffset(String text, Position position) {
  var line = 0;
  var offset = 0;
  while (line < position.line && offset < text.length) {
    final nextNewline = text.indexOf('\n', offset);
    if (nextNewline == -1) {
      return text.length;
    }
    offset = nextNewline + 1;
    line++;
  }
  final lineEnd = text.indexOf('\n', offset);
  final maxChar = (lineEnd == -1 ? text.length : lineEnd) - offset;
  final char = position.character.clamp(0, maxChar);
  return offset + char;
}
