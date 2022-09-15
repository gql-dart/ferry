import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';

void handleCommand(TypedLinkWithCache client, IsolateCommand command,
    ReceivePort globalReceivePort) async {
  final sendPort = command.sendPort;
  try {
    switch (command.type) {
      case CommandType.clearCache:
        client.cache.clear();
        sendPort.send(null);
        break;
      case CommandType.request:
        final requestCommand = command as RequestCommand;
        final cancelEventPort = ReceivePort();
        sendPort.send(cancelEventPort.sendPort);
        final stream = client.request(requestCommand.request);
        final sub = stream.listen((event) {
          sendPort.send(event);
        });
        sendPort;
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
      case CommandType.dispose:
        globalReceivePort.close();
        await client.dispose();
        final disposeCommand = command as DisposeCommand;
        sendPort.send(null);
        Isolate.exit(disposeCommand.sendPort);
    }
  } catch (e, s) {
    sendPort.send(IsolateClientException(e, s, command));
  }
}

class IsolateClientException implements LinkException {
  @override
  final Object? originalException;
  @override
  final StackTrace? originalStackTrace;
  final IsolateCommand command;

  IsolateClientException(
      this.originalException, this.originalStackTrace, this.command);
}
