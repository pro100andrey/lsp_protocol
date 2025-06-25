import 'package:json_rpc_2/json_rpc_2.dart';

class Connection {
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
