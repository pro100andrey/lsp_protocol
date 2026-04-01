import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';

import 'action_status.dart';
import 'exception.dart';
import 'observers.dart';
import 'store_exception.dart';
import 'wrap_reduce.dart';

part 'action.dart';

/// A function type that represents a reducer, which can return either a state
/// synchronously or asynchronously.
typedef Reducer<St> = FutureOr<St?> Function();

/// A function type for dispatching actions that can complete synchronously or
/// asynchronously.
///
/// Returns an [ActionStatus] that indicates the result of the dispatch.
typedef Dispatch<St> = FutureOr<ActionStatus> Function(ReduxAction<St> action);

/// A function type for dispatching actions and waiting for them to complete.
///
/// Always returns a [Future] that resolves to an [ActionStatus].
typedef DispatchAndWait<St> =
    Future<ActionStatus> Function(ReduxAction<St> action);

/// A function type for dispatching synchronous actions only.
///
/// Returns an [ActionStatus] immediately.
typedef DispatchSync<St> = ActionStatus Function(ReduxAction<St> action);

/// A function type that represents a condition on actions.
/// The function receives the set of actions currently in progress and
/// the action that triggered the check (if any).
typedef ActionCondition<St> =
    bool Function(Set<ReduxAction<St>>, ReduxAction<St>?);

typedef CompleterBox<St> = (Set<ReduxAction<St>>, ReduxAction<St>?);

/// The Redux store that manages application state.
///
/// The store is the central hub that holds the application state and provides
/// methods to dispatch actions, observe state changes, and manage errors.
///
/// Type parameter [St] represents the state type.
final class Store<St> {
  /// Creates a new store with the given initial state and optional
  /// configuration.
  ///
  /// Parameters:
  /// - [initialState]: The initial state of the store.
  /// - [actionObservers]: List of observers to monitor action lifecycle.
  /// - [stateObservers]: List of observers to monitor state changes.
  /// - [wrapReduce]: Global reducer wrapper for all actions.
  /// - [globalWrapError]: Global error wrapper for all actions.
  /// - [errorObserver]: Observer for error handling.
  Store({
    required St initialState,
    List<ActionObserver>? actionObservers,
    List<StateObserver>? stateObservers,
    WrapReduce<St>? wrapReduce,
    GlobalWrapError<St>? globalWrapError,
    ErrorObserver<St>? errorObserver,
  }) : _state = initialState,
       _actionObservers = actionObservers,
       _stateObservers = stateObservers,
       _wrapReduce = wrapReduce,
       _globalWrapError = globalWrapError,
       _errorObserver = errorObserver,
       _actionsInProgress = HashSet<ReduxAction<St>>.identity(),
       _actionsWeCanCheckFailed = HashSet<Type>.identity(),
       _failedActions = HashMap<Type, ReduxAction<St>>(),
       _props = {},
       _dispatchCount = 0,
       _reduceCount = 0;

  final List<ActionObserver>? _actionObservers;
  final List<StateObserver>? _stateObservers;
  final WrapReduce<St>? _wrapReduce;
  final GlobalWrapError<St>? _globalWrapError;
  final ErrorObserver<St>? _errorObserver;

  final HashSet<ReduxAction<St>> _actionsInProgress;
  final HashMap<Type, ReduxAction<St>> _failedActions;
  final HashSet<Type> _actionsWeCanCheckFailed;
  final Map<(Type, Object?), Object> _props;

  St _state;

  int _dispatchCount;
  int _reduceCount;

  /// The total number of actions that have been dispatched.
  int get dispatchCount => _dispatchCount;

  /// The total number of times reducers have been executed.
  int get reduceCount => _reduceCount;

  /// The current state of the store.
  St get state => _state;

  /// A stream that emits the state whenever it changes.
  // Stream<St> get onChange => _changeController.stream;

  /// The default timeout in milliseconds for [waitCondition] and similar
  /// methods.
  /// Defaults to 10 minutes (600,000 ms). Set to -1 to disable timeout.
  static int defaultTimeoutMillis = 60 * 1000 * 10;

  final _stateConditionCompleters =
      <bool Function(St), Completer<ReduxAction<St>?>>{};

  final _awaitableActions = HashSet<Type>.identity();

