// GENERATED — do not edit.

sealed class ProgressToken {
  static ProgressToken fromJson(Object? json) {
    if (json is int) return ProgressToken$Int(json);
    return ProgressToken$String(json as String);
  }

  Object toJson();
}

final class ProgressToken$Int extends ProgressToken {
  ProgressToken$Int(this.value);
  final int value;
  @override
  int toJson() => value;
}

final class ProgressToken$String extends ProgressToken {
  ProgressToken$String(this.value);
  final String value;
  @override
  String toJson() => value;
}
