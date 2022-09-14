import 'dart:isolate';
import 'package:ferry/ferry.dart';

abstract class IsolateCommand {
  SendPort sendPort;
  CommandType type;

  IsolateCommand(this.sendPort, this.type);
}

enum CommandType { request, clearCache, readQuery, writeQuery, dispose }

class DisposeCommand extends IsolateCommand {
  DisposeCommand(SendPort sendPort) : super(sendPort, CommandType.dispose);
}

class RequestCommand<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;

  RequestCommand(SendPort sendPort, this.request)
      : super(sendPort, CommandType.request);
}

class ClearCacheCommand extends IsolateCommand {
  ClearCacheCommand(SendPort sendPort)
      : super(sendPort, CommandType.clearCache);
}

class ReadQueryCommand<TData extends Object, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;
  final bool optimistic;

  ReadQueryCommand(SendPort sendPort, this.request, {this.optimistic = true})
      : super(sendPort, CommandType.readQuery);
}

class WriteQueryCommand<TData extends Object, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;
  final TData response;
  final OperationRequest<TData, TVars>? optimisticRequest;

  WriteQueryCommand(
      SendPort sendPort, this.request, this.response, this.optimisticRequest)
      : super(sendPort, CommandType.writeQuery);
}
