import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

/// Signature of the `connect` helper returned by [e2eHarness].
typedef E2EConnect =
    Future<({LspServer server, LspClient client})> Function({
      void Function(LspServer server)? configureServer,
      void Function(LspClient client)? configureClient,
    });

/// Installs an end-to-end harness for the current test group and returns a
/// `connect` helper.
///
/// Each `connect` call wires a real [LspServer] and [LspClient] together over
/// the actual LSP byte transport (Content-Length framing via
/// [LspByteStreamChannel]) and completes the `initialize`/`initialized`
/// handshake, so tests exercise the full typed surface exactly as a production
/// editor↔server pair would.
///
/// `configureServer` runs before `server.listen()` so handlers are registered
/// in time; `configureClient` runs before `client.start()` so incoming
/// server→client handlers are ready before the server can send anything.
///
/// All endpoints created during a test are closed automatically via a
/// registered [tearDown]. Call this once at the top of `main()`.
E2EConnect e2eHarness() {
  final openClients = <LspClient>[];
  final openServers = <LspServer>[];

  tearDown(() async {
    for (final client in openClients) {
      await client.close();
    }
    for (final server in openServers) {
      await server.close();
    }
    openClients.clear();
    openServers.clear();
  });

  return ({configureServer, configureClient}) async {
    final controller = StreamChannelController<List<int>>();

    final server = LspServer.fromChannel(controller.local)
      ..general.onInitialize(
        (params, context) async => const InitializeResult(
          capabilities: ServerCapabilities(
            hoverProvider: .bool(true),
            definitionProvider: .bool(true),
          ),
          serverInfo: ServerInfo(name: 'e2e-server', version: '1.0.0'),
        ),
      );
    configureServer?.call(server);
    openServers.add(server);
    unawaited(server.listen());

    final client = LspClient.fromChannel(controller.foreign);
    configureClient?.call(client);
    openClients.add(client);
    await client.start(
      capabilities: const ClientCapabilities(),
      clientInfo: const ClientInfo(name: 'e2e-client', version: '1.0.0'),
      processId: 1234,
    );

    return (server: server, client: client);
  };
}