  final _actionConditionCompleters =
      <ActionCondition<St>, Completer<CompleterBox<St>>>{};

  /// Dispatches a synchronous action.
  ///
  /// Throws [StoreException] if the action is not synchronous.
  ///
  /// Parameters:
  /// - [action]: The action to dispatch.
  ActionStatus dispatchSync(ReduxAction<St> action) {
    if (!action.isSync) {
      throw StoreException(
        "Can't dispatchSync(${action.runtimeType}) because "
        '${action.runtimeType} is async.',
      );
    }

    return _dispatch(action) as ActionStatus;
  }

  /// Dispatches an action.
  ///
  /// Returns immediately for synchronous actions, or a [Future] for async
  /// actions.
  ///
  /// [action] is the action to dispatch.
  ///
  /// If the action is synchronous, it will be executed immediately and the
  /// status will be returned.
  /// If the action is asynchronous, a Future will be returned.
  FutureOr<ActionStatus> dispatch(ReduxAction<St> action) => _dispatch(action);

  /// Dispatches an action and returns a [Future] that completes when the action
  /// finishes.
  ///
  /// This is useful when you want to await for an action to complete,
  /// regardless of whether it is synchronous or asynchronous.
  ///
  /// [action] is the action to dispatch.
  Future<ActionStatus> dispatchAndWait(ReduxAction<St> action) =>
      Future.sync(() => _dispatch(action));

  FutureOr<ActionStatus> _dispatch(ReduxAction<St> action) {
    // The action may access the store/state/dispatch as fields.
    action.setStore(this);

    if (action.abortDispatch()) {
      return const ActionStatus(isDispatchAborted: true);
    }

    _dispatchCount++;

    if (action.status.isDispatched) {
      throw const StoreException(
        'The action was already dispatched. Please, create a new action each '
        'time.',
      );
    }

    action._status = action._status.copy(isDispatched: true);

    if (_actionObservers != null) {
      for (final observer in _actionObservers) {
        observer.observe(action, dispatchCount, ini: true);
      }
    }

    return _processAction(action);
  }

  /// Dispatches an action and waits for both the action and all subsequently
  /// dispatched actions to complete.
  ///
  /// Parameters:
  /// - [action]: The action to dispatch.
  /// true.
  /// - [timeoutMillis]: Optional timeout in milliseconds.
  Future<ActionStatus> dispatchAndWaitAllActions(
    ReduxAction<St> action, {
    int? timeoutMillis,
  }) async {
    final actionStatus = await dispatchAndWait(action);

    await waitAllActions(
      [],
      completeImmediately: true,
      timeoutMillis: timeoutMillis,
    );

    return actionStatus;
  }

  /// Dispatches multiple actions and waits for all of them to complete.
  ///
  /// Parameters:
  /// - [actions]: List of actions to dispatch.
  /// true.
  Future<List<ReduxAction<St>>> dispatchAndWaitAll(
    List<ReduxAction<St>> actions,
  ) async {
    final futures = <Future<ActionStatus>>[];

    for (final action in actions) {
      futures.add(dispatchAndWait(action));
    }

    await Future.wait(futures);

    return actions;
  }

  /// Dispatches multiple actions without waiting for them to complete.
  ///
  /// Parameters:
  /// - [actions]: List of actions to dispatch.
  /// true.
  List<ReduxAction<St>> dispatchAll(List<ReduxAction<St>> actions) {
    actions.forEach(_dispatch);
    return actions;
  }

  /// Waits for all specified actions to complete.
  ///
  /// If [actions] is null or empty, waits for all currently executing actions.
  /// Throws [StoreException] if no actions are in progress and
  /// [completeImmediately] is false.
  ///
  /// Parameters:
  /// - [actions]: Optional list of specific actions to wait for.
  /// - [completeImmediately]: If true, completes immediately when no actions
  ///   are in progress. Defaults to false.
  /// - [timeoutMillis]: Optional timeout in milliseconds.
  Future<void> waitAllActions(
    List<ReduxAction<St>>? actions, {
    bool completeImmediately = false,
    int? timeoutMillis,
  }) {
    if (actions == null || actions.isEmpty) {
      return waitActionCondition(
        completeImmediately: completeImmediately,
        completedErrorMessage: 'No actions were in progress',
        timeoutMillis: timeoutMillis,
        (actions, triggerAction) => actions.isEmpty,
      );
    } else {
      return waitActionCondition(
        completeImmediately: completeImmediately,
        completedErrorMessage: 'None of the given actions were in progress',
        timeoutMillis: timeoutMillis,

        (actionsInProgress, triggerAction) {
          for (final action in actions) {
            if (actionsInProgress.contains(action)) {
              return false;
            }
          }
          return true;
        },
      );
    }
  }

