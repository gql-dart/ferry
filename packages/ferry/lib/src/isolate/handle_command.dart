import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';

void handleCommand(Client client, IsolateCommand command,
    ReceivePort globalReceivePort) async {
  switch (command.type) {
    case CommandType.clearCache:
      final clearCacheCommand = command as ClearCacheCommand;
      client.cache.clear();
      clearCacheCommand.sendPort.send(null);
      break;
    case CommandType.request:
      final requestCommand = command as RequestCommand;
      final cancelEventPort = ReceivePort();
      requestCommand.sendPort.send(cancelEventPort.sendPort);
      final stream = client.request(requestCommand.request);
      final sub = stream.listen((event) {
        requestCommand.sendPort.send(event);
      });
      requestCommand.sendPort;
      cancelEventPort.listen((_) {
        sub.cancel();
        cancelEventPort.close();
      });
      break;
    case CommandType.readQuery:
      final readQueryCommand = command as ReadQueryCommand;
      final response = client.cache.readQuery(readQueryCommand.request,
          optimistic: readQueryCommand.optimistic);
      readQueryCommand.sendPort.send(response);
      break;
    case CommandType.writeQuery:
      final writeQueryCommand = command as WriteQueryCommand;
      client.cache.writeQuery(
        writeQueryCommand.request,
        writeQueryCommand.response,
        optimisticRequest: writeQueryCommand.optimisticRequest,
      );
      writeQueryCommand.sendPort.send(null);
      break;
    case CommandType.dispose:
      globalReceivePort.close();
      await client.dispose();
      final disposeCommand = command as DisposeCommand;
      disposeCommand.sendPort.send(null);
      Isolate.exit(disposeCommand.sendPort);
  }
}
