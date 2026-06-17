// Standalone benchmark: current hand-rolled _Parser core vs a simple
// "compact-every-message" parser. Run: dart run benchmark/parser_bench.dart
//
// This is a throwaway micro-benchmark harness, not production code.
// ignore_for_file: avoid_print, avoid_dynamic_calls, unreachable_from_main
// ignore_for_file: always_put_control_body_on_new_line, unnecessary_parenthesis
import 'dart:convert';
import 'dart:typed_data';

// ---------------------------------------------------------------------------
// A) Current parser core (extracted from lsp_byte_stream_channel.dart _Parser),
//    made synchronous + callback-based so we measure pure CPU cost.
// ---------------------------------------------------------------------------
final class CurrentParser {
  CurrentParser(this.onMessage);
  final void Function(Object?) onMessage;
  static const int kMaxMessageSize = 50 * 1024 * 1024;

  var _buffer = Uint8List(4096);
  var _readIndex = 0;
  var _writeIndex = 0;
  var _headerMode = true;
  var _contentLength = -1;

  void add(List<int> chunk) {
    if (chunk.isEmpty) return;
    if (_readIndex == _writeIndex) {
      _readIndex = 0;
      _writeIndex = 0;
      if (_buffer.length > 4096) _buffer = Uint8List(4096);
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
        final headerEnd = _findHeaderEnd(chunk.length);
        if (headerEnd == -1) break;
        _contentLength = _parseContentLengthFromBytes(headerEnd);
        _readIndex = headerEnd;
        _headerMode = false;
      } else {
        if (_writeIndex - _readIndex < _contentLength) break;
        final bodyStr = utf8.decoder.convert(
          _buffer,
          _readIndex,
          _readIndex + _contentLength,
        );
        onMessage(jsonDecode(bodyStr));
        _readIndex += _contentLength;
        _headerMode = true;
        _contentLength = -1;
      }
    }
  }

  int _findHeaderEnd(int lastChunkLength) {
    final start = _readIndex > _writeIndex - lastChunkLength - 3
        ? _readIndex
        : _writeIndex - lastChunkLength - 3;
    final limit = _writeIndex - 3 < 0 ? 0 : _writeIndex - 3;
    for (var i = start; i < limit; i++) {
      if (_buffer[i] == 13 &&
          _buffer[i + 1] == 10 &&
          _buffer[i + 2] == 13 &&
          _buffer[i + 3] == 10) {
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
          }
          return length;
        }
      }
    }
    throw const FormatException('Content-Length missing');
  }

  bool _isContentLengthPrefix(int index) {
    const chars = [
      99, 111, 110, 116, 101, 110, 116, 45, 108, 101, 110, 103, 116, 104, 58, //
    ];
    for (var i = 0; i < chars.length; i++) {
      final b = _buffer[index + i];
      final t = chars[i];
      if (b != t && (t < 97 || t > 122 || (b | 32) != t)) return false;
    }
    return true;
  }
}

// ---------------------------------------------------------------------------
// B) Simple parser: single growable buffer, compact (memmove) after every
//    consumed frame. No read/write index juggling, no chunk-windowed search.
// ---------------------------------------------------------------------------
final class SimpleParser {
  SimpleParser(this.onMessage);
  final void Function(Object?) onMessage;

  var _buffer = Uint8List(4096);
  var _len = 0; // number of valid bytes at the front of _buffer
  var _contentLength = -1;

  void add(List<int> chunk) {
    if (chunk.isEmpty) return;
    if (_len + chunk.length > _buffer.length) {
      var newSize = _buffer.length * 2;
      while (newSize < _len + chunk.length) {
        newSize *= 2;
      }
      _buffer = Uint8List(newSize)..setRange(0, _len, _buffer);
    }
    _buffer.setAll(_len, chunk);
    _len += chunk.length;

    while (true) {
      if (_contentLength < 0) {
        final end = _findHeaderEnd();
        if (end < 0) break;
        _contentLength = _parseContentLength(end);
        _consume(end);
      } else {
        if (_len < _contentLength) break;
        final bodyStr = utf8.decoder.convert(_buffer, 0, _contentLength);
        onMessage(jsonDecode(bodyStr));
        _consume(_contentLength);
        _contentLength = -1;
      }
    }
  }

  void _consume(int n) {
    _buffer.setRange(0, _len - n, _buffer, n);
    _len -= n;
  }

  int _findHeaderEnd() {
    final limit = _len - 3;
    for (var i = 0; i < limit; i++) {
      if (_buffer[i] == 13 &&
          _buffer[i + 1] == 10 &&
          _buffer[i + 2] == 13 &&
          _buffer[i + 3] == 10) {
        return i + 4;
      }
    }
    return -1;
  }

