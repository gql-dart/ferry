import 'dart:isolate';
import 'package:ferry/ferry.dart';

abstract class IsolateCommand {
  SendPort sendPort;
  CommandType type;

  IsolateCommand(this.sendPort, this.type);
}

enum CommandType {
  request,
  clearCache,
  readQuery,
  writeQuery,
  dispose,
  readFragment,
  writeFragment,
  evictDataId,
  gc
}

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

class ReadFragmentCommand<TData, TVars> extends IsolateCommand {
  final FragmentRequest<TData, TVars> request;
  final bool optimistic;

  ReadFragmentCommand(SendPort sendPort, this.request, {this.optimistic = true})
      : super(sendPort, CommandType.readFragment);
}

class WriteFragmentCommand<TData, TVars> extends IsolateCommand {
  final FragmentRequest<TData, TVars> request;
  final TData response;
  final OperationRequest<TData, TVars>? optimisticRequest;

  WriteFragmentCommand(
      SendPort sendPort, this.request, this.response, this.optimisticRequest)
      : super(sendPort, CommandType.writeFragment);
}

class EvictDataIdCommand extends IsolateCommand {
  final String dataId;
  final String? fieldName;
  final Map<String, dynamic>? args;
  final OperationRequest? optimisticRequest;

  EvictDataIdCommand(SendPort sendPort, this.dataId, this.fieldName, this.args,
      this.optimisticRequest)
      : super(sendPort, CommandType.evictDataId);
}

class GcCommand extends IsolateCommand {
  GcCommand(SendPort sendPort) : super(sendPort, CommandType.gc);
}
