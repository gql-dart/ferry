import 'dart:async';
import 'package:test/test.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/offline_mutation_typed_link.dart';

import 'package:ferry_test_graphql/schema/serializers.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.req.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.data.gql.dart';
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart';

final req = GCreateReviewReq(
  (b) => b
    ..vars.review.stars = 5
    ..vars.episode = GEpisode.NEWHOPE
    ..vars.review.commentary = 'Amazing!!!',
);

final data = GCreateReviewData(
  (b) => b
    ..createReview.id = '123'
    ..createReview.stars = 5
    ..createReview.episode = GEpisode.NEWHOPE
    ..createReview.commentary = 'Amazing!!!',
);

void main() {
  Hive.init('./test/__hive_data__');

  test('mutations get enqueued and dequeued', () async {
    final box = await Hive.openBox<Map<String, dynamic>>('mutation_queue');
    await box.clear();

    final requestController = StreamController<OperationRequest>();
    final cache = Cache();

    final terminatingTypedLink = TypedLink.function(
      <TData, TVars>(request, [forward]) => requestController.stream
          .whereType<OperationRequest<TData, TVars>>()
          .switchMap(
            (req) => Stream.value(
              OperationResponse(
                operationRequest: req,
                data: data as TData,
              ),
            ),
          ),
    );

    final offlineMutationTypedLink = OfflineMutationTypedLink(
      mutationQueueBox: box,
      serializers: serializers,
      cache: cache,
      requestController: requestController,
    );

    final typedLink = TypedLink.from([
      offlineMutationTypedLink,
      terminatingTypedLink,
    ]);

    await Future.delayed(Duration.zero);

    expect(box.keys.length, equals(1));

    offlineMutationTypedLink.isConnectedController.add(true);

    await expectLater(typedLink.request(req), emits(data));

    expect(box.keys.length, equals(0));
  });
}
