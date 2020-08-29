import 'dart:async';
import 'package:async/async.dart';
import 'package:mockito/mockito.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:ferry/ferry.dart';
import 'package:test/test.dart';

import 'package:ferry_test_graphql/queries/variables/human_with_args.req.gql.dart';
import 'package:ferry_test_graphql/queries/variables/human_with_args.data.gql.dart';

class MockLink extends Mock implements Link {}

void main() {
  group('Fetch Policy', () {
    final mockLink = MockLink();

    final data = GHumanWithArgsData(
      (b) => b
        ..human.name = 'Steve Jobs'
        ..human.height = 1.88,
    );

    when(mockLink.request(any, any)).thenAnswer(
      (_) => Stream.value(Response(data: data.toJson())),
    );

    group('.CacheFirst', () {
      final client = Client(link: mockLink);

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '1'
          ..fetchPolicy = FetchPolicy.CacheFirst,
      );

      final queue = StreamQueue(client.responseStream(
        req,
        executeOnListen: false,
      ));

      test('First request returns a network response', () async {
        expect(client.cache.readQuery(req.execRequest), equals(null));
        client.requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Link));
        expect(client.cache.readQuery(req.execRequest), equals(data.toJson()));
      });

      test('Second request returns a cached response', () async {
        client.requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Cache));
      });
    });

    group('.CacheAndNetwork', () {
      final client = Client(link: mockLink);

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '1'
          ..fetchPolicy = FetchPolicy.CacheAndNetwork,
      );

      final queue = StreamQueue(client.responseStream(
        req,
        executeOnListen: false,
      ));

      test('First request returns a network response', () async {
        expect(client.cache.readQuery(req.execRequest), equals(null));
        client.requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Link));
        expect(client.cache.readQuery(req.execRequest), equals(data.toJson()));
      });

      test('Second request returns a cached response then a network response',
          () async {
        client.requestController.add(req);
        final response1 = await queue.next;
        expect(response1.dataSource, equals(DataSource.Cache));
        final response2 = await queue.next;
        expect(response2.dataSource, equals(DataSource.Link));
      });
    });

    group('.NetworkOnly', () {
      final client = Client(link: mockLink);

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '1'
          ..fetchPolicy = FetchPolicy.NetworkOnly,
      );

      final queue = StreamQueue(client.responseStream(
        req,
        executeOnListen: false,
      ));

      test('First request returns a network response', () async {
        expect(client.cache.readQuery(req.execRequest), equals(null));
        client.requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Link));
        expect(client.cache.readQuery(req.execRequest), equals(data.toJson()));
      });

      test('Second request returns a network response', () async {
        client.requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Link));
      });
    });

    group('.CacheOnly', () {
      final client = Client(link: mockLink);

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '1'
          ..fetchPolicy = FetchPolicy.CacheOnly,
      );

      final queue = StreamQueue(client.responseStream(
        req,
        executeOnListen: false,
      ));

      test('Request returns no data with empty cache', () async {
        expect(client.cache.readQuery(req.execRequest), equals(null));
        client.requestController.add(req);
        final response = await queue.next;
        expect(client.cache.readQuery(req.execRequest), equals(null));
        expect(response.dataSource, equals(DataSource.Cache));
        expect(response.data, equals(null));
      });

      test('Request returns data after writing to cache', () async {
        client.cache.writeQuery(req.execRequest, data.toJson());
        client.requestController.add(req);
        final response = await queue.next;
        expect(response.dataSource, equals(DataSource.Cache));
        expect(response.data, equals(data));
      });
    });

    group('.NoCache', () {
      final client = Client(link: mockLink);

      final req = GHumanWithArgsReq(
        (b) => b
          ..vars.id = '1'
          ..fetchPolicy = FetchPolicy.NoCache,
      );

      final queue = StreamQueue(client.responseStream(
        req,
        executeOnListen: false,
      ));

      test("First request returns response from network, doesn't cache",
          () async {
        expect(client.cache.readQuery(req.execRequest), equals(null));
        client.requestController.add(req);
        final response = await queue.next;
        expect(client.cache.readQuery(req.execRequest), equals(null));
        expect(response.dataSource, equals(DataSource.Link));
        expect(response.data, equals(data));
      });

      test("Second request returns response from network, doesn't cache",
          () async {
        client.requestController.add(req);
        final response = await queue.next;
        expect(client.cache.readQuery(req.execRequest), equals(null));
        expect(response.dataSource, equals(DataSource.Link));
        expect(response.data, equals(data));
      });
    });
  });
}
