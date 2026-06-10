import 'dart:async';
import 'dart:io';

import 'package:lsp_test_server/src/server_runner.dart';
import 'package:stream_channel/stream_channel.dart';

Future<void> main(List<String> args) async {
  final socketPort = _parseSocketPort(args);

  if (socketPort != null) {
    await _runSocket(socketPort);
  } else {
    await ServerRunner().run();
  }
}

/// Returns the port number from `--socket <port>`, or `null` for stdio mode.
int? _parseSocketPort(List<String> args) {
  final idx = args.indexOf('--socket');
  if (idx == -1 || idx + 1 >= args.length) {
    return null;
  }
  return int.tryParse(args[idx + 1]);
}

Future<void> _runSocket(int port) async {
  final serverSocket = await ServerSocket.bind('127.0.0.1', port);
  stderr.writeln('[lsp_test_server] Listening on port $port');

  await for (final socket in serverSocket) {
    stderr.writeln(
      '[lsp_test_server] Client connected from '
      '${socket.remoteAddress.address}:${socket.remotePort}',
    );
    final channel = StreamChannel<List<int>>(socket, socket);
    unawaited(
      ServerRunner.fromChannel(channel).run().then((_) {
        socket.destroy();
        stderr.writeln('[lsp_test_server] Client disconnected');
      }),
    );
  }
}
