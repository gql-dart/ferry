import 'dart:async';
import 'package:async/async.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.data.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.req.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry/src/fetch_policy_typed_link.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/human_fragment.req.gql.dart';

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

    final newData = GHumanWithArgsData(
      (b) => b
        ..human.id = 'mark'
        ..human.name = 'Mark Zuckerberg'
        ..human.height = 1.71,
    );

    when(mockLink.request(any, any)).thenAnswer(
      (_) => Stream.fromIterable([
        Response(data: data.toJson(), response: {}),
        Response(data: newData.toJson(), response: {}),
      ]).interval(Duration(milliseconds: 10)),
    );

    late StreamController<OperationRequest> requestController;
    late TypedLink typedLink;
    late Cache cache;
    late FetchPolicyTypedLink fetchPolicyTypedLink;

    setUp(() {
      requestController = StreamController<OperationRequest>();
      cache = Cache();
      fetchPolicyTypedLink = FetchPolicyTypedLink(link: mockLink, cache: cache);

      typedLink = TypedLink.from([
        TypedLink.function(
          <TData, TVars>(req, [forward]) => requestController.stream
              .whereType<OperationRequest<TData, TVars>>()
              .switchMap(
                (req) => forward!(req),
              ),
        ),
        fetchPolicyTypedLink,
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
        expect(cache.readQuery(req), equals(data));

        /// Second request returns a cached response
        requestController.add(req);
        final second = await queue.next;
        expect(second.dataSource, equals(DataSource.Cache));
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
                dataSource: DataSource.Link,
                data: newData,
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
        expect(cache.readQuery(req), equals(data));

        /// Second request returns a cached response then a network response
        requestController.add(req);
        final second = await queue.next;
        expect(second.dataSource, equals(DataSource.Cache));
        final third = await queue.next;
        expect(third.dataSource, equals(DataSource.Link));
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
                dataSource: DataSource.Link,
                data: newData,
              ),
            ),
          ]),
        );
      });

      test('emit new event when cache changes', () async {
        final modifiedName = 'modified name';
        final modifiedData = GHumanWithArgsData(
          (b) => b
            ..human.id = 'steve'
            ..human.name = modifiedName
            ..human.height = 1.88,
        );

        when(mockLink.request(any, any)).thenAnswer((_) => Stream.fromIterable([
              Response(data: data.toJson(), response: {}),
            ]));

        final stream = fetchPolicyTypedLink.request(req);

        unawaited(expectLater(
          stream,
          emitsInOrder([
            //  Data emitted from making a request.
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Link,
                data: data,
              ),
            ),
            // Data emitted because of changes in cache [writeFragment].
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Cache,
                data: modifiedData,
              ),
            ),
          ]),
        ));

        await pumpEventQueue();

        final fragmentRequest = GHumanFragmentReq(
          (b) => b.idFields = {'id': 'steve'},
        );
        final currentCacheData = cache.readFragment(fragmentRequest);
        final modifiedCacheData =
            currentCacheData!.rebuild((b) => b.name = modifiedName);
        cache.writeFragment(fragmentRequest, modifiedCacheData);
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
        expect(cache.readQuery(req), equals(data));

        /// Second request returns a network response
        requestController.add(req);
        final second = await queue.next;
        expect(second.dataSource, equals(DataSource.Link));
      });

      test('emit new event when cache changes', () async {
        final modifiedName = 'modified name';
        final modifiedData = GHumanWithArgsData(
          (b) => b
            ..human.id = 'steve'
            ..human.name = modifiedName
            ..human.height = 1.88,
        );

        when(mockLink.request(any, any)).thenAnswer((_) => Stream.fromIterable([
              Response(data: data.toJson(), response: {}),
            ]));

        final stream = fetchPolicyTypedLink.request(req);

        unawaited(expectLater(
          stream,
          emitsInOrder([
            //  Data emitted from making a request.
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Link,
                data: data,
              ),
            ),
            // Data emitted because of changes in cache [writeFragment].
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Cache,
                data: modifiedData,
              ),
            ),
          ]),
        ));

        await pumpEventQueue();

        final fragmentRequest = GHumanFragmentReq(
          (b) => b.idFields = {'id': 'steve'},
        );
        final currentCacheData = cache.readFragment(fragmentRequest);
        final modifiedCacheData =
            currentCacheData!.rebuild((b) => b.name = modifiedName);
        cache.writeFragment(fragmentRequest, modifiedCacheData);
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
        expect(cache.readQuery(req), equals(null));
        expect(first.dataSource, equals(DataSource.Cache));
        expect(first.data, equals(null));

        /// Request returns data after writing to cache
        cache.writeQuery(req, data);
        requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Cache));
        expect(response.data, equals(data));
      });

      test('emit new event when cache changes', () async {
        final modifiedName = 'modified name';
        final modifiedData = GHumanWithArgsData(
          (b) => b
            ..human.id = 'steve'
            ..human.name = modifiedName
            ..human.height = 1.88,
        );

        when(mockLink.request(any, any)).thenAnswer((_) => Stream.fromIterable([
              Response(data: data.toJson(), response: {}),
            ]));

        final stream = fetchPolicyTypedLink.request(req);
        // Inistal cache data.
        cache.writeQuery(req, data);

        unawaited(expectLater(
          stream,
          emitsInOrder([
            //  Initial data emitted from cache.
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Cache,
                data: data,
              ),
            ),
            // Data emitted because of changes in cache [writeFragment].
            equals(
              OperationResponse(
                operationRequest: req,
                dataSource: DataSource.Cache,
                data: modifiedData,
              ),
            ),
          ]),
        ));

        await pumpEventQueue();

        final fragmentRequest = GHumanFragmentReq(
          (b) => b.idFields = {'id': 'steve'},
        );
        final currentCacheData = cache.readFragment(fragmentRequest);
        final modifiedCacheData =
            currentCacheData!.rebuild((b) => b.name = modifiedName);
        cache.writeFragment(fragmentRequest, modifiedCacheData);
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
        expect(cache.readQuery(req), equals(null));
        expect(first.dataSource, equals(DataSource.Link));
        expect(first.data, equals(data));

        /// Second request returns response from network, doesn't cache
        requestController.add(req);
        final second = await queue.next;
        expect(cache.readQuery(req), equals(null));
        expect(second.dataSource, equals(DataSource.Link));
        expect(second.data, equals(data));
      });
    });
  });

  group('remove optimistic response when listener unsubscribes', () {
    final mockLink = MockLink();

    when(mockLink.request(any, any)).thenAnswer((_) => NeverStream());

    late TypedLink typedLink;
    late Cache cache;

    setUp(() {
      cache = Cache();
      typedLink = TypedLink.from([
        FetchPolicyTypedLink(link: mockLink, cache: cache),
      ]);
    });

    tearDown(() {
      typedLink.dispose();
      cache.dispose();
    });

    final optimisticData = GCreateReviewData((b) => b
      ..createReview.id = '__optimistic__'
      ..createReview.stars = 5
      ..createReview.commentary = 'Amazing!!!'
      ..createReview.episode = GEpisode.NEWHOPE);

    final req = GCreateReviewReq((b) => b
      ..fetchPolicy = FetchPolicy.NetworkOnly
      ..vars.episode = GEpisode.NEWHOPE
      ..vars.review.stars = 5
      ..vars.review.commentary = 'Amazing!!!'
      ..optimisticResponse = optimisticData.toBuilder());

    for (final fetchPolicy in [
      FetchPolicy.NetworkOnly,
      FetchPolicy.CacheAndNetwork,
      FetchPolicy.CacheFirst,
    ]) {
      test(
          'remove optimistic response when listener unsubscribes for $fetchPolicy',
          () async {
        final stream =
            typedLink.request(req.rebuild((b) => b..fetchPolicy = fetchPolicy));

        final queue = StreamQueue(stream);

        final data = await queue.next;

        expect(
            data,
            predicate<OperationResponse>(
                (p) => p.dataSource == DataSource.Optimistic));
        expect(data.data, equals(optimisticData));

        expect(cache.readQuery(req), equals(optimisticData));
        expect(cache.readQuery(req, optimistic: false), isNull);

        await queue.cancel();

        expect(cache.readQuery(req), isNull);
        expect(cache.readQuery(req, optimistic: false), isNull);
      });
    }
  });
}
