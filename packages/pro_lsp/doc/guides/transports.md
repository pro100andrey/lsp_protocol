<!-- markdownlint-disable-file MD004 -->
# Transports

`pro_lsp` is transport-agnostic: it speaks the LSP byte-framing protocol
(`Content-Length` headers) over any byte stream. The default is stdio, but you
can run over a TCP socket or any `StreamChannel<List<int>>` without changing a
single handler.

See also [Testing](./testing.md), which uses the same channel abstraction to
wire endpoints together in memory.

---

## stdio (the default)

`server.listen()` binds to `stdin` / `stdout` automatically — the standard LSP
process model that most editors use to launch a language server:

```dart
final server = LspServer();
// register handlers...
await server.listen(); // reads stdin, writes stdout, blocks until exit
```

> **Never write to `stdout` from a stdio server.** On stdio, `stdout` *is* the
> protocol channel — a stray `print()` corrupts the JSON-RPC stream. Log to
> `stderr`, a file, or the `window/logMessage` notification, and route framework
> errors through `server.onError`.

---

## Sockets and custom byte streams

To run over a socket or any other byte stream, hand the raw
`StreamChannel<List<int>>` to `LspServer.fromChannel`. It applies LSP
byte-framing for you, and `close()` releases the transport:

```dart
import 'dart:io';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:stream_channel/stream_channel.dart';

void main() async {
  final serverSocket = await ServerSocket.bind('localhost', 3000);
  await for (final socket in serverSocket) {
    // A Socket is both a Stream<Uint8List> and an IOSink.
    final channel = StreamChannel<List<int>>(socket, socket);

    final server = LspServer.fromChannel(channel);
    // register handlers...
    await server.listen(); // closes (and releases the socket) when the peer exits
  }
}
```

The client side is symmetric — `LspClient.fromChannel(channel)` over the same
kind of `StreamChannel`.

---

## Low-level framing

For lower-level control you can frame a channel yourself with
`LspByteStreamChannel.fromByteChannel(channel)` and drive an `LspConnection`
directly. It returns a result holding the framed `channel` plus a `cleanup`
function you must call when done:

```dart
final result = LspByteStreamChannel.fromByteChannel(myChannel);
try {
  // use result.channel with an LspConnection...
} finally {
  await result.cleanup();
}
```

Most servers should prefer `LspServer.fromChannel`, which handles framing and
cleanup for you.

---

## Where to go next

* [Building a server](./server.md) — registering handlers and lifecycle.
* [Building a client](./client.md) — the client end of any transport.
* [Testing](./testing.md) — an in-memory transport for fast round-trip tests.
