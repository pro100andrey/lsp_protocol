import '../../common.dart';

final class SetOutputDirAction extends BaseAction {
  SetOutputDirAction({required this.path});

  final String path;

  @override
  AppState? reduce() => state.copyWith.meta(outputDir: path);
}
