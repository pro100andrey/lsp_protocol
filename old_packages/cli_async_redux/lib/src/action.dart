part of 'store.dart';

/// All actions you create must extend this class `ReduxAction`.
///
/// Important: Do NOT override operator == and hashCode. Actions must retain
/// their default [Object] comparison by identity, for Redux to work.
abstract class ReduxAction<St> {
  late Store<St> _store;

  /// The store that this action is associated with.
  Store<St> get store => _store;

  /// The current state of the store.
  St get state => _store.state;

  late St _initialState;

  /// The state at the time this action was dispatched.
  St get initialState => _initialState;

  var _status = const ActionStatus();

  /// The current status of this action (waiting, failed, etc.).
  ActionStatus get status => _status;

  bool _completedFuture = false;

  /// Sets the store for this action.
  ///
  /// This is called internally by the store when the action is dispatched.
  void setStore(Store<St> store) {
    _store = store;
    _initialState = _store.state;
  }

  /// The `reduce` method is the action reducer. It may read the action state,
  /// the store state, and then return a new state (or `null` if no state
  /// change is necessary).
  ///
  /// It may be synchronous (returning `AppState` or `null`)
  /// or async (returning `Future<AppState>` or `Future<null>`).
  FutureOr<St?> reduce();

  /// Called before the action is dispatched.
  ///
  /// If this method returns true, the action will not be dispatched and
  /// [AbortDispatchException] will be thrown.
  ///
  /// This is useful for validating the action's parameters or checking
  /// preconditions before the action is executed.
  bool abortDispatch() => false;

  /// You may override [wrapReduce] to wrap the [reduce] method and allow for
  /// some pre- or post-processing. For example, if you want to prevent an
  /// async reducer to change the current state in cases where the current
  /// state has already changed since when the reducer started:
  ///
  /// ```dart
  /// Future<St?> wrapReduce(Reducer<St> reduce) async {
  ///    var oldState = state;
  ///    AppState? newState = await reduce();
  ///    return identical(oldState, state) ? newState : null;
  /// };
  /// ```
  ///
  /// IMPORTANT:
  ///
  /// * Your [wrapReduce] method MUST always return `Future<St?>`. If it
  /// returns a `FutureOr`, it will NOT be called, and no error will be shown.
  /// This is because AsyncRedux uses the return type to determine if
  /// [wrapReduce] was overridden or not.
  ///
  /// * If [wrapReduce] returns `St` or `St?`, an error will be thrown.
  ///
  /// * Once you override [wrapReduce] the action will always be ASYNC
  FutureOr<St?> wrapReduce(Reducer<St> reduce) => null;

  /// Wraps errors thrown during action execution.
  ///
  /// Override this to transform or handle errors in a custom way.
  /// The default implementation returns the error unchanged.
  ///
  /// If you return `null`, the error will be swallowed (not thrown).
  /// If you return a different error, that error will be thrown instead.
  Object? wrapError(Object error, StackTrace stackTrace) => error;

  /// Dispatches an action and waits for it to complete.
  DispatchAndWait<St> get dispatchAndWait => _store.dispatchAndWait;

  /// Dispatches an action without waiting for it to complete.
  Dispatch<St> get dispatch => _store.dispatch;

  /// Dispatches a synchronous action.
  DispatchSync<St> get dispatchSync => _store.dispatchSync;

  /// Dispatches multiple actions.
  ///
  /// Returns a list of the dispatched actions.
  List<ReduxAction<St>> Function(List<ReduxAction<St>> actions)
  get dispatchAll => _store.dispatchAll;

  /// Dispatches multiple actions and waits for all of them to complete.
  Future<List<ReduxAction<St>>> Function(List<ReduxAction<St>> actions)
  get dispatchAndWaitAll => _store.dispatchAndWaitAll;

  /// Returns true if [wrapReduce] is overridden with an async implementation.
  bool ifWrapReduceOverriddenAsync() =>
      wrapReduce is Future<St?> Function(Reducer<St>);

  /// Returns true if [wrapReduce] is overridden with a sync implementation.
  bool ifWrapReduceOverriddenSync() => wrapReduce is St? Function(Reducer<St>);

  /// Returns true if [wrapReduce] is overridden.
  bool ifWrapReduceOverridden() =>
      ifWrapReduceOverriddenAsync() || ifWrapReduceOverriddenSync();

  /// Returns true if this action is synchronous.
  ///
  /// An action is synchronous if both [reduce] and [wrapReduce] are
  /// synchronous.
  bool get isSync {
    final reduceMethodIsSync = reduce is St? Function();
    if (!reduceMethodIsSync) {
      return false;
    }

    // `wrapReduce` is sync if it's not overridden.
    // `wrapReduce` is sync if it's overridden and SYNC.
    // `wrapReduce` is NOT sync if it's overridden and ASYNC.
    return !ifWrapReduceOverriddenAsync();
  }

  /// Returns true if the given action(s) are currently being executed.
  ///
  /// [actionOrTypeOrList] can be an action instance, a Type, or a list of
  /// Types.
  ///
  /// Examples:
  /// ```dart
  /// isWaiting(MyAction); // Checks if any MyAction is waiting.
  /// isWaiting(myActionInstance); // Checks if this specific instance is waiting.
  /// isWaiting([MyAction, OtherAction]); // Checks if any of these types are waiting.
  /// ```
  bool isWaiting(Object actionOrTypeOrList) =>
      _store.isWaiting(actionOrTypeOrList);

  /// Returns true if the given action(s) have failed.
  ///
  /// [actionOrTypeOrList] can be an action instance, a Type, or a list of
  /// Types.
  ///
  /// This checks if the action threw an error that was not swallowed.
  bool isFailed(Object actionOrTypeOrList) =>
      _store.isFailed(actionOrTypeOrList);

