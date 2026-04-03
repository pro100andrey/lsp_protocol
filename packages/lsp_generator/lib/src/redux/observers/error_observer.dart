import 'package:cli_async_redux/cli_async_redux.dart';
import 'package:cli_utils/cli_utils.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:stack_trace/stack_trace.dart';

import '../app_state.dart';

/// Logs errors to the console.
class AppErrorObserver implements ErrorObserver<AppState> {
  AppErrorObserver({required Logger logger}) : _logger = logger;

  final Logger _logger;

  @override
  bool observe(
    Object error,
    StackTrace stackTrace,
    ReduxAction<AppState> action,
    Store store,
  ) {
    final trace = Trace.from(stackTrace);

    _logger
      ..err('Error during ${action.runtimeTypeString()}')
      ..detail(error.toString().box())
      ..detail(trace.toString());

    return true;
  }
}
