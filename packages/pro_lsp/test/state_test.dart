import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

void main() {
  group('LspState', () {
    group('isRequestAllowed', () {
      test('uninitialized allows only initialize', () {
        expect(
          LspState.uninitialized.isRequestAllowed(
            RequestMethod.initialize.value,
          ),
          isTrue,
        );
        expect(
          LspState.uninitialized.isRequestAllowed('textDocument/hover'),
          isFalse,
        );
        expect(
          LspState.uninitialized.isRequestAllowed('shutdown'),
          isFalse,
        );
      });

      test('initializing allows only initialize', () {
        expect(
          LspState.initializing.isRequestAllowed(
            RequestMethod.initialize.value,
          ),
          isTrue,
        );
        expect(
          LspState.initializing.isRequestAllowed('textDocument/hover'),
          isFalse,
        );
      });

      test('initialized allows all requests except initialize', () {
        expect(
          LspState.initialized.isRequestAllowed(
            RequestMethod.initialize.value,
          ),
          isFalse,
        );
        expect(
          LspState.initialized.isRequestAllowed('textDocument/hover'),
          isTrue,
        );
        expect(
          LspState.initialized.isRequestAllowed('shutdown'),
          isTrue,
        );
        expect(
          LspState.initialized.isRequestAllowed('workspace/executeCommand'),
          isTrue,
        );
      });

      test('shuttingDown allows no requests', () {
        expect(
          LspState.shuttingDown.isRequestAllowed(
            RequestMethod.initialize.value,
          ),
          isFalse,
        );
        expect(
          LspState.shuttingDown.isRequestAllowed('textDocument/hover'),
          isFalse,
        );
        expect(
          LspState.shuttingDown.isRequestAllowed('shutdown'),
          isFalse,
        );
      });

      test('exited allows no requests', () {
        expect(
          LspState.exited.isRequestAllowed(RequestMethod.initialize.value),
          isFalse,
        );
        expect(
          LspState.exited.isRequestAllowed('textDocument/hover'),
          isFalse,
        );
      });
    });

    group('isNotificationAllowed', () {
      test('uninitialized allows only exit', () {
        expect(
          LspState.uninitialized.isNotificationAllowed(
            NotificationMethod.exit.value,
          ),
          isTrue,
        );
        expect(
          LspState.uninitialized.isNotificationAllowed('window/logMessage'),
          isFalse,
        );
        expect(
          LspState.uninitialized.isNotificationAllowed(
            NotificationMethod.didChangeConfiguration.value,
          ),
          isFalse,
        );
      });

      test('initializing allows only exit', () {
        expect(
          LspState.initializing.isNotificationAllowed(
            NotificationMethod.exit.value,
          ),
          isTrue,
        );
        expect(
          LspState.initializing.isNotificationAllowed('window/logMessage'),
          isFalse,
        );
      });

      test('initialized allows all notifications', () {
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.exit.value,
          ),
          isTrue,
        );
        expect(
          LspState.initialized.isNotificationAllowed('window/logMessage'),
          isTrue,
        );
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.didChangeConfiguration.value,
          ),
          isTrue,
        );
        expect(
          LspState.initialized.isNotificationAllowed(
            NotificationMethod.textDocumentDidOpen.value,
          ),
          isTrue,
        );
      });

      test('shuttingDown allows only exit', () {
        expect(
          LspState.shuttingDown.isNotificationAllowed(
            NotificationMethod.exit.value,
          ),
          isTrue,
        );
        expect(
          LspState.shuttingDown.isNotificationAllowed('window/logMessage'),
          isFalse,
        );
      });

      test('exited allows no notifications', () {
        expect(
          LspState.exited.isNotificationAllowed(NotificationMethod.exit.value),
          isFalse,
        );
        expect(
          LspState.exited.isNotificationAllowed('window/logMessage'),
          isFalse,
        );
      });
    });
  });
}
