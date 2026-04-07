import 'package:freezed_annotation/freezed_annotation.dart';

import 'meta/meta_state.dart';
import 'resolved/resolved_state.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required MetaState meta,
    ResolvedState? resolved,
  }) = _AppState;

  factory AppState.initial() => const AppState(
    meta: MetaState(),
  );
}
