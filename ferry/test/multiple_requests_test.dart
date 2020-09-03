import 'dart:async';
import 'package:async/async.dart';
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:ferry/ferry.dart';
import 'package:test/test.dart';

import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  final req = GHumanWithArgsReq((b) => b..vars.id = '1');

  group('Multiple OperationRequests of the same type', () {
    final mockLink = MockLink();

    when(mockLink.request(any, any)).thenAnswer(
      (_) => Stream.value(Response(data: {})),
    );

    test(
        'Requests with different requestIds are not returned in the same response stream',
        () async {
      final client = Client(link: mockLink);

      final queue = StreamQueue(client.responseStream(req));

      expect((await queue.next).operationRequest.vars.id, equals('1'));

      final req2 = req.rebuild((b) => b..requestId = 'req2');
      client.requestController.add(req2);
      client.dispose();

      expect(await queue.hasNext, equals(false));
    });

    test(
        'Requests with the same requestId but different variables are returned in the same response stream',
        () async {
      final client = Client(link: mockLink);

      final queue = StreamQueue(client.responseStream(req));

      expect((await queue.next).operationRequest.vars.id, equals('1'));

      final req2 = req.rebuild((b) => b..vars.id = '2');
      client.requestController.add(req2);

      expect((await queue.next).operationRequest.vars.id, equals('2'));

      client.dispose();

      expect(await queue.hasNext, equals(false));
    });
  });
}
