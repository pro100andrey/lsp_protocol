import '../generated/models/structures.dart';
import '../generated/models/unions.dart';
import 'lsp_server.dart';

/// Simplifies registering and unregistering server capabilities dynamically.
final class CapabilityManager {
  CapabilityManager(this._server);

  final LspServer _server;
  var _registrationIdCounter = 0;

  /// Dynamically registers a capability on the client for the specified
  /// [method].
  ///
  /// Returns a registration ID string that can be used to unregister later.
  Future<String> register({
    required String method,
    LSPAny? registerOptions,
  }) async {
    final registrationId = 'dynamic-registration-${_registrationIdCounter++}';
    await _server.client.client.registerCapability(
      RegistrationParams(
        registrations: [
          Registration(
            id: registrationId,
            method: method,
            registerOptions: registerOptions,
          ),
        ],
      ),
    );
    return registrationId;
  }

  /// Dynamically unregisters a capability by its [registrationId] and [method].
  Future<void> unregister({
    required String registrationId,
    required String method,
  }) async {
    await _server.client.client.unregisterCapability(
      UnregistrationParams(
        unregisterations: [
          Unregistration(
            id: registrationId,
            method: method,
          ),
        ],
      ),
    );
  }
}
