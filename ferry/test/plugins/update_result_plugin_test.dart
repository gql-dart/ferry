import 'dart:async';
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry/plugins.dart';
import 'package:test/test.dart';
import 'package:async/async.dart';

import 'package:ferry_test_graphql/queries/variables/reviews.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/reviews.data.gql.dart';
import 'package:ferry_test_graphql/fragments/review_fragment.req.gql.dart';

class MockLink extends Mock implements Link {}

GReviewsData dataForRequest(GReviewsReq request) {
  final offset = request.vars.offset ?? 0;
  final first = request.vars.first;
  return GReviewsData((b) => b
    ..reviews.addAll([
      for (int i = offset; i < offset + first; i++)
        GReviewsData_reviews(
          (b) => b
            ..id = '$i'
            ..stars = 5,
        )
    ]));
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
  final mockLink = MockLink();

  for (var req in [req1, req2, req3]) {
    when(mockLink.request(req.execRequest, any)).thenAnswer(
      (_) => Stream.value(Response(data: dataForRequest(req).toJson())),
    );
  }

  test('correctly updates the result', () async {
    final client = Client(
      link: mockLink,
    )..plugins.removeWhere((plugin) => plugin is AddTypenamePlugin);

    final queue = StreamQueue(client.responseStream(req1));

    final reviews1 = dataForRequest(req1).reviews;
    expect((await queue.next).data.reviews, equals(reviews1));

    client.requestController.add(req2);
    final reviews2 = reviews1.rebuild(
      (b) => b..addAll(dataForRequest(req2).reviews),
    );
    expect((await queue.next).data.reviews, equals(reviews2));

    client.requestController.add(req3);
    final reviews3 = reviews2.rebuild(
      (b) => b..addAll(dataForRequest(req3).reviews),
    );
    expect((await queue.next).data.reviews, equals(reviews3));
  });

  test('continues to track changes to previous', () async {
    final client = Client(
      link: mockLink,
    )..plugins.removeWhere((plugin) => plugin is AddTypenamePlugin);

    final queue = StreamQueue(client.responseStream(req1));

    final reviews1 = dataForRequest(req1).reviews;
    expect((await queue.next).data.reviews, equals(reviews1));

    client.requestController.add(req2);
    final reviews2 = reviews1.rebuild(
      (b) => b..addAll(dataForRequest(req2).reviews),
    );
    expect((await queue.next).data.reviews, equals(reviews2));

    final reviewFragment = GReviewFragmentReq((b) => b..idFields = {'id': 0});
    final review = client.cache.readFragment(reviewFragment);
    client.cache
        .writeFragment(reviewFragment, review.rebuild((b) => b..stars = 1));
    expect((await queue.next).data.reviews.first.stars, equals(1));
  });
}
