class DocumentService {
  final Map<String, String> _documents = {};
  final Map<String, int> _versions = {};

  Map<String, String> get documents => _documents;

  int? getVersion(String uri) => _versions[uri];

  void open(String uri, String text) {
    _documents[uri] = text;
    _versions[uri] = 1;
  }

  void update(String uri, String text) {
    _documents[uri] = text;
    _versions[uri] = (_versions[uri] ?? 0) + 1;
  }

  void close(String uri) {
    _documents.remove(uri);
    _versions.remove(uri);
  }

  String? get(String uri) => _documents[uri];
}
