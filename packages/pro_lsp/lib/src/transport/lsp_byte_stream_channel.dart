import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:stream_channel/stream_channel.dart';

/// Creates a [StreamChannel<Object?>] that speaks the LSP byte-framing
/// protocol (Content-Length headers) over an underlying byte channel.
///
/// Typical usage (stdio transport):
/// ```dart
/// final channel = LspByteStreamChannel.fromStdio();
/// ```
final class LspByteStreamChannel {
  LspByteStreamChannel._();

  /// Wraps the process's stdin/stdout streams with LSP framing.
  static StreamChannel<Object?> fromStdio() =>
      fromByteChannel(StreamChannel<List<int>>(stdin, stdout));

  /// Wraps an arbitrary [StreamChannel<List<int>>] with LSP framing.
  ///
  /// Incoming bytes are parsed as LSP messages (Content-Length header + JSON
  /// body) and emitted as [Object?] values on the returned channel's stream.
  ///
  /// Outgoing [Object?] values are encoded with Content-Length framing and
  /// passed to `channel.sink` as `List<int>` byte chunks.
  static StreamChannel<Object?> fromByteChannel(
    StreamChannel<List<int>> channel,
  ) {
    final parser = _Parser(channel.stream);
    return StreamChannel<Object?>.withGuarantees(
      parser.stream,
      _LspMessageSink(channel.sink),
    );
  }
}

// ---------------------------------------------------------------------------
// Incoming — Content-Length parser
// ---------------------------------------------------------------------------

/// Parses a [Stream<List<int>>] byte stream into LSP message objects.
///
/// Accumulates bytes in a buffer, detects the `\r\n\r\n` header terminator,
/// extracts the Content-Length value, then emits the exact JSON body as a
/// decoded [Object?].
final class _Parser {
  _Parser(Stream<List<int>> stream) {
    _subscription = stream.listen(
      _handleChunk,
      onDone: _streamCtl.close,
      onError: _streamCtl.addError,
    );
  }

  static const int kMaxMessageSize = 50 * 1024 * 1024; // 50MB

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

    // Reset indices to start of buffer if it is empty to avoid compaction/grow
    if (_readIndex == _writeIndex) {
      _readIndex = 0;
      _writeIndex = 0;
      // Shrink buffer if it had grown large but is now empty
      if (_buffer.length > 4096) {
        _buffer = Uint8List(4096);
      }
    }

    final neededCapacity = _writeIndex + chunk.length;
    if (neededCapacity > _buffer.length) {
      final activeLength = _writeIndex - _readIndex;
      if (_readIndex > 0 && activeLength + chunk.length <= _buffer.length) {
        // Compact: shift remaining active bytes to start
        _buffer.setRange(0, activeLength, _buffer, _readIndex);
        _readIndex = 0;
        _writeIndex = activeLength;
      } else {
        // Grow: double capacity or resize to fit active bytes + new chunk
        var newSize = _buffer.length * 2;
        while (newSize < activeLength + chunk.length) {
          newSize *= 2;
        }
        final newBuffer = Uint8List(newSize);
        if (activeLength > 0) {
          newBuffer.setRange(0, activeLength, _buffer, _readIndex);
        }
        _buffer = newBuffer;
        _readIndex = 0;
        _writeIndex = activeLength;
      }
    }

    _buffer.setAll(_writeIndex, chunk);
    _writeIndex += chunk.length;

    while (true) {
      final available = _writeIndex - _readIndex;
      if (_headerMode) {
        final headerEnd = _findHeaderEnd(chunk.length);
        if (headerEnd == -1) {
          break; // Header is not yet complete
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
        if (available < _contentLength) {
          break; // Message body is not yet complete
        }

        final bodyStr = utf8.decoder.convert(
          _buffer,
          _readIndex,
          _readIndex + _contentLength,
        );

        try {
          final bodyObj = jsonDecode(bodyStr);
          _streamCtl.add(bodyObj);
        } on FormatException catch (e, st) {
          _streamCtl.addError(e, st);
        }

        _readIndex += _contentLength;
        _headerMode = true;
        _contentLength = -1;
      }
    }
  }

  int _findHeaderEnd(int lastChunkLength) {
    // Only search starting from the newly appended chunk
    // (plus boundary overlap)
    final start = math.max(_readIndex, _writeIndex - lastChunkLength - 3);
    final limit = _writeIndex - 3;
    for (var i = start; i < limit; i++) {
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
    final limit = headerEnd - 15; // Length of 'content-length:'
    int? prefixIndex;

    for (var i = _readIndex; i <= limit; i++) {
      if (_isContentLengthPrefix(i)) {
        prefixIndex = i;
        break;
      }
    }

    if (prefixIndex != null) {
      var start = prefixIndex + 15;
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
        for (var i = start; i < end; i++) {
          length = length * 10 + (_buffer[i] - 48);
          if (length > kMaxMessageSize) {
            throw FormatException(
              'Content-Length $length exceeds limit of $kMaxMessageSize bytes',
            );
          }
        }
        return length;
      }
    }
    throw const FormatException('Content-Length header missing or malformed');
  }

  bool _isContentLengthPrefix(int index) {
    const chars = [
      99,
      111,
      110,
      116,
      101,
      110,
      116,
      45,
      108,
      101,
      110,
      103,
      116,
      104,
      58,
    ];
    for (var i = 0; i < chars.length; i++) {
      final b = _buffer[index + i];
      final target = chars[i];
      if (target == 45 || target == 58) {
        if (b != target) {
          return false;
        }
      } else {
        if ((b | 32) != target) {
          return false; // Case-insensitive ASCII match
        }
      }
    }
    return true;
  }
}

// ---------------------------------------------------------------------------
// Outgoing — Content-Length writer
// ---------------------------------------------------------------------------

final class _LspMessageSink implements StreamSink<Object?> {
  _LspMessageSink(this._byteSink);

  final StreamSink<List<int>> _byteSink;
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
  Future<void> close() => _byteSink.close();

  @override
  Future<void> get done => _byteSink.done;
}
