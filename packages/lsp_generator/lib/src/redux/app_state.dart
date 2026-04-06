import 'package:freezed_annotation/freezed_annotation.dart';

import 'downloader/downloader_state.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required DownloaderState downloader,
  }) = _AppState;

  factory AppState.initial() => const AppState(
    downloader: DownloaderState(),
  );
}
