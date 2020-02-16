// import "dart:async";
// import 'package:mockito/mockito.dart';
// import 'package:gql_link/gql_link.dart';
// import 'package:gql_exec/gql_exec.dart';
// import 'package:gql/ast.dart';
// import "package:flutter_test/flutter_test.dart";
// import 'package:normalize/normalize.dart';
// import "package:gql_client/gql_client.dart";

// import '../lib/helpers/deep_merge.dart';
// import '../lib/graphql/songs_query.data.gql.dart';
// import '../lib/graphql/songs_query.req.gql.dart';

// class MockLink extends Mock implements Link {}

// enum Source {
//   Cache,
//   Network,
// }

// void main() {
//   group(FetchPolicy, () {
//     final mockLink = MockLink();

//     final queryRequests = [
//       SongsQuery(
//         buildVars: (b) => b..first = 3,
//       ),
//       SongsQuery(
//         buildVars: (b) => b
//           ..first = 3
//           ..offset = 3,
//       ),
//     ];

//     final networkRequests = queryRequests
//         .map((request) => Request(
//               operation: request.operation,
//               variables: request.variables,
//             ))
//         .toList();

//     Map<String, List<Map<String, dynamic>>> getResponse(
//         SongsQuery query, Source source) {
//       final List<Map<String, dynamic>> songs = [];
//       for (var i = 0; i < query.variables["first"]; i++) {
//         final id = (i + (query.variables["offset"] ?? 0)).toString();
//         songs.add(
//             {"id": id, "name": "Song $id from $source", "__typename": "Song"});
//       }
//       return {"Song": songs};
//     }

//     final networkResponses = queryRequests
//         .map((request) => getResponse(request, Source.Network))
//         .toList();

//     final cacheResponses = queryRequests
//         .map((request) => getResponse(request, Source.Cache))
//         .toList();

//     for (var i = 0; i < networkRequests.length; i++) {
//       when(mockLink.request(networkRequests[i], any)).thenAnswer(
//           (_) => Stream.fromIterable([Response(data: networkResponses[i])]));
//     }

//     Map<String, Map<String, dynamic>> cacheSnapshot(Source source) =>
//         queryRequests.fold<Map<String, Map<String, dynamic>>>({},
//             (cachedData, request) {
//           final data = getResponse(request, source);
//           final queryResult = {};
//           normalize(
//             writer: (dataId, value) => queryResult[dataId] = value,
//             query: request.operation.document,
//             operationName: request.operation.operationName,
//             variables: request.variables,
//             data: data,
//           );
//           return Map.from(deepMerge(cachedData, queryResult));
//         });

//     group(FetchPolicy.NetworkOnly, () {
//       test('Returns the correct result', () async {
//         final store = MemoryStore(cacheSnapshot(Source.Cache));
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.NetworkOnly,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) => response.data),
//             emitsInOrder(networkResponses));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Network)));
//       });
//     });

//     group(FetchPolicy.NoCache, () {
//       test('Returns the correct result', () async {
//         final store = MemoryStore(cacheSnapshot(Source.Cache));
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.NoCache,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) => response.data),
//             emitsInOrder(networkResponses));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Cache)));
//       });
//     });

//     group(FetchPolicy.CacheOnly, () {
//       test('With seeded cache', () async {
//         final store = MemoryStore(cacheSnapshot(Source.Cache));
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.CacheOnly,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) => response.data),
//             emitsInOrder(cacheResponses));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Cache)));
//       });

//       test('With empty cache', () async {
//         final store = MemoryStore();
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.CacheOnly,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) => response.data), emits(null));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap().isEmpty, equals(true));
//       });
//     });

//     group(FetchPolicy.CacheFirst, () {
//       test('With empty cache', () async {
//         final store = MemoryStore();
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.CacheFirst,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) {
//           return response.data;
//         }), emitsInOrder(networkResponses));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Network)));
//       });

//       test('With cached results', () async {
//         final store = MemoryStore(cacheSnapshot(Source.Cache));
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.CacheFirst,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) {
//           return response.data;
//         }), emitsInOrder(cacheResponses));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Cache)));
//       });
//     });

//     group(FetchPolicy.CacheAndNetwork, () {
//       test('With seeded cache', () async {
//         final store = MemoryStore(cacheSnapshot(Source.Cache));
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.CacheAndNetwork,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) => response.data),
//             emitsInAnyOrder([...cacheResponses, ...networkResponses]));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Network)));
//       });

//       test('With empty cache', () async {
//         final store = MemoryStore();
//         final cache = Cache(dataStore: store);
//         final options = ClientOptions(defaultFetchPolicies: {
//           OperationType.query: FetchPolicy.CacheAndNetwork,
//         });

//         final client = Client(
//           link: mockLink,
//           cache: cache,
//           options: options,
//         );

//         final responseStream = client.responseStream(queryRequests.first);

//         expect(responseStream.map((response) {
//           return response.data;
//         }), emitsInOrder(networkResponses));

//         client.queryController.add(queryRequests[0]);
//         await Future.delayed(Duration.zero);

//         client.queryController.add(queryRequests[1]);
//         await Future.delayed(Duration.zero);

//         expect(store.toMap(), equals(cacheSnapshot(Source.Network)));
//       });
//     });
//   });
// }
