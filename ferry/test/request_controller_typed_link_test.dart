import 'dart:async';
import 'package:async/async.dart';
import 'package:test/test.dart';
import 'package:ferry_exec/ferry_exec.dart';

import 'package:ferry/src/request_controller_typed_link.dart';

import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';

final _TerminatingTypedLink = TypedLink.function(
  <TData, TVars>(request, [next]) {
    final controller = StreamController<OperationResponse<TData, TVars>>();
    controller.add(OperationResponse(operationRequest: request));
    return controller.stream;
  },
);

final req = GHumanWithArgsReq((b) => b..vars.id = '1');

void main() {
  test('Can be canceled', () async {
    final controller = StreamController<OperationRequest>();
    final typedLink = TypedLink.from([
      RequestControllerTypedLink(controller),
      _TerminatingTypedLink,
    ]);

    final stream = typedLink.request(req);

    expect(stream, emitsThrough(emitsDone));

    await Future.delayed(Duration.zero);
    await typedLink.dispose();
    print(stream);
  });

  group('Multiple OperationRequests of the same type', () {
    test(
        'Requests with different requestIds are not returned in the same response stream',
        () async {
      final controllerTypedLink = RequestControllerTypedLink();
      final typedLink = TypedLink.from([
        controllerTypedLink,
        _TerminatingTypedLink,
      ]);

      final queue = StreamQueue(typedLink.request(req));

      expect((await queue.next).operationRequest.vars.id, equals('1'));

      final req2 = req.rebuild((b) => b..requestId = 'req2');
      controllerTypedLink.requestController.add(req2);

      await typedLink.dispose();

      expect(await queue.hasNext, equals(false));
    });

    test(
        'Requests with the same requestId but different variables are returned in the same response stream',
        () async {
      final controllerTypedLink = RequestControllerTypedLink();
      final typedLink = TypedLink.from([
        controllerTypedLink,
        _TerminatingTypedLink,
      ]);

      final queue = StreamQueue(typedLink.request(req));

      expect((await queue.next).operationRequest.vars.id, equals('1'));

      final req2 = req.rebuild((b) => b..vars.id = '2');
      controllerTypedLink.requestController.add(req2);

      expect((await queue.next).operationRequest.vars.id, equals('2'));

      await typedLink.dispose();

      expect(await queue.hasNext, equals(false));
    });
  });
}
