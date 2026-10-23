// Measures the cost of Cache.watchQuery on a Hive-backed store when a few
// queries each depend on thousands of normalized entities.
//
// Run with the VM service enabled to also get GC counts and GC time:
//
//   dart run --enable-vm-service --disable-service-auth-codes \
//     benchmark/watch_fanout_benchmark.dart \
//     [--store=legacy,keyed,memory] [--rounds=3] [--entities=3300]
//
// Or AOT-compiled for timings closer to a release build (no GC data):
//
//   dart compile exe benchmark/watch_fanout_benchmark.dart -o /tmp/fanout
//   /tmp/fanout
import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_hive_ce_store/ferry_hive_ce_store.dart';
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:ffi/ffi.dart';
import 'package:hive_ce/hive.dart';
import 'package:vm_service/vm_service.dart' as vm;
import 'package:vm_service/vm_service_io.dart';

import '../test/legacy_hive_store.dart';

/// Entities watched by each of the two catalog-like queries.
var watchedEntities = 3300;

/// Entities written by an unrelated query, like a sync of other data.
const unrelatedEntities = 300;

/// About the average entity size of the app cache (8.8 MB / 3,372 entities).
final _commentary = 'x' * 2000;

int _microtasks = 0;

Future<void> main(List<String> args) async {
  final stores = _arg(args, 'store', 'legacy,keyed,memory').split(',');
  final rounds = int.parse(_arg(args, 'rounds', '3'));
  watchedEntities = int.parse(_arg(args, 'entities', '$watchedEntities'));

  await runZoned(
    () async {
      final profiler = await _Profiler.connect();
      final tmp = await Directory.systemTemp.createTemp('ferry_fanout');
      Hive.init(tmp.path);

      final results = <String, List<Map<String, _Sample>>>{};
      for (var round = 0; round < rounds; round++) {
        for (final store in stores) {
          final samples = await _runScenario(store, profiler, round);
          (results[store] ??= []).add(samples);
        }
      }
      _printMedians(results);

      await profiler.dispose();
      await Hive.close();
      await tmp.delete(recursive: true);
    },
    zoneSpecification: ZoneSpecification(
      scheduleMicrotask: (self, parent, zone, f) {
        _microtasks++;
        parent.scheduleMicrotask(zone, f);
      },
    ),
  );
}

String _arg(List<String> args, String name, String fallback) {
  for (final arg in args) {
    if (arg.startsWith('--$name=')) return arg.substring(name.length + 3);
  }
  return fallback;
}

GReviewsData _reviews(int count, {int offset = 0, int stars = 3}) =>
    GReviewsData(
      (b) => b
        ..reviews.addAll([
          for (var i = 0; i < count; i++)
            GReviewsData_reviews(
              (r) => r
                ..id = '${offset + i}'
                ..episode = GEpisode.JEDI
                ..stars = stars
                ..commentary = '$i$_commentary',
            ),
        ]),
    );

Future<Store> _createStore(String kind, int round) async {
  switch (kind) {
    case 'memory':
      return MemoryStore();
    case 'legacy':
      return LegacyHiveStore(await Hive.openBox<dynamic>('legacy_$round'));
    case 'keyed':
      return HiveStore(await Hive.openBox<dynamic>('keyed_$round'));
  }
  throw ArgumentError.value(kind, 'store');
}

