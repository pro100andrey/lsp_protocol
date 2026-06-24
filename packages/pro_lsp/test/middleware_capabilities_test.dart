import 'dart:async';

import 'package:pro_lsp/pro_lsp.dart';
import 'package:test/test.dart';

import 'support/connection_harness.dart';

/// A custom, non-spec [LSPMethod] so we can dispatch through the full
/// middleware + handler path without depending on a generated method enum.
final class _CustomMethod implements LSPMethod {
  const _CustomMethod(this.value);
  @override
  final String value;
}

class _Greeter {
  const _Greeter();
  String greet() => 'hi';
}

void main() {
  group('middleware on the unified LspRequest', () {
    late ConnectionHarness h;
    setUp(() => h = ConnectionHarness());
    tearDown(() => h.dispose());

    test('resolves services, reads context, and rewrites params', () async {
      const method = _CustomMethod(r'$/echo');
      String? mwGreeting;
      String? mwMethod;
      bool? mwIsNotification;
      bool? mwTokenCancelled;
      var mwSeesConnection = false;

      h.connection.register(const _Greeter());
      h.connection.addMiddleware(
        LspMiddleware.fromFunction((request, next) {
          mwGreeting = request.resolve<_Greeter>().greet();
          mwMethod = request.method;
          mwIsNotification = request.isNotification;
          mwTokenCancelled = request.cancellationToken.isCancelled;
          mwSeesConnection = identical(request.connection, h.connection);
          request.params = const {'modified': true};
          return next(request);
        }),
      );
      h.connection.registerCustomRequestHandler(
        method,
        (params, context) async => {
          'sawModified': (params! as Map)['modified'],
        },
      );

      await h.initialize();
      final resp = await h.sendRequest(1, r'$/echo', {'original': 1});

      expect(mwGreeting, 'hi');
      expect(mwMethod, r'$/echo');
      expect(mwIsNotification, isFalse);
      expect(mwTokenCancelled, isFalse);
      expect(mwSeesConnection, isTrue);
      expect(resp['result'], {'sawModified': true});
    });

    test('notification middleware sees isNotification and a null id', () async {
      const method = _CustomMethod(r'$/note');
      bool? isNote;
      Object? sawId;
      final handled = Completer<void>();

      h.connection.addMiddleware(
        LspMiddleware.fromFunction((request, next) {
          isNote = request.isNotification;
          sawId = request.id;
          return next(request);
        }),
      );
      h.connection.registerCustomNotificationHandler(
        method,
        (params, context) async => handled.complete(),
      );

      await h.initialize();
      h.sendNotification(r'$/note', {'a': 1});
      await handled.future;

      expect(isNote, isTrue);
      expect(sawId, isNull);
    });
  });
}
