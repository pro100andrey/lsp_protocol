// ignore_for_file: one_member_abstracts

import 'store.dart';

/// Interface for observing the lifecycle of actions.
abstract class ActionObserver<St> {
  const ActionObserver();

  /// Called when an action is dispatched or finishes.
  ///
  /// [action] is the action being observed.
  /// [dispatchCount] is the total number of actions dispatched so far.
  /// [ini] is true when the action is dispatched, and false when it finishes.
  void observe(ReduxAction<St> action, int dispatchCount, {required bool ini});
}

/// Interface for observing errors thrown by actions.
abstract class ErrorObserver<St> {
  const ErrorObserver();

  /// Called when an action throws an error.
  ///
  /// Return true to let the error be thrown (rethrow).
  /// Return false to swallow the error.
  bool observe(
    Object error,
    StackTrace stackTrace,
    ReduxAction<St> action,
    Store<St> store,
  );
}

/// Interface for observing state changes.
abstract class StateObserver<St> {
  const StateObserver();

  /// Called when the state changes.
  ///
  /// [action] is the action that caused the state change.
  /// [prevState] is the state before the change.
  /// [newState] is the state after the change.
  /// [error] is the error thrown by the action, if any.
  /// [dispatchCount] is the total number of actions dispatched so far.
  void observe(
    ReduxAction<St> action,
    St prevState,
    St newState,
    Object? error,
    int dispatchCount,
  );
}

/// Interface for globally wrapping errors.
abstract class GlobalWrapError<St> {
  /// Wraps the error globally.
  ///
  /// This is called for every error thrown by any action.
  /// You can use this to transform errors or add extra information.
  Object? wrap(Object error, StackTrace stackTrace, ReduxAction<St> action);
}
