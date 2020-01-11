import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:test/test.dart";
import 'package:normalize/normalize.dart';

import '../example/lib/graphql_api.dart';
import '../lib/src/client/client.dart';
import '../lib/src/client/query_request.dart';
import '../lib/src/cache/cache.dart';
import '../lib/src/helpers/deep_merge.dart';

class MockLink extends Mock implements Link {}

enum Source {
  Cache,
  Network,
}

void main() {
  group(FetchPolicy, () {
    final mockLink = MockLink();

    final queryRequests = [
      QueryRequest(query: SongsQuery(variables: SongsArguments(first: 3))),
      QueryRequest(
        query: SongsQuery(variables: SongsArguments(first: 3, offset: 3)),
      ),
    ];

    final networkRequests = queryRequests
        .map((request) => Request(
            operation: Operation(
              document: request.query.document,
              operationName: request.query.operationName,
            ),
            variables: request.query.getVariablesMap()))
        .toList();

    Map<String, List<Map<String, dynamic>>> getResponse(
        SongsQuery query, Source source) {
      final List<Map<String, dynamic>> songs = [];
      for (var i = 0; i < query.variables.first; i++) {
        final id = (i + (query.variables.offset ?? 0)).toString();
        songs.add(
            {"id": id, "name": "Song $id from $source", "__typename": "Song"});
      }
      return {"Song": songs};
    }

    final networkResponses = queryRequests
        .map((request) => getResponse(request.query, Source.Network))
        .toList();

    final cacheResponses = queryRequests
        .map((request) => getResponse(request.query, Source.Cache))
        .toList();

    for (var i = 0; i < networkRequests.length; i++) {
      when(mockLink.request(networkRequests[i], any)).thenAnswer(
          (_) => Stream.fromIterable([Response(data: networkResponses[i])]));
    }

    Map<String, Map<String, dynamic>> cacheSnapshot(Source source) =>
        queryRequests.fold<Map<String, Map<String, dynamic>>>({},
            (cachedData, request) {
          final data = getResponse(request.query, source);
          final queryResult = normalize(
              query: request.query.document,
              operationName: request.query.operationName,
              variables: request.query.getVariablesMap(),
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

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) => response.data.toJson()),
            emitsInOrder(networkResponses));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

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

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) => response.data.toJson()),
            emitsInOrder(networkResponses));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

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

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) => response.data.toJson()),
            emitsInOrder(cacheResponses));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

        expect(cache.data, equals(cacheSnapshot(Source.Cache)));
      });

      test('With empty cache', () async {
        final cache = GQLCache();
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheOnly);

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) => response.data), emits(null));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

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

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) {
          return response.data.toJson();
        }), emitsInOrder(networkResponses));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });

      test('With cached results', () async {
        final cache = GQLCache(seedData: cacheSnapshot(Source.Cache));
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheFirst);

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) {
          return response.data.toJson();
        }), emitsInOrder(cacheResponses));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

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

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) => response.data.toJson()),
            emitsInAnyOrder([...cacheResponses, ...networkResponses]));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });

      test('With empty cache', () async {
        final cache = GQLCache();
        final client = GQLClient(
            link: mockLink,
            cache: cache,
            defaultFetchPolicy: FetchPolicy.CacheAndNetwork);

        final responseStream = client.responseStream(queryRequests.first);

        expect(responseStream.map((response) {
          return response.data.toJson();
        }), emitsInOrder(networkResponses));

        client.queryController.add(queryRequests[0]);
        await Future.delayed(Duration.zero);

        client.queryController.add(queryRequests[1]);
        await Future.delayed(Duration.zero);

        expect(cache.data, equals(cacheSnapshot(Source.Network)));
      });
    });
  });
}
