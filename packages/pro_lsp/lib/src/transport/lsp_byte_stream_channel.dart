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
  /// passed to `channel.sink` as `List<int>` byte chunks.
  static StreamChannel<String> fromByteChannel(
    StreamChannel<List<int>> channel,
  ) {
    final parser = _Parser(channel.stream);
    return StreamChannel<String>.withGuarantees(
      parser.stream,
      _LspMessageSink(channel.sink),
    );
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
    _subscription = stream.listen(
      _handleChunk,
      onDone: _streamCtl.close,
      onError: _streamCtl.addError,
    );
  }

  final _streamCtl = StreamController<String>();
  Stream<String> get stream => _streamCtl.stream;

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
        final headerEnd = _findHeaderEnd();
        if (headerEnd == -1) {
          break; // Header is not yet complete
        }

        _contentLength = _parseContentLengthFromBytes(headerEnd);
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

        _streamCtl.add(bodyStr);

        _readIndex += _contentLength;
        _headerMode = true;
        _contentLength = -1;
      }
    }
  }

  int _findHeaderEnd() {
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
    final headerStr = String.fromCharCodes(_buffer, _readIndex, headerEnd);
    const prefix = 'content-length:';
    final index = headerStr.toLowerCase().indexOf(prefix);
    if (index != -1) {
      final start = index + prefix.length;
      final end = headerStr.indexOf('\r\n', start);
      final valueStr =
          (end == -1
                  ? headerStr.substring(start)
                  : headerStr.substring(start, end))
              .trim();
              
      final length = int.tryParse(valueStr);
      if (length != null) {
        return length;
      }
    }

    throw const FormatException('Content-Length header missing or malformed');
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
    final headerStr = 'Content-Length: ${body.length}\r\n\r\n';
    final headerLen = headerStr.length;
    final frame = Uint8List(headerLen + body.length);
    for (var i = 0; i < headerLen; i++) {
      frame[i] = headerStr.codeUnitAt(i);
    }
    frame.setAll(headerLen, body);
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
