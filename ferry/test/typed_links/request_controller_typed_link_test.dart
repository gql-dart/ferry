import 'dart:async';
import 'package:async/async.dart';
import 'package:test/test.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry/src/request_controller_typed_link.dart';

import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.var.gql.dart';

TData dataForRequest<TData, TVars>(OperationRequest<TData, TVars> request) {
  final req = request as GReviewsReq;
  final offset = req.vars.offset ?? 0;
  final first = req.vars.first;
  return GReviewsData((b) => b
    ..reviews.addAll([
      for (int i = offset; i < offset + first!; i++)
        GReviewsData_reviews(
          (b) => b
            ..id = '$i'
            ..stars = 5,
        )
    ])) as TData;
}

final req = GReviewsReq(
  (b) => b
    ..vars.first = 3
    ..vars.offset = 0
    ..updateResult = updateResult,
);

final updateResult = (GReviewsData? previous, GReviewsData? result) =>
    previous?.rebuild((b) => b..reviews.addAll(result!.reviews!)) ?? result;

void main() {
  group('RequestControllerTypedLink', () {
    late StreamController<OperationRequest> requestController;
    late StreamController<OperationResponse> responseController;
    late TypedLink typedLink;

    setUp(() {
      requestController = StreamController();
      responseController = StreamController.broadcast();

      typedLink = TypedLink.from([
        RequestControllerTypedLink(requestController),
        TypedLink.function(
          <TData, TVars>(request, [next]) => responseController.stream
              .whereType<OperationResponse<TData, TVars>>()
              .where((res) => request == res.operationRequest)
              .startWith(OperationResponse(
                operationRequest: request,
                data: dataForRequest(request),
              )),
        ),
      ]);
    });

    tearDown(() {
      requestController.close();
      responseController.close();
      typedLink.dispose();
    });

    group('multiple OperationRequests of the same type', () {
      test(
          'requests with different requestIds are not returned in the same response stream',
          () async {
        final queue = StreamQueue(typedLink.request(req));

        expect(await queue.next, isNotNull);

        requestController.add(req.rebuild((b) => b..requestId = 'another'));

        await responseController.close();
        requestController.close();

        expect(await queue.hasNext, equals(false));
      });

      test(
          'requests with the same requestId but different variables are returned in the same response stream',
          () async {
        final request = req.rebuild((b) => b..requestId = '123');
        final queue = StreamQueue(typedLink.request(request));

        expect(await queue.next, isNotNull);

        requestController.add(request.rebuild((b) => b..vars.offset = 3));

        expect((await queue.next).operationRequest.vars.offset, equals(3));

        await responseController.close();
        requestController.close();

        expect(await queue.hasNext, equals(false));
      });

      test(
          'requests with no requestId and different variables are not returned in the same response stream',
          () async {
        final queue = StreamQueue(typedLink.request(req));

        expect(await queue.next, isNotNull);

        requestController.add(req.rebuild((b) => b..vars.offset = 3));

        await responseController.close();
        requestController.close();

        expect(await queue.hasNext, equals(false));
      });

      test(
          'identical requests with no requestId are returned in the same response stream',
          () async {
        final queue = StreamQueue(typedLink.request(req));

        expect(await queue.next, isNotNull);

        requestController.add(req);

        expect(await queue.next, isNotNull);

        await responseController.close();
        requestController.close();

        expect(await queue.hasNext, equals(false));
      });
    });

    group('updating result', () {
      test('correctly updates the result', () async {
        final req1 = req.rebuild((b) => b..requestId = '123');

        final queue = StreamQueue(typedLink.request(req1));

        final reviews1 = dataForRequest(req1).reviews!;
        expect((await queue.next).data!.reviews, equals(reviews1));

        final req2 = req1.rebuild((b) => b..vars.offset = 3);
        requestController.add(req2);
        final reviews2 = reviews1.rebuild(
          (b) => b..addAll(dataForRequest(req2).reviews!),
        );
        expect((await queue.next).data!.reviews, equals(reviews2));

        final req3 = req1.rebuild((b) => b..vars.offset = 6);
        requestController.add(req3);
        final reviews3 = reviews2.rebuild(
          (b) => b..addAll(dataForRequest(req3).reviews!),
        );
        expect((await queue.next).data!.reviews, equals(reviews3));

        await responseController.close();
        requestController.close();

        expect(await queue.hasNext, equals(false));
      });

      test('continues to track changes to previous', () async {
        final req1 = req.rebuild((b) => b..requestId = '123');

        final queue = StreamQueue(typedLink.request(req1));

        final reviews1 = dataForRequest(req1).reviews!;
        expect((await queue.next).data!.reviews, equals(reviews1));

        final req2 = req1.rebuild((b) => b..vars.offset = 3);
        requestController.add(req2);
        final reviews2 = reviews1.rebuild(
          (b) => b..addAll(dataForRequest(req2).reviews!),
        );
        expect((await queue.next).data!.reviews, equals(reviews2));

        responseController.add(
          OperationResponse<GReviewsData, GReviewsVars>(
            operationRequest: req1,
            data: dataForRequest(req1).rebuild(
              (b) => b
                ..reviews.first = b.reviews.first.rebuild((b) => b..stars = 1),
            ),
          ),
        );
        expect((await queue.next).data!.reviews!.first.stars, equals(1));

        await responseController.close();
        requestController.close();

        expect(await queue.hasNext, equals(false));
      });
    });
  });
}
