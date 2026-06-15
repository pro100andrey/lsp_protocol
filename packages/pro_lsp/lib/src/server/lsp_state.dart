import '../generated/models/methods.dart';

/// Represents the lifecycle states of an LSP server.
///
/// The LSP protocol defines a strict state machine that governs which
/// requests and notifications are valid at each stage of the server's
/// lifecycle.
///
/// ## State Machine
///
/// ```
/// ┌─────────────────┐
/// │  uninitialized  │ ← Server starts here
/// └────────┬────────┘
///          │ initialize request
///          ▼
/// ┌─────────────────┐
/// │  initializing   │ ← Processing initialize
/// └────────┬────────┘
///          │ initialize response sent
///          ▼
/// ┌─────────────────┐
/// │   initialized   │ ← Fully operational
/// └────────┬────────┘
///          │ shutdown request
///          ▼
/// ┌─────────────────┐
/// │ shuttingDown    │ ← Processing shutdown
/// └────────┬────────┘
///          │ exit notification
///          ▼
/// ┌─────────────────┐
/// │    exited       │ ← Server shutting down
/// └─────────────────┘
/// ```
///
/// ## State Rules
///
/// | State | Allowed Requests | Allowed Notifications |
/// |-------|-----------------|----------------------|
/// | `uninitialized` | `initialize` only | `exit` only |
/// | `initializing` | None | `exit` only |
/// | `initialized` | All except `initialize` | All |
/// | `shuttingDown` | None | `exit` only |
/// | `exited` | None | None |
///
/// ## State Transitions
///
/// State transitions are managed automatically by the connection when
/// handling requests and notifications. Handlers should never manually
/// change the state — use the state machine as a read-only indicator
/// of where the server is in its lifecycle.
///
/// Use [isRequestAllowed] and [isNotificationAllowed] to check if a given
/// method is valid in the current state.
enum LspState {
  /// The server has started but has not yet received an `initialize` request.
  ///
  /// In this state, the only valid operations are:
  /// - Receive `initialize` request (transitions to [initializing])
  /// - Receive `exit` notification (transitions to [exited])
  uninitialized,

  /// The server is currently processing the `initialize` request.
  ///
  /// No requests are allowed during this state. The only valid operation
  /// is to receive an `exit` notification.
  ///
  /// Once the `initialize` request handler completes successfully, the
  /// server transitions to [initialized].
  initializing,

  /// The server has responded to the `initialize` request and is fully
  /// operational.
  ///
  /// All LSP requests (except `initialize`) and notifications are allowed.
  /// This is the normal operating state for the server.
  initialized,

  /// The server has received a `shutdown` request but has not yet received an
  /// `exit` notification.
  ///
  /// No requests are allowed during this state. The server is cleaning up
  /// resources and preparing to shut down.
  ///
  /// Once the `shutdown` request handler completes, the server waits for
  /// the `exit` notification to transition to [exited].
  shuttingDown,

  /// The server has received an `exit` notification and has stopped processing
  /// messages.
  ///
  /// No requests or notifications are allowed in this state. The server
  /// will close its connection after this state is reached.
  exited,
}

/// Helper extension on [LspState] to validate transitions and allowed messages.
///
/// Provides methods to check whether a given LSP method is valid in the
/// current state. Used internally by the connection to enforce
/// the LSP state machine protocol.
extension LspStateExtension on LspState {
  /// Returns whether a request with the given [method] is allowed
  /// in this state.
  ///
  /// Request validation follows the LSP state machine rules:
  /// - [uninitialized]: Only `initialize` is allowed
  /// - [initializing]: No requests allowed
  /// - [initialized]: All requests except `initialize`
  /// - [shuttingDown]: No requests allowed
  /// - [exited]: No requests allowed
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

  /// Returns whether a notification with the given [method] is allowed
  /// in this state.
  ///
  /// Notification validation follows the LSP state machine rules:
  /// - [uninitialized]: Only `exit` is allowed
  /// - [initializing]: Only `exit` is allowed
  /// - [initialized]: All notifications allowed
  /// - [shuttingDown]: Only `exit` is allowed
  /// - [exited]: No notifications allowed
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
