import 'package:lsp_test_server/src/server_runner.dart';

Future<void> main() async {
  final runner = ServerRunner();
  await runner.run();
}
