abstract class Store {
  Stream<Map<String, Map<String, dynamic>>> watch();

  Map<String, dynamic> get(
    String dataId,
  );

  void put(
    String dataId,
    Map<String, dynamic> value,
  );

  void putAll(
    Map<String, Map<String, dynamic>> data,
  );

  void delete(
    String dataId,
  );

  Map<String, Map<String, dynamic>> toMap();
}
