// ignore_for_file: cascade_invocations, prefer_expression_function_bodies

import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:lsp_protocol/src/generated/protocol.dart';
import 'package:lsp_protocol/src/server/connection.dart';

Future<void> main() async {
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 9999);
  print('Listening on ${server.address.address}:${server.port}');

  await for (final socket in server) {
    final connection = Connection(socket, socket);

    connection.console.log('Starting LSP server...');

    connection.onInitialize((params) async {
      return const InitializeResult(
        capabilities: ServerCapabilities(
          textDocumentSync: ServerCapabilitiesTextDocumentSync1(
            value: TextDocumentSyncKind.full,
          ),
        ),
      );
    });

    connection.onDidOpenTextDocument((params) async {
      final diagnostics = _validateTextDocument(
        params.textDocument.text,
        params.textDocument.uri,
      );

      connection.sendDiagnostics(
        PublishDiagnosticsParams(
          diagnostics: diagnostics,
          uri: params.textDocument.uri,
        ),
      );
    });

    connection.onDidChangeTextDocument((params) async {
      final contentChanges = params.contentChanges
          .map((e) => TextDocumentContentChangeEvent1.fromJson(e.toJson()))
          .toList();

      final diagnostics = _validateTextDocument(
        contentChanges.last.value.text,
        params.textDocument.uri,
      );

      connection.sendDiagnostics(
        PublishDiagnosticsParams(
          diagnostics: diagnostics,
          uri: params.textDocument.uri,
        ),
      );
    });

    unawaited(connection.listen());
  }
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
