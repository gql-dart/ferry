import 'dart:async';

import 'package:async/async.dart';
import 'package:ferry/src/fetch_policy_typed_link.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.req.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

import './fetch_policy_typed_link_test.mocks.dart';

@GenerateMocks([Link])
void main() {
  group('Fetch Policy', () {
    final mockLink = MockLink();

    final request = GHumanWithArgsReq(
      (b) => b
        ..executeOnListen = false
        ..vars.id = '1',
    );

    final data = GHumanWithArgsData(
      (b) => b
        ..human.id = 'steve'
        ..human.name = 'Steve Jobs'
        ..human.height = 1.88,
    );

    when(mockLink.request(any, any)).thenAnswer(
      (_) => Stream.value(Response(data: data.toJson(), response: {})).delay(
          const Duration(milliseconds: 0)), //add delay to reliably test caching
    );

    late StreamController<OperationRequest> requestController;
    late TypedLink typedLink;
    late Cache cache;

    setUp(() {
      requestController = StreamController<OperationRequest>();
      cache = Cache();
      typedLink = TypedLink.from([
        TypedLink.function(
          <TData, TVars>(req, [forward]) => requestController.stream
              .whereType<OperationRequest<TData, TVars>>()
              .switchMap(
                (req) => forward!(req),
              ),
        ),
        FetchPolicyTypedLink(link: mockLink, cache: cache),
      ]);
    });

    tearDown(() {
      requestController.close();
      typedLink.dispose();
      cache.dispose();
    });

    group('.CacheFirst', () {
      final req = request.rebuild(
        (b) => b..fetchPolicy = FetchPolicy.CacheFirst,
      );

      test('returns correct data', () async {
        final queue = StreamQueue(typedLink.request(req));

        /// First request returns a network response
        requestController.add(req);
        final first = await queue.next;
        expect(first.dataSource, equals(DataSource.Link));
        // When we receive the first response, the cache may not have finished
        // to write in the async store.
        // We need to await a second event before reading the cache.
        final second = await queue.next;
        expect(second.dataSource, equals(DataSource.Cache));
        expect(await cache.readQuery(req), equals(data));

        /// Second request returns a cached response
        requestController.add(req);
        final third = await queue.next;
        expect(third.dataSource, equals(DataSource.Cache));
      });

      test('can return multiple responses from link', () async {
        final stream = typedLink.request(req);
        requestController.add(req);

        expect(
          stream,
          emitsInOrder([
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Link,
                data: data,
              ),
            ),
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Cache,
                data: data,
              ),
            ),
          ]),
        );
      });
    });

    group('.CacheAndNetwork', () {
      final req = request.rebuild(
        (b) => b..fetchPolicy = FetchPolicy.CacheAndNetwork,
      );

      test('returns correct data', () async {
        final queue = StreamQueue(typedLink.request(req));

        /// First request returns a network response
        requestController.add(req);
        final first = await queue.next;
        expect(first.dataSource, equals(DataSource.Link));
        // When we receive the first response, the cache may not have finished
        // to write in the async store.
        // We need to await a second event before reading the cache.
        final second = await queue.next;
        expect(second.dataSource, equals(DataSource.Cache));
        expect(await cache.readQuery(req), equals(data));

        /// Second request returns a cached response then a network response
        requestController.add(req);
        final third = await queue.next;
        expect(third.dataSource, equals(DataSource.Cache));
        final fourth = await queue.next;
        expect(fourth.dataSource, equals(DataSource.Link));

        // Let the cache write in the async store so we don't get this error
        // after the test finishes:
        // Bad state: Cannot add new events after calling close.
        // ! Note: the error only happens when you run all the tests in the file.
        await Future.delayed(const Duration(milliseconds: 0));
      });

      test('can return multiple responses from link', () async {
        final stream = typedLink.request(req);
        requestController.add(req);

        expect(
          stream,
          emitsInOrder([
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Link,
                data: data,
              ),
            ),
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Cache,
                data: data,
              ),
            ),
          ]),
        );
      });
    });

    group('.NetworkOnly', () {
      final req = request.rebuild(
        (b) => b..fetchPolicy = FetchPolicy.NetworkOnly,
      );

      test('returns correct data', () async {
        final queue = StreamQueue(typedLink.request(req));

        /// First request returns a network response
        requestController.add(req);
        final first = await queue.next;
        expect(first.dataSource, equals(DataSource.Link));
        // Let the cache write in the async store.
        await Future.delayed(const Duration(milliseconds: 0));
        expect(await cache.readQuery(req), equals(data));

        /// Second request returns a network response
        requestController.add(req);
        final third = await queue.next;
        expect(third.dataSource, equals(DataSource.Link));
        // Let the cache write in the async store so we don't get this error
        // after the test finishes:
        // Bad state: Cannot add new events after calling close.
        // ! Note: the error only happens when you run all the tests in the file.
        await Future.delayed(const Duration(milliseconds: 0));
      });
    });

    group('.CacheOnly', () {
      final req = request.rebuild(
        (b) => b..fetchPolicy = FetchPolicy.CacheOnly,
      );

      test('returns correct data', () async {
        final queue = StreamQueue(typedLink.request(req));

        /// Request returns no data with empty cache
        requestController.add(req);
        final first = await queue.next;
        expect(await cache.readQuery(req), equals(null));
        expect(first.dataSource, equals(DataSource.Cache));
        expect(first.data, equals(null));

        /// Request returns data after writing to cache
        await cache.writeQuery(req, data);
        requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Cache));
        expect(response.data, equals(data));
      });
    });

    group('.NoCache', () {
      final req = request.rebuild(
        (b) => b..fetchPolicy = FetchPolicy.NoCache,
      );

      test('returns correct data', () async {
        final queue = StreamQueue(typedLink.request(req));

        /// First request returns response from network, doesn't cache
        requestController.add(req);
        final first = await queue.next;
        expect(await cache.readQuery(req), equals(null));
        expect(first.dataSource, equals(DataSource.Link));
        expect(first.data, equals(data));

        /// Second request returns response from network, doesn't cache
        requestController.add(req);
        final second = await queue.next;
        expect(await cache.readQuery(req), equals(null));
        expect(second.dataSource, equals(DataSource.Link));
        expect(second.data, equals(data));
      });
    });
  });
}
