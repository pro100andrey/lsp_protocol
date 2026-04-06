/// A lightweight Redux implementation for CLI applications.
///
/// Provides centralized state management via a [Store] that holds the
/// application state and dispatches [ReduxAction]s to update it.
///
/// ## Core concepts
///
/// - **[Store]** — holds the state; dispatch actions against it.
/// - **[ReduxAction]** — defines a unit of work via [ReduxAction.reduce].
///   May be sync or async. Use [Store.dispatch] / [Store.dispatchAndWait] /
///   [Store.dispatchSync] to run actions.
/// - **[ActionStatus]** — tracks the result of a dispatched action
///   (waiting, completed, failed, aborted).
/// - **[ReduxException]** — structured error with Unix exit codes for CLI
///   error reporting.
/// - **Observers** — [ActionObserver], [StateObserver], [ErrorObserver], and
///   [GlobalWrapError] let you monitor the action lifecycle and state changes.
/// - **[WrapReduce]** — globally wraps every reducer, similar to middleware.
library;

import 'cli_async_redux.dart'
    show
        ActionObserver,
        ErrorObserver,
        GlobalWrapError,
        ReduxAction,
        ReduxException,
        StateObserver,
        Store,
        WrapReduce;
import 'src/action_status.dart' show ActionStatus;

export 'src/exception.dart';
export 'src/observers.dart';
export 'src/store.dart';
export 'src/store_exception.dart';
export 'src/wrap_reduce.dart';
