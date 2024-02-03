import 'package:ferry/ferry.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';

class _TestContextEntry implements ContextEntry {
  final String test;
  _TestContextEntry({required this.test});

  @override
  List<Object?> get fieldsForEquality => [test];
}

void main() {
  test('passes context to links', () async {
    // network response
    final link = Link.function((request, [forward]) {
      final contextTest = request.context.entry<_TestContextEntry>()!.test;
      final data = GReviewsData((b) => b
        ..reviews.addAll([
          GReviewsData_reviews((b) => b
            ..id = '1'
            ..commentary = contextTest
            ..stars = 5),
        ])).toJson();

      return Stream.value(Response(
        errors: [],
        data: data,
        response: data,
      ));
    });

    final client = Client(link: link);

    final req = GReviewsReq((b) => b
      ..vars.first = 3
      ..vars.offset = 0
      ..context =
          Context.fromList([_TestContextEntry(test: 'some contextual value')]));

    final result = await client.request(req).first;

    expect(result.data!.reviews!.first!.commentary, 'some contextual value');
  });
}
