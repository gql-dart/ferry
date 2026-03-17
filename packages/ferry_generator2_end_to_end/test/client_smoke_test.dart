import 'package:ferry/ferry.dart';
import 'package:ferry_generator2_end_to_end/no_vars/__generated__/hero_no_vars.data.gql.dart';
import 'package:ferry_generator2_end_to_end/no_vars/__generated__/hero_no_vars.req.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/human_with_args.req.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/human_with_args.var.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';

void main() {
  test('client executes no-vars operation requests', () async {
    final requests = <Request>[];
    final link = Link.function((request, [forward]) {
      requests.add(request);
      return Stream.value(
        Response(
          data: {
            '__typename': 'Query',
            'hero': {
              '__typename': 'Droid',
              'id': '2001',
              'name': 'R2-D2',
            },
          },
          response: const {},
        ),
      );
    });

    final client = Client(link: link);
    final req = GHeroNoVarsReq();
    final response = await client.request(req).first;

    expect(requests, hasLength(1));
    expect(requests.first.operation.operationName, 'HeroNoVars');
    expect(requests.first.variables, isEmpty);
    expect(response.data, isA<GHeroNoVarsData>());
    expect(response.data!.hero!.id, '2001');
    expect(response.data!.hero!.name, 'R2-D2');

    await client.dispose();
  });

  test('client executes operation requests with vars', () async {
    final requests = <Request>[];
    final link = Link.function((request, [forward]) {
      requests.add(request);
      return Stream.value(
        Response(
          data: {
            '__typename': 'Query',
            'human': {
              '__typename': 'Human',
              'name': 'Luke',
              'height': 1.72,
            },
          },
          response: const {},
        ),
      );
    });

    final client = Client(link: link);
    final vars = GHumanWithArgsVars(id: '1000');
    final req = GHumanWithArgsReq(vars: vars);
    final response = await client.request(req).first;

    expect(requests, hasLength(1));
    expect(requests.first.operation.operationName, 'HumanWithArgs');
    expect(requests.first.variables, equals({'id': '1000'}));
    expect(response.data, isA<GHumanWithArgsData>());
    expect(response.data!.human!.name, 'Luke');
    expect(response.data!.human!.height, 1.72);

    await client.dispose();
  });
}
