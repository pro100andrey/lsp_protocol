import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:stream_channel/stream_channel.dart';

/// A [StreamChannel] implementation that speaks the LSP byte-framing protocol.
///
/// The Language Server Protocol (LSP) uses a simple byte-framing protocol
/// based on HTTP-like headers to delimit JSON-RPC messages:
///
/// ```
/// Content-Length: <length>\r\n
/// \r\n
/// <JSON body>
/// ```
///
/// This channel wraps an underlying byte stream (e.g. stdin/stdout) and
/// transparently handles:
///
/// - **Parsing** incoming bytes into JSON-RPC message objects
/// - **Framing** outgoing JSON-RPC messages with Content-Length headers
///
/// ## Protocol Details
///
/// Each message consists of:
///
/// 1. A header line: `Content-Length: <N>\r\n`
/// 2. A blank line: `\r\n`
/// 3. The JSON body: exactly `<N>` bytes
///
/// The parser handles partial messages, multiple messages in a single chunk,
/// and buffers bytes until a complete message is available.
///
/// ## Usage
///
/// **Stdio transport (standard LSP process):**
/// ```dart
/// final server = LspServer(); // Automatically binds to stdin/stdout
/// await server.listen();
/// ```
///
/// **Custom transport (TCP, pipes, etc.):**
/// ```dart
/// final tcpSocket = await Socket.connect('localhost', 6000);
/// final server = LspServer.fromChannel(
///   StreamChannel<List<int>>(tcpSocket, tcpSocket),
/// );
/// await server.listen();
/// ```
final class LspByteStreamChannel {
  LspByteStreamChannel._();

  /// Creates a channel using the process's stdin/stdout as the byte transport.
  ///
  /// This is the standard LSP process communication model. The server
  /// reads from stdin and writes to stdout, which is how most LSP clients
  /// communicate with language servers.
  ///
  /// Example:
  /// ```dart
  /// void main() async {
  ///   final server = LspServer();
  ///   // ... configure handlers ...
  ///   await server.listen();
  /// }
  /// ```
  static LspByteStreamChannelResult fromStdio() =>
      fromByteChannel(StreamChannel<List<int>>(stdin, stdout));

  /// Wraps an arbitrary [StreamChannel<List<int>>] with LSP byte-framing.
  ///
  /// The returned [LspByteStreamChannelResult] contains:
  /// - [LspByteStreamChannelResult.channel]: the LSP-framed stream channel
  /// - [LspByteStreamChannelResult.cleanup]:
  ///   function to cancel the input subscription
  ///
  /// ## Error Handling
  ///
  /// - Malformed headers (missing or invalid `Content-Length`) produce
  ///   a [FormatException] on the stream's error channel
  /// - Invalid JSON bodies produce a [FormatException] on the error channel
  /// - Maximum message size is 50MB ([_Parser.kMaxMessageSize])
  ///
  /// ## Disposal
  ///
  /// Always call [LspByteStreamChannelResult.cleanup] when done, especially
  /// for non-stdio transports (TCP, pipes, etc.):
  /// ```dart
  /// final result = LspByteStreamChannel.fromByteChannel(myChannel);
  /// try {
  ///   // use result.channel...
  /// } finally {
  ///   await result.cleanup();
  /// }
  /// ```
  static LspByteStreamChannelResult fromByteChannel(
    StreamChannel<List<int>> channel,
  ) {
    final parser = _Parser(channel.stream);

    return LspByteStreamChannelResult(
      StreamChannel<Object?>.withGuarantees(
        parser.stream,
        _LspMessageSink(channel.sink, onClosed: parser.close),
      ),
      parser.close,
    );
  }
}

/// Result of [LspByteStreamChannel.fromByteChannel] containing the framed
/// channel and a cleanup function.
///
/// Use [channel] for LSP communication and call [cleanup] when done
/// (especially for non-stdio transports like TCP sockets) to cancel
/// the input subscription and prevent resource leaks.
final class LspByteStreamChannelResult {
  LspByteStreamChannelResult(this.channel, this.cleanup);

  /// The LSP-framed stream channel for JSON-RPC communication.
  final StreamChannel<Object?> channel;

