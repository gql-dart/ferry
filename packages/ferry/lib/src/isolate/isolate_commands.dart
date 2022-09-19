import 'dart:isolate';
import 'package:ferry/ferry.dart';
import 'package:meta/meta.dart';

@internal
abstract class IsolateCommand {
  SendPort sendPort;
  CommandType type;

  IsolateCommand(this.sendPort, this.type);
}

@internal
enum CommandType {
  request,
  clearCache,
  readQuery,
  writeQuery,
  dispose,
  readFragment,
  writeFragment,
  evictDataId,
  gc,
  retain,
  release,
  removeOptimisticPatch,
}

@internal
class DisposeCommand extends IsolateCommand {
  DisposeCommand(SendPort sendPort) : super(sendPort, CommandType.dispose);
}

@internal
class RequestCommand<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;

  RequestCommand(SendPort sendPort, this.request)
      : super(sendPort, CommandType.request);
}

@internal
class ClearCacheCommand extends IsolateCommand {
  ClearCacheCommand(SendPort sendPort)
      : super(sendPort, CommandType.clearCache);
}

@internal
class ReadQueryCommand<TData extends Object, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;
  final bool optimistic;

  ReadQueryCommand(SendPort sendPort, this.request, {this.optimistic = true})
      : super(sendPort, CommandType.readQuery);
}

@internal
class WriteQueryCommand<TData extends Object, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;
  final TData response;
  final OperationRequest<TData, TVars>? optimisticRequest;

  WriteQueryCommand(
      SendPort sendPort, this.request, this.response, this.optimisticRequest)
      : super(sendPort, CommandType.writeQuery);
}

@internal
class ReadFragmentCommand<TData, TVars> extends IsolateCommand {
  final FragmentRequest<TData, TVars> request;
  final bool optimistic;

  ReadFragmentCommand(SendPort sendPort, this.request, {this.optimistic = true})
      : super(sendPort, CommandType.readFragment);
}

@internal
class WriteFragmentCommand<TData, TVars> extends IsolateCommand {
  final FragmentRequest<TData, TVars> request;
  final TData response;
  final OperationRequest<TData, TVars>? optimisticRequest;

  WriteFragmentCommand(
      SendPort sendPort, this.request, this.response, this.optimisticRequest)
      : super(sendPort, CommandType.writeFragment);
}

@internal
class EvictDataIdCommand extends IsolateCommand {
  final String dataId;
  final String? fieldName;
  final Map<String, dynamic>? args;
  final OperationRequest? optimisticRequest;

  EvictDataIdCommand(SendPort sendPort, this.dataId, this.fieldName, this.args,
      this.optimisticRequest)
      : super(sendPort, CommandType.evictDataId);
}

@internal
class GcCommand extends IsolateCommand {
  GcCommand(SendPort sendPort) : super(sendPort, CommandType.gc);
}

@internal
class RetainCommand extends IsolateCommand {
  final String entityId;

  RetainCommand(SendPort sendPort, this.entityId)
      : super(sendPort, CommandType.retain);
}

@internal
class ReleaseCommand extends IsolateCommand {
  final String entityId;

  ReleaseCommand(SendPort sendPort, this.entityId)
      : super(sendPort, CommandType.release);
}

@internal
class RemoveOptimisticResponseCommand<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;

  RemoveOptimisticResponseCommand(
    SendPort sendPort,
    this.request,
  ) : super(sendPort, CommandType.removeOptimisticPatch);
}
