import 'package:pro_lsp/src/connection/lsp_exception.dart';
import 'package:test/test.dart';

void main() {
  group('LspErrorCodes', () {
    test('parseError is -32700', () {
      expect(LspErrorCodes.parseError, -32700);
    });

    test('invalidRequest is -32600', () {
      expect(LspErrorCodes.invalidRequest, -32600);
    });

    test('methodNotFound is -32601', () {
      expect(LspErrorCodes.methodNotFound, -32601);
    });

    test('invalidParams is -32602', () {
      expect(LspErrorCodes.invalidParams, -32602);
    });

    test('internalError is -32603', () {
      expect(LspErrorCodes.internalError, -32603);
    });

    test('serverNotInitialized is -32002', () {
      expect(LspErrorCodes.serverNotInitialized, -32002);
    });

    test('unknownErrorCode is -32001', () {
      expect(LspErrorCodes.unknownErrorCode, -32001);
    });

    test('requestCancelled is -32800', () {
      expect(LspErrorCodes.requestCancelled, -32800);
    });

    test('contentModified is -32801', () {
      expect(LspErrorCodes.contentModified, -32801);
    });
  });

  group('LspException', () {
    test('toString includes code and message', () {
      const exception = LspException(-1, 'test error');
      expect(exception.toString(), 'LspException(-1): test error');
    });

    test('parseError factory creates correct exception', () {
      final e = LspException.parseError('bad json');
      expect(e.code, LspErrorCodes.parseError);
      expect(e.message, 'bad json');
      expect(e.data, isNull);
    });

    test('invalidRequest factory creates correct exception', () {
      final e = LspException.invalidRequest('bad request');
      expect(e.code, LspErrorCodes.invalidRequest);
      expect(e.message, 'bad request');
    });

    test('methodNotFound factory creates correct exception', () {
      final e = LspException.methodNotFound('unknown method');
      expect(e.code, LspErrorCodes.methodNotFound);
      expect(e.message, 'unknown method');
    });

    test('invalidParams factory creates correct exception', () {
      final e = LspException.invalidParams('missing field');
      expect(e.code, LspErrorCodes.invalidParams);
      expect(e.message, 'missing field');
    });

    test('internalError factory creates correct exception', () {
      final e = LspException.internalError('crash');
      expect(e.code, LspErrorCodes.internalError);
      expect(e.message, 'crash');
    });

    test('serverNotInitialized factory creates correct exception', () {
      final e = LspException.serverNotInitialized('not ready');
      expect(e.code, LspErrorCodes.serverNotInitialized);
      expect(e.message, 'not ready');
    });

    test('requestCancelled factory creates correct exception', () {
      final e = LspException.requestCancelled('aborted');
      expect(e.code, LspErrorCodes.requestCancelled);
      expect(e.message, 'aborted');
    });

    test('contentModified factory creates correct exception', () {
      final e = LspException.contentModified('conflict');
      expect(e.code, LspErrorCodes.contentModified);
      expect(e.message, 'conflict');
    });

    test('data field is stored', () {
      const e = LspException(-1, 'error', {'key': 'value'});
      expect(e.data, {'key': 'value'});
    });

    test('toRpcException converts to RpcException', () {
      final e = LspException.invalidRequest('test', {'key': 'value'});
      final rpc = e.toRpcException();
      expect(rpc.code, LspErrorCodes.invalidRequest);
      expect(rpc.message, 'test');
      expect(rpc.data, {'key': 'value'});
    });
  });

  group('parseParams', () {
    test('successfully parses non-null map', () {
      final result = parseParams<Map<String, dynamic>>(
        {'key': 'value'},
        (json) => json,
      );
      expect(result, {'key': 'value'});
    });

    test('successfully parses null map as empty map', () {
      final result = parseParams<Map<String, dynamic>>(
        null,
        (json) => json,
      );
      expect(result, isEmpty);
    });

    test('throws LspException.invalidParams on invalid types', () {
      expect(
        () => parseParams<Map<String, dynamic>>('not-a-map', (json) => json),
        throwsA(
          isA<LspException>().having(
            (e) => e.code,
            'code',
            LspErrorCodes.invalidParams,
          ),
        ),
      );
    });
  });
}
