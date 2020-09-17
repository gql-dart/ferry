import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_exec/src/response.dart';
import 'package:test/test.dart';

import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';

class _StreamCancelTestLink extends Link {
  Completer hasCanceledStreamCompleter = Completer();

  @override
  Stream<Response> request(Request request, [forward]) async* {
    var controller = StreamController<Response>();
    StreamSubscription sub;
    try {
      //simulate events coming in, e.g. from a websocket
      sub =
          Stream.periodic(Duration(microseconds: 1), (_) => Response(data: {}))
              .listen(controller.add);
      //yield* should finish when the client stops listening
      yield* controller.stream;
    } finally {
      //this gets called when the client stops listening to the stream
      sub?.cancel();
      controller.close();

      hasCanceledStreamCompleter.complete();
    }
  }

  void reset() {
    hasCanceledStreamCompleter = Completer();
  }
}

void main() {
  test(
      'Stream in Link is cancelled when no one is listening - for all FetchPolicies',
      () async {
    final link = _StreamCancelTestLink();
    final client = Client(link: link);
    // test all fetchpolicies except CacheOnly - CacheOnly does not actually the link
    for (final fetchPolicy in [
      FetchPolicy.NetworkOnly,
      FetchPolicy.CacheFirst,
      FetchPolicy.CacheAndNetwork,
      FetchPolicy.NoCache
    ]) {
      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '123'
          ..fetchPolicy = fetchPolicy,
      );

      expect(link.hasCanceledStreamCompleter.isCompleted, isFalse);
      StreamSubscription subscription;
      subscription = client
          .responseStream(req)
          .where((event) => event.dataSource == DataSource.Link)
          .listen((event) async {
        //cancel subscription after first item
        //this ensures the the link.request() method is entered
        await subscription.cancel();
      });
      // the link should complete its "yield*" statement when the subscription is cancelled
      // and complete its completer
      try {
        await link.hasCanceledStreamCompleter.future
            .timeout(Duration(seconds: 1));
        expect(link.hasCanceledStreamCompleter.isCompleted, isTrue);
        link.reset();
      } on TimeoutException {
        fail('Stream from link was not cancelled when using $fetchPolicy');
      }
    }
  });
}
