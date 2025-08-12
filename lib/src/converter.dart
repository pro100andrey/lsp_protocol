import 'package:json_annotation/json_annotation.dart';

class SealedConverter extends JsonConverter<Object, Map<String, dynamic>> {
  const SealedConverter();

  @override
  Object fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(Object object) {
    throw UnimplementedError();
  }
}
