// Placeholder for a simple Either type, or use a package like dartz
import 'package:freezed_annotation/freezed_annotation.dart';

sealed class IntOrString {
  const IntOrString();
}

class IsInt extends IntOrString {
  const IsInt(this.value);
  final int value;
}

class IsString extends IntOrString {
  const IsString(this.value);
  final String value;
}

// Custom converter for IntOrString sealed class
class IntOrStringSealedConverter implements JsonConverter<IntOrString, Object> {
  const IntOrStringSealedConverter();

  @override
  IntOrString fromJson(Object json) {
    if (json is int) {
      return IsInt(json);
    } else if (json is String) {
      return IsString(json);
    }
    throw Exception(
      'Expected int or String for IntOrString, but got ${json.runtimeType}',
    );
  }

  @override
  Object toJson(IntOrString object) {
    if (object is IsInt) {
      return object.value;
    } else if (object is IsString) {
      return object.value;
    }
    throw Exception('Unknown IntOrString type');
  }
}
