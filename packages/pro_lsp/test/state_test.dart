import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

void main() {
  group('LspState', () {
    group('isRequestAllowed', () {
      test('uninitialized allows only initialize', () {
        expect(
          LspState.uninitialized.isRequestAllowed(
            RequestMethod.initialize,
          ),
          isTrue,
        );
        expect(
          LspState.uninitialized.isRequestAllowed(RequestMethod.hover),
          isFalse,
        );
        expect(
          LspState.uninitialized.isRequestAllowed(RequestMethod.shutdown),
          isFalse,
        );
      });

      test('initializing allows only initialize', () {
        expect(
          LspState.initializing.isRequestAllowed(
            RequestMethod.initialize,
          ),
          isTrue,
        );
        expect(
          LspState.initializing.isRequestAllowed(RequestMethod.hover),
          isFalse,
        );
      });

      test('initialized allows all requests except initialize', () {
        expect(
          LspState.initialized.isRequestAllowed(
            RequestMethod.initialize,
          ),
          isFalse,
        );
        expect(
          LspState.initialized.isRequestAllowed(RequestMethod.hover),
          isTrue,
        );
        expect(
          LspState.initialized.isRequestAllowed(RequestMethod.shutdown),
          isTrue,
        );
        expect(
          LspState.initialized.isRequestAllowed(RequestMethod.executeCommand),
          isTrue,
        );
      });

      test('shuttingDown allows no requests', () {
        expect(
          LspState.shuttingDown.isRequestAllowed(
            RequestMethod.initialize,
          ),
          isFalse,
        );
        expect(
          LspState.shuttingDown.isRequestAllowed(RequestMethod.hover),
          isFalse,
        );
        expect(
          LspState.shuttingDown.isRequestAllowed(RequestMethod.shutdown),
          isFalse,
        );
      });

      test('exited allows no requests', () {
        expect(
          LspState.exited.isRequestAllowed(RequestMethod.initialize),
          isFalse,
        );
        expect(
          LspState.exited.isRequestAllowed(RequestMethod.hover),
          isFalse,
        );
      });
    });

    group('isNotificationAllowed', () {
      test('uninitialized allows only exit', () {
        expect(
          LspState.uninitialized.isNotificationAllowed(
            NotificationMethod.exit,
          ),
          isTrue,
        );
        expect(
          LspState.uninitialized.isNotificationAllowed(
            NotificationMethod.logMessage,
          ),
          isFalse,
        );
        expect(
          LspState.uninitialized.isNotificationAllowed(
            NotificationMethod.didChangeConfiguration,
          ),
          isFalse,
        );
      });

      test('initializing allows only exit', () {
        expect(
          LspState.initializing.isNotificationAllowed(
            NotificationMethod.exit,
          ),
          isTrue,
        );
        expect(
          LspState.initializing.isNotificationAllowed(
            NotificationMethod.logMessage,
          ),
          isFalse,
        );
      });

      test('initialized allows all notifications', () {
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.exit,
          ),
          isTrue,
        );
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.logMessage,
          ),
          isTrue,
        );
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.didChangeConfiguration,
          ),
          isTrue,
        );
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.textDocumentDidOpen,
          ),
          isTrue,
        );
      });

      test('shuttingDown allows only exit', () {
        expect(
          LspState.shuttingDown.isNotificationAllowed(
            NotificationMethod.exit,
          ),
          isTrue,
        );
        expect(
          LspState.shuttingDown.isNotificationAllowed(
            NotificationMethod.logMessage,
          ),
          isFalse,
        );
      });

      test('exited allows no notifications', () {
        expect(
          LspState.exited.isNotificationAllowed(NotificationMethod.exit),
          isFalse,
        );
        expect(
          LspState.exited.isNotificationAllowed(NotificationMethod.logMessage),
          isFalse,
        );
      });
    });
  });
}
