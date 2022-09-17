import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/handle_command.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';
import 'package:ferry_test_graphql/fragments/__generated__/review_fragment.data.gql.dart';
import 'package:ferry_test_graphql/fragments/__generated__/review_fragment.req.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.data.gql.dart';
import 'package:ferry_test_graphql/queries/__generated__/human_with_args.req.gql.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'handle_command_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TypedLinkWithCache>(),
  MockSpec<ReceivePort>(),
  MockSpec<SendPort>(),
  MockSpec<Cache>(),
])
void main() {
  group('handleCommand delegation to link', () {
    late TypedLinkWithCache link;
    late SendPort sendPort;
    late ReceivePort receivePort;
    late Cache cache;

    setUp(() {
      link = MockTypedLinkWithCache();
      sendPort = MockSendPort();
      receivePort = MockReceivePort();
      cache = MockCache();
      when(link.cache).thenReturn(cache);
    });

    test('can handle gc command', () {
      handleCommand(link, GcCommand(sendPort), receivePort);

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
      handleCommand(
          link,
          EvictDataIdCommand(sendPort, 'human:1', 'field', null, null),
          receivePort);

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
      handleCommand(link, RetainCommand(sendPort, 'human:1'), receivePort);

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
      handleCommand(link, ReleaseCommand(sendPort, 'human:1'), receivePort);

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
      handleCommand(
        link,
        ReadQueryCommand(sendPort, GHumanWithArgsReq((b) => b..vars.id = '1')),
        receivePort,
      );

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
      handleCommand(
          link,
          WriteQueryCommand(
            sendPort,
            GHumanWithArgsReq((b) => b..vars.id = '1'),
            GHumanWithArgsData((b) => b
              ..human.id = '1'
              ..human.name = 'a'),
            null,
          ),
          receivePort);
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
      handleCommand(link, ClearCacheCommand(sendPort), receivePort);

      verifyInOrder([cache.clear(), sendPort.send(null)]);
      verify(link.cache);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });

    test('can handle readFragment command', () {
      final fragmentReq = GReviewFragmentReq((b) => b..idFields = {});
      handleCommand(
          link, ReadFragmentCommand(sendPort, fragmentReq), receivePort);

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
      handleCommand(link,
          WriteFragmentCommand(sendPort, fragmentReq, data, null), receivePort);

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
    test('can handle dispose command', () async {
      await handleCommand(link, DisposeCommand(sendPort), receivePort);
      verify(link.dispose());
      verify(sendPort.send(null));
      verify(receivePort.close());
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    }, skip: true);

    test('can handle request command', () {
      handleCommand(
        link,
        RequestCommand(sendPort, GHumanWithArgsReq((b) => b..vars.id = '1')),
        receivePort,
      );
      verifyInOrder([
        sendPort.send(argThat(isA<SendPort>())),
        link.request(GHumanWithArgsReq((b) => b..vars.id = '1')),
      ]);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(link);
      verifyNoMoreInteractions(sendPort);
      verifyNoMoreInteractions(receivePort);
    });
  });
}
