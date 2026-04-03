import 'dart:collection';

import 'package:cli_async_redux/cli_async_redux.dart';
import 'package:cli_utils/cli_utils.dart';
import 'package:mason_logger/mason_logger.dart';

import '../app_state.dart';

/// Logs actions to the console.
class AppActionLogger extends ActionObserver<AppState> {
  AppActionLogger({required Logger logger}) : _logger = logger;

  final Logger _logger;

  final _stopwatches = HashMap<ReduxAction, Stopwatch>();

  @override
  void observe(
    ReduxAction<AppState> action,
    int dispatchCount, {
    bool ini = false,
  }) {
    final type = action.runtimeTypeString();
    final an = action.status.isCompletedFailed ? type.red.bold : type;
    final dc = dispatchCount.toString();
    final st = action.isSync ? '∥'.gray : '∥'.lightMagenta;

    final i = ini ? '→'.gray : '←'.lightGreen;

    if (ini) {
      assert(
        !_stopwatches.containsKey(action),
        'Stopwatch already exists for $an',
      );

      _stopwatches[action] = Stopwatch()..start();
      _logger.detail('$i $an $st D:$dc');
    } else {
      assert(
        _stopwatches.containsKey(action),
        'Stopwatch does not exist for $an',
      );

      final watch = _stopwatches.remove(action)!..stop();
      final e = watch.toElapsedString();
      _logger.detail('$i $an $st D:$dc $e');
    }
  }
}

extension StopWatchExtension on Stopwatch {
  String toElapsedString() {
    final inMicroseconds = elapsedMicroseconds;
    final inMilliseconds = elapsedMilliseconds;
    final inSeconds = inMilliseconds ~/ 1000;

    if (inMicroseconds < 1000) {
      // ignore: unnecessary_brace_in_string_interps
      return '${inMicroseconds}μs'.dim;
    } else if (inMilliseconds < 1000) {
      return '${inMilliseconds}ms';
    } else if (inSeconds < 60) {
      return '${(inMilliseconds / 1000).toStringAsFixed(2)}s'.yellow;
    } else {
      final minutes = inSeconds ~/ 60;
      final seconds = inSeconds % 60;
      return '${minutes}m ${seconds}s'.red.bold;
    }
  }
}