  /// Returns true if the given action(s) are currently being executed.
  ///
  /// [actionOrActionTypeOrList] can be:
  /// - A [ReduxAction] instance
  /// - A [Type] representing an action class
  /// - An [Iterable] of actions or types
  bool isWaiting(Object actionOrActionTypeOrList) {
    // 1) If a type was passed:
    if (actionOrActionTypeOrList is Type) {
      _awaitableActions.add(actionOrActionTypeOrList);
      return _actionsInProgress.any(
        (action) => action.runtimeType == actionOrActionTypeOrList,
      );
    }
    // 2) If an action was passed:
    else if (actionOrActionTypeOrList is ReduxAction) {
      _awaitableActions.add(actionOrActionTypeOrList.runtimeType);
      return _actionsInProgress.contains(actionOrActionTypeOrList);
    }
    // 3) If an iterable was passed:
    // 3.1) For each action or action type in the iterable...
    else if (actionOrActionTypeOrList is Iterable) {
      var isWaiting = false;
      for (final actionOrType in actionOrActionTypeOrList) {
        //
        // 3.2) If it's a type.
        if (actionOrType is Type) {
          _awaitableActions.add(actionOrType);

          // 3.2.1) Is waiting if any of the actions in progress has that exact
          // type.
          if (!isWaiting) {
            isWaiting = _actionsInProgress.any(
              (action) => action.runtimeType == actionOrType,
            );
          }
        }
        //
        // 3.3) If it's an action.
        else if (actionOrType is ReduxAction) {
          _awaitableActions.add(actionOrType.runtimeType);

          // 3.3.1) Is waiting if any of the actions in progress is the exact
          // action.
          if (!isWaiting) {
            isWaiting = _actionsInProgress.contains(actionOrType);
          }
        }
        //
        // 3.4) If it's not an action and not an action type, throw an
        // exception.
        // The exception is thrown after the async gap, so that it doesn't
        // interrupt the processes.
        else {
          // ignore: discarded_futures
          Future.microtask(() {
            final type = actionOrActionTypeOrList.runtimeType;
            throw StoreException(
              "You can't do isWaiting''([$type]). "
              'Use only actions, action types, or a list of them.',
            );
          });
        }
      }

      // 3.5) If the `for` finished without matching any items, return false
      //(it's NOT waiting).
      return isWaiting;
    }
    // 4) If something different was passed, it's an error. We show the error
    // after the async gap, so we don't interrupt the code. But we return false
    //(not waiting).
    else {
      // ignore: discarded_futures
      Future.microtask(() {
        throw StoreException(
          "You can't do isWaiting(${actionOrActionTypeOrList.runtimeType}), "
          'Use only actions, action types, or a list of them.',
        );
      });

      return false;
    }
  }

  /// Returns true if the given action(s) have failed.
  ///
  /// [actionOrActionTypeOrList] can be an action type or a list of types.
  bool isFailed(Object actionOrActionTypeOrList) =>
      exceptionFor(actionOrActionTypeOrList) != null;

