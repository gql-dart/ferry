import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql/execution.dart';
import "package:test/test.dart";
import 'package:normalize/normalize.dart';

import '../example/lib/graphql_api.dart';
import '../lib/src/client/client.dart';
import '../lib/src/client/query_event.dart';
import '../lib/src/client/cache.dart';
import '../lib/src/helpers/deep_merge.dart';

class MockLink extends Mock implements Link {}

enum Source {
  Cache,
  Network,
}

void main() {
  group(FetchPolicy, () {
    final mockLink = MockLink();

    final queries = [
      SongsQuery(variables: SongsArguments(first: 3)),
      SongsQuery(variables: SongsArguments(first: 3, offset: 3)),
    ];

    final requests = queries
        .map((query) => Request(
              operation: Operation(
                document: query.document,
                operationName: query.operationName,
                variables: query.getVariablesMap(),
              ),
            ))
        .toList();

    Map<String, List<Map<String, dynamic>>> response(
        SongsQuery query, Source source) {
      final List<Map<String, dynamic>> songs = [];
      for (var i = 0; i < query.variables.first; i++) {
        final id = (i + (query.variables.offset ?? 0)).toString();
        songs.add(
            {"id": id, "name": "Song $id from $source", "__typename": "Song"});
        return {"Song": songs};
      }
    }

    final networkResponses =
        queries.map((query) => response(query, Source.Network)).toList();

    final cacheResponses =
        queries.map((query) => response(query, Source.Cache)).toList();

    for (var i = 0; i < requests.length; i++) {
      when(mockLink.request(requests[i], any)).thenAnswer(
          (_) => Stream.fromIterable([Response(data: networkResponses[i])]));
    }

    Map<String, Map<String, dynamic>> cacheSnapshot(Source source) => queries
            .fold<Map<String, Map<String, dynamic>>>({}, (cachedData, query) {
          final data = response(query, source);
          final queryResult = normalize(
              query: query.document,
              operationName: query.operationName,
              variables: query.getVariablesMap(),
              data: data);
          return Map.from(deepMerge(cachedData, queryResult));
        });

    group(FetchPolicy.NetworkOnly, () {
      test('Returns the correct result', () async {
        final cache = GQLCache(seedData: cacheSnapshot(Source.Cache));

        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.NetworkOnly);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) => response.data.toJson()),
            emitsInOrder(networkResponses));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });
    });

    group(FetchPolicy.NoCache, () {
      test('Returns the correct result', () async {
        final cache = GQLCache(seedData: cacheSnapshot(Source.Cache));
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.NoCache);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) => response.data.toJson()),
            emitsInOrder(networkResponses));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data, equals(cacheSnapshot(Source.Cache)));
      });
    });

    group(FetchPolicy.CacheOnly, () {
      test('With seeded cache', () async {
        final cache = GQLCache(seedData: cacheSnapshot(Source.Cache));
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheOnly);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) => response.data.toJson()),
            emitsInOrder(cacheResponses));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data, equals(cacheSnapshot(Source.Cache)));
      });

      test('With empty cache', () async {
        final cache = GQLCache();
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheOnly);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) => response.data), emits(null));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data.isEmpty, equals(true));
      });
    });

    group(FetchPolicy.CacheFirst, () {
      test('With empty cache', () async {
        final cache = GQLCache();
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheFirst);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) {
          return response.data.toJson();
        }), emitsInOrder(networkResponses));

        ref.stream.listen((response) => print(response.data));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });

      test('With cached results', () async {
        final cache = GQLCache(seedData: cacheSnapshot(Source.Cache));
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheFirst);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) {
          return response.data.toJson();
        }), emitsInOrder(cacheResponses));

        ref.stream.listen((response) => print(response.data));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data, equals(cacheSnapshot(Source.Cache)));
      });
    });

    group(FetchPolicy.CacheAndNetwork, () {
      test('With seeded cache', () async {
        final cache = GQLCache(seedData: cacheSnapshot(Source.Cache));
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheAndNetwork);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) => response.data.toJson()),
            emitsInAnyOrder([...cacheResponses, ...networkResponses]));

        await ref.execute();
        await ref.execute(query: queries[1]);

        // Since the execute future resolves with the first valid result (i.e. from cache), we must
        // add an artificial delay to ensure that the network result is also received.
        await Future.delayed(Duration(seconds: 2));

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });

      test('With empty cache', () async {
        final cache = GQLCache();
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheAndNetwork);

        final ref = client.ref(queries[0]);

        expect(ref.stream.map((response) {
          return response.data.toJson();
        }), emitsInOrder(networkResponses));

        await ref.execute();
        await ref.execute(query: queries[1]);

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });
    });
  });
}
