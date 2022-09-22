import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import 'package:benchmarking/benchmarking.dart';

import 'package:ferry_test_graphql/queries/__generated__/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.data.gql.dart';

const _numItems = 1000;

void main() async {
  final result = await asyncBenchmark('Query', query);
  result.report(units: _numItems);
}

Future<void> query() async {
  final client = Client(link: AutoResponderLink());
  final numbers = List.generate(_numItems, (i) => i);

  for (final num in numbers) {
    final req = GHumanWithArgsReq((b) => b..vars.id = num.toString());
    await client.request(req).first;
  }
}

class AutoResponderLink extends Link {
  @override
  Stream<Response> request(
    Request req, [
    forward,
  ]) =>
      Stream.value(
        Response(
          response: {},
          data: GHumanWithArgsData(
            (b) => b
              ..human.id = req.variables['id']
              ..human.name = 'Luke',
          ).toJson(),
        ),
      );
}

class AutoResponderLinkExceptionLink extends Link {
  @override
  Stream<Response> request(
    Request req, [
    forward,
  ]) =>
      Stream.error(RequestFormatException(
        request: req,
        originalException: Exception(),
        originalStackTrace: StackTrace.current,
      ));
}
