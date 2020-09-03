import 'package:async/async.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import 'package:ferry_test_graphql/schema/serializers.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.req.gql.dart';
import 'package:ferry_test_graphql/mutations/variables/create_review.data.gql.dart';
import 'package:ferry_test_graphql/schema/schema.schema.gql.dart';
import 'package:ferry/plugins.dart';
import 'package:ferry/ferry.dart';

class MockLink extends Mock implements Link {}

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

  final mockLink = MockLink();
  when(mockLink.request(any, any))
      .thenAnswer((_) => Stream.value(Response(data: data.toJson())));

  test('mutations get enqueued and dequeued', () async {
    final box = await Hive.openBox<Map<String, dynamic>>('mutation_queue');
    await box.clear();

    final client = Client(link: mockLink);
    final plugin = OfflineMutationPlugin(
      mutationQueueBox: box,
      serializers: serializers,
      client: client,
    );
    client.plugins.add(plugin);

    final queue = StreamQueue(client.responseStream(req));

    await Future.delayed(Duration.zero);

    expect(box.keys.length, equals(1));

    plugin.isConnectedController.add(true);

    expect((await queue.next).data, equals(data));

    expect(box.keys.length, equals(0));
  });
}
