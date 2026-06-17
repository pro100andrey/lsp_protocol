import 'dart:async';

import 'package:logging/logging.dart';
import 'package:pro_lsp/pro_lsp.dart';
import '../lsp_support.dart';

import 'shared.dart';

/// Listens to document and configuration changes to compile and publish
/// diagnostics to the client.
final class DiagnosticsFeature extends LspFeature {
  DiagnosticsFeature({
    required TextDocumentManager docService,
    required DiagnosticsManager diagnosticsManager,
    required LspConfigurationManager configManager,
  }) : _docService = docService,
       _diagnosticsManager = diagnosticsManager,
       _configManager = configManager;

  final TextDocumentManager _docService;
  final DiagnosticsManager _diagnosticsManager;
  final LspConfigurationManager _configManager;

  final _logger = Logger('DiagnosticsFeature');
  final _subscriptions = <StreamSubscription<void>>[];

  @override
  void register(LspServer server) {
    _subscriptions
      ..add(
        _docService.onDidChange.listen((doc) {
          _logger.info('Document changed: ${doc.uri}');
          unawaited(_publishDiagnostics(doc));
        }),
      )
      ..add(
        _docService.onDidClose.listen((doc) {
          _logger.info('Document closed: ${doc.uri}');
          _diagnosticsManager.clear(doc.uri);
        }),
      )
      ..add(
        _docService.onDidOpen.listen((doc) {
          _logger.info('Document opened: ${doc.uri}');
          unawaited(_publishDiagnostics(doc));
        }),
      )
      ..add(
        _configManager.onChange.listen((_) {
          _logger.info(
            'Configuration changed, recomputing diagnostics...',
          );
          for (final doc in _docService.all) {
            unawaited(_publishDiagnostics(doc));
          }
        }),
      );
  }

  @override
  Future<void> dispose() async {
    for (final sub in _subscriptions) {
      await sub.cancel();
    }
    _subscriptions.clear();
  }

  Future<void> _publishDiagnostics(LspDocument doc) async {
    final diagnostics = <Diagnostic>[];
    final lines = doc.lines;

    // Read maxLineLength dynamically from configuration manager
    final maxLineLength =
        await _configManager.getSection<int>('lspTester.maxLineLength') ?? 120;

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      // Check for `TODO comments`
      if (line.contains('TODO')) {
        final index = line.indexOf('TODO');
        if (isCommented(line, index)) {
          diagnostics.add(
            .new(
              message: 'TODO: This needs to be implemented (Sveta)',
              range: .new(
                start: .new(line: i, character: index),
                end: .new(line: i, character: index + 4),
              ),
              severity: .warning,
              code: const .string('todo'),
              source: 'lsp-test-server',
            ),
          );
        }
      }

      // Check for `FIXME comments`
      if (line.contains('FIXME')) {
        final index = line.indexOf('FIXME');
        if (isCommented(line, index)) {
          diagnostics.add(
            .new(
              message: 'FIXME: This is a bug that needs to be fixed',
              range: .new(
                start: .new(line: i, character: index),
                end: .new(line: i, character: index + 5),
              ),
              severity: .error,
              code: const .string('fixme'),
              source: 'lsp-test-server',
            ),
          );
        }
      }

      // Check for very long lines
      if (line.length > maxLineLength) {
        diagnostics.add(
          .new(
            message:
                'Line is too long (${line.length} characters, '
                'limit is $maxLineLength)',
            range: .new(
              start: .new(line: i, character: maxLineLength),
              end: .new(line: i, character: line.length),
            ),
            severity: .information,
            code: const .string('long-line'),
            source: 'lsp-test-server',
          ),
        );
      }
    }

    _diagnosticsManager.publish(doc.uri, diagnostics);
  }
}
