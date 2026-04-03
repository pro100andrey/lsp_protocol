import 'package:cli_async_redux/cli_async_redux.dart';

import '../app_state.dart';

/// Wraps errors into [ReduxException] if they are not already.
class AppGlobalWrapError extends GlobalWrapError<AppState> {
  @override
  Object? wrap(Object error, StackTrace stackTrace, ReduxAction action) {
    if (error is ReduxException) {
      return error;
    }

    return ReduxException(reason: error.toString());
  }
}
