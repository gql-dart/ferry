import 'package:meta/meta.dart';

import './data_proxy.dart' show Query, DataProxy, DiffResult;

typedef WatchCallback = void Function(Object newData);
typedef VoidCallback = void Function();

class ReadOptions<TVariables> extends Query<TVariables> {
  String rootId;
  Object previousResult;
  bool optimistic;

  ReadOptions({@required this.optimistic, this.rootId, this.previousResult});
}

class WriteOptions<TResult, TVariables> extends Query<TVariables> {
  String dataId;
  TResult result;

  WriteOptions({@required this.dataId, @required this.result});
}

class DiffOptions extends ReadOptions {
  bool returnPartialData;

  DiffOptions({this.returnPartialData});
}

class WatchOptions extends ReadOptions {
  WatchCallback callback;

  WatchOptions({@required this.callback});
}

abstract class GQLCache<TSerialized> implements DataProxy {
  // required to implement
  // core API
  T read<T, TVariables>(
    ReadOptions<TVariables> query,
  );
  void write<TResult, TVariables>(
    WriteOptions<TResult, TVariables> write,
  );
  DiffResult<T> diff<T>(DiffOptions query);
  VoidCallback watch(WatchOptions watch);
  bool evict(String dataId);
  Future<void> reset();
}