  /// Cleanup function that cancels the input subscription.
  ///
  /// Call this when done with the channel to prevent resource leaks.
  final Future<void> Function() cleanup;
}

// Incoming — Content-Length parser

/// Parses a [Stream<List<int>>] byte stream into LSP message objects.
///
/// Implements the LSP byte-framing protocol parser:
///
/// 1. Accumulates incoming bytes in a resizable buffer
/// 2. Detects the `\r\n\r\n` header terminator
/// 3. Parses the `Content-Length` header value
/// 4. Collects exactly `<Content-Length>` bytes for the JSON body
/// 5. Decodes UTF-8 and parses JSON, emitting the result
///
/// ## Buffer Management
///
/// Uses a circular buffer with automatic compaction and growth:
/// - Starts with 4KB capacity
/// - Doubles when growth is needed
/// - Compacts remaining bytes when space is available
/// - Shrinks back to 4KB when the buffer becomes empty
///
/// ## Message Size Limit
///
/// Maximum message size is 50MB ([kMaxMessageSize]). Messages exceeding
/// this limit are rejected with a [FormatException].
final class _Parser {
  _Parser(Stream<List<int>> stream) {
    _subscription = stream.listen(
      _handleChunk,
      onDone: _streamCtl.close,
      onError: _streamCtl.addError,
    );
  }

  static const int kMaxMessageSize = 50 * 1024 * 1024; // 50MB

  /// Maximum size of the header block (everything up to and including the
  /// `\r\n\r\n` terminator). LSP headers are a handful of bytes; this cap stops
  /// a peer from exhausting memory (and CPU) by streaming a header that never
  /// terminates.
  static const int kMaxHeaderSize = 8 * 1024; // 8KB

  final _streamCtl = StreamController<Object?>();
  Stream<Object?> get stream => _streamCtl.stream;

  var _buffer = Uint8List(4096);
  var _readIndex = 0;
  var _writeIndex = 0;
  var _headerMode = true;
  var _contentLength = -1;

  late StreamSubscription<List<int>> _subscription;

  Future<void> close() => _subscription.cancel();

  void _handleChunk(List<int> chunk) {
    if (chunk.isEmpty) {
      return;
    }

    if (_readIndex == _writeIndex) {
      _readIndex = 0;
      _writeIndex = 0;

      if (_buffer.length > 4096) {
        _buffer = Uint8List(4096);
      }
    }

    final activeLength = _writeIndex - _readIndex;
    if (_writeIndex + chunk.length > _buffer.length) {
      if (_readIndex > 0 && activeLength + chunk.length <= _buffer.length) {
        _buffer.setRange(0, activeLength, _buffer, _readIndex);
      } else {
        var newSize = _buffer.length * 2;
        while (newSize < activeLength + chunk.length) {
          newSize *= 2;
        }
        _buffer = Uint8List(newSize)
          ..setRange(0, activeLength, _buffer, _readIndex);
      }
      _readIndex = 0;
      _writeIndex = activeLength;
    }

    _buffer.setAll(_writeIndex, chunk);
    _writeIndex += chunk.length;

    while (true) {
      if (_headerMode) {
        final headerEnd = _findHeaderEnd();
        if (headerEnd == -1) {
          // No terminator yet. Guard against a peer that streams an
          // unbounded header and never sends `\r\n\r\n`: cap the buffered
          // header bytes and tear down rather than growing forever.
          if (_writeIndex - _readIndex > kMaxHeaderSize) {
            _streamCtl.addError(
              const FormatException(
                'LSP header exceeds $kMaxHeaderSize bytes with no '
                r'`\r\n\r\n` terminator',
              ),
            );
            unawaited(_subscription.cancel());
            unawaited(_streamCtl.close());
          }
          break;
        }

        try {
          _contentLength = _parseContentLengthFromBytes(headerEnd);
        } on FormatException catch (e, st) {
          _streamCtl.addError(e, st);
          unawaited(_subscription.cancel());
          unawaited(_streamCtl.close());
          break;
        }
        _readIndex = headerEnd;
        _headerMode = false;
      } else {
        if (_writeIndex - _readIndex < _contentLength) {
          break; // Message body is not yet complete
        }

        try {
          final bodyStr = utf8.decoder.convert(
            _buffer,
            _readIndex,
            _readIndex + _contentLength,
          );
          _streamCtl.add(jsonDecode(bodyStr));
        } on FormatException catch (e, st) {
          _streamCtl.addError(e, st);
        }

        _readIndex += _contentLength;
        _headerMode = true;
        _contentLength = -1;
      }
    }
  }

