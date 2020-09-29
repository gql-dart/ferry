import 'dart:async';
import 'package:test/test.dart';
import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/request_controller_typed_link.dart';

import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';

TData dataForRequest<TData, TVars>(OperationRequest<TData, TVars> request) {
  final req = request as GReviewsReq;
  final offset = req.vars.offset ?? 0;
  final first = req.vars.first;
  return GReviewsData((b) => b
    ..reviews.addAll([
      for (int i = offset; i < offset + first; i++)
        GReviewsData_reviews(
          (b) => b
            ..id = '$i'
            ..stars = 5,
        )
    ])) as TData;
}

final req1 = GReviewsReq(
  (b) => b
    ..vars.first = 3
    ..vars.offset = 0
    ..updateResult = updateResult,
);
final req2 = req1.rebuild(
  (b) => b..vars.offset = 3,
);
final req3 = req1.rebuild(
  (b) => b..vars.offset = 6,
);

final updateResult = (GReviewsData previous, GReviewsData result) =>
    previous?.rebuild((b) => b..reviews.addAll(result.reviews)) ?? result;

void main() {
  StreamController<OperationRequest> requestController;
  StreamController<OperationResponse> responseController;
  TypedLink typedLink;

  setUp(() {
    requestController = StreamController();
    responseController = StreamController.broadcast();
    typedLink = TypedLink.from([
      RequestControllerTypedLink(requestController),
      TypedLink.function(
        <TData, TVars>(req, [fw]) => responseController.stream
            .whereType<OperationResponse<TData, TVars>>()
            .where((res) => res.operationRequest.requestId == req.requestId)
            .startWith(
              OperationResponse(
                  operationRequest: req, data: dataForRequest(req)),
            ),
      ),
    ]);
  });

  test('correctly updates the result', () async {
    final queue = StreamQueue(typedLink.request(req1));

    final reviews1 = dataForRequest(req1).reviews;
    expect((await queue.next).data.reviews, equals(reviews1));

    requestController.add(req2);
    final reviews2 = reviews1.rebuild(
      (b) => b..addAll(dataForRequest(req2).reviews),
    );
    expect((await queue.next).data.reviews, equals(reviews2));

    requestController.add(req3);
    final reviews3 = reviews2.rebuild(
      (b) => b..addAll(dataForRequest(req3).reviews),
    );
    expect((await queue.next).data.reviews, equals(reviews3));
  });

  test('continues to track changes to previous', () async {
    final queue = StreamQueue(typedLink.request(req1));

    final reviews1 = dataForRequest(req1).reviews;
    expect((await queue.next).data.reviews, equals(reviews1));

    requestController.add(req2);
    final reviews2 = reviews1.rebuild(
      (b) => b..addAll(dataForRequest(req2).reviews),
    );
    expect((await queue.next).data.reviews, equals(reviews2));

    responseController.add(
      OperationResponse(
        operationRequest: req1,
        data: dataForRequest(req1).rebuild(
          (b) =>
              b..reviews.first = b.reviews.first.rebuild((b) => b..stars = 1),
        ),
      ),
    );
    expect((await queue.next).data.reviews.first.stars, equals(1));
  });
}
