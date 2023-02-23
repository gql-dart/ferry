

import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';

void main() {

  test('can merge pages in cache using custom field policy', () async {

    final client = Client(
      cache: Cache(
        typePolicies: {
          'Query': TypePolicy(
            fields: {
              'reviews': FieldPolicy(
                keyArgs: const [], // every reviews query is cached together, do not consider arguments for paging
                merge: (existing, incoming, options) {
                  final merged = (LinkedHashSet<dynamic>(
                      equals: jsonMapEquals,
                      hashCode: const DeepCollectionEquality().hash)
                    ..addAll(existing ?? [])
                    ..addAll(incoming ?? []))
                      .toList();
                  return merged.toList();
                },
              ),
            },
          ),
        }
      ),
      link: _AutoResponderTerminalLink(),
    );

    final req = GReviewsReq((b) => b
    ..fetchPolicy = FetchPolicy.NetworkOnly
      ..vars.first = 3
      ..vars.offset = 0);

    final req2 = GReviewsReq((b) => b
      ..fetchPolicy = FetchPolicy.NetworkOnly
      ..vars.first = 3
      ..vars.offset = 3);

    final req3 = GReviewsReq((b) => b
      ..fetchPolicy = FetchPolicy.NetworkOnly
      ..vars.first = 3
      ..vars.offset = 6);

    await client.request(req).first;

    final result1 =  client.cache.readQuery(req);

    expect(result1!.reviews!.length, 3);
    await client.request(req2).first;

    final result2 =  client.cache.readQuery(req);

    expect(result2!.reviews!.length, 6);
    await client.request(req3).first;

    final result3 =  client.cache.readQuery(req);

    expect(result3!.reviews!.length, 9);

    expect(result3.reviews!.map((e) => e!.id).toList(), ['0', '1', '2', '3', '4', '5', '6', '7', '8']);

    expect(client.cache.readQuery(req2), client.cache.readQuery(req3));

  });


  test('can set read policy to adopt transform data' ,() async{

    final  client = Client(
      cache: Cache(
        typePolicies: {
          'Review': TypePolicy(
            fields: {
              'stars': FieldPolicy(
                read: (existing, options) {
                  return existing! * 2;
                },
              ),
            },
          ),
        }
      ),
      link: _AutoResponderTerminalLink(),
    );

    final req = GReviewsReq((b) => b
      ..fetchPolicy = FetchPolicy.NetworkOnly
      ..vars.first = 1
      ..vars.offset = 0);

    await client.request(req).first;

    final result1 =  client.cache.readQuery(req);

    expect(result1!.reviews!.map((e) => e!.stars).toList(), [10]);

  });

}


class _AutoResponderTerminalLink extends Link {
  @override
  Stream<Response> request(
      Request req, [
        forward,
      ]) =>
      Stream.value(Response(
          response: {},
          data: GReviewsData((b) => b
            ..reviews.addAll([
              for (int i = req.variables['offset'] as int;
              i <
                  ((req.variables['offset'] as int) + req.variables['first']
                  as int);
              i++)
                GReviewsData_reviews(
                      (b) => b
                    ..id = '$i'
                    ..stars = 5,
                )
            ])).toJson()));
}
