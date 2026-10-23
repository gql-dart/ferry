// Checks that each Store.watch listener receives the values it received from
// the legacy HiveStore, for random writes and listeners that subscribe and
// cancel while box events are still in flight.
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:ferry_hive_ce_store/ferry_hive_ce_store.dart';
import 'package:hive_ce/hive.dart';
import 'package:test/test.dart';

import 'legacy_hive_store.dart';

const _keys = ['a', 'b', 'c', 'd'];

class _Received {
  final values = <int, List<String>>{};

  /// Listeners cancelled while box events could still be in flight.
  final cancelled = <int>{};
}

/// Runs a random script and returns what each listener received.
Future<_Received> _run(Store store, int seed) async {
  final random = Random(seed);
  String key() => _keys[random.nextInt(_keys.length)];
  Map<String, dynamic> value() => {'v': random.nextInt(3)};

  final received = _Received();
  final subscriptions = <int, StreamSubscription<Object?>>{};
  var listeners = 0;

  for (var i = 0; i < 80; i++) {
    switch (random.nextInt(10)) {
      case 0 || 1:
        final listener = listeners++;
        final values = received.values[listener] = [];
        subscriptions[listener] = store
            .watch(key(), distinct: random.nextBool())
            .listen((data) => values.add(jsonEncode(data)));
      case 2:
        if (subscriptions.isNotEmpty) {
          final listener = subscriptions.keys
              .elementAt(random.nextInt(subscriptions.length));
          received.cancelled.add(listener);
          await subscriptions.remove(listener)!.cancel();
        }
      case 3:
        store.putAll({key(): value(), key(): value()});
      case 4:
        store.delete(key());
      case 5:
        store.deleteAll([key(), key(), key()]);
      case 6:
        if (random.nextInt(4) == 0) store.clear();
      case 7:
        // Let some, but not all, box events arrive.
        for (var n = random.nextInt(4); n > 0; n--) {
          await null;
        }
      default:
        store.put(key(), value());
    }
  }
  await Future<void>.delayed(Duration.zero);
  for (final subscription in subscriptions.values) {
    await subscription.cancel();
  }
  await store.dispose();
  return received;
}

void main() {
  Hive.init('./test/__hive_data__');

  test('listeners receive the values the legacy store emitted', () async {
    var values = 0;
    for (var seed = 0; seed < 500; seed++) {
      final legacy = await _run(
        LegacyHiveStore(
          await Hive.openBox<dynamic>('dl$seed', bytes: Uint8List(0)),
        ),
        seed,
      );
      final keyed = await _run(
        HiveStore(await Hive.openBox<dynamic>('dk$seed', bytes: Uint8List(0))),
        seed,
      );
      for (final MapEntry(key: listener, value: expected)
          in legacy.values.entries) {
        final actual = keyed.values[listener]!;
        final reason = 'seed $seed, listener $listener';
        if (legacy.cancelled.contains(listener)) {
          // One box subscription works through the events of all keys, so an
          // event can arrive later than at a box.watch subscription of its
          // key, after the listener cancelled.
          expect(actual.length, lessThanOrEqualTo(expected.length),
              reason: reason);
          expect(actual, equals(expected.take(actual.length)), reason: reason);
        } else {
          expect(actual, equals(expected), reason: reason);
        }
        values += expected.length;
      }
    }
    expect(values, greaterThan(5000));
  });
}