  int _findHeaderEnd() {
    // In header mode the active region [_readIndex, _writeIndex) only ever
    // holds unterminated header bytes (the previous body was already consumed
    // before we returned to header mode), so this scan is over a tiny range.
    final limit = _writeIndex - 3;
    for (var i = _readIndex; i < limit; i++) {
      if (_buffer[i] == 13 && // \r
          _buffer[i + 1] == 10 && // \n
          _buffer[i + 2] == 13 && // \r
          _buffer[i + 3] == 10) {
        // \n
        return i + 4;
      }
    }
    return -1;
  }

  int _parseContentLengthFromBytes(int headerEnd) {
    for (var i = _readIndex; i <= headerEnd - 15; i++) {
      if (_isContentLengthPrefix(i)) {
        var start = i + 15;
        while (start < headerEnd &&
            (_buffer[start] == 32 || _buffer[start] == 9)) {
          start++;
        }

        var end = start;
        while (end < headerEnd && _buffer[end] >= 48 && _buffer[end] <= 57) {
          end++;
        }

        if (end > start) {
          var length = 0;
          for (var j = start; j < end; j++) {
            length = length * 10 + (_buffer[j] - 48);
            if (length > kMaxMessageSize) {
              throw FormatException(
                'Content-Length $length exceeds limit of '
                '$kMaxMessageSize bytes',
              );
            }
          }
          return length;
        }
      }
    }
    throw const FormatException('Content-Length header missing or malformed');
  }

  bool _isContentLengthPrefix(int index) {
    const chars = [
      99, 111, 110, 116, 101, 110, 116, 45, 108, 101, 110, 103, 116, 104, 58, //
    ];
    for (var i = 0; i < chars.length; i++) {
      final b = _buffer[index + i];
      final t = chars[i];

      if (b != t && (t < 97 || t > 122 || (b | 32) != t)) {
        return false;
      }
    }

    return true;
  }
}

// Outgoing — Content-Length writer

/// Implements [StreamSink<Object?>] with LSP byte-framing for outgoing
/// messages.
///
/// When [add] is called with a JSON-encodable object, this sink:
///
/// 1. Encodes the object to JSON using [JsonUtf8Encoder]
/// 2. Computes the byte length of the encoded body
/// 3. Prepends the header: `Content-Length: <N>\r\n\r\n`
/// 4. Writes the complete frame (header + body) as a single [Uint8List]
///    to the underlying [_byteSink]
///
/// The header is encoded using ASCII, and the body is encoded using UTF-8
/// (via [JsonUtf8Encoder]). The resulting frame is always written atomically
/// as a single [Uint8List] to avoid partial messages.
final class _LspMessageSink implements StreamSink<Object?> {
  _LspMessageSink(this._byteSink, {this.onClosed});

  final StreamSink<List<int>> _byteSink;
  final FutureOr<void> Function()? onClosed;
  static final _encoder = JsonUtf8Encoder();

  @override
  void add(Object? event) {
    final body = _encoder.convert(event);
    final headerBytes = ascii.encode('Content-Length: ${body.length}\r\n\r\n');
    final frame = Uint8List(headerBytes.length + body.length)
      ..setAll(0, headerBytes)
      ..setAll(headerBytes.length, body);
    _byteSink.add(frame);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      _byteSink.addError(error, stackTrace);

  @override
  Future<void> addStream(Stream<Object?> stream) async {
    await for (final event in stream) {
      add(event);
    }
  }

  @override
  Future<void> close() async {
    if (onClosed != null) {
      final result = onClosed!();
      if (result is Future) {
        await result;
      }
    }
    await _byteSink.close();
  }

  @override
  Future<void> get done => _byteSink.done;
}
