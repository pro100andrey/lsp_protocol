//
// ignore_for_file: unreachable_from_main

void main(List<String> args) {}

class Request {
  void initialize() {}
}

extension type InitializeParams(Map<String, Object?> params) {
  int? get processId => params['processId'] as int?;
  
  ClientInfo? get clientInfo {
    final info = params['clientInfo'] as Map<String, Object?>?;
    return info != null ? ClientInfo(info) : null;
  }
}

extension type ClientInfo(Map<String, Object?> params) {
  String get name => params['name']! as String;
  String? get version => params['version'] as String?;
}
