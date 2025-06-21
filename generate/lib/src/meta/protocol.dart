import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

@JsonSerializable()
class LSPProtocol {
  const LSPProtocol({required this.metaData, required this.requests});

  factory LSPProtocol.fromJson(Map<String, dynamic> json) =>
      _$LSPProtocolFromJson(json);

  final MetaData metaData;
  final List<Request> requests;

  Map<String, dynamic> toJson() => _$LSPProtocolToJson(this);
}

@JsonSerializable()
class MetaData {
  MetaData({required this.version});

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  final String version;

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable()
class Request {
  Request({required this.method, required this.params, required this.result});

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  final String method;
  final Parameters? params;
  final Result result;

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

@JsonSerializable()
class Result {
  Result({required this.kind, required this.name});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  final TypeKind kind;
  final String? name;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Parameters {
  Parameters({required this.kind, required this.name});

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  final TypeKind kind;
  final String name;

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}

@JsonEnum(valueField: 'kind')
enum TypeKind {
  array('array'),
  base('base'),
  literal('literal'),
  map('map'),
  or('or'),
  reference('reference'),
  string('string_literal'),
  tuple('tuple');

  const TypeKind(this.kind);
  final String kind;
}