  /// Returns the [ReduxException] of the action type that failed.
  ///
  /// [actionTypeOrList] can be a [Type] or an [Iterable] of types.
  /// Returns null if the action hasn't failed or if the error is not a
  /// [ReduxException].
  ///
  /// Note: This method uses the EXACT type. Subtypes are not considered.
  ReduxException? exceptionFor(Object actionTypeOrList) {
    //
    // 1) If a type was passed:
    if (actionTypeOrList is Type) {
      _actionsWeCanCheckFailed.add(actionTypeOrList);
      final action = _failedActions[actionTypeOrList];
      final error = action?.status.wrappedError;
      return (error is ReduxException) ? error : null;
    }
    //
    // 2) If a list was passed:
    else if (actionTypeOrList is Iterable) {
      for (final actionType in actionTypeOrList) {
        _actionsWeCanCheckFailed.add(actionType);
        if (actionType is Type) {
          final error = _failedActions.entries
              .firstWhereOrNull((entry) => entry.key == actionType)
              ?.value
              .status
              .wrappedError;
          return (error is ReduxException) ? error : null;
        } else {
          // ignore: discarded_futures
          Future.microtask(() {
            throw StoreException(
              "You can't do exceptionFor([${actionTypeOrList.runtimeType}]), "
              'but only an action Type, or a List of types.',
            );
          });
        }
      }
      return null;
    }
    // 3) If something different was passed, it's an error. We show the error
    // after the async gap, so we don't interrupt the code. But we return null.
    else {
      // ignore: discarded_futures
      Future.microtask(() {
        throw StoreException(
          "You can't do exceptionFor(${actionTypeOrList.runtimeType}), "
          'but only an action Type, or a List of types.',
        );
      });

      return null;
    }
  }

  /// Removes the given action type(s) from the list of failed actions.
  ///
  /// Note that dispatching an action already removes that action type from the
  /// exceptions list automatically.
  ///
  /// [actionTypeOrList] can be a [Type] or an [Iterable] of types.
  ///
  /// Note: This method uses the EXACT type. Subtypes are not considered.
  void clearExceptionFor(Object actionTypeOrList) {
    //
    // 1) If a type was passed:
    if (actionTypeOrList is Type) {
      final result = _failedActions.remove(actionTypeOrList);
      if (result != null) {
        // _changeController.add(state);
      }
    }
    //
    // 2) If a list was passed:
    else if (actionTypeOrList is Iterable) {
      Object? result;
      for (final actionType in actionTypeOrList) {
        if (actionType is Type) {
          result = _failedActions.remove(actionType);
        } else {
          // ignore: discarded_futures
          Future.microtask(() {
            throw StoreException(
              "You can't clearExceptionFor([${actionTypeOrList.runtimeType}]), "
              'but only an action Type, or a List of types.',
            );
          });
        }
      }
      if (result != null) {
        // _changeController.add(state);
      }
    }
    // 3) If something different was passed, it's an error. We show the error
    // after the async gap, so we don't interrupt the code. But we return null.
    else {
      // ignore: discarded_futures
      Future.microtask(() {
        throw StoreException(
          "You can't clearExceptionFor(${actionTypeOrList.runtimeType}), "
          'but only an action Type, or a List of types.',
        );
      });
    }
  }

  /// Returns a future that completes when the given state [condition] becomes
  /// true.
  ///
  /// If the condition is already true, the future completes immediately (if
  /// [completeImmediately] is true) or throws [StoreException].
  ///
  /// [condition] is a function that returns true when the desired state is
  /// reached.
  /// [completeImmediately] if true (default), the future completes immediately
  /// if the condition is already met.
  /// [timeoutMillis] is the timeout in milliseconds. Defaults to
  /// [defaultTimeoutMillis]. Set to -1 to disable.
  ///
  /// Example:
  /// ```dart
  /// await store.waitCondition((state) => state.isLoading == false);
  /// ```
  Future<ReduxAction<St>?> waitCondition(
    bool Function(St) condition, {
    bool completeImmediately = true,
    int? timeoutMillis,
  }) async {
    //
    // If the condition is already true when `waitCondition` is called.
    if (condition(_state)) {
      // Complete and return null (no trigger action).
      if (completeImmediately) {
        return Future.syncValue(null);
      } else {
        throw const StoreException(
          'Awaited state condition was already true, '
          'and the future completed immediately.',
        );
      }
    }
    //
    else {
      final completer = Completer<ReduxAction<St>?>();

      _stateConditionCompleters[condition] = completer;

      final timeout = timeoutMillis ?? defaultTimeoutMillis;
      var future = completer.future;

      if (timeout >= 0) {
        future = completer.future.timeout(
          Duration(milliseconds: timeout),
          onTimeout: () {
            _stateConditionCompleters.remove(condition);
            throw TimeoutException(null, Duration(milliseconds: timeout));
          },
        );
      }

      return future;
    }
  }

