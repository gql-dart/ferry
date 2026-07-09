import 'package:benchmark_harness/perf_benchmark_harness.dart';
import 'package:ferry_hive_ce_store/ferry_hive_ce_store.dart';
import 'package:ferry_sqlite_store/ferry_sqlite_store.dart';
import 'package:hive_ce/hive.dart';
import 'package:sqlite3/sqlite3.dart';

class HiveBenchmark extends PerfBenchmarkBase {
  final HiveStore store;

  HiveBenchmark(Box<dynamic> box)
      : store = HiveStore(box),
        super('Hive');

  @override
  Future<void> setup() async {
    prepareData(store);
  }

  @override
  Future<void> run() async {
    benchmarkStoreGet(store);
  }
}

class Sqlite3Benchmark extends PerfBenchmarkBase {
  final Sqlite3StoreInMemoryFlush store;

  Sqlite3Benchmark(Database db)
      : store = Sqlite3StoreInMemoryFlush(db),
        super('Sqlite3');

  @override
  void setup() {
    prepareData(store);
  }

  @override
  Future<void> run() async {
    benchmarkStoreGet(store);
  }
}

class Sqlite3StoreWriteThrough extends PerfBenchmarkBase {
  final Sqlite3StoreInMemoryWriteThrough store;

  Sqlite3StoreWriteThrough(Database db)
      : store = Sqlite3StoreInMemoryWriteThrough(db),
        super('Sqlite3 Write Through');

  @override
  void setup() {
    prepareData(store);
  }

  @override
  Future<void> run() async {
    benchmarkStoreGet(store);
  }
}

class Sqlite3StoreWriteThroughPut extends PerfBenchmarkBase {
  final Sqlite3StoreInMemoryWriteThrough store;

  Sqlite3StoreWriteThroughPut(Database db)
      : store = Sqlite3StoreInMemoryWriteThrough(db),
        super('Sqlite3 Write Through Put');

  @override
  void setup() {
    prepareData(store);
  }

  @override
  Future<void> run() async {
    benchMarkStorePut(store);
  }
}

class HiveStorePut extends PerfBenchmarkBase {
  final HiveStore store;

  HiveStorePut(Box<dynamic> box)
      : store = HiveStore(box),
        super('Hive Put');

  @override
  Future<void> setup() async {
    prepareData(store);
  }

  @override
  Future<void> run() async {
    benchMarkStorePut(store);
  }
}

class Sqlite3StorePut extends PerfBenchmarkBase {
  final Sqlite3StoreInMemoryFlush store;

  Sqlite3StorePut(Database db)
      : store = Sqlite3StoreInMemoryFlush(db),
        super('Sqlite3 Put');

  @override
  void setup() {
    prepareData(store);
  }

  @override
  Future<void> run() async {
    benchMarkStorePut(store);
  }
}

void main() async {
  Hive.init('./test/__hive_data__');
  final hiveBox = await Hive.openBox<dynamic>('graphql');
  //WAL
  final sqlite3Db =
      sqlite3.open('/tmp/ferry_sqlite3.db', mode: OpenMode.readWriteCreate);

  final hiveBenchmark = HiveBenchmark(hiveBox);
  final sqlite3Benchmark = Sqlite3Benchmark(sqlite3Db);

  final sqlite3Db2 =
      sqlite3.open('/tmp/ferry_sqlite3_2.db', mode: OpenMode.readWriteCreate);

  final sqlite3StoreWriteThrough = Sqlite3StoreWriteThrough(sqlite3Db2);

  hiveBenchmark.report();
  sqlite3Benchmark.report();
  sqlite3StoreWriteThrough.report();

  final sqlite3Db3 =
      sqlite3.open('/tmp/ferry_sqlite3_3.db', mode: OpenMode.readWriteCreate);

  final sqlite3StoreWriteThroughPut = Sqlite3StoreWriteThroughPut(sqlite3Db3);

  sqlite3StoreWriteThroughPut.report();

  final hiveBox2 = await Hive.openBox<dynamic>('graphql2');

  final hiveStorePut = HiveStorePut(hiveBox2);

  hiveStorePut.report();

  final sqlite3Db4 =
      sqlite3.open('/tmp/ferry_sqlite3_4.db', mode: OpenMode.readWriteCreate);

  final sqlite3StorePut = Sqlite3StorePut(sqlite3Db4);

  sqlite3StorePut.report();
}

void prepareData(Store store) {
  final data = {
    'Query': {
      'posts': [
        {'\$ref': 'Post:123'}
      ]
    },
    'Post:123': {
      'id': '123',
      '__typename': 'Post',
    },
  };

  store.putAll(data);
}

void benchmarkStoreGet(Store store) {
  for (var key in ['Query', 'Post:123']) {
    store.get(key);
  }
}

void benchMarkStorePut(Store store) {
  for (int i = 0; i < 1000; i++) {
    store.put('Post:$i', {
      'id': '$i',
      '__typename': 'Post',
    });
  }
}
