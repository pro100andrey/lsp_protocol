import 'dart:developer';
import 'dart:io';

Future<void> main(List<String> args)  {
  _test();

  if (args.isEmpty) {
    log('Usage: lsp_generator <spec_file>');
    exit(1);
  }

  exit(0);
}

void _test() {}