  FutureOr<ActionStatus> _processAction(ReduxAction<St> action) {
    _calculateIsWaitingIsFailed(action);

    if (action.isSync) {
      return _processActionSync(action);
    } else {
      return _processActionAsync(action);
    }
  }

  void _calculateIsWaitingIsFailed(ReduxAction<St> action) {
    // If the action is fallible (that is to say, we have once called `isFailed`
    // for this action),
    final fallible = _actionsWeCanCheckFailed.contains(action.runtimeType);

    var theUIHasAlreadyUpdated = false;

    if (fallible) {
      // Dispatch is starting, so we remove the action from the list of failed
      // actions.
      final removedAction = _failedActions.remove(action.runtimeType);

      // Then we notify the UI. Note we don't notify if the action was never
      // checked.
      if (removedAction != null) {
        theUIHasAlreadyUpdated = true;
        // _changeController.add(state);
      }
    }

    // Add the action to the list of actions in progress.
    // Note: We add both SYNC and ASYNC actions. The SYNC actions are important
    // too, to prevent NonReentrant sync actions, where they call themselves.
    final ifWasAdded = _actionsInProgress.add(action);
    if (ifWasAdded) {
      _checkAllActionConditions(action);
    }

    // Note: If the UI hasn't updated yet, AND
    // the action is awaitable (that is to say, we have already called
    //`isWaiting` for this action),
    if (!theUIHasAlreadyUpdated &&
        _awaitableActions.contains(action.runtimeType)) {
      // _changeController.add(state);
    }
  }

  ActionStatus _processActionSync(ReduxAction<St> action) {
    // The action may access the store/state/dispatch as fields.
    assert(
      action.store == this,
      'The action.store is not set to the correct store instance.',
    );

    Object? originalError;
    Object? processedError;

    try {
      // ignore: discarded_futures
      _applyReducer(action);
      action._status = action._status.copy(hasFinishedMethodReduce: true);
    }
    //
    catch (error, stackTrace) {
      originalError = error;
      processedError = _processError(action, error, stackTrace);

      // Error is meant to be "swallowed".
      if (processedError == null) {
        return action._status;
      } else if (identical(processedError, error)) {
        rethrow;
      }
      //
      // Error was wrapped. Throw.
      else {
        Error.throwWithStackTrace(processedError, stackTrace);
      }
    }
    //
    finally {
      _finalize(action, originalError, processedError);
    }

    return action._status;
  }

  FutureOr<void> _applyReducer(ReduxAction<St> action) {
    _reduceCount++;

    // Make sure the action reducer returns an acceptable type.
    _checkReducerType(action.reduce);

    if (action.ifWrapReduceOverridden()) {
      return _applyReduceAndWrapReduce(action);
    } else {
      return _applyReduce(action);
    }
  }

  FutureOr<void> _applyReduceAndWrapReduce(ReduxAction<St> action) {
    assert(
      action.ifWrapReduceOverridden(),
      'This method should only be called when wrapReduce is overridden.',
    );

    // wrapReduce cannot be synchronous if it returns a Future.
    if (action.ifWrapReduceOverriddenSync()) {
      throw StoreException(
        'The ${action.runtimeType}.wrapReduce method '
        'should return `Future<St?>`, not `<St>` or `<St?>`.',
      );
    }

    action._completedFuture = false;

    // 1. Wrap the reducer with the global wrapper (if any).
    final reduce = (_wrapReduce != null)
        ? _wrapReduce.wrapReduce(action.reduce, this, action)
        : action.reduce;

    // 2. Call wrapReduce, which returns a Future<St?>.
    return (action.wrapReduce(reduce) as Future<St?>?)!.then((state) {
      // 3. Register the new state.
      _registerState(state, action);

      // 4. Check if the reducer returned a completed future (which is bad).
      if (action._completedFuture) {
        return Future.error(
          'The reducer of action ${action.runtimeType} returned a completed '
          'Future. This may result in state changes being lost. '
          'Please make sure all code paths in the reducer pass through at '
          'least one `await`. If necessary, add `await microtask;` to the '
          'start of the reducer.',
        );
      }
    });
  }

