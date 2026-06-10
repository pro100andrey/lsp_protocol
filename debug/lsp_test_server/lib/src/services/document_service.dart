class DocumentService {
  final Map<String, String> _documents = {};

  void open(String uri, String text) {
    _documents[uri] = text;
  }

  void update(String uri, String text) {
    _documents[uri] = text;
  }

  void close(String uri) {
    _documents.remove(uri);
  }

  String? get(String uri) => _documents[uri];
}
