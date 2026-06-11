import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

void main() {
  group('CancellationToken', () {
    test('isCancelled is false by default', () {
      final token = CancellationToken();
      expect(token.isCancelled, isFalse);
    });

    test('cancel() sets isCancelled to true', () {
      final token = CancellationToken()
        ..cancel()
        ..cancel()
        ..cancel();
      expect(token.isCancelled, isTrue);
    });

    test('cancel() is idempotent', () {
      final token = CancellationToken()..cancel();
      expect(token.isCancelled, isTrue);
    });

    test('onCancelled fires when cancelled', () async {
      final token = CancellationToken();
      final events = <void>[];
      token.onCancelled.listen(events.add);

      token.cancel();
      await Future<dynamic>.delayed(Duration.zero);

      expect(events, hasLength(1));
    });

    test('onCancelled fires only once', () async {
      final token = CancellationToken();
      final events = <void>[];
      token.onCancelled.listen(events.add);

      token
        ..cancel()
        ..cancel()
        ..cancel();
      await Future<dynamic>.delayed(Duration.zero);

      expect(events, hasLength(1));
    });

    test('throwIfCancelled() does nothing when not cancelled', () {
      final token = CancellationToken();
      expect(token.throwIfCancelled, returnsNormally);
    });

    test('throwIfCancelled() throws LspException when cancelled', () {
      final token = CancellationToken()..cancel();

      expect(
        token.throwIfCancelled,
        throwsA(
          isA<LspException>().having(
            (e) => e.code,
            'code',
            LspErrorCodes.requestCancelled,
          ),
        ),
      );
      expect(
        token.throwIfCancelled,
        throwsA(
          isA<LspException>().having(
            (e) => e.message,
            'message',
            contains('cancelled'),
          ),
        ),
      );
    });

    test('CancellationToken.current returns null outside zone', () {
      expect(CancellationToken.current, isNull);
    });

    test('CancellationToken.current returns token from zone', () async {
      CancellationToken? capturedToken;

      final token = CancellationToken();
      await runZoned(
        () {
          capturedToken = CancellationToken.current;
        },
        zoneValues: {#cancellationToken: token},
      );

      expect(identical(capturedToken, token), isTrue);
    });
  });
}
