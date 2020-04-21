import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import "package:flutter_test/flutter_test.dart";
import "package:ferry/ferry.dart";

// TODO: move query objects into test folder
import '../example/lib/src/graphql/all_pokemon.req.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group("GraphQLErrors", () {
    final mockLink = MockLink();

    final allPokemonReq = AllPokemon(buildVars: (b) => b..first = 3);

    final graphQLErrors = [GraphQLError(message: "Your GraphQL is not valid")];

    test('Returns the correct result', () async {
      when(mockLink.request(allPokemonReq)).thenAnswer(
        (_) => Stream.value(Response(errors: graphQLErrors)),
      );

      final client = Client(link: mockLink);

      final responseStream = client.responseStream(allPokemonReq);

      expect(responseStream.map((response) => response.data),
          emitsInOrder(networkResponses));

      client.queryController.add(queryRequests[0]);
      await Future.delayed(Duration.zero);

      client.queryController.add(queryRequests[1]);
      await Future.delayed(Duration.zero);

      expect(store.toMap(), equals(cacheSnapshot(Source.Network)));
    });
  });
}
