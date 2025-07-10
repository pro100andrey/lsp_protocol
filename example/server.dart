import 'dart:io';

import 'package:collection/collection.dart';
import 'package:lsp_protocol/src/generated/protocol.dart';
import 'package:lsp_protocol/src/server/connection.dart';

Future<void> main() async {
  final inputStream = stdin;
  final outputSink = stdout;
  final connection = Connection(inputStream, outputSink);

  connection.console.log('Starting LSP server...');

  connection
    ..onInitialize((params) async {
      final testDocumentSync = TextDocumentSyncOptions(
        openClose: true,
      );
      // TODO(Andrii): Unknown type for textDocumentSync
      // Handle initialization
      return InitializeResult(
        capabilities: ServerCapabilities(),
      );
    })
    ..onDidOpenTextDocument((params) async {
      final diagnostics = _validateTextDocument(
        params.textDocument.text,
        params.textDocument.uri,
      );

      // Send back an event notifying the client of issues we want them to
      // render. To clear issues the server is responsible for sending an
      // empty list.
      connection.sendDiagnostics(
        PublishDiagnosticsParams(
          diagnostics: diagnostics,
          uri: params.textDocument.uri,
        ),
      );
    })
    ..onDidChangeTextDocument(
      (params) async {
        // TODO(Andrii): Unknown type for contentChanges.
        final _ = params.contentChanges;

        // Our custom validation logic
        final diagnostics = _validateTextDocument(
          'not supported',
          params.textDocument.uri,
        );

        connection.sendDiagnostics(
          PublishDiagnosticsParams(
            diagnostics: diagnostics,
            uri: params.textDocument.uri,
          ),
        );
      },
    );

  await connection.listen();
}

List<Diagnostic> _validateTextDocument(String text, String sourcePath) {
  final pattern = RegExp(r'\b[A-Z]{2,}\b');

  final lines = text.split('\n');

  final matches = lines.map(pattern.allMatches);

  final diagnostics = matches
      .mapIndexed(
        (line, lineMatches) => _convertPatternToDiagnostic(lineMatches, line),
      )
      .reduce((aggregate, diagnostics) => [...aggregate, ...diagnostics])
      .toList();

  return diagnostics;
}

// Convert each line that has uppercase strings into a list of diagnostics.
// The line "AAA bbb CCC" would be converted into two diagnostics:
// One for "AAA".
// One for "CCC".
Iterable<Diagnostic> _convertPatternToDiagnostic(
  Iterable<RegExpMatch> matches,
  int line,
) => matches.map(
  (match) => Diagnostic(
    message:
        '${match.input.substring(match.start, match.end)} is all uppercase.',
    range: Range(
      start: Position(character: match.start, line: line),
      end: Position(character: match.end, line: line),
    ),
  ),
);
