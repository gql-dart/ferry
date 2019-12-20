abstract class NormalizedCache {
  bool has(String dataId);
  Map<String, dynamic> get(String dataId);
  void set(String dataId, Map<String, dynamic> value);
  void delete(String dataId);
  void clear();
  Map<String, Map<String, dynamic>> toObject();
  void replace(Map<String, Map<String, dynamic>> newData);
  int retain(String rootId);
  int release(String rootId);
}
