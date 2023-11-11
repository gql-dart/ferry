import 'dart:async';
import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/ferry_isolate.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.data.gql.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.var.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/reviews.req.gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:test/test.dart';

import '../../benchmark/operations.dart';

void main() {
  group('IsolateClient', () {
    test('can create IsolateClient', () async {
      final client = await IsolateClient.create<Null>(
          _initAutoResponderLinkClient,
          params: null);

      expect(client, isA<IsolateClient>());
    });

    test('can do requests on Isolate', () async {
      final client = await IsolateClient.create<Null>(
          _initAutoResponderLinkClient,
          params: null);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            isA<OperationResponse<GHumanWithArgsData, GHumanWithArgsVars>>()
                .having(
                    (p) => p.data,
                    'data',
                    GHumanWithArgsData((b) => b
                      ..human.id = '1'
                      ..human.name = 'Luke'))
                .having((p) => p.linkException, 'linkException', isNull)
                .having((p) => p.graphqlErrors, 'errors', isNull)
                .having((p) => p.dataSource, 'source', DataSource.Link),
            emitsDone,
          ])));

      await Future.delayed(Duration.zero);

      await client.dispose();
    });

    test('can handle errors', () async {
      final client = await IsolateClient.create<Null>(_initErrorResponderClient,
          params: null);

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
          _initAutoResponderLinkClientWithMessageHandler,
          params: null, messageHandler: (m) {
        message = m;
      });
      await Future.delayed(Duration.zero);

      expect(message, 42);

      await client.dispose();
    });

    test('can cancel subscription across isolates', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      final sub = stream.listen((event) {});

      await Future.delayed(Duration.zero);

      unawaited(sub.cancel());

      await Future.delayed(Duration.zero);
    });

    test('can readQuery', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);

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
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            isA<OperationResponse<GHumanWithArgsData, GHumanWithArgsVars>>()
                .having(
                    (p) => p.data,
                    'data',
                    GHumanWithArgsData((b) => b
                      ..human.id = '1'
                      ..human.name = 'Luke'))
                .having((p) => p.linkException, 'linkException', isNull)
                .having((p) => p.graphqlErrors, 'errors', isNull)
                .having((p) => p.dataSource, 'source', DataSource.Link),
            isA<OperationResponse<GHumanWithArgsData, GHumanWithArgsVars>>()
                .having(
                    (p) => p.data,
                    'data',
                    GHumanWithArgsData((b) => b
                      ..human.id = '2'
                      ..human.name = 'Bert'))
                .having((p) => p.linkException, 'linkException', isNull)
                .having((p) => p.graphqlErrors, 'errors', isNull)
                .having((p) => p.dataSource, 'source', DataSource.Cache),
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
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);

      final req = GHumanWithArgsReq((b) => b..vars.id = '1');

      final stream = client.request(req);

      unawaited(expectLater(
          stream,
          emitsInOrder([
            isA<OperationResponse<GHumanWithArgsData, GHumanWithArgsVars>>()
                .having(
                    (p) => p.data,
                    'data',
                    GHumanWithArgsData((b) => b
                      ..human.id = '1'
                      ..human.name = 'Luke'))
                .having((p) => p.linkException, 'linkException', isNull)
                .having((p) => p.graphqlErrors, 'errors', isNull)
                .having((p) => p.dataSource, 'source', DataSource.Link),
            isA<OperationResponse<GHumanWithArgsData?, GHumanWithArgsVars>>()
                .having((p) => p.data, 'data', isNull)
                .having((p) => p.linkException, 'linkException', isNull)
                .having((p) => p.graphqlErrors, 'errors', isNull)
                .having((p) => p.dataSource, 'source', DataSource.Cache),
            emitsDone,
          ])));

      await Future.delayed(Duration.zero);

      expect(await client.readQuery(req), isNotNull);

      await client.clearCache();

      expect(await client.readQuery(req), isNull);

      await Future.delayed(Duration.zero);

      await client.dispose();
    });

    test('can write optimistic data and remove optimistic response', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);
      addTearDown(client.dispose);
      final req = GHumanWithArgsReq((b) => b..vars.id = '1');
      final data = GHumanWithArgsData((b) => b
        ..human.id = '__optimistic'
        ..human.name = 'Luke');

      await client.writeQuery(
          req,
          GHumanWithArgsData((b) => b
            ..human.id = '__optimistic'
            ..human.name = 'Luke'),
          optimisticRequest: req);

      expect(await client.readQuery(req), data);
      expect(await client.readQuery(req, optimistic: false), isNull);

      await client.removeOptimisticPatch(req);

      expect(await client.readQuery(req), isNull);
      expect(await client.readQuery(req, optimistic: false), isNull);
    });

    test('can refetch and paginate with updateResult', () async {
      final client = await IsolateClient.create(
          _initAutoResponderForReviewsLinkClient,
          params: null);

      final req = GReviewsReq((b) => b
        ..requestId = '1'
        ..updateResult = _mergeReviews
        ..vars.first = 3
        ..vars.offset = 0);

      final stream = client.request(req);

      expect(
          stream,
          emitsInOrder([
            isA<OperationResponse>()
                .having((p) => p.graphqlErrors, 'no graphql errors', isNull)
                .having((p) => p.linkException, 'no exception', isNull)
                .having(
                    (p) => p.data,
                    'data',
                    GReviewsData((b) => b
                      ..reviews.addAll([
                        for (var i = 0; i < 3; i++)
                          GReviewsData_reviews((b) => b
                            ..id = '$i'
                            ..stars = 5)
                      ]))),
            isA<OperationResponse>()
                .having((p) => p.graphqlErrors, 'no graphql errors', isNull)
                .having((p) => p.linkException, 'no exception', isNull)
                .having(
                    (p) => p.data,
                    'data',
                    GReviewsData((b) => b
                      ..reviews.addAll([
                        for (var i = 0; i < 6; i++)
                          GReviewsData_reviews((b) => b
                            ..id = '$i'
                            ..stars = 5)
                      ]))),
            emitsDone,
          ]));

      await Future.delayed(Duration.zero);

      await client.addRequestToRequestController(
          req.rebuild((b) => b..vars.offset = 3));

      await Future.delayed(Duration.zero);

      await client.dispose();
    });

    test('throws assertionError when trying to invalid updateResult function',
        () async {
      final client = await IsolateClient.create(
          _initAutoResponderForReviewsLinkClient,
          params: null);

      void localFunc() {}

      addTearDown(client.dispose);
      //closure that captures local state, cannot be sent to isolate
      final invalidMergeReviews =
          (GReviewsData? previousResult, GReviewsData? fetchMoreResult) {
        // try to call this locally declared function
        // -> this will make the invalidMergeReviews non-transmittable for sure
        localFunc();
        return null;
      };

      final req = GReviewsReq((b) => b
        ..requestId = '1'
        ..updateResult = invalidMergeReviews
        ..vars.first = 3
        ..vars.offset = 0);

      expect(() => client.request(req), throwsA(isA<AssertionError>()));
      expect(() => client.addRequestToRequestController(req),
          throwsA(isA<AssertionError>()));
    });

    test('can watchFragment', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);
      final fragmentReq = GReviewFragmentReq((b) => b..idFields = {'id': '2'});

      final stream = client.watchFragment(fragmentReq);

      await client.writeQuery(
          GReviewsReq(),
          GReviewsData((b) => b
            ..reviews.addAll([
              GReviewsData_reviews((b) => b
                ..id = '1'
                ..stars = 5
                ..commentary = 'commentary'),
              GReviewsData_reviews((b) => b
                ..id = '2'
                ..stars = 5
                ..commentary = 'commentary2'),
            ])));

      expect(
          stream,
          emitsInOrder([
            null,
            GReviewFragmentData((b) => b
              ..stars = 5
              ..commentary = 'commentary2'),
            emitsDone
          ]));

      await client.dispose();
    });

    test('can watchQuery', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);
      final req = GReviewsReq();

      final stream = client.watchQuery(req);

      final data = GReviewsData((b) => b
        ..reviews.addAll([
          GReviewsData_reviews((b) => b
            ..id = '1'
            ..stars = 5
            ..commentary = 'commentary'),
          GReviewsData_reviews((b) => b
            ..id = '2'
            ..stars = 5
            ..commentary = 'commentary2'),
        ]));

      await client.writeQuery(req, data);

      expect(stream, emitsInOrder([null, data, emitsDone]));

      await client.dispose();
    });

    test('can clearOptimistic patches', () async {
      final client = await IsolateClient.create(_initAutoResponderLinkClient,
          params: null);
      final req = GReviewsReq();

      final stream = client.watchQuery(req);

      final data = GReviewsData((b) => b
        ..reviews.addAll([
          GReviewsData_reviews((b) => b
            ..id = '1'
            ..stars = 5
            ..commentary = 'commentary'),
        ]));

      await client.writeQuery(req, data, optimisticRequest: req);

      await client.clearOptimisticPatches();

      expect(stream, emitsInOrder([null, data, null, emitsDone]));

      await client.dispose();
    });
  });
}

Future<Client> _initAutoResponderLinkClient(
    Null params, SendPort? sendMessageToMessageHandler) async {
  return Client(link: AutoResponderLink());
}

Future<Client> _initErrorResponderClient(
    Null params, SendPort? sendMessageToMessageHandler) async {
  return Client(link: AutoResponderLinkExceptionLink());
}

Future<Client> _initAutoResponderLinkClientWithMessageHandler(
    Null params, SendPort? sendMessageToMessageHandler) async {
  sendMessageToMessageHandler!.send(42);
  return Client(link: AutoResponderLink());
}

Future<Client> _initAutoResponderForReviewsLinkClient(
    Null params, SendPort? sendMessageToMessageHandler) async {
  return Client(link: _ReviewsAutoResponderTerminalLink());
}

class _ReviewsAutoResponderTerminalLink extends Link {
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

GReviewsData? _mergeReviews(GReviewsData? previous, GReviewsData? result) {
  final merged =
      previous?.rebuild((b) => b..reviews.addAll(result!.reviews!)) ?? result;
  return merged;
}
