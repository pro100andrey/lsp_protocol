import 'package:cli_async_redux/cli_async_redux.dart';
import 'package:mason_logger/mason_logger.dart';

import '../../redux/app_state.dart';

mixin WithStore {
  /// The [Store] instance to be used by the command.
  Store<AppState> get store;

  /// The [Logger] instance to be used by the command.
  Logger get logger => store.prop();

  /// Dispatch an action and wait for its completion.
  DispatchAndWait<AppState> get dispatchAndWait => store.dispatchAndWait;

  /// Dispatch an action synchronously.
  DispatchSync<AppState> get dispatchSync => store.dispatchSync;

  /// Dispatch multiple actions in sequence.
  List<ReduxAction<AppState>> Function(List<ReduxAction<AppState>> actions)
  get dispatchAll => store.dispatchAll;

  /// Dispatch all actions and wait for their completion.
  Future<void> Function(List<ReduxAction<AppState>> actions)
  get dispatchAndWaitAll => store.dispatchAndWaitAll;
}
