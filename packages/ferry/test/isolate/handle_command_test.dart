import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';
import 'package:ferry/src/isolate/request_response_message.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.data.gql.dart';
import 'package:ferry_test_graphql2/fragments/__generated__/review_fragment.req.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql2/queries/__generated__/human_with_args.req.gql.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'handle_command_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TypedLinkWithCacheAndRequestController>(),
  MockSpec<ReceivePort>(),
  MockSpec<SendPort>(),
  MockSpec<Cache>(),
])
void main() {
  group('handleCommand delegation to link', () {
    late TypedLinkWithCacheAndRequestController link;
    late SendPort sendPort;
    late ReceivePort receivePort;
    late Cache cache;

    setUp(() {
      link = MockTypedLinkWithCacheAndRequestController();
      sendPort = MockSendPort();
      receivePort = MockReceivePort();
      cache = MockCache();
      when(link.cache).thenReturn(cache);
    });

    test('can handle gc command', () {
      GcCommand(sendPort).handle(link, receivePort);

      verifyInOrder([
        cache.gc(),
        sendPort.send(argThat(isA<Set<String>>()
            .having((s) => s, 'set of removed ids should be empty', isEmpty)))
      ]);

      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle evict command', () {
      EvictDataIdCommand(sendPort, 'human:1', 'field', null, null)
          .handle(link, receivePort);

      verifyInOrder([
        cache.evict(
          'human:1',
          fieldName: 'field',
          args: const {},
          optimisticRequest: null,
        ),
        sendPort.send(null)
      ]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle retain command', () {
      RetainCommand(sendPort, 'human:1').handle(link, receivePort);

      verifyInOrder([
        cache.retain(
          'human:1',
        ),
        sendPort.send(null)
      ]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle release command', () {
      ReleaseCommand(sendPort, 'human:1').handle(link, receivePort);

      verifyInOrder([
        cache.release(
          'human:1',
        ),
        sendPort.send(null)
      ]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle readQuery command', () {
      ReadQueryCommand(sendPort, GHumanWithArgsReq((b) => b..vars.id = '1'))
          .handle(link, receivePort);

      verify(cache.readQuery(GHumanWithArgsReq((b) => b..vars.id = '1')))
          .called(1);
      verify(sendPort.send(null)).called(1);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle writeQuery command', () {
      WriteQueryCommand(
              sendPort,
              GHumanWithArgsReq((b) => b..vars.id = '1'),
              GHumanWithArgsData((b) => b
                ..human.id = '1'
                ..human.name = 'a'),
              null)
          .handle(link, receivePort);
      verifyInOrder([
        cache.writeQuery(
            GHumanWithArgsReq((b) => b..vars.id = '1'),
            GHumanWithArgsData((b) => b
              ..human.id = '1'
              ..human.name = 'a')),
        sendPort.send(null)
      ]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle clearCache command', () {
      ClearCacheCommand(sendPort).handle(link, receivePort);

      verifyInOrder([cache.clear(), sendPort.send(null)]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle readFragment command', () {
      final fragmentReq = GReviewFragmentReq((b) => b..idFields = {});
      ReadFragmentCommand(sendPort, fragmentReq).handle(link, receivePort);

      verifyInOrder([cache.readFragment(fragmentReq), sendPort.send(null)]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle writeFragment command', () {
      final fragmentReq = GReviewFragmentReq((b) => b..idFields = {});
      final data = GReviewFragmentData((b) => b..stars = 5);
      WriteFragmentCommand(sendPort, fragmentReq, data, null)
          .handle(link, receivePort);

      verifyInOrder([
        cache.writeFragment(fragmentReq, data, optimisticRequest: null),
        sendPort.send(null)
      ]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    // TODO: handleCommand calls Isolate.exit directly, making it impossible to test
    // wrap the Isolate.exit command to make it testable
    test(
      'can handle dispose command',
      () async {
        final command = DisposeCommand(sendPort);
        command.killIsolate = false;
        await command.handle(link, receivePort);

        verify(link.dispose());
        verify(sendPort.send(null));
        verify(receivePort.close());
        verifyNoMoreInteractions(cache);
        verifyNoMoreInteractions(link);
        verifyNoMoreInteractions(sendPort);
        verifyNoMoreInteractions(receivePort);
      },
    );

    test('can handle request command', () {
      RequestCommand(sendPort, GHumanWithArgsReq((b) => b..vars.id = '1'))
          .handle(link, receivePort);

      verifyInOrder([
        link.request(GHumanWithArgsReq((b) => b..vars.id = '1')),
        sendPort.send(argThat(isA<RequestResponse>()
            .having(
                (p) => p.type, 'type is initial', RequestResponseType.initial)
            .having((p) => p.sendPort, 'has sendport', isNotNull))),
      ]);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle remove optimistic patch command', () {
      RemoveOptimisticPatch(
              sendPort, GHumanWithArgsReq((b) => b..vars.id = '1'))
          .handle(link, receivePort);

      verifyInOrder([
        link.cache,
        cache.removeOptimisticPatch(GHumanWithArgsReq((b) => b..vars.id = '1')),
        sendPort.send(null)
      ]);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });
  });
}
