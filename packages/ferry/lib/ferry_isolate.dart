import 'dart:async';
import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:rxdart/rxdart.dart';

typedef InitClient = Future<Client> Function({Map<String, dynamic> params});

class IsolateClient extends TypedLink {
  final InitClient createClient;

  late final ReceivePort globalReceivePort;

  late final SendPort globalSendPort;

  late final Isolate isolate;

  IsolateClient._({required this.createClient, Map<String, dynamic>? params});

  static Future<IsolateClient> spawn(InitClient createClient,
      {Map<String, dynamic>? params}) async {
    final client = IsolateClient._(createClient: createClient, params: params);

    client.globalReceivePort = ReceivePort('package:ferry/ferry_isolate.dart');

    final completer = Completer();

    client.globalReceivePort.first.then((value) {
      assert(value is SendPort);
      client.globalSendPort = value;
      completer.complete();
    });

    client.isolate = await Isolate.spawn(
      _isolateMain,
      _IsolateInit(createClient, client.globalReceivePort.sendPort, params),
    );

    await completer.future;

    print("spawned client!");

    return client;
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
      OperationRequest<TData, TVars> request,
      [NextTypedLink<TData, TVars>? forward]) {
    final receivePort = ReceivePort();

    globalSendPort.send(_IsolateRequest(request, receivePort.sendPort));

    return receivePort.map<OperationResponse<TData, TVars>>((o) {
      final OperationResponse response = o;
      return OperationResponse<TData, TVars>(
        operationRequest: request,
        linkException: response.linkException,
        graphqlErrors: response.graphqlErrors,
        dataSource: response.dataSource,
        extensions: response.extensions,
        data: response.data as TData,
      );
    }).doOnCancel(receivePort.close);
  }

  Future<TData?> readQuery<TData extends Object, TVars>(
      OperationRequest<TData, TVars> request,
      {bool optimistic = true}) {
    final receivePort = ReceivePort();
    globalSendPort.send(_ReadQueryRequest(request, receivePort.sendPort,
        optimistic: optimistic));
    return receivePort.first.then((value) {
      receivePort.close();
      return value as TData?;
    });
  }

  Future<void> writeQuery<TData extends Object, TVars>(
    OperationRequest<TData, TVars> request,
    OperationResponse<TData, TVars> response, {
    OperationRequest<TData, TVars>? optimisticRequest,
  }) {
    final receivePort = ReceivePort();
    globalSendPort.send(_WriteQueryRequest(
        request, response, receivePort.sendPort,
        optimisticRequest: optimisticRequest));
    return receivePort.first.then((value) {
      receivePort.close();
      return null;
    });
  }

  Future<void> clearCache() {
    final receivePort = ReceivePort();
    globalSendPort.send(_ClearCacheRequest(receivePort.sendPort));
    return receivePort.first.then((value) {
      receivePort.close();
      return null;
    });
  }

  @override
  Future<void> dispose() async {
    globalSendPort.send(_KillRequest());
    await globalReceivePort.first;
    globalReceivePort.close();
    isolate.kill();
    return super.dispose();
  }
}

class _IsolateInit {
  final InitClient initClient;
  final SendPort sendPort;
  final Map<String, dynamic>? params;

  _IsolateInit(this.initClient, this.sendPort, this.params);
}

class _IsolateRequest<TData, TVars> {
  final OperationRequest<TData, TVars> request;
  final SendPort sendPort;

  _IsolateRequest(this.request, this.sendPort);
}

class _ReadQueryRequest<TData extends Object, TVars> {
  final OperationRequest<TData, TVars> request;
  final bool optimistic;
  final SendPort sendPort;

  _ReadQueryRequest(this.request, this.sendPort, {this.optimistic = true});
}

class _WriteQueryRequest<TData extends Object, TVars> {
  final OperationRequest<TData, TVars> request;
  final OperationResponse<TData, TVars> response;
  final OperationRequest<TData, TVars>? optimisticRequest;
  final SendPort sendPort;

  _WriteQueryRequest(this.request, this.response, this.sendPort,
      {this.optimisticRequest});
}

class _KillRequest {}

class _ClearCacheRequest {
  final SendPort sendPort;

  _ClearCacheRequest(this.sendPort);
}

void _isolateMain(_IsolateInit init) async {
  final client = await init.initClient(params: init.params ?? {});

  final sendPort = init.sendPort;

  final mainToIsolateStream = ReceivePort();

  sendPort.send(mainToIsolateStream.sendPort);

  Future<void> dispose() async {
    await client.dispose();
    sendPort.send(null);
    mainToIsolateStream.close();
  }

  mainToIsolateStream.listen((message) {
    if (message is _KillRequest) {
      dispose();
      return;
    }
    if (message is _ReadQueryRequest) {
      message.sendPort.send(client.cache.readQuery(message.request));
      return;
    }
    if (message is _ClearCacheRequest) {
      client.cache.clear();
      sendPort.send(null);
      return;
    }
    if (message is _WriteQueryRequest) {
      client.cache.writeQuery(message.request, message.response,
          optimisticRequest: message.optimisticRequest);
      message.sendPort.send(null);
      return;
    }

    print("got message $message!");

    final request = message as _IsolateRequest;

    client.request(request.request).listen((event) {
      print("send $event");
      request.sendPort.send(event);
    });
  });
}
