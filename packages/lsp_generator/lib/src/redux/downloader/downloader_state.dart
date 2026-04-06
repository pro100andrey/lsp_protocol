import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloader_state.freezed.dart';

@freezed
abstract class DownloaderState with _$DownloaderState {
  const factory DownloaderState({
    @Default('3.17') String version,
  }) = _DownloaderState;

}
