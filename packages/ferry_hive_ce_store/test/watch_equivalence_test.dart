// Replays random sequences of cache operations against the legacy HiveStore
// and the current one, and checks that every watchQuery and watchFragment
// stream emits the same values in the same steps.
//
// The current store hands box events to watchers at a different point in the
// microtask queue, and the Cache debounce can turn that into a different
// number of repeated, identical emissions. Those repeats are ignored. The
// Cache also misses writes made while a watcher sets up its subscriptions, so
// a different microtask order can rarely change the value a watcher ends a
// step on; about 1 in 1000 scripts does, as does switching to MemoryStore.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_hive_ce_store/ferry_hive_ce_store.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.data.gql.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/review_by_id.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:hive_ce/hive.dart';
import 'package:test/test.dart';

import 'legacy_hive_store.dart';

const _ids = ['1', '2', '3', '4', '5'];
const _commentaries = ['a', 'b', null];

final _reviewsRequests = [
  GReviewsReq((b) => b..vars.first = 3),
  GReviewsReq((b) => b..vars.episode = GEpisode.EMPIRE),
  GReviewsReq(
    (b) => b
      ..vars.first = 3
      ..vars.offset = 1,
  ),
];

/// Requests that only serve as keys for optimistic patches.
final _patchRequests = [
  for (var i = 0; i < 3; i++) GReviewsByIDReq((b) => b..vars.id = 'patch$i'),
];

typedef _Watcher = Stream<Object?> Function(Cache cache);

final List<_Watcher> _watchers = [
  (cache) => cache.watchQuery(_reviewsRequests[0]),
  (cache) => cache.watchQuery(_reviewsRequests[1]),
  (cache) => cache.watchQuery(_reviewsRequests[0], optimistic: false),
  (cache) => cache.watchQuery(GReviewsByIDReq((b) => b..vars.id = '1')),
  (cache) => cache.watchFragment(
        GReviewFragmentReq((b) => b..idFields = {'id': '2'}),
      ),
  (cache) => cache.watchFragment(
        GReviewFragmentReq((b) => b..idFields = {'id': '1'}),
        optimistic: false,
      ),
];

/// One cache operation. Steps are separated by [_Settle]. The operations of a
/// step don't wait for the cache, so the debounce has to merge their changes;
/// only [_Unwatch] waits for the subscription to cancel.
sealed class _Op {}

class _Settle extends _Op {}

class _Watch extends _Op {
  final int watcher;
  _Watch(this.watcher);
}

class _Unwatch extends _Op {
  final int watcher;
  _Unwatch(this.watcher);
}

class _WriteReviews extends _Op {
  final int request;
  final List<(String, int, String?)> reviews;
  final int? patch;
  _WriteReviews(this.request, this.reviews, this.patch);
}

class _WriteReview extends _Op {
  final String id;
  final int stars;
  final String? commentary;
  final int? patch;
  _WriteReview(this.id, this.stars, this.commentary, this.patch);
}

class _WriteFragment extends _Op {
  final String id;
  final int stars;
  final String? commentary;
  _WriteFragment(this.id, this.stars, this.commentary);
}

class _RemovePatch extends _Op {
  final int patch;
  _RemovePatch(this.patch);
}

class _Evict extends _Op {
  final String id;
  final String? field;
  final int? patch;
  _Evict(this.id, this.field, this.patch);
}

class _StorePut extends _Op {
  final String id;
  final int stars;
  _StorePut(this.id, this.stars);
}

class _StoreDelete extends _Op {
  final String id;
  _StoreDelete(this.id);
}

class _Clear extends _Op {}

class _Gc extends _Op {}

List<_Op> _randomScript(int seed, {int length = 60}) {
  final random = Random(seed);
  T pick<T>(List<T> values) => values[random.nextInt(values.length)];
  int? maybePatch() => random.nextInt(4) == 0 ? random.nextInt(3) : null;
  (String, int, String?) review() =>
      (pick(_ids), 1 + random.nextInt(3), pick(_commentaries));

  final ops = <_Op>[
    // Start most watchers before anything is written, some later.
    for (var i = 0; i < _watchers.length; i++)
      if (random.nextBool()) _Watch(i),
  ];
  for (var i = 0; i < length; i++) {
    final roll = random.nextInt(100);
    ops.add(switch (roll) {
      < 18 => _Settle(),
      < 33 => _WriteReviews(
          random.nextInt(_reviewsRequests.length),
          [for (var j = random.nextInt(4); j > 0; j--) review()],
          maybePatch(),
        ),
      < 45 => () {
          final (id, stars, commentary) = review();
          return _WriteReview(id, stars, commentary, maybePatch());
        }(),
      < 52 => () {
          final (id, stars, commentary) = review();
          return _WriteFragment(id, stars, commentary);
        }(),
      < 58 => _RemovePatch(random.nextInt(3)),
      < 64 => _Evict(
          pick(_ids),
          random.nextBool() ? 'stars' : null,
          maybePatch(),
        ),
      < 70 => _StorePut(pick(_ids), 1 + random.nextInt(3)),
      < 75 => _StoreDelete(pick(_ids)),
      < 78 => _Clear(),
      < 81 => _Gc(),
      < 91 => _Watch(random.nextInt(_watchers.length)),
      _ => _Unwatch(random.nextInt(_watchers.length)),
    });
  }
  return ops..add(_Settle());
}

GReviewsData_reviews _reviewData((String, int, String?) review) =>
    GReviewsData_reviews(
      (b) => b
        ..id = review.$1
        ..episode = GEpisode.JEDI
        ..stars = review.$2
        ..commentary = review.$3,
    );

