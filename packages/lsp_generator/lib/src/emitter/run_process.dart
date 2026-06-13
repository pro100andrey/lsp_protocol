import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

import '../common/cli_exception.dart';

/// Runs a CLI command via `dart` and handles progress, success, and failure.
///
/// [workingDir] — the working directory for the process.
/// [logger] — the logger to use for output.
/// [progressLabel] — text shown in the progress bar.
/// [args] — arguments passed to `dart` (e.g. `['analyze']`
///   or `['run', 'build_runner', 'build']`).
/// [onSuccess] — optional callback invoked with stdout on success.
///
/// Throws a [CliException] if the process exits with a non-zero code.
Future<void> runProcess(
  String workingDir,
  Logger logger,
  String progressLabel,
  List<String> args, {
  void Function(String stdout)? onSuccess,
}) async {
  final progress = logger.progress(progressLabel);

  final result = await Process.run(
    'dart',
    args,
    workingDirectory: workingDir,
  );

  if (result.exitCode == 0) {
    progress.complete('completed successfully');
    final out = (result.stdout as String).trim();
    if (out.isNotEmpty) {
      onSuccess?.call(out);
    }
  } else {
    progress.fail('failed (exit ${result.exitCode})');
    final err = (result.stderr as String).trim();
    if (err.isNotEmpty) {
      logger.err(err);
    }

    throw CliException(
      '$progressLabel exited with code ${result.exitCode}.',
      reason: err.isNotEmpty ? err : 'See output above.',
      code: result.exitCode,
    );
  }
}

/// Runs `dart analyze` in the given [workingDir].
Future<void> runAnalyzer(String workingDir, Logger logger) => runProcess(
  workingDir,
  logger,
  'Running dart analyze in $workingDir...',
  ['analyze'],
);

/// Runs `build_runner build` in the given [workingDir].
Future<void> runBuildRunner(String workingDir, Logger logger) => runProcess(
  workingDir,
  logger,
  'Running build_runner in $workingDir...',
  ['run', 'build_runner', 'build'],
  onSuccess: (stdout) => logger.detail(stdout),
);
