import 'dart:io';

Future<void> main(List<String> args) async {
  _test();

  if (args.isEmpty) {
    print('Usage: lsp_generator <spec_file>');
    exit(1);
  }

  exit(0);
}

void _test() {}
