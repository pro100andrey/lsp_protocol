// GENERATED — do not edit.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scalar_unions.freezed.dart';

@freezed
sealed class ProgressToken with _$ProgressToken {
  const ProgressToken._();

  const factory ProgressToken.int({required int value}) = ProgressToken$Int;
  const factory ProgressToken.string({required String value}) =
      ProgressToken$String;

  static ProgressToken fromJson(Object? json) {
    if (json is int) return ProgressToken.int(value: json);
    return ProgressToken.string(value: json as String);
  }

  Object toJson() => switch (this) {
    ProgressToken$Int(:final value) => value,
    ProgressToken$String(:final value) => value,
  };
}
