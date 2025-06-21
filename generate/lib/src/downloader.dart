// ignore_for_file: avoid_print

import 'package:http/http.dart';

Future<String> download(Uri uri) async {
  print('Downloading from $uri');
  final watch = Stopwatch()..start();

  final response = await get(uri);
  watch.stop();
  print('Download completed in ${watch.elapsedMilliseconds} ms');

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to download: ${response.reasonPhrase}');
  }
}