  FutureOr<void> _applyReduce(ReduxAction<St> action) {
    final reduce = (_wrapReduce != null)
        ? _wrapReduce.wrapReduce(action.reduce, this, action)
        : action.reduce;

    // Sync reducer.
    if (reduce is St? Function()) {
      _registerState(reduce(), action);
    }
    // Async reducer.
    else if (reduce is Future<St?> Function()) {
      action._completedFuture = false;

      return reduce().then((state) {
        _registerState(state, action);

        if (action._completedFuture) {
          {
            return Future.error(
              'The reducer of action ${action.runtimeType} returned a '
              'completed Future. This may result in state changes being lost. '
              'Please make sure all code paths in the reducer pass through at '
              'least one `await`. If necessary, add `await microtask;` to the '
              'start of the reducer.',
            );
          }
        }
      });
    }
    // Invalid reducer (FutureOr is not accepted).
    else {
      throw StoreException(
        'Reducer should return `St?` or `Future<St?>`. '
        'Do not return `FutureOr<St?>`. '
        "Reduce is of type: '${reduce.runtimeType}'.",
      );
    }
  }

  /// We check the return type of methods `before` and `reduce` to decide if the
  /// reducer is synchronous or asynchronous. It's important to run the reducer
  /// synchronously, if possible.
  Future<ActionStatus> _processActionAsync(ReduxAction<St> action) async {
    // The action may access the store/state/dispatch as fields.
    assert(
      action.store == this,
      'The action.store is not set to the correct store instance.',
    );

    Object? result;
    Object? originalError;
    Object? processedError;

    try {
      // 1. If there was a "before" method (not implemented here but common in
      // Redux), we would await it here.
      if (result is Future) {
        await result;
      }

      // 2. Apply the reducer.
      result = _applyReducer(action);
      if (result is Future) {
        await result;
      }

      // 3. Mark as finished.
      action._status = action._status.copy(hasFinishedMethodReduce: true);
    }
    //
    catch (error, stackTrace) {
      originalError = error;
      processedError = _processError(action, error, stackTrace);
      // Error is meant to be "swallowed".
      if (processedError == null) {
        return action._status;
      } else if (identical(processedError, error)) {
        rethrow;
      } else {
        Error.throwWithStackTrace(processedError, stackTrace);
      }
    }
    //
    finally {
      _finalize(action, originalError, processedError);
    }

    return action._status;
  }

  void _checkAllActionConditions(ReduxAction<St> triggerAction) {
    if (_actionConditionCompleters.isEmpty) {
      return;
    }

    final keysToRemove = <ActionCondition<St>>[];

    _actionConditionCompleters.forEach((condition, completer) {
      final actionsInProgress = UnmodifiableSetView(_actionsInProgress);

      if (condition(actionsInProgress, triggerAction)) {
        completer.complete((actionsInProgress, triggerAction));
        keysToRemove.add(condition);
      }
    });

    keysToRemove.forEach(_actionConditionCompleters.remove);
  }

  /// Returns a future that completes when the given action [condition] becomes
  /// true.
  ///
  /// This allows you to wait for specific actions to be in progress or
  /// finished.
  ///
  /// [condition] is a function that receives the set of actions in progress and
  /// the action that triggered the check.
  /// [completeImmediately] if true, completes immediately if the condition is
  /// already met.
  /// [completedErrorMessage] is the error message if the condition is already
  /// met and [completeImmediately] is false.
  /// [timeoutMillis] is the timeout in milliseconds.
  Future<CompleterBox<St>> waitActionCondition(
    ActionCondition<St> condition, {
    bool completeImmediately = false,
    String completedErrorMessage = 'Awaited action condition was already true',
    int? timeoutMillis,
  }) {
    final actionsInProgress = UnmodifiableSetView(_actionsInProgress);

    if (condition(actionsInProgress, null)) {
      // Complete and return the actions in progress and the trigger action.
      if (completeImmediately) {
        return Future.syncValue((actionsInProgress, null));
      } else {
        throw StoreException(
          '$completedErrorMessage, and the future completed immediately.',
        );
      }
    }
    //
    else {
      final completer = Completer<CompleterBox<St>>();

      _actionConditionCompleters[condition] = completer;

      final timeout = timeoutMillis ?? defaultTimeoutMillis;
      var future = completer.future;

      if (timeout >= 0) {
        future = completer.future.timeout(
          Duration(milliseconds: timeout),
          onTimeout: () {
            _actionConditionCompleters.remove(condition);
            throw TimeoutException(null, Duration(milliseconds: timeout));
          },
        );
      }

      return future;
    }
  }

