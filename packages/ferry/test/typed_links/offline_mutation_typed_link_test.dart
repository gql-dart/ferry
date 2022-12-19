import 'dart:async';
import 'package:test/test.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:async/async.dart';

import 'package:ferry/src/offline_mutation_typed_link.dart';

import 'package:ferry_test_graphql2/schema/__generated__/serializers.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.req.gql.dart';
import 'package:ferry_test_graphql2/mutations/__generated__/create_review.data.gql.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';

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

    final controllerLink = TypedLink.function(
      <TData, TVars>(request, [forward]) => requestController.stream
          .whereType<OperationRequest<TData, TVars>>()
          .switchMap(
            (req) => forward!(request),
          )
          .doOnListen(
        () {
          if (request.executeOnListen) {
            scheduleMicrotask(() => requestController.add(request));
          }
        },
      ),
    );

    final offlineMutationLink = OfflineMutationTypedLink(
      mutationQueueBox: box,
      serializers: serializers,
      cache: cache,
      requestController: requestController,
    );

    final terminatingLink =
        TypedLink.function(<TData, TVars>(request, [forward]) => Stream.value(
              OperationResponse(
                operationRequest: request,
                data: data as TData,
              ),
            ));

    // offline mutation link must go between controller link and terminating link
    final typedLink = TypedLink.from([
      controllerLink,
      offlineMutationLink,
      terminatingLink,
    ]);

    // online, initial request is executed
    offlineMutationLink.connected = true;

    final queue = StreamQueue(typedLink.request(req));

    expect((await queue.next).data, equals(data));

    // client goes offline, subsequent request is queued
    offlineMutationLink.connected = false;
    requestController.add(req);
    queue.hasNext;
    await Future.delayed(Duration.zero);

    expect(box.keys.length, equals(1));

    // client comes back online, queued request is executed
    offlineMutationLink.connected = true;

    expect((await queue.next).data, equals(data));

    expect(box.keys.length, equals(0));
  });
}
