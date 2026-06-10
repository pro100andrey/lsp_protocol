import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

import '../common/user_exception.dart';

Future<void> runAnalyzer(String outputDir, Logger logger) async {
  final progress = logger.progress('Running dart analyze in $outputDir...');

  final result = await Process.run(
    'dart',
    ['analyze'],
    workingDirectory: outputDir,
  );

  if (result.exitCode == 0) {
    progress.complete('dart analyze passed successfully');
  } else {
    progress.fail('dart analyze failed (exit ${result.exitCode})');
    final out = (result.stdout as String).trim();
    if (out.isNotEmpty) {
      logger.err(out);
    }
    throw UserException(
      'dart analyze exited with code ${result.exitCode}.',
      reason: out.isNotEmpty ? out : 'See output above.',
      code: result.exitCode,
    );
  }
}
