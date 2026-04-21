import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool initialized,
    @Default({}) Map<String, String> documentContents,
  }) = _AppState;

  factory AppState.initial() => const AppState();
}
