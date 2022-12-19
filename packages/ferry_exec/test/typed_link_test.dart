import 'package:async/async.dart';
import 'package:test/test.dart';

import 'package:ferry_exec/ferry_exec.dart';
import 'package:ferry_test_graphql2/queries/__generated__/hero_no_vars.req.gql.dart';

final _TerminatingTypedLink = TypedLink.function(
  <TData, TVars>(request, [next]) => Stream.value(
    OperationResponse(operationRequest: request),
  ),
);

final _Req2TypedLink = TypedLink.function(
  <TData, TVars>(request, [next]) =>
      next!((request as dynamic).rebuild((b) => b..requestId = '2')).map(
    (response) => OperationResponse(
      operationRequest: response.operationRequest,
      dataSource: DataSource.Cache,
    ),
  ),
);

final _Req3TypedLink = TypedLink.function(
  <TData, TVars>(request, [next]) =>
      next!((request as dynamic).rebuild((b) => b..requestId = '3')).map(
    (response) => OperationResponse(
      operationRequest: response.operationRequest,
      dataSource: DataSource.Link,
    ),
  ),
);

void main() {
  group('TypedLink.from', () {
    test('applies typedLinks in the correct order', () async {
      final req = GHeroNoVarsReq();
      final typedLink = TypedLink.from([
        _Req2TypedLink,
        _Req3TypedLink,
        _TerminatingTypedLink,
      ]);
      final queue = StreamQueue(typedLink.request(req));
      final response = await queue.next;
      expect(response.operationRequest.requestId, equals('3'));
      expect(response.dataSource, equals(DataSource.Cache));
      expect(await queue.hasNext, equals(false));
    });
  });
}
