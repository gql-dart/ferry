import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';
import 'package:ferry/src/isolate/request_response_message.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

// this function matches an IsolateCommand to an actual method call
// to be executed on the client or its cache
@internal
Future<void> handleCommand(TypedLinkWithCache client, IsolateCommand command,
    ReceivePort globalReceivePort) async {
  final sendPort = command.sendPort;
  try {
    switch (command.type) {
      case CommandType.clearCache:
        client.cache.clear();
        sendPort.send(null);
        break;
      case CommandType.request:
        command as RequestCommand;
        final cancelEventPort = ReceivePort();
        sendPort.send(
            RequestResponse.initialCancelSendPort(cancelEventPort.sendPort));
        final stream = client.request(command.request);
        final sub = stream.doOnDone(() {
          sendPort.send(RequestResponse.done());
        }).listen((event) {
          sendPort.send(RequestResponse.data(event));
        });
        cancelEventPort.listen((_) {
          sub.cancel();
          cancelEventPort.close();
        });
        break;
      case CommandType.readQuery:
        command as ReadQueryCommand;
        final response = client.cache
            .readQuery(command.request, optimistic: command.optimistic);
        sendPort.send(response);
        break;
      case CommandType.writeQuery:
        command as WriteQueryCommand;
        client.cache.writeQuery(
          command.request,
          command.response,
          optimisticRequest: command.optimisticRequest,
        );
        sendPort.send(null);
        break;
      case CommandType.readFragment:
        command as ReadFragmentCommand;
        final fragment = client.cache
            .readFragment(command.request, optimistic: command.optimistic);
        sendPort.send(fragment);
        break;
      case CommandType.writeFragment:
        command as WriteFragmentCommand;
        client.cache.writeFragment(command.request, command.response,
            optimisticRequest: command.optimisticRequest);
        sendPort.send(null);
        break;
      case CommandType.evictDataId:
        command as EvictDataIdCommand;
        client.cache.evict(
          command.dataId,
          fieldName: command.fieldName,
          args: command.args ?? const {},
          optimisticRequest: command.optimisticRequest,
        );
        sendPort.send(null);
        break;
      case CommandType.gc:
        command.sendPort.send(client.cache.gc());
        break;
      case CommandType.retain:
        command as RetainCommand;
        client.cache.retain(command.entityId);
        sendPort.send(null);
        break;
      case CommandType.release:
        command as ReleaseCommand;
        client.cache.release(command.entityId);
        sendPort.send(null);
        break;
      case CommandType.dispose:
        globalReceivePort.close();
        await client.dispose();
        await Future.delayed(Duration.zero);
        final disposeCommand = command as DisposeCommand;
        sendPort.send(null);

        Isolate.exit(disposeCommand.sendPort);
    }
  } catch (e, s) {
    sendPort.send(RequestResponse.error(e, s));
  }
}
