import 'package:rxdart/rxdart.dart';

abstract class Store {
  ValueStream<Map<String, Map<String, dynamic>>> valueStream;

  Map<String, dynamic> get(String dataId);

  void put(String dataId, Map<String, dynamic> value);

  void putAll(Map<String, Map<String, dynamic>> data);

  void delete(String dataId);

  void clear();

  void dispose();
}
