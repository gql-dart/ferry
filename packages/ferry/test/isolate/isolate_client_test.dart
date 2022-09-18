import 'dart:async';
import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/ferry_isolate.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.req.gql.dart';
import 'package:test/test.dart';

import '../../benchmark/operations.dart';

void main() {
  group('IsolateClient', () {
    test('can create IsolateClient', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient);

      expect(client, isA<IsolateClient>());
    });

    test('can do requests on Isolate', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            OperationResponse(
                data: GHumanWithArgsData((b) => b
                  ..human.id = '1'
                  ..human.name = 'Luke'),
                dataSource: DataSource.Link,
                operationRequest: req),
            emitsDone,
          ])));

      await Future.delayed(Duration.zero);

      await client.dispose();
    });

    test('can handle errors', () async {
      final client = await IsolateClient.create(_initErrorResponderClient);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            isA<OperationResponse>()
                .having((p) => p.data, 'no data', isNull)
                .having((p) => p.dataSource, 'datasource ', DataSource.Link)
                .having(
                    (p) => p.linkException,
                    'has link exception',
                    isA<LinkException>()
                        .having((p) => p.originalStackTrace, 'has stacktrace',
                            isNotNull)
                        .having((e) => e.originalException, 'exception',
                            isA<Exception>())),
            emitsDone,
          ])));

      await Future.delayed(Duration.zero);

      await client.dispose();
    });

    test('can use messageHandler', () async {
      late Object? message;

      final client = await IsolateClient.create(
          _initAutoResponderLinkClientWithMessageHandler, messageHandler: (m) {
        message = m;
      });
      await Future.delayed(Duration.zero);

      expect(message, 42);

      await client.dispose();
    });

    test('can cancel subscription across isolates', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      final sub = stream.listen((event) {});

      await Future.delayed(Duration.zero);

      unawaited(sub.cancel());

      await Future.delayed(Duration.zero);
    });

    test('can readQuery', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      await stream.first;

      final result =
          await client.readQuery(GHumanWithArgsReq((b) => b..vars.id = '1'));

      expect(
          result,
          isA<GHumanWithArgsData>()
              .having((p) => p.human.id, 'id', '1')
              .having((p) => p.human.name, 'name', 'Luke'));

      await Future.delayed(Duration.zero);
    });

    test('can writeQuery', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            OperationResponse(
                data: GHumanWithArgsData((b) => b
                  ..human.id = '1'
                  ..human.name = 'Luke'),
                dataSource: DataSource.Link,
                operationRequest: req),
            OperationResponse(
                data: GHumanWithArgsData((b) => b
                  ..human.id = '2'
                  ..human.name = 'Bert'),
                dataSource: DataSource.Cache,
                operationRequest: req),
            emitsDone,
          ])));

      await Future.delayed(Duration.zero);

      await client.writeQuery(
          GHumanWithArgsReq((b) => b..vars.id = '1'),
          GHumanWithArgsData((b) => b
            ..human.id = '2'
            ..human.name = 'Bert'));

      await Future.delayed(Duration.zero);

      await client.dispose();
    });

    test('can clear cache', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            OperationResponse(
                data: GHumanWithArgsData((b) => b
                  ..human.id = '1'
                  ..human.name = 'Luke'),
                dataSource: DataSource.Link,
                operationRequest: req),
            OperationResponse(
                operationRequest: req,
                data: null,
                dataSource: DataSource.Cache),
            // TODO: figure out why duplicate emit and eliminate it
            mayEmit(OperationResponse(
                operationRequest: req,
                data: null,
                dataSource: DataSource.Cache)),
            emitsDone,
          ])));

      await Future.delayed(Duration.zero);

      expect(await client.readQuery(req), isNotNull);

      await client.clearCache();

      expect(await client.readQuery(req), isNull);

      await Future.delayed(Duration.zero);

      await client.dispose();
    });
  });
}

Future<Client> _initAutoResponderLinkClient(
    Map<String, dynamic> params, SendPort? sendMessageToMessageHandler) async {
  return Client(link: AutoResponderLink());
}

Future<Client> _initErrorResponderClient(
    Map<String, dynamic> params, SendPort? sendMessageToMessageHandler) async {
  return Client(link: AutoResponderLinkExceptionLink());
}

Future<Client> _initAutoResponderLinkClientWithMessageHandler(
    Map<String, dynamic> params, SendPort? sendMessageToMessageHandler) async {
  sendMessageToMessageHandler!.send(42);
  return Client(link: AutoResponderLink());
}
