import "dart:async";
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql/execution.dart';
import "package:test/test.dart";
import 'package:rxdart/rxdart.dart';

import '../example/lib/graphql_api.dart';
import '../lib/src/client/client.dart';

class MockLink extends Mock implements Link {}

void main() {
  test("", () async {
    final mockLink = MockLink();

    final queries = [
      SongsQuery(variables: SongsArguments(first: 1)),
    ];

    final requests = queries
        .map((query) => Request(
              operation: Operation(
                document: query.document,
                operationName: query.operationName,
                variables: query.getVariablesMap(),
              ),
            ))
        .toList();

    final responseData = queries.map((query) {
      final songId = query.variables.first + (query.variables.offset ?? 0);
      return {
        "Song": [
          {
            "id": songId.toString(),
            "name": "Song $songId",
            "__typename": "Song"
          }
        ]
      };
    }).toList();

    for (var i = 0; i < requests.length; i++) {
      when(mockLink.request(requests[i], any)).thenAnswer(
          (_) => Stream.fromIterable([Response(data: responseData[i])]));
    }

    final client = Client(link: mockLink);

    final queryRef = client.query(queries[0]);

    expect(queryRef.stream.map((response) => response.data.toJson()),
        emitsInOrder(responseData));
  });
}
