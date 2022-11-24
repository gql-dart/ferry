import 'dart:isolate';
import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/request_response_message.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/transformers.dart';

@internal
abstract class IsolateCommand {
  SendPort sendPort;

  IsolateCommand(this.sendPort);

  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort);
}

@internal
class DisposeCommand extends IsolateCommand {
  DisposeCommand(SendPort sendPort) : super(sendPort);

  @visibleForTesting
  bool killIsolate = true;

  @override
  Future<void> handle(TypedLinkWithCacheAndRequestController link,
      ReceivePort receivePort) async {
    receivePort.close();
    await link.dispose();
    sendPort.send(null);
    await Future.delayed(Duration.zero);

    if (killIsolate) {
      Isolate.current.kill();
    }
  }
}

@internal
class RequestCommand<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;

  RequestCommand(SendPort sendPort, this.request) : super(sendPort);

  @override
  void handle(TypedLinkWithCacheAndRequestController client,
      ReceivePort globalReceivePort) {
    final cancelEventPort = ReceivePort();
    sendPort
        .send(RequestResponse.initialCancelSendPort(cancelEventPort.sendPort));
    final stream = client.request<TData, TVars>(request);
    final sub = stream.doOnDone(() {
      cancelEventPort.close();
      sendPort.send(RequestResponse.done());
      cancelEventPort.close();
    }).listen((event) {
      sendPort.send(RequestResponse.data(event));
    }, onError: (Object error, StackTrace stack) {
      sendPort.send(RequestResponse.error(error, stack));
    });
    cancelEventPort.listen((_) {
      sub.cancel();
      cancelEventPort.close();
    });
  }
}

@internal
class ClearCacheCommand extends IsolateCommand {
  ClearCacheCommand(SendPort sendPort) : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.clear();
    sendPort.send(null);
  }
}

@internal
class ReadQueryCommand<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;
  final bool optimistic;

  ReadQueryCommand(SendPort sendPort, this.request, {this.optimistic = true})
      : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    final response = link.cache.readQuery(request, optimistic: optimistic);
    sendPort.send(response);
  }
}

@internal
class WriteQueryCommand<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;
  final TData response;
  final OperationRequest<TData, TVars>? optimisticRequest;

  WriteQueryCommand(
      SendPort sendPort, this.request, this.response, this.optimisticRequest)
      : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.writeQuery(
      request,
      response,
      optimisticRequest: optimisticRequest,
    );
    sendPort.send(null);
  }
}

@internal
class ReadFragmentCommand<TData, TVars> extends IsolateCommand {
  final FragmentRequest<TData, TVars> request;
  final bool optimistic;

  ReadFragmentCommand(SendPort sendPort, this.request, {this.optimistic = true})
      : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    final fragment = link.cache.readFragment(request, optimistic: optimistic);
    sendPort.send(fragment);
  }
}

@internal
class WriteFragmentCommand<TData, TVars> extends IsolateCommand {
  final FragmentRequest<TData, TVars> request;
  final TData response;
  final OperationRequest<TData, TVars>? optimisticRequest;

  WriteFragmentCommand(
      SendPort sendPort, this.request, this.response, this.optimisticRequest)
      : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.writeFragment(
      request,
      response,
      optimisticRequest: optimisticRequest,
    );
    sendPort.send(null);
  }
}

@internal
class EvictDataIdCommand extends IsolateCommand {
  final String dataId;
  final String? fieldName;
  final Map<String, dynamic>? args;
  final OperationRequest? optimisticRequest;

  EvictDataIdCommand(SendPort sendPort, this.dataId, this.fieldName, this.args,
      this.optimisticRequest)
      : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.evict(
      dataId,
      fieldName: fieldName,
      args: args ?? const {},
      optimisticRequest: optimisticRequest,
    );
    sendPort.send(null);
  }
}

@internal
class GcCommand extends IsolateCommand {
  GcCommand(SendPort sendPort) : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    final ids = link.cache.gc();
    sendPort.send(ids);
  }
}

@internal
class RetainCommand extends IsolateCommand {
  final String entityId;

  RetainCommand(SendPort sendPort, this.entityId) : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.retain(entityId);
    sendPort.send(null);
  }
}

@internal
class ReleaseCommand extends IsolateCommand {
  final String entityId;

  ReleaseCommand(SendPort sendPort, this.entityId) : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.release(entityId);
    sendPort.send(null);
  }
}

@internal
class RemoveOptimisticPatch<TData, TVars> extends IsolateCommand {
  final OperationRequest<TData, TVars> request;

  RemoveOptimisticPatch(
    SendPort sendPort,
    this.request,
  ) : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.cache.removeOptimisticPatch(request);
    sendPort.send(null);
  }
}

class AddRequestToRequestControllerCommand<TData, TVasrs>
    extends IsolateCommand {
  final OperationRequest<TData, TVasrs> request;

  AddRequestToRequestControllerCommand(
    SendPort sendPort,
    this.request,
  ) : super(sendPort);

  @override
  void handle(
      TypedLinkWithCacheAndRequestController link, ReceivePort receivePort) {
    link.requestController.add(request);
    sendPort.send(null);
  }
}