  void _checkReducerType(FutureOr<St?> Function() reduce) {
    //
    // Sync reducer is acceptable.
    if (reduce is St? Function()) {
      return;
    }
    //
    // Async reducer is acceptable.
    else if (reduce is Future<St?> Function()) {
      return;
    }
    //
    else if (reduce is Future<St>? Function()) {
      throw const StoreException(
        '${_reducerTypeErrorMsg}Do not return `Future<St>?`.',
      );
    }
    //
    else if (reduce is Future<St?>? Function()) {
      throw const StoreException(
        '${_reducerTypeErrorMsg}Do not return `Future<St?>?`.',
      );
    }
    //
    // ignore: unnecessary_type_check
    else if (reduce is FutureOr Function()) {
      throw const StoreException(
        '${_reducerTypeErrorMsg}Do not return `FutureOr`.',
      );
    }
  }

  static const _reducerTypeErrorMsg =
      'Reducer should return `St?` or `Future<St?>`. ';

  /// Returns the processed error. Returns `null` if the error is meant to be
  /// "swallowed".
  Object? _processError(
    ReduxAction<St> action,
    Object error,
    StackTrace stackTrace,
  ) {
    if (_stateObservers != null) {
      for (final observer in _stateObservers) {
        observer.observe(action, _state, _state, error, dispatchCount);
      }
    }

    Object? errorOrNull = error;

    action._status = action._status.copy(originalError: error);

    try {
      errorOrNull = action.wrapError(errorOrNull, stackTrace);
    } on Object catch (e) {
      // If the action's wrapError throws an error, it will be used instead
      // of the original error (but the recommended way is returning the error).
      errorOrNull = e;
    }

    if (_globalWrapError != null && errorOrNull != null) {
      try {
        errorOrNull = _globalWrapError.wrap(errorOrNull, stackTrace, action);
      } on Object catch (e) {
        // If the GlobalWrapError throws an error, it will be used instead
        // of the original error (but the recommended way is returning the
        // error).
        errorOrNull = e;
      }
    }

    action._status = action._status.copy(wrappedError: errorOrNull);

    // Memorizes the action that failed. We'll remove it when it's dispatched
    // again.
    _failedActions[action.runtimeType] = action;

    // If the error is an AbortDispatchException, we set the status.
    if (errorOrNull is AbortDispatchException) {
      action._status = action._status.copy(isDispatchAborted: true);
    }

    // If an errorObserver was NOT defined, return (to throw) all errors which
    // are not UserException or AbortDispatchException.
    if (_errorObserver == null) {
      if ((errorOrNull is! ReduxException) &&
          (errorOrNull is! AbortDispatchException)) {
        return errorOrNull;
      }
    }
    // If an errorObserver was defined, observe the error.
    // Then, if the observer returns true, return the error to be thrown.
    else if (errorOrNull != null) {
      try {
        if (_errorObserver.observe(errorOrNull, stackTrace, action, this)) {
          return errorOrNull;
        }
      } on Object catch (e) {
        // The errorObserver should never throw. However, if it does, print the
        // error.
        _throws(
          "Method 'ErrorObserver.observe()' has thrown an error '$e' "
          "when observing error '$errorOrNull'.",
          e,
          stackTrace,
        );

        return errorOrNull;
      }
    }

    return null;
  }

  void _throws(errorMsg, Object? error, StackTrace stackTrace) {
    // ignore: discarded_futures
    Future(() {
      Error.throwWithStackTrace(
        (error == null) ? errorMsg : '$errorMsg:\n  $error',
        stackTrace,
      );
    });
  }

