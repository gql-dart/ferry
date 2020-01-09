// import 'package:meta/meta.dart';
// import 'package:hive/hive.dart';

// import './query_event.dart';

// abstract class OfflineMutationStore {
//   Future<void> add(QueryRequest event);

//   Iterable<dynamic> keys;

//   Iterable<QueryRequest> values;

//   Future<void> delete(dynamic key);
// }

// class HiveMutationQueue extends OfflineMutationStore {
//   final Box _box;

//   HiveMutationQueue(Box box) : _box = box;
// }
