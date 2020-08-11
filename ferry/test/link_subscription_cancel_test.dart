import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_exec/src/response.dart';
import 'package:test/test.dart';

import './graphql/all_pokemon.req.gql.dart';

class _StreamCancelTestLink extends Link {
  final Completer hasCanceledStreamCompleter = Completer();

  @override
  Stream<Response> request(Request request, [forward]) async* {
    StreamController<Response> controller = StreamController();
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
}

void main() {
  test("Steam in Link is cancelled when no one is listening", () async {
    final link = _StreamCancelTestLink();

    final client = Client(link: link);
    final request = AllPokemon(
        fetchPolicy: FetchPolicy.NetworkOnly, buildVars: (b) => b..first = 3);
    expect(link.hasCanceledStreamCompleter.isCompleted, isFalse);
    StreamSubscription subscription;
    subscription = client
        .responseStream(request)
        .where((event) => event.dataSource == DataSource.Link)
        .listen((event) async {
      //cancel subscription after first item
      //this ensures the the link.request() method is entered
      await subscription.cancel();
    });
    // the link should complete its "yield*" statement when the subscription is cancelled
    // and complete its completer
    await link.hasCanceledStreamCompleter.future;

    expect(link.hasCanceledStreamCompleter.isCompleted, isTrue);
  });
}
