import 'package:ferry/ferry.dart';
import 'package:ferry_test_graphql2/schema/__generated__/schema.schema.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';
import 'package:gql/language.dart' as gql;

void main() {
  test('can execute query with json operation', () async {
    final client = Client(
      cache: Cache(
        possibleTypes: possibleTypesMap,
      ),
      link: _AutoResponderTerminalLink(),
    );

    addTearDown(client.dispose);

    final req =
        JsonOperationRequest(operation: Operation(document: gql.parseString(r'''
       query Reviews {
            reviews(episode: $episode, first: $first, offset: $offset) {
              id
              stars
            }
          }''')), fetchPolicy: FetchPolicy.CacheFirst, vars: {
      'episode': 'NEWHOPE',
      'first': 3,
      'offset': 0,
    });

    final result = await client.request(req).first;

    expect(result.linkException, isNull);

    expect(result.hasErrors, false);

    expect(result.dataSource, DataSource.Link);

    final data = result.data;

    expect(data, isNotNull);

    const expected = {
      '__typename': 'Query',
      'reviews': [
        {
          '__typename': 'Review',
          'id': '0',
          'stars': 5,
        },
        {
          '__typename': 'Review',
          'id': '1',
          'stars': 5,
        },
        {
          '__typename': 'Review',
          'id': '2',
          'stars': 5,
        }
      ]
    };
    expect(data, expected);

    final resultCached = await client.request(req).first;

    expect(resultCached.linkException, isNull);

    expect(resultCached.hasErrors, false);

    expect(resultCached.dataSource, DataSource.Cache);

    final dataCached = resultCached.data;

    expect(dataCached, isNotNull);

    expect(
      dataCached,
      expected,
    );
  });
}

class _AutoResponderTerminalLink extends Link {
  @override
  Stream<Response> request(
    Request req, [
    forward,
  ]) =>
      Stream.value(
        Response(
          response: {},
          data: {
            '__typename': 'Query',
            'reviews': [
              for (int i = req.variables['offset'] as int;
                  i <
                      ((req.variables['offset'] as int) + req.variables['first']
                          as int);
                  i++)
                {
                  '__typename': 'Review',
                  'id': '$i',
                  'stars': 5,
                }
            ],
          },
        ),
      );
}
