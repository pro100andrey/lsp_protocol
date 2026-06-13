import '../generated/models/methods.dart';

/// Represents the lifecycle states of an LSP server.
enum LspState {
  /// The server has started but has not yet received an `initialize` request.
  uninitialized,

  /// The server is currently processing the `initialize` request.
  initializing,

  /// The server has responded to the `initialize` request and is fully
  ///  operational.
  initialized,

  /// The server has received a `shutdown` request but has not yet received an
  ///  `exit` notification.
  shuttingDown,

  /// The server has received an `exit` notification and has stopped processing
  /// messages.
  exited,
}

/// Helper extension on [LspState] to validate transitions and allowed messages.
extension LspStateExtension on LspState {
  /// Returns whether a request with the given [method] is allowed in this
  /// state.
  bool isRequestAllowed(RequestMethod method) {
    switch (this) {
      case .uninitialized:
        return method == .initialize;
      case .initializing:
        return false;
      case .initialized:
        // initialize is not allowed after we are initialized
        return method != .initialize;
      case .shuttingDown:
        return false; // No requests allowed during shutdown
      case .exited:
        return false;
    }
  }

  /// Returns whether a notification with the given [method] is allowed in this
  ///  state.
  bool isNotificationAllowed(NotificationMethod method) {
    switch (this) {
      case .uninitialized:
        return method == .exit;
      case .initializing:
        return method == .exit;
      case .initialized:
        return true;
      case .shuttingDown:
        return method == .exit;
      case .exited:
        return false;
    }
  }
}
