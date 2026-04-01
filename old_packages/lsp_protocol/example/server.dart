//
// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:lsp_protocol/lsp_protocol.dart';

Future<void> main() async {
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 9999);
  print('[server] Listening on ${server.address.address}:${server.port}');

  await for (final socket in server) {
    print(
      '[server] Client connected: '
      '${socket.remoteAddress.address}:${socket.remotePort}',
    );

    final connection = Connection(socket, socket);

    connection
      // ── Lifecycle ─────────────────────────────────────────────────
      ..onInitializeRequest((params) async {
        print('[server] >>> initialize (${params.clientInfo?['name']})');
        connection.console.log('Received initialize request.');

        return InitializeResult(
          capabilities: ServerCapabilities(
            textDocumentSync: TextDocumentSyncKind.full.value,
            diagnosticProvider: const DiagnosticOptions(
              interFileDependencies: false,
              workspaceDiagnostics: false,
            ).toJson(),
          ),
          serverInfo: {'name': 'My LSP Server', 'version': '1.0.0'},
        );
      })
      ..onInitializedNotification((_) async {
        print('[server] >>> initialized');
        connection.console.info('Server fully initialized.');
      })
      ..onShutdownRequest(() async {
        print('[server] >>> shutdown');
      })
      ..onExitNotification(() async {
        print('[server] >>> exit');
        await connection.close();
      })
      // ── Text document sync ────────────────────────────────────────
      ..onTextDocumentDidOpenNotification((params) async {
        final uri = params.textDocument.uri;
        print('[server] >>> textDocument/didOpen: $uri');
        connection.console.log('Opened: $uri');
      })
      ..onTextDocumentDidChangeNotification((params) async {
        final uri = params.textDocument.uri;
        print('[server] >>> textDocument/didChange: $uri');
      })
      ..onTextDocumentDidCloseNotification((params) async {
        final uri = params.textDocument.uri;
        print('[server] >>> textDocument/didClose: $uri');
      })
      // ── Diagnostics ───────────────────────────────────────────────
      ..onTextDocumentDiagnosticRequest((params) async {
        final uri = params.textDocument.uri;
        print('[server] >>> textDocument/diagnostic: $uri');

        // Return an empty full-document diagnostic report.
        return {'kind': 'full', 'items': <Object?>[]};
      });

    unawaited(connection.listen());
  }
}