  void _finalize(
    ReduxAction<St> action,
    Object? error,
    Object? processedError,
  ) {
    final ifWasRemoved = _actionsInProgress.remove(action);
    if (ifWasRemoved) {
      _checkAllActionConditions(action);
    }

    if (_actionObservers != null) {
      for (final observer in _actionObservers) {
        observer.observe(action, dispatchCount, ini: false);
      }
    }
  }

  void _registerState(
    St? state,
    ReduxAction<St> action,
    //   {
    //   bool notify = true,
    // }
  ) {
    final prevState = _state;

    // Reducers may return null state, or the unaltered state, when they don't
    // want to change the state. Note: If the action is an "active action" it
    // will be removed, so we have to add the state to _changeController even
    // if it's the same state.
    if (((state != null) && !identical(_state, state)) ||
        _actionsInProgress.contains(action)) {
      _state = state ?? _state;

      _checkAllStateConditions(action);
    }
    final newState = _state;

    if (_stateObservers != null) {
      for (final observer in _stateObservers) {
        observer.observe(action, prevState, newState, null, dispatchCount);
      }
    }
  }

  void _checkAllStateConditions(ReduxAction<St> triggerAction) {
    final keysToRemove = <bool Function(St)>[];

    _stateConditionCompleters.forEach((condition, completer) {
      if (condition(_state)) {
        completer.complete(triggerAction);
        keysToRemove.add(condition);
      }
    });

    keysToRemove.forEach(_stateConditionCompleters.remove);
  }
}

extension StorePropsExtension on Store<dynamic> {
  /// Registers a property value that can be retrieved later by type.
  ///
  /// This is useful for dependency injection or sharing services across
  /// actions.
  /// Throws an exception if a property of the same type and key is already
  /// registered.
  ///
  /// Parameters:
  /// - [value]: The value to register.
  /// - [key]: Optional key to distinguish between multiple instances of the
  ///   same type.
  void setProp<T extends Object>(T value, {Object? key}) {
    final id = (T, key);

    if (_props.containsKey(id)) {
      throw Exception('Provider already registered for $T (key: $key)');
    }

    _props[id] = value;
  }

  /// Retrieves a previously registered property by type.
  ///
  /// Throws an exception if no property of the specified type and key is found.
  ///
  /// Parameters:
  /// - [key]: Optional key to retrieve a specific instance.
  T prop<T extends Object>({String? key}) {
    final id = (T, key);

    if (_props.containsKey(id)) {
      return _props[id]! as T;
    }

    throw Exception('No provider registered for $T (key: $key)');
  }

  /// Disposes a specific property by value and key.
  ///
  /// If the property is a [Timer], [Future], or [Stream], it will be properly
  /// cancelled/closed.
  void disposeProp(Object? value, Object? keyToDispose) {
    disposeProps(({key, value}) => key == keyToDispose && value == value);
  }

  /// Disposes properties based on a predicate.
  ///
  /// If no predicate is provided, disposes all properties that are [Timer],
  /// [Future], or [Stream] instances by cancelling/closing them.
  ///
  /// Parameters:
  /// - [predicate]: Optional function to determine which properties to dispose.
  void disposeProps([bool Function({Object? value, Object? key})? predicate]) {
    final keysToRemove = [];

    for (final MapEntry(key: key, value: value) in _props.entries) {
      final removeIt = predicate?.call(key: key, value: value) ?? true;

      if (removeIt) {
        final ifTimerFutureStream = _closeTimerFutureStream(value);

        // Removes the key if the predicate was provided and returned true,
        // or it was not provided but the value is Timer/Future/Stream.
        if ((predicate != null) || ifTimerFutureStream) {
          keysToRemove.add(key);
        }
      }
    }

    // After the iteration, remove all keys at the same time.
    keysToRemove.forEach(_props.remove);
  }

  /// If [obj] is a timer, future or stream related, it will be
  /// closed/cancelled/ignored, and `true` will be returned. For other object
  /// types, the method returns `false`.
  bool _closeTimerFutureStream(Object? obj) {
    switch (obj) {
      case Timer():
        obj.cancel();
      case Future():
        obj.ignore();
      case StreamSubscription():
        // ignore: discarded_futures
        obj.cancel();
      case StreamConsumer():
        // ignore: discarded_futures
        obj.close();
      case Sink():
        obj.close();
      case _:
        return false;
    }

    return true;
  }
}
