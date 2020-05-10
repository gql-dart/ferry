import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:ferry/ferry.dart";
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

import './graphql/all_pokemon.req.gql.dart';
import './graphql/all_pokemon.data.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group("Multiple QueryRequests of the same type", () {
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
      final req1 = AllPokemon(
        buildVars: (b) => b..first = 3,
      );

      final req2 = AllPokemon(
        buildVars: (b) => b..first = 5,
      );

      final resultStream = client
          .responseStream(req1, executeOnListen: false)
          .scan<List<QueryResponse<$AllPokemon>>>(
              (acc, val, _) => acc..add(val),
              []).takeUntil(TimerStream(null, Duration(milliseconds: 100)));

      () async {
        await Future.delayed(Duration.zero);
        client.queryController.add(req1);
        await Future.delayed(Duration.zero);
        client.queryController.add(req2);
      }();

      final response1 = QueryResponse<$AllPokemon>(
        queryRequest: req1,
        data: null,
        dataSource: DataSource.Link,
      );

      expect(await resultStream.last, equals([response1]));
    });

    test("Requests with the same args are returned in the same response stream",
        () async {
      final req1 = AllPokemon(
        buildVars: (b) => b..first = 3,
      );

      final req2 = AllPokemon(
        buildVars: (b) => b..first = 3,
      );

      final resultStream = client
          .responseStream(req1, executeOnListen: false)
          .scan<List<QueryResponse<$AllPokemon>>>((acc, val, _) {
        return acc..add(val);
      }, []).takeUntil(TimerStream(null, Duration(milliseconds: 100)));

      () async {
        await Future.delayed(Duration.zero);
        client.queryController.add(req1);
        await Future.delayed(Duration.zero);
        client.queryController.add(req2);
      }();

      Future.delayed(Duration(milliseconds: 100)).then((value) {});

      final response1 = QueryResponse<$AllPokemon>(
        queryRequest: req1,
        data: null,
        dataSource: DataSource.Link,
      );

      final response2 = QueryResponse<$AllPokemon>(
        queryRequest: req2,
        data: null,
        dataSource: DataSource.Link,
      );

      expect(await resultStream.last, equals([response1, response2]));
    });

    test(
        "Requests with the same queryId are returned in the same response stream",
        () async {
      final req1 = AllPokemon(
        queryId: "123",
        buildVars: (b) => b..first = 3,
      );

      final req2 = AllPokemon(
        queryId: "123",
        buildVars: (b) => b..first = 5,
      );

      final resultStream = client
          .responseStream(req1, executeOnListen: false)
          .scan<List<QueryResponse<$AllPokemon>>>((acc, val, _) {
        return acc..add(val);
      }, []).takeUntil(TimerStream(null, Duration(milliseconds: 100)));

      () async {
        await Future.delayed(Duration.zero);
        client.queryController.add(req1);
        await Future.delayed(Duration.zero);
        client.queryController.add(req2);
      }();

      Future.delayed(Duration(milliseconds: 100)).then((value) {});

      final response1 = QueryResponse<$AllPokemon>(
        queryRequest: req1,
        data: null,
        dataSource: DataSource.Link,
      );

      final response2 = QueryResponse<$AllPokemon>(
        queryRequest: req2,
        data: null,
        dataSource: DataSource.Link,
      );

      expect(await resultStream.last, equals([response1, response2]));
    });
  });
}
