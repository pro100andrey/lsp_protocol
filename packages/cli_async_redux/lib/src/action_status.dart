/// Represents the status of an action's execution.
///
/// Tracks whether an action has been dispatched, completed, aborted, and any
/// errors that occurred during execution.
final class ActionStatus {
  /// Creates an [ActionStatus] with the given properties.
  const ActionStatus({
    this.isDispatched = false,
    this.hasFinishedMethodReduce = false,
    this.isDispatchAborted = false,
    this.originalError,
    this.wrappedError,
  });

  /// True if the action has been dispatched.
  final bool isDispatched;

  /// True if the reducer method has finished executing.
  final bool hasFinishedMethodReduce;

  /// True if the action was aborted before execution.
  final bool isDispatchAborted;

  /// The original error that was thrown, if any.
  final Object? originalError;

  /// The error after being wrapped by error handlers, if any.
  final Object? wrappedError;

  /// True if the action completed successfully without errors.
  bool get isCompletedOk => isCompleted && (originalError == null);

  /// True if the action completed with an error.
  bool get isCompletedFailed => isCompleted && (originalError != null);

  /// True if the action has finished executing (either successfully or with
  /// error) or was aborted.
  bool get isCompleted =>
      hasFinishedMethodReduce || originalError != null || isDispatchAborted;

  /// Creates a copy of this status with updated properties.
  ActionStatus copy({
    bool? isDispatched,
    bool? hasFinishedMethodReduce,
    bool? isDispatchAborted,
    Object? originalError,
    Object? wrappedError,
  }) => ActionStatus(
    isDispatched: isDispatched ?? this.isDispatched,
    hasFinishedMethodReduce:
        hasFinishedMethodReduce ?? this.hasFinishedMethodReduce,
    isDispatchAborted: isDispatchAborted ?? this.isDispatchAborted,
    originalError: originalError ?? this.originalError,
    wrappedError: wrappedError ?? this.wrappedError,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionStatus &&
          runtimeType == other.runtimeType &&
          isDispatched == other.isDispatched &&
          hasFinishedMethodReduce == other.hasFinishedMethodReduce &&
          isDispatchAborted == other.isDispatchAborted &&
          originalError == other.originalError &&
          wrappedError == other.wrappedError;

  @override
  int get hashCode =>
      isDispatched.hashCode ^
      hasFinishedMethodReduce.hashCode ^
      isDispatchAborted.hashCode ^
      originalError.hashCode ^
      wrappedError.hashCode;
}