String _encode(Object? data) => jsonEncode((data as dynamic)?.toJson());

/// Runs [ops] and returns, per step, what each watcher emitted.
Future<List<Map<int, List<String>>>> _run(Store store, List<_Op> ops) async {
  final cache = Cache(store: store);
  final steps = <Map<int, List<String>>>[{}];
  final subscriptions = <int, StreamSubscription<Object?>>{};

  void record(int watcher, String event) =>
      (steps.last[watcher] ??= []).add(event);

  for (final op in ops) {
    try {
      switch (op) {
        case _Settle():
          await Future<void>.delayed(Duration.zero);
          await Future<void>.delayed(Duration.zero);
          steps.add({});
        case _Watch(:final watcher):
          subscriptions[watcher] ??= _watchers[watcher](cache).listen(
            (data) => record(watcher, _encode(data)),
            onError: (Object error) => record(watcher, 'error $error'),
          );
        case _Unwatch(:final watcher):
          await subscriptions.remove(watcher)?.cancel();
        case _WriteReviews(:final request, :final reviews, :final patch):
          cache.writeQuery(
            _reviewsRequests[request],
            GReviewsData((b) => b..reviews.addAll(reviews.map(_reviewData))),
            optimisticRequest: patch == null ? null : _patchRequests[patch],
          );
        case _WriteReview(
            :final id,
            :final stars,
            :final commentary,
            :final patch
          ):
          cache.writeQuery(
            GReviewsByIDReq((b) => b..vars.id = id),
            GReviewsByIDData(
              (b) => b.review
                ..id = id
                ..episode = GEpisode.JEDI
                ..stars = stars
                ..commentary = commentary,
            ),
            optimisticRequest: patch == null ? null : _patchRequests[patch],
          );
        case _WriteFragment(:final id, :final stars, :final commentary):
          cache.writeFragment(
            GReviewFragmentReq((b) => b..idFields = {'id': id}),
            GReviewFragmentData(
              (b) => b
                ..stars = stars
                ..commentary = commentary,
            ),
          );
        case _RemovePatch(:final patch):
          cache.removeOptimisticPatch(_patchRequests[patch]);
        case _Evict(:final id, :final field, :final patch):
          cache.evict(
            'Review:$id',
            fieldName: field,
            optimisticRequest: patch == null ? null : _patchRequests[patch],
          );
        case _StorePut(:final id, :final stars):
          store.put('Review:$id', {
            ...?store.get('Review:$id'),
            '__typename': 'Review',
            'id': id,
            'stars': stars,
          });
        case _StoreDelete(:final id):
          store.delete('Review:$id');
        case _Clear():
          cache.clear();
        case _Gc():
          cache.gc();
      }
    } catch (error) {
      // A few operation sequences make Cache itself throw; record it like
      // an emission so that both runs have to agree on it.
      (steps.last[-1] ??= []).add('op error $error');
    }
  }

  for (final subscription in subscriptions.values) {
    await subscription.cancel();
  }
  await cache.dispose();
  return steps;
}

Future<Box<dynamic>> _memoryBox(String name) =>
    Hive.openBox<dynamic>(name, bytes: Uint8List(0));

String _describe(_Op op) => switch (op) {
      _Settle() => '---',
      _Watch(:final watcher) => 'watch $watcher',
      _Unwatch(:final watcher) => 'unwatch $watcher',
      _WriteReviews(:final request, :final reviews, :final patch) =>
        'writeReviews $request $reviews patch=$patch',
      _WriteReview(:final id, :final stars, :final commentary, :final patch) =>
        'writeReview $id $stars $commentary patch=$patch',
      _WriteFragment(:final id, :final stars, :final commentary) =>
        'writeFragment $id $stars $commentary',
      _RemovePatch(:final patch) => 'removePatch $patch',
      _Evict(:final id, :final field, :final patch) =>
        'evict $id $field patch=$patch',
      _StorePut(:final id, :final stars) => 'storePut $id $stars',
      _StoreDelete(:final id) => 'storeDelete $id',
      _Clear() => 'clear',
      _Gc() => 'gc',
    };

void main() {
  final dumpSeed = Platform.environment['DUMP_SEED'];
  if (dumpSeed != null) {
    var step = 0;
    for (final op in _randomScript(int.parse(dumpSeed))) {
      print(op is _Settle ? '--- end of step ${step++}' : _describe(op));
    }
    return;
  }

  Hive.init('./test/__hive_data__');

  List<Map<int, List<String>>> withoutRepeats(
    List<Map<int, List<String>>> steps,
  ) =>
      [
        for (final step in steps)
          {
            for (final MapEntry(:key, :value) in step.entries)
              key: [
                for (final (i, event) in value.indexed)
                  if (i == 0 || event != value[i - 1]) event,
              ],
          },
      ];

  test('watchers emit like with the legacy HiveStore', () async {
    var emissions = 0;
    for (var seed = 0; seed < 300; seed++) {
      final ops = _randomScript(seed);
      final legacy = await _run(
          LegacyHiveStore.deletesEmitNull(await _memoryBox('legacy_$seed')),
          ops);
      final keyed = await _run(HiveStore(await _memoryBox('keyed_$seed')), ops);
      expect(
        withoutRepeats(keyed),
        equals(withoutRepeats(legacy)),
        reason: 'seed $seed',
      );
      emissions += legacy.fold(
        0,
        (sum, step) => sum + step.values.fold(0, (s, e) => s + e.length),
      );
    }
    // Guard against scripts that hardly make the watchers emit.
    expect(emissions, greaterThan(3000));
  });
}
