import 'dart:async';
import 'package:async/async.dart';
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/add_typename_typed_link.dart';
import 'package:ferry/src/update_cache_typed_link.dart';
import 'package:ferry/src/request_controller_typed_link.dart';
import 'package:ferry/src/fetch_policy_typed_link.dart';

import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.req.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.var.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.data.gql.dart';
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.data.gql.dart';

class MockLink extends Mock implements Link {}

final createReviewData = GCreateReviewData(
  (b) => b
    ..createReview.id = '123'
    ..createReview.stars = 5
    ..createReview.episode = GEpisode.NEWHOPE
    ..createReview.commentary = 'Amazing!!!',
);

final reviewsReq = GReviewsReq();

UpdateCacheHandler<GCreateReviewData, GCreateReviewVars> createReviewHandler = (
  proxy,
  response,
) {
  final reviews = proxy.readQuery(reviewsReq) ?? GReviewsData();
  proxy.writeQuery(
    reviewsReq,
    reviews.rebuild((b) => b
      ..reviews.add(
          GReviewsData_reviews.fromJson(response.data.createReview.toJson()))),
  );
};

void main() {
  group('CacheProxy', () {
    group('writing queries', () {
      final cache = Cache();

      final req = GHumanWithArgsReq((b) => b..vars.id = '123');
      final data = GHumanWithArgsData(
        (b) => b
          ..human.id = '123'
          ..human.name = 'Han Solo'
          ..human.height = 1.85,
      );

      final cacheProxy = CacheProxy(cache, true, req.requestId);
      test('can write queries', () {
        expect(cacheProxy.readQuery(req), equals(null));
        cacheProxy.writeQuery(req, data);
        expect(cacheProxy.readQuery(req), equals(data));
      });
    });
  });

  group('UpdateCacheHandler', () {
    final createReviewReq = GCreateReviewReq(
      (b) => b
        ..executeOnListen = false
        ..updateCacheHandlerKey = 'createReviewHandler'
        ..vars.episode = GEpisode.NEWHOPE
        ..vars.review.stars = 5
        ..vars.review.commentary = 'Amazing!!!',
    );

    MockLink mockLink;
    StreamController<Response> linkController;
    Cache cache;
    StreamController<OperationRequest> requestController;
    TypedLink typedLink;

    final updateCacheHandlers = {
      'createReviewHandler': createReviewHandler,
    };

    setUp(() {
      mockLink = MockLink();
      linkController = StreamController<Response>();
      cache = Cache();
      requestController = StreamController<OperationRequest>.broadcast();
      typedLink = TypedLink.from([
        RequestControllerTypedLink(requestController),
        AddTypenameTypedLink(),
        UpdateCacheTypedLink(
          cache: cache,
          updateCacheHandlers: updateCacheHandlers,
        ),
        FetchPolicyTypedLink(
          link: mockLink,
          cache: cache,
        ),
      ]);

      when(mockLink.request(any, any)).thenAnswer((_) => linkController.stream);
    });

    tearDown(() {
      linkController.close();
      requestController.close();
      typedLink.dispose();
      cache.dispose();
    });

    group('without optimistic response', () {
      test('runs only on first non-optimistic', () async {
        final queue = StreamQueue(typedLink.request(createReviewReq));

        expect(cache.readQuery(reviewsReq), equals(null));

        requestController.add(createReviewReq);
        linkController.add(Response(data: createReviewData.toJson()));
        await queue.next;

        expect(cache.readQuery(reviewsReq).reviews.length, equals(1));

        linkController.add(Response(data: createReviewData.toJson()));
        await queue.next;

        expect(cache.readQuery(reviewsReq).reviews.length, equals(1));
      });
    });

    group('with optimistic response', () {
      test('runs on optimistic response and first non-optimistic response',
          () async {
        final req = createReviewReq.rebuild(
          (b) => b
            ..optimisticResponse.createReview.id = '456'
            ..optimisticResponse.createReview.stars = 4
            ..optimisticResponse.createReview.episode = GEpisode.JEDI
            ..optimisticResponse.createReview.commentary = 'hi',
        );

        final queue = StreamQueue(typedLink.request(req));

        expect(cache.readQuery(reviewsReq), equals(null));

        requestController.add(req);
        await queue.next;

        expect(cache.readQuery(reviewsReq).reviews.length, equals(1));
        expect(
          cache.readQuery(reviewsReq).reviews.first.id,
          equals('456'),
        );

        linkController.add(Response(data: createReviewData.toJson()));
        await queue.next;

        expect(cache.readQuery(reviewsReq).reviews.length, equals(1));
        expect(
          cache.readQuery(reviewsReq).reviews.first.id,
          equals('123'),
        );

        linkController.add(Response(data: createReviewData.toJson()));
        await queue.next;

        expect(cache.readQuery(reviewsReq).reviews.length, equals(1));
        expect(
          cache.readQuery(reviewsReq).reviews.first.id,
          equals('123'),
        );
      });
    });
  });
}
