import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:stream_channel/stream_channel.dart';

/// Creates a [StreamChannel<String>] that speaks the LSP byte-framing
/// protocol (Content-Length headers) over an underlying byte channel.
///
/// Typical usage (stdio transport):
/// ```dart
/// final channel = LspByteStreamChannel.fromStdio();
/// ```
final class LspByteStreamChannel {
  LspByteStreamChannel._();

  /// Wraps the process's stdin/stdout streams with LSP framing.
  static StreamChannel<String> fromStdio() =>
      fromByteChannel(StreamChannel<List<int>>(stdin, stdout));

  /// Wraps an arbitrary [StreamChannel<List<int>>] with LSP framing.
  ///
  /// Incoming bytes are parsed as LSP messages (Content-Length header + JSON
  /// body) and emitted as [String] values on the returned channel's stream.
  ///
  /// Outgoing [String] values are encoded with Content-Length framing and
  /// passed to [channel.sink] as [List<int>] byte chunks.
  static StreamChannel<String> fromByteChannel(
    StreamChannel<List<int>> channel,
  ) {
    final parser = _Parser(channel.stream);
    final sink = _LspMessageSink(channel.sink);
    return StreamChannel<String>.withGuarantees(parser.stream, sink);
  }
}

// ---------------------------------------------------------------------------
// Incoming — Content-Length parser
// ---------------------------------------------------------------------------

/// Parses a [Stream<List<int>>] byte stream into LSP message strings.
///
/// Accumulates bytes in a buffer, detects the `\r\n\r\n` header terminator,
/// extracts the Content-Length value, then emits the exact JSON body as a
/// decoded [String].
final class _Parser {
  _Parser(Stream<List<int>> stream) {
    _subscription = stream
        .expand((bytes) => bytes)
        .listen(
          _handleByte,
          onDone: _streamCtl.close,
          onError: _streamCtl.addError,
        );
  }

  final _streamCtl = StreamController<String>();
  Stream<String> get stream => _streamCtl.stream;

  final _buffer = <int>[];
  var _headerMode = true;
  var _contentLength = -1;

  late StreamSubscription<int> _subscription;

  Future<void> close() => _subscription.cancel();

  void _handleByte(int byte) {
    _buffer.add(byte);
    if (_headerMode && _headerComplete) {
      _contentLength = _parseContentLength();
      _buffer.clear();
      _headerMode = false;
    } else if (!_headerMode && _messageComplete) {
      _streamCtl.add(utf8.decode(_buffer));
      _buffer.clear();
      _headerMode = true;
    }
  }

  bool get _messageComplete => _buffer.length >= _contentLength;

  int _parseContentLength() {
    final asString = ascii.decode(_buffer);
    final headers = asString.split('\r\n');
    final lengthHeader = headers.firstWhere(
      (h) => h.startsWith('Content-Length'),
    );
    return int.parse(lengthHeader.split(':').last.trim());
  }

  bool get _headerComplete {
    final l = _buffer.length;
    return l >= 4 &&
        _buffer[l - 1] == 10 &&
        _buffer[l - 2] == 13 &&
        _buffer[l - 3] == 10 &&
        _buffer[l - 4] == 13;
  }
}

// ---------------------------------------------------------------------------
// Outgoing — Content-Length writer
// ---------------------------------------------------------------------------

final class _LspMessageSink implements StreamSink<String> {
  _LspMessageSink(this._byteSink);

  final StreamSink<List<int>> _byteSink;

  @override
  void add(String event) {
    final body = utf8.encode(event);
    final header = ascii.encode('Content-Length: ${body.length}\r\n\r\n');
    final frame = Uint8List(header.length + body.length)
      ..setAll(0, header)
      ..setAll(header.length, body);
    _byteSink.add(frame);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      _byteSink.addError(error, stackTrace);

  @override
  Future<void> addStream(Stream<String> stream) async {
    await for (final event in stream) {
      add(event);
    }
  }

  @override
  Future<void> close() => _byteSink.close();

  @override
  Future<void> get done => _byteSink.done;
}