Future<Map<String, _Sample>> _runScenario(
  String kind,
  _Profiler profiler,
  int round,
) async {
  final store = await _createStore(kind, round);
  final cache = Cache(store: store);

  // Two queries over the same entities, like MyPrograms and a second
  // catalog query.
  final catalog1 = GReviewsReq((b) => b..vars.first = watchedEntities);
  final catalog2 = GReviewsReq(
    (b) => b
      ..vars.first = watchedEntities
      ..vars.offset = 0,
  );
  final unrelated = GReviewsReq(
    (b) => b
      ..vars.episode = GEpisode.NEWHOPE
      ..vars.first = unrelatedEntities,
  );
  final catalogData = _reviews(watchedEntities);

  // Seed the cache the way a previous app session leaves it on disk.
  cache.writeQuery(catalog1, catalogData);
  cache.writeQuery(catalog2, catalogData);
  await store.flush();
  await _settle();

  final emissions = [0, 0];
  final subscriptions = <StreamSubscription<Object?>>[];
  final firstEmissions = [Completer<void>(), Completer<void>()];
  void watch() {
    for (final (i, request) in [catalog1, catalog2].indexed) {
      subscriptions.add(cache.watchQuery(request).listen((_) {
        emissions[i]++;
        if (!firstEmissions[i].isCompleted) firstEmissions[i].complete();
      }));
    }
  }

  final samples = <String, _Sample>{};
  Future<void> measure(String name, Future<void> Function() body) async {
    await _settle();
    emissions.fillRange(0, 2, 0);
    samples[name] = await profiler.measure(() async {
      await body();
      await _settle();
    }, emissions);
  }

  // What any watcher pays for its first emission, without watching.
  await measure('readQuery 2 queries (no watch)', () async {
    cache.readQuery(catalog1);
    cache.readQuery(catalog2);
  });

  await measure('subscribe 2 queries', () async {
    watch();
    await Future.wait(firstEmissions.map((c) => c.future));
  });

  // The startup cache GC, while the catalog is watched.
  await measure('gc, nothing to collect', () async {
    cache.gc();
    await store.flush();
  });

  await measure('gc, $unrelatedEntities orphans', () async {
    for (var i = 0; i < unrelatedEntities; i++) {
      store.put('Review:orphan$i', {
        '__typename': 'Review',
        'id': 'orphan$i',
        'stars': 1,
        'commentary': _commentary,
      });
    }
    cache.gc();
    await store.flush();
  });

  await measure('rewrite identical response', () async {
    cache.writeQuery(catalog1, catalogData);
    await store.flush();
  });

  await measure('change 1 watched entity', () async {
    cache.writeQuery(
      GReviewsByIDReq((b) => b..vars.id = '7'),
      GReviewsByIDData(
        (b) => b.review
          ..id = '7'
          ..episode = GEpisode.JEDI
          ..stars = 5
          ..commentary = '7$_commentary',
      ),
    );
    await store.flush();
  });

  await measure('write $unrelatedEntities unrelated entities', () async {
    cache.writeQuery(
      unrelated,
      _reviews(unrelatedEntities, offset: 100000),
    );
    await store.flush();
  });

  await measure('optimistic patch + revert', () async {
    final mutation = GReviewsByIDReq((b) => b..vars.id = 'optimistic');
    cache.writeQuery(
      GReviewsByIDReq((b) => b..vars.id = '8'),
      GReviewsByIDData(
        (b) => b.review
          ..id = '8'
          ..episode = GEpisode.JEDI
          ..stars = 1
          ..commentary = 'optimistic',
      ),
      optimisticRequest: mutation,
    );
    await _settle();
    cache.removeOptimisticPatch(mutation);
  });

  await measure('resubscribe 2 queries', () async {
    for (final s in subscriptions) {
      await s.cancel();
    }
    subscriptions.clear();
    firstEmissions
      ..clear()
      ..addAll([Completer<void>(), Completer<void>()]);
    watch();
    await Future.wait(firstEmissions.map((c) => c.future));
  });

  for (final s in subscriptions) {
    await s.cancel();
  }
  await cache.dispose();
  await _settle();
  return samples;
}

/// Waits until no more microtasks are being scheduled.
Future<void> _settle() async {
  while (true) {
    final before = _microtasks;
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
    if (_microtasks - before < 10) return;
  }
}

class _Sample {
  final double wallMs;
  final double cpuMs;
  final int microtasks;
  final int? gcs;
  final double? gcMs;
  final List<int> emissions;

  _Sample({
    required this.wallMs,
    required this.cpuMs,
    required this.microtasks,
    required this.gcs,
    required this.gcMs,
    required this.emissions,
  });
}

class _Profiler {
  final vm.VmService? _service;
  int _gcs = 0;

  /// Total seconds spent collecting new and old space, from the last GC event.
  final _gcSeconds = <String, double>{};
  StreamSubscription<vm.Event>? _gcSubscription;

  _Profiler._(this._service);

