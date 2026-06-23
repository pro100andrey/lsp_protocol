import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';

/// Represents an open text document in the virtual file system of the LSP
/// server.
final class LspDocument {
  LspDocument({
    required this.uri,
    required this.languageId,
    required this.version,
    required String text,
  }) : text = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n');

  /// The document's associated URI.
  final String uri;

  /// The text document's language identifier (e.g. 'dart', 'rust', 'go').
  final String languageId;

  /// The version number of this document (it will increase after each change).
  final int version;

  /// The content of the document.
  final String text;

  /// The lines of code in this document.
  List<String> get lines => _lines ??= text.split('\n');
  List<String>? _lines;

  /// The character offsets of the start of each line in [text].
  List<int> get lineStarts => _lineStarts ??= _computeLineStarts(text);
  List<int>? _lineStarts;
}

/// Manages active/open text documents synchronized from the client.
final class TextDocumentManager extends LspFeature {
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
  @override
  void register(LspServer server) {
    if (_registrations.isNotEmpty) {
      return;
    }

    _registrations
      ..add(
        server.textDocument.onDidOpen((params, context) async {
          final item = params.textDocument;
          final doc = LspDocument(
            uri: item.uri,
            languageId: item.languageId.value,
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
            List<int>? currentLineStarts = existingDoc.lineStarts;

            for (final change in changes) {
              final fullText = change.asTextDocumentContentChangeWholeDocument;
              if (fullText != null) {
                text = fullText.text;
                currentLineStarts = null;
              } else {
                final rangeChange =
                    change.asTextDocumentContentChangePartial;
                if (rangeChange != null) {
                  final starts = currentLineStarts ??= _computeLineStarts(text);
                  final startOffset = _positionToOffset(
                    text,
                    starts,
                    rangeChange.range.start,
                  );
                  final endOffset = _positionToOffset(
                    text,
                    starts,
                    rangeChange.range.end,
                  );
                  text = text.replaceRange(
                    startOffset,
                    endOffset,
                    rangeChange.text,
                  );
                  currentLineStarts = null; // Invalidate for subsequent changes
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

  /// Retrieves the document matching the given [uri].
  LspDocument? get(String uri) => _documents[uri];

  /// Returns all currently open documents.
  List<LspDocument> get all => _documents.values.toList();

  @override
  FutureOr<void> dispose() async {
    for (final dispose in _registrations) {
      dispose();
    }
    _registrations.clear();
    _documents.clear();

    await _didOpenController.close();
    await _didChangeController.close();
    await _didCloseController.close();
  }
}

int _positionToOffset(String text, List<int> starts, Position position) {
  if (position.line >= starts.length) {
    return text.length;
  }

  final offset = starts[position.line];
  final nextOffset = (position.line + 1 < starts.length)
      ? starts[position.line + 1]
      : text.length;

  var lineLength = nextOffset - offset;

  if (lineLength > 0 && text.codeUnitAt(nextOffset - 1) == 10) {
    lineLength--;

    if (lineLength > 0 && text.codeUnitAt(nextOffset - 2) == 13) {
      lineLength--;
    }
  }

  final char = position.character.clamp(0, lineLength);

  return offset + char;
}

List<int> _computeLineStarts(String text) {
  final starts = [0];
  var offset = 0;

  while (offset < text.length) {
    final next = text.indexOf('\n', offset);
    if (next == -1) {
      break;
    }

    offset = next + 1;
    starts.add(offset);
  }

  return starts;
}
