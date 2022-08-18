abstract class Store {
  Iterable<String> get keys;

  Stream<Map<String, dynamic>?> watch(String dataId);

  Future<Map<String, dynamic>?> get(String dataId);

  Future<void> put(String dataId, Map<String, dynamic>? value);

  Future<void> putAll(Map<String, Map<String, dynamic>?> data);

  Future<void> delete(String dataId);

  Future<void> deleteAll(Iterable<String> dataIds);

  Future<void> clear();

  Future<void> dispose() async => null;
}
