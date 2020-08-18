import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:ferry/ferry.dart";
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

import 'package:test_graphql/queries/variables/human_with_args.req.gql.dart';
import 'package:test_graphql/queries/variables/human_with_args.data.gql.dart';
import 'package:test_graphql/queries/variables/human_with_args.var.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group("Multiple OperationRequests of the same type", () {
    final mockLink = MockLink();

    when(mockLink.request(any, any)).thenAnswer(
      (_) => Stream.value(Response(data: Map())),
    );

    final client = Client(
      link: mockLink,
      options: ClientOptions(addTypename: false),
    );
    test(
        "Requests with different args aren't returned in the same response stream",
        () async {
      final human1 = GHumanWithArgs((b) => b..vars.id = "1");
      final human2 = GHumanWithArgs((b) => b..vars.id = "2");

      final resultStream = client
          .responseStream(human1, executeOnListen: false)
          .scan<
                  List<
                      OperationResponse<GHumanWithArgsData,
                          GHumanWithArgsVars>>>((acc, val, _) => acc..add(val),
              []).takeUntil(TimerStream(null, Duration(milliseconds: 100)));

      () async {
        await Future.delayed(Duration.zero);
        client.requestController.add(human1);
        await Future.delayed(Duration.zero);
        client.requestController.add(human2);
      }();

      final response1 = OperationResponse(
        operationRequest: human1,
        data: null,
        dataSource: DataSource.Link,
      );

      expect(await resultStream.last, equals([response1]));
    });

    test("Requests with the same args are returned in the same response stream",
        () async {
      final req1 = GHumanWithArgs((b) => b..vars.id = "1");

      final req2 = GHumanWithArgs((b) => b..vars.id = "1");

      final resultStream = client
          .responseStream(req1, executeOnListen: false)
          .scan<
              List<
                  OperationResponse<GHumanWithArgsData,
                      GHumanWithArgsVars>>>((acc, val, _) {
        return acc..add(val);
      }, []).takeUntil(TimerStream(null, Duration(milliseconds: 100)));

      () async {
        await Future.delayed(Duration.zero);
        client.requestController.add(req1);
        await Future.delayed(Duration.zero);
        client.requestController.add(req2);
      }();

      Future.delayed(Duration(milliseconds: 100)).then((value) {});

      final response1 = OperationResponse(
        operationRequest: req1,
        data: null,
        dataSource: DataSource.Link,
      );

      final response2 = OperationResponse(
        operationRequest: req2,
        data: null,
        dataSource: DataSource.Link,
      );

      expect(await resultStream.last, equals([response1, response2]));
    });

    test(
        "Requests with the same requestId are returned in the same response stream",
        () async {
      final req1 = GHumanWithArgs(
        (b) => b
          ..vars.id = "1"
          ..requestId = "123",
      );

      final req2 = GHumanWithArgs(
        (b) => b
          ..vars.id = "2"
          ..requestId = "123",
      );

      final resultStream = client
          .responseStream(req1, executeOnListen: false)
          .scan<
              List<
                  OperationResponse<GHumanWithArgsData,
                      GHumanWithArgsVars>>>((acc, val, _) {
        return acc..add(val);
      }, []).takeUntil(TimerStream(null, Duration(milliseconds: 100)));

      () async {
        await Future.delayed(Duration.zero);
        client.requestController.add(req1);
        await Future.delayed(Duration.zero);
        client.requestController.add(req2);
      }();

      Future.delayed(Duration(milliseconds: 100)).then((value) {});

      final response1 = OperationResponse(
        operationRequest: req1,
        data: null,
        dataSource: DataSource.Link,
      );

      final response2 = OperationResponse(
        operationRequest: req2,
        data: null,
        dataSource: DataSource.Link,
      );

      expect(await resultStream.last, equals([response1, response2]));
    });
  });
}
