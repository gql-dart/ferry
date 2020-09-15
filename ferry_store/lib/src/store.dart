abstract class Store {
  Iterable<String> get keys;

  Stream<Map<String, dynamic>> watch(String dataId);

  Map<String, dynamic> get(String dataId);

  void put(String dataId, Map<String, dynamic> value);

  void putAll(Map<String, Map<String, dynamic>> data);

  void delete(String dataId);

  void deleteAll(Iterable<String> dataIds);

  void clear();

  Future<void> dispose() async => null;
}
