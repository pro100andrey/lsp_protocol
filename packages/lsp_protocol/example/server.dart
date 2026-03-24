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
      '[server] Client connected: ${socket.remoteAddress.address}:${socket.remotePort}',
    );
    final connection = Connection(socket, socket);

    connection.onInitializeRequest((params) async {
      print('[server] >>> onInitializeRequest fired!');
      connection.console.log('Received initialize request.');

      return {};
    });

    connection.onDocumentDiagnosticRequest((uri) async {
      print('[server] >>> onDocumentDiagnosticRequest: $uri');
      return []; // пока нет диагностик
    });

    unawaited(connection.listen());
  }
}