  int _parseContentLength(int headerEnd) {
    for (var i = 0; i <= headerEnd - 15; i++) {
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
          }
          return length;
        }
      }
    }
    throw const FormatException('Content-Length missing');
  }

  bool _isContentLengthPrefix(int index) {
    const chars = [
      99, 111, 110, 116, 101, 110, 116, 45, 108, 101, 110, 103, 116, 104, 58, //
    ];
    for (var i = 0; i < chars.length; i++) {
      final b = _buffer[index + i];
      final t = chars[i];
      if (b != t && (t < 97 || t > 122 || (b | 32) != t)) return false;
    }
    return true;
  }
}

Uint8List frame(String json) {
  final body = utf8.encode(json);
  final header = ascii.encode('Content-Length: ${body.length}\r\n\r\n');
  return Uint8List(header.length + body.length)
    ..setAll(0, header)
    ..setAll(header.length, body);
}

List<int> buildStream(List<String> messages) {
  final b = BytesBuilder();
  for (final m in messages) {
    b.add(frame(m));
  }
  return b.takeBytes();
}

double timeIt(void Function() f, {int iterations = 1}) {
  final sw = Stopwatch()..start();
  for (var i = 0; i < iterations; i++) {
    f();
  }
  sw.stop();
  return sw.elapsedMicroseconds / iterations / 1000.0; // ms per iteration
}

void feed(dynamic parser, List<int> bytes, int chunkSize) {
  for (var i = 0; i < bytes.length; i += chunkSize) {
    final end = i + chunkSize < bytes.length ? i + chunkSize : bytes.length;
    parser.add(bytes.sublist(i, end));
  }
}

void main() {
  // Representative LSP message mixes.
  final small = List.generate(
    2000,
    (i) =>
        '{"jsonrpc":"2.0","id":$i,"method":"textDocument/didChange",'
        '"params":{"uri":"file:///a/b/c$i.dart","version":$i}}',
  );
  final medium = List.generate(
    1000,
    (i) => jsonEncode({
      'jsonrpc': '2.0',
      'id': i,
      'method': 'textDocument/completion',
      'params': {
        'textDocument': {'uri': 'file:///project/lib/file$i.dart'},
        'position': {'line': i % 500, 'character': i % 80},
        'context': {'triggerKind': 1},
        'items': List.generate(20, (j) => {'label': 'item_$j', 'kind': j}),
      },
    }),
  );
  final large = List.generate(
    50,
    (i) => jsonEncode({
      'jsonrpc': '2.0',
      'id': i,
      'method': 'textDocument/didOpen',
      'params': {
        'textDocument': {
          'uri': 'file:///project/lib/big$i.dart',
          'languageId': 'dart',
          'version': 1,
          'text': List.generate(
            400,
            (l) => 'final x$l = compute($l) + $i;',
          ).join('\n'),
        },
      },
    }),
  );

  final scenarios = <String, List<String>>{
    'small x2000': small,
    'medium x1000': medium,
    'large x50': large,
  };

  // chunkSize -1 means "one whole frame at a time" handled specially.
  final chunkSizes = <int>[64, 1024, 16384];

  const warmup = 50;
  const iters = 200;

  for (final entry in scenarios.entries) {
    final bytes = buildStream(entry.value);
    final totalBytes = bytes.length;
    print(
      '\n=== ${entry.key}  (${(totalBytes / 1024).toStringAsFixed(1)} KiB/iter) ===',
    );
    for (final cs in chunkSizes) {
      // correctness check
      var cCount = 0;
      var sCount = 0;
      feed(CurrentParser((_) => cCount++), bytes, cs);
      feed(SimpleParser((_) => sCount++), bytes, cs);
      if (cCount != entry.value.length || sCount != entry.value.length) {
        print(
          '  !! MISMATCH chunk=$cs current=$cCount simple=$sCount '
          'expected=${entry.value.length}',
        );
        continue;
      }

      for (var w = 0; w < warmup; w++) {
        feed(CurrentParser((_) {}), bytes, cs);
        feed(SimpleParser((_) {}), bytes, cs);
      }
      final cMs = timeIt(
        () => feed(CurrentParser((_) {}), bytes, cs),
        iterations: iters,
      );
      final sMs = timeIt(
        () => feed(SimpleParser((_) {}), bytes, cs),
        iterations: iters,
      );
      final delta = ((sMs - cMs) / cMs * 100);
      print(
        '  chunk=${cs.toString().padLeft(6)}  '
        'current=${cMs.toStringAsFixed(3)}ms  '
        'simple=${sMs.toStringAsFixed(3)}ms  '
        'simple is ${delta >= 0 ? '+' : ''}${delta.toStringAsFixed(1)}% '
        'vs current',
      );
    }
  }
}
