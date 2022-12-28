import 'dart:async';
import 'package:async/async.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/add_typename_typed_link.dart';
import 'package:ferry/src/update_cache_typed_link.dart';
import 'package:ferry/src/request_controller_typed_link.dart';
import 'package:ferry/src/fetch_policy_typed_link.dart';

import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.req.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.var.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.data.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart';

import './update_cache_typed_link_test.mocks.dart';

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
      ..reviews.add(GReviewsData_reviews.fromJson(
          response.data!.createReview!.toJson())!)),
  );
};

@GenerateMocks([Link])
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

      final cacheProxy = CacheProxy(cache, req);
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
    late StreamController<Response> linkController;
    late Cache cache;
    late StreamController<OperationRequest> requestController;
    late TypedLink typedLink;

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

    test('calls handler with multiple responses from DataSource.Link',
        () async {
      final queue = StreamQueue(typedLink.request(createReviewReq));

      expect(cache.readQuery(reviewsReq), equals(null));

      requestController.add(createReviewReq);
      linkController
          .add(Response(data: createReviewData.toJson(), response: {}));
      await queue.next;

      expect(cache.readQuery(reviewsReq)!.reviews!.length, equals(1));

      linkController
          .add(Response(data: createReviewData.toJson(), response: {}));
      await queue.next;

      expect(cache.readQuery(reviewsReq)!.reviews!.length, equals(2));
    });

    group('with optimistic response', () {
      test('can run handler optimistically followed by non-optimistically',
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
        final res1 = await queue.next;

        expect(res1.dataSource, equals(DataSource.Optimistic));
        expect(cache.readQuery(reviewsReq)!.reviews!.length, equals(1));
        expect(
          cache.readQuery(reviewsReq)!.reviews!.first!.id,
          equals('456'),
        );

        linkController
            .add(Response(data: createReviewData.toJson(), response: {}));
        final res2 = await queue.next;

        expect(res2.dataSource, equals(DataSource.Link));
        expect(cache.readQuery(reviewsReq)!.reviews!.length, equals(1));
        expect(
          cache.readQuery(reviewsReq)!.reviews!.first!.id,
          equals('123'),
        );
      });
    });

  });

  test("optimistic update ", () {




  });

}
