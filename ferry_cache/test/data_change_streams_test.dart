import 'package:test/test.dart';

import 'package:ferry_cache/src/operation_data_change_stream.dart';
import 'package:ferry_cache/src/fragment_data_change_stream.dart';
import 'package:ferry_cache/ferry_cache.dart';
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart';
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.req.gql.dart';
import 'package:ferry_test_graphql/queries/fragments/hero_with_fragments.data.gql.dart';

final luke = GHeroWithFragmentsData_hero(
  (b) => b
    ..id = 'luke'
    ..name = 'Luke Skywalker',
);

final vader = GHeroWithFragmentsData_hero(
  (b) => b
    ..id = 'vader'
    ..name = 'Darth Vader',
);

final han = GHeroWithFragmentsData_hero(
  (b) => b
    ..id = 'han'
    ..name = 'Han Solo'
    ..friendsConnection.totalCount = 1
    ..friendsConnection
        .edges
        .add(GHeroWithFragmentsData_hero_friendsConnection_edges(
          (b) => b
            ..node = GHeroWithFragmentsData_hero_friendsConnection_edges_node
                    .fromJson(luke.toJson())!
                .toBuilder(),
        )),
);

final lukeFragment = GheroDataReq((b) => b..idFields = {'id': 'luke'});

final heroReq = GHeroWithFragmentsReq((b) => b..vars.episode = GEpisode.EMPIRE);
final heroData = GHeroWithFragmentsData((b) => b..hero = han.toBuilder());

void main() {
  late Cache cache;

  setUp(() {
    cache = Cache()
      ..writeQuery(heroReq, heroData)
      ..writeQuery(
        GHeroWithFragmentsReq((b) => b..vars.episode = GEpisode.NEWHOPE),
        GHeroWithFragmentsData((b) => b..hero = luke.toBuilder()),
      )
      ..writeQuery(
        GHeroWithFragmentsReq((b) => b..vars.episode = GEpisode.JEDI),
        GHeroWithFragmentsData((b) => b..hero = vader.toBuilder()),
      );
  });

  group('operationDataChangeStream', () {
    test("doesn't trigger before a change", () async {
      final stream = operationDataChangeStream(
        heroReq,
        true,
        cache.optimisticPatchesStream,
        cache.optimisticReader,
        cache.store,
        {},
        true,
      );

      expect(
        stream,
        emitsDone,
      );

      await Future.delayed(Duration.zero);
      await cache.dispose();
    });

    group('root operation data changes', () {
      test("doesn't trigger with changes to unused root operation fields",
          () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.writeQuery(
          heroReq.rebuild((b) => b..vars.episode = GEpisode.JEDI),
          GHeroWithFragmentsData((b) => b..hero = luke.toBuilder()),
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test("doesn't trigger with the same data for operation fields", () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.writeQuery(heroReq, heroData);

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test("doesn't trigger with changes to unrelated data", () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.writeFragment(
          GheroDataReq((b) => b..idFields = {'id': 'vader'}),
          vader.rebuild((b) => b..name = 'Anakin'),
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with different data for operation fields', () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Query'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.writeQuery(
          heroReq,
          GHeroWithFragmentsData((b) => b..hero = luke.toBuilder()),
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });

    group('dependent reference data changes', () {
      test('triggers with change to dependent reference', () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Character:luke'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.store.delete('Character:luke');

        /// Only trigger the first time
        await Future.delayed(Duration.zero);
        cache.store.delete('Character:luke');

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });

    group('optimistic patch changes', () {
      test(
          "doesn't trigger with optimistic patches that don't affect operation root",
          () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.optimisticPatchesStream.add({
          heroReq: {
            'Query': {
              'someQuery': [
                {'\$ref': 'Character:luke'},
              ],
            },
          },
        });

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with optimistic patches that affect operation root',
          () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Query'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.optimisticPatchesStream.add({
          heroReq: {
            'Query': {
              'hero({"episode":"EMPIRE"})': [
                {'\$ref': 'Character:luke'},
              ],
            },
          },
        });

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with optimistic patches that affect referenced entities',
          () async {
        final stream = operationDataChangeStream(
          heroReq,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Character:luke'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.optimisticPatchesStream.add({
          heroReq: {
            'Character:luke': {
              '__typename': 'Character',
              'id': 'luke',
              'name': 'Lucas S',
            },
          },
        });

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });

    group('fragmentDataChangeStream', () {
      test("doesn't trigger before a change", () async {
        final stream = fragmentDataChangeStream(
          lukeFragment,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsDone,
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test("doesn't trigger with the same data", () async {
        final stream = fragmentDataChangeStream(
          lukeFragment,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(stream, emitsInOrder([emitsDone]));

        await Future.delayed(Duration.zero);
        cache.writeFragment(lukeFragment, luke);

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with different data', () async {
        final stream = fragmentDataChangeStream(
          lukeFragment,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Character:luke'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.writeFragment(
          lukeFragment,
          luke.rebuild((b) => b..name = 'Luca'),
        );

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });

      test('triggers with change to dependent reference', () async {
        final hanFrag = GheroDataReq((b) => b..idFields = {'id': 'luke'});
        final stream = fragmentDataChangeStream(
          hanFrag,
          true,
          cache.optimisticPatchesStream,
          cache.optimisticReader,
          cache.store,
          {},
          true,
        );

        expect(
          stream,
          emitsInOrder([
            {'Character:luke'},
            emitsDone,
          ]),
        );

        await Future.delayed(Duration.zero);
        cache.store.delete('Character:luke');

        /// Only trigger the first time
        await Future.delayed(Duration.zero);
        cache.store.delete('Character:luke');

        await Future.delayed(Duration.zero);
        await cache.dispose();
      });
    });
  });
}
