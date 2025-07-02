import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:stream_channel/stream_channel.dart';

class Connection {
  Connection(
    Stream<List<int>> stream,
    StreamSink<List<int>> sink,
  ) {
    final parser = _Parser(stream);
    final outSink = StreamSinkTransformer.fromHandlers(
      handleData: _serialize,
      handleDone: (sink) async {
        await parser.close();
        sink.close();
      },
    ).bind(sink);

    final channel = StreamChannel.withGuarantees(parser.stream, outSink);

    peer = Peer(channel);
  }

  late final Peer peer;

  void onRequest<R>(
    String method,
    Future<R> Function(Parameters) handler,
  ) {
    peer.registerMethod(method, (params) async => handler(params));
  }

  void onNotification<R>(
    String method,
    Future<R> Function(Parameters) handler,
  ) {
    peer.registerMethod(method, (params) async => handler(params));
  }

  void sendNotification(String method, Object? params) =>
      peer.sendNotification(method, params);
}

void _serialize(String data, EventSink<List<int>> sink) {
  final message = utf8.encode(data);
  final header = 'Content-Length: ${message.length}\r\n\r\n';
  sink.add(ascii.encode(header));

  const chunkSize = 1024;
  _chunks(message, chunkSize).forEach(sink.add);
}

class _Parser {
  _Parser(Stream<List<int>> stream) {
    _subscription = stream
        .expand((bytes) => bytes)
        .listen(
          _handleByte,
          onDone: _streamCtl.close,
        );
  }

  final _streamCtl = StreamController<String>();
  Stream<String> get stream => _streamCtl.stream;

  final _buffer = <int>[];
  bool _headerMode = true;
  int _contentLength = -1;

  late StreamSubscription _subscription;

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

  /// Whether the entire message is in [_buffer].
  bool get _messageComplete => _buffer.length >= _contentLength;

  /// Decodes [_buffer] into a String and looks for the 'Content-Length' header.
  int _parseContentLength() {
    final asString = ascii.decode(_buffer);
    final headers = asString.split('\r\n');
    final lengthHeader = headers.firstWhere(
      (h) => h.startsWith('Content-Length'),
    );
    final length = lengthHeader.split(':').last.trim();

    return int.parse(length);
  }

  /// Whether [_buffer] ends in '\r\n\r\n'.
  bool get _headerComplete {
    final l = _buffer.length;

    return l > 4 &&
        _buffer[l - 1] == 10 &&
        _buffer[l - 2] == 13 &&
        _buffer[l - 3] == 10 &&
        _buffer[l - 4] == 13;
  }
}

Iterable<List<T>> _chunks<T>(List<T> data, int chunkSize) sync* {
  if (data.length <= chunkSize) {
    yield data;
    return;
  }

  var low = 0;
  while (low < data.length) {
    if (data.length > low + chunkSize) {
      yield data.sublist(low, low + chunkSize);
    } else {
      yield data.sublist(low);
    }

    low += chunkSize;
  }
}