  /// Returns the [ReduxException] of the [actionTypeOrList] that failed.
  ///
  /// [actionTypeOrList] can be a [Type], or an Iterable of types. Any other
  /// type of object will return null and throw a [StoreException] after the
  /// async gap.
  ///
  /// Note: This method uses the EXACT type in [actionTypeOrList]. Subtypes are
  /// not considered.
  ///
  /// Returns `null` if the action has not failed, or if the error is not a
  /// [ReduxException].
  ReduxException? exceptionFor(Object actionTypeOrList) =>
      _store.exceptionFor(actionTypeOrList);

  /// Removes the given [actionTypeOrList] from the list of action types that
  /// failed.
  ///
  /// Note that dispatching an action already removes that action type from the
  /// exceptions list. This removal happens as soon as the action is dispatched,
  /// not when it finishes.
  ///
  /// [actionTypeOrList] can be a [Type], or an Iterable of types. Any other
  /// type of object will return null and throw a [StoreException] after the
  /// async gap.
  ///
  /// Note: This method uses the EXACT type in [actionTypeOrList]. Subtypes are
  /// not considered.
  void clearExceptionFor(Object actionTypeOrList) =>
      _store.clearExceptionFor(actionTypeOrList);

  /// Returns a future which will complete when the given state [condition] is
  /// true. If the condition is already true when the method is called, the
  /// future completes immediately.
  ///
  /// You may also provide a [timeoutMillis], which by default is 10 minutes.
  /// To disable the timeout, make it -1.
  /// If you want, you can modify [Store.defaultTimeoutMillis] to change the
  /// default timeout.
  ///
  /// ```dart
  /// var action = await store.waitCondition((state) => state.name == "Bill");
  /// expect(action, isA<ChangeNameAction>());
  /// ```
  Future<ReduxAction<St>?> waitCondition(
    bool Function(St) condition, {
    int? timeoutMillis,
  }) => _store.waitCondition(condition, timeoutMillis: timeoutMillis);

  /// Returns a future that completes when ALL given [actions] finished
  /// dispatching. You MUST provide at list one action, or an error will be
  /// thrown.
  ///
  /// If [completeImmediately] is `false` (the default), this method will throw
  /// [StoreException]  if none of the given actions are in progress when the
  /// method is called. Otherwise, the future will complete immediately and
  /// throw no error.
  Future<void> waitAllActions(
    List<ReduxAction<St>> actions, {
    bool completeImmediately = false,
  }) {
    if (actions.isEmpty) {
      throw const StoreException(
        'You have to provide a non-empty list of actions.',
      );
    }
    return _store.waitAllActions(
      actions,
      completeImmediately: completeImmediately,
    );
  }

  /// An async reducer (one that returns Future<AppState?>) must never complete
  /// without at least one await, because this may result in state changes being
  /// lost. It's up to you to make sure all code paths in the reducer pass
  /// through at least one `await`.
  ///
  /// Futures defined by async functions with no `await` are called "completed
  /// futures". It's generally easy to make sure an async reducer does not
  /// return a completed future. In the rare case when your reducer function is
  /// complex and you are unsure that all code paths pass through an await,
  /// there are 3 possible solutions:
  ///
  ///
  /// * Simplify your reducer, by applying clean-code techniques. That will make
  ///  it easier for you to make sure all code paths have 'await'.
  ///
  /// * Add `await microtask;` to the very START of the reducer.
  ///
  /// * Call method [assertUncompletedFuture] at the very END of your [reduce]
  /// method, right before the return. If you do that, an error will be shown in
  /// the console in case the reduce method ever returns a completed future.
  /// Note there is no other way for AsyncRedux to warn you if your reducer
  /// returned a completed future, because although the completion information
  /// exists in the `FutureImpl` class, it's not exposed. Also note, the error
  /// will be thrown asynchronously (will not stop the action from returning a
  /// state).
  void assertUncompletedFuture() {
    scheduleMicrotask(() {
      _completedFuture = true;
    });
  }

  /// Returns the runtime type as a string, without the generic part.
  ///
  /// For example, if the runtime type is `MyAction&lt;int&gt;`, this returns
  /// `"MyAction"`.
  String runtimeTypeString() {
    final text = runtimeType.toString();
    final pos = text.indexOf('<');
    return (pos == -1) ? text : text.substring(0, pos);
  }

  @override
  String toString() => 'Action ${runtimeTypeString()}';
}

/// Exception thrown when an action's [ReduxAction.abortDispatch] method returns
///  true.
///
/// This exception is used to signal that an action should not be dispatched
/// and is handled internally by the store.
class AbortDispatchException implements Exception {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbortDispatchException && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

/// The [UpdateStateAction] action is used to update the state of the Redux
/// store, by applying the given [reducerFunction] to the current state.
class UpdateStateAction<St> extends ReduxAction<St> {
  /// When you don't need to use the current state to create the new state, you
  /// can use the `UpdateStateAction` factory.
  ///
  /// Example:
  /// ```
  /// var newState = AppState(...);
  /// store.dispatch(UpdateStateAction(newState));
  /// ```
  factory UpdateStateAction(St state) =>
      UpdateStateAction.withReducer((_) => state);

  /// When you need to use the current state to create the new state, you
  /// can use `UpdateStateAction.withReducer`.
  ///
  /// Example:
  /// ```
  /// store.dispatch(UpdateStateAction.withReducer((state) => state.copy(...)));
  /// ```
  UpdateStateAction.withReducer(this.reducerFunction);

  final St? Function(St state) reducerFunction;

  @override
  St? reduce() => reducerFunction(state);
}
