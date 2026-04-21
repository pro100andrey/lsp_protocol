import 'package:dar/dar.dart';
import 'package:http/http.dart' show ClientException;
import 'package:mason_logger/mason_logger.dart';

import '../app_state.dart';
import 'selectors.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  /// Mason logger for console output with progress indicators and styling.
  Logger get logger => store.prop();

  Selectors get select => Selectors(state);

  /// Wraps PocketBase client exceptions into [UserException]s.
  ///
  /// Converts [ClientException]s from PocketBase SDK into proper
  /// [UserException]s with appropriate error messages and exit codes.
  @override
  Object? wrapError(Object error, StackTrace stackTrace) =>
      super.wrapError(error, stackTrace);
}
