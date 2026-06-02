import 'package:dar/dar.dart';
import 'package:mason_logger/mason_logger.dart';

import '../app_state.dart';
import 'selectors.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  /// Mason logger for console output with progress indicators and styling.
  Logger get logger => store.prop();

  Selectors get select => Selectors(state);
}
