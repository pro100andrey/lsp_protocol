import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

final class _Service {
  _Service(this.id);
  final String id;
}

final class _Missing {}

void main() {
  group('LspRequest', () {
    late ConnectionHarness h;

    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    LspRequest makeRequest({Object? id}) => LspRequest(
      method: 'textDocument/hover',
      cancellationToken: CancellationToken.noop,
      connection: h.connection,
      id: id,
    );

    test('isNotification is true when id is null', () {
      expect(makeRequest().isNotification, isTrue);
    });

    test('isNotification is false when an id is present', () {
      final request = makeRequest(id: 7);
      expect(request.isNotification, isFalse);
      expect(request.id, 7);
    });

    test('exposes method and connection', () {
      final request = makeRequest(id: 1);
      expect(request.method, 'textDocument/hover');
      expect(request.connection, same(h.connection));
    });

    test('resolve delegates to the connection container', () {
      h.connection.register(_Service('x'));
      expect(makeRequest().resolve<_Service>().id, 'x');
    });

    test('resolve throws for an unregistered type', () {
      expect(makeRequest().resolve<_Missing>, throwsStateError);
    });

    test('tryResolve returns null for an unregistered type', () {
      expect(makeRequest().tryResolve<_Missing>(), isNull);
    });
  });
}
