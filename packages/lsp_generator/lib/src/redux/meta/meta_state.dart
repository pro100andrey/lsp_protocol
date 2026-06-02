import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/protocol.dart';

part 'meta_state.freezed.dart';

@freezed
abstract class MetaState with _$MetaState {
  const factory MetaState({
    @Default('3.17') String version,
    MetaProtocol? protocol,
    String? outputDir,
  }) = _MetaState;
}