  double get _gcMs => _gcSeconds.values.fold(0.0, (a, b) => a + b) * 1000;

  static Future<_Profiler> connect() async {
    final info = await Service.getInfo();
    final uri = info.serverWebSocketUri;
    if (uri == null) {
      stderr.writeln('VM service not enabled: no GC counts.');
      return _Profiler._(null);
    }
    final service = await vmServiceConnectUri(uri.toString());
    final profiler = _Profiler._(service);
    await service.streamListen(vm.EventStreams.kGC);
    profiler._gcSubscription = service.onGCEvent.listen((event) {
      profiler._gcs++;
      for (final space in ['new', 'old']) {
        final heap = event.json?[space];
        if (heap is Map && heap['time'] is num) {
          profiler._gcSeconds[space] = (heap['time'] as num).toDouble();
        }
      }
    });
    return profiler;
  }

  Future<_Sample> measure(
    Future<void> Function() body,
    List<int> emissions,
  ) async {
    final gcsBefore = _gcs;
    final gcMsBefore = _gcMs;
    final microtasksBefore = _microtasks;
    final cpuBefore = _cpuTimeUs();
    final stopwatch = Stopwatch()..start();

    await body();

    stopwatch.stop();
    final cpu = _cpuTimeUs() - cpuBefore;
    final microtasks = _microtasks - microtasksBefore;
    if (_service != null) {
      // Let GC events for this phase arrive before reading the counts.
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    return _Sample(
      wallMs: stopwatch.elapsedMicroseconds / 1000,
      cpuMs: cpu / 1000,
      microtasks: microtasks,
      gcs: _service == null ? null : _gcs - gcsBefore,
      gcMs: _service == null ? null : _gcMs - gcMsBefore,
      emissions: [...emissions],
    );
  }

  Future<void> dispose() async {
    await _gcSubscription?.cancel();
    await _service?.dispose();
  }
}

void _printMedians(Map<String, List<Map<String, _Sample>>> results) {
  T median<T extends num>(List<T> values) =>
      (values.toList()..sort())[values.length ~/ 2];

  stdout.writeln(
    '| phase | store | wall ms | CPU ms (all threads) | microtasks | '
    'GCs | GC ms | emissions q1/q2 |',
  );
  stdout.writeln('|---|---|--:|--:|--:|--:|--:|---|');
  final phases = results.values.first.first.keys;
  for (final phase in phases) {
    for (final MapEntry(key: store, value: rounds) in results.entries) {
      final samples = rounds.map((r) => r[phase]!).toList();
      final gcs = samples.map((s) => s.gcs).whereType<int>().toList();
      final gcMs = samples.map((s) => s.gcMs).whereType<double>().toList();
      stdout.writeln(
        '| $phase | $store '
        '| ${median(samples.map((s) => s.wallMs).toList()).toStringAsFixed(1)} '
        '| ${median(samples.map((s) => s.cpuMs).toList()).toStringAsFixed(1)} '
        '| ${median(samples.map((s) => s.microtasks).toList())} '
        '| ${gcs.isEmpty ? '-' : median(gcs)} '
        '| ${gcMs.isEmpty ? '-' : median(gcMs).toStringAsFixed(1)} '
        '| ${samples.last.emissions.join('/')} |',
      );
    }
  }
}

final class _Timeval extends Struct {
  @Int64()
  external int seconds;
  @Int32()
  external int microseconds;
}

final class _Rusage extends Struct {
  external _Timeval user;
  external _Timeval system;
  @Array(14)
  external Array<Int64> rest;
}

final _getrusage = DynamicLibrary.process().lookupFunction<
    Int32 Function(Int32, Pointer<_Rusage>),
    int Function(int, Pointer<_Rusage>)>('getrusage');

/// User plus system CPU time of the whole process, including GC threads.
int _cpuTimeUs() {
  final usage = calloc<_Rusage>();
  try {
    _getrusage(0, usage);
    final u = usage.ref.user;
    final s = usage.ref.system;
    return (u.seconds + s.seconds) * 1000000 + u.microseconds + s.microseconds;
  } finally {
    calloc.free(usage);
  }
}
