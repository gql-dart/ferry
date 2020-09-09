import 'package:test/test.dart';
import 'package:normalize/src/utils/field_key.dart';

import 'package:ferry/cache.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';

void main() {
  final chewieReq = GHumanWithArgsReq((b) => b..vars.id = 'chewie');

  final chewieData = GHumanWithArgsData(
    (b) => b
      ..human.id = 'chewie'
      ..human.name = 'Chewie'
      ..human.height = 2.3,
  );

  final lukeData = GHumanWithArgsData(
    (b) => b
      ..human.id = 'luke'
      ..human.name = 'Luke Skywalker'
      ..human.height = 1.6,
  );

  final hanReq = GHumanWithArgsReq((b) => b..vars.id = 'han-solo');

  final hanData = GHumanWithArgsData(
    (b) => b
      ..human.id = 'han'
      ..human.name = 'Han Solo'
      ..human.height = 1.89
      ..human.friendsConnection.friends.addAll([
        GHumanWithArgsData_human_friendsConnection_friends.fromJson(
          lukeData.human.toJson(),
        ),
        GHumanWithArgsData_human_friendsConnection_friends.fromJson(
          chewieData.human.toJson(),
        ),
      ]),
  );
  group('Evicting entities', () {
    test('can evict entities', () {
      final cache = Cache();
      cache.writeQuery(hanReq, hanData);
      cache.writeQuery(chewieReq, chewieData);
      expect(cache.readQuery(hanReq), equals(hanData));
      final entityId = cache.identify(hanData.human);
      cache.evict(entityId);
      expect(cache.readQuery(hanReq), equals(null));
      expect(cache.store.get(entityId), equals(null));
      expect(cache.readQuery(chewieReq), equals(chewieData));
    });

    test('can filter out dangling references', () {
      final cache = Cache();
      cache.writeQuery(hanReq, hanData);
      expect(
        cache.readQuery(hanReq).human.friendsConnection.friends.length,
        equals(2),
      );
      cache.evict(cache.identify(chewieData.human));
      expect(
        cache.readQuery(hanReq).human.friendsConnection.friends.length,
        equals(1),
      );
    });
  });

  group('Evicting fields', () {
    test('can evict fields', () {
      final cache = Cache();
      cache.writeQuery(hanReq, hanData);
      final entityId = cache.identify(hanData.human);
      cache.evict(entityId, fieldName: 'height');
      final result = cache.readQuery(hanReq);
      expect(result, equals(hanData.rebuild((b) => b..human.height = null)));
    });

    test('can evict only fields that include specific args', () {
      final cache = Cache();
      cache.writeQuery(
        hanReq.rebuild((b) => b..vars.friendsAfter = 'luke'),
        hanData,
      );
      cache.writeQuery(
        hanReq.rebuild((b) => b..vars.friendsAfter = 'chewie'),
        hanData,
      );
      final entityId = cache.identify(hanData.human);
      final keyLuke =
          FieldKey.from('friendsConnection', {'first': 10, 'after': 'luke'});
      final keyChewie =
          FieldKey.from('friendsConnection', {'first': 10, 'after': 'chewie'});
      expect(cache.store.get(entityId)[keyLuke.toString()], isNotNull);
      expect(cache.store.get(entityId)[keyChewie.toString()], isNotNull);
      cache.evict(entityId,
          fieldName: 'friendsConnection', args: {'after': 'luke'});
      expect(cache.store.get(entityId)[keyLuke.toString()], isNull);
      expect(cache.store.get(entityId)[keyChewie.toString()], isNotNull);
    });
  });

  group('Garbage collection', () {
    test('can remove orphaned entities', () {
      final cache = Cache();
      cache.writeQuery(hanReq, hanData);
      cache.writeQuery(
        hanReq,
        hanData.rebuild((b) => b..human.friendsConnection.friends.removeLast()),
      );
      expect(cache.store.get('Human:luke'), isNotNull);
      expect(cache.store.get('Human:chewie'), isNotNull);
      cache.gc();
      expect(cache.store.get('Human:luke'), isNotNull);
      expect(cache.store.get('Human:chewie'), isNull);
    });

    test('can retain and release entities entities', () {
      final cache = Cache();
      cache.writeQuery(hanReq, hanData);
      cache.writeQuery(
        hanReq,
        hanData.rebuild((b) => b..human.friendsConnection.friends.removeLast()),
      );
      expect(cache.store.get('Human:luke'), isNotNull);
      expect(cache.store.get('Human:chewie'), isNotNull);
      cache.retain('Human:chewie');
      cache.gc();
      expect(cache.store.get('Human:luke'), isNotNull);
      expect(cache.store.get('Human:chewie'), isNotNull);
      cache.release('Human:chewie');
      cache.gc();
      expect(cache.store.get('Human:luke'), isNotNull);
      expect(cache.store.get('Human:chewie'), isNull);
    });
  });
}
