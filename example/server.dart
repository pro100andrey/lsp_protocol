import 'dart:io';

import 'package:lsp_protocol/src/generated/protocol.dart';
import 'package:lsp_protocol/src/server/connection.dart';

Future<void> main() async {
  final inputStream = stdin;
  final outputSink = stdout;
  final connection = Connection(inputStream, outputSink)
    ..onInitialize((params) async {
      final testDocumentSync = TextDocumentSyncOptions(
        openClose: true,
      );
      // Handle initialization
      return InitializeResult(
        capabilities: ServerCapabilities(
          textDocumentSync: testDocumentSync as OrRefType,
        ),
      );
    });

    await connection.listen();
}
