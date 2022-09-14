import 'dart:async';
import 'dart:isolate';
import 'package:async/async.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/handle_command.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';
import 'package:rxdart/rxdart.dart';

/// a function that asynchronously creates a ferry client, given a map of params
typedef InitClient = Future<Client> Function({Map<String, dynamic> params});

/// A [TypedLink} that executes requests of a [Client] in
/// another isolate to avoid jank on heavy requests
class IsolateClient extends TypedLink {
  final InitClient createClient;

  late final ReceivePort _globalReceivePort;

  late final SendPort _globalSendPort;

  IsolateClient._({required this.createClient, Map<String, dynamic>? params});

  /// Create a new [IsolateClient]. The IsolateClient will spawn a new Isolate,
  /// and create a standard [Client] on this Isolate given the passed [InitClient]
  /// function.
  /// initClient must a static or top-level function in order to be send over the isolate.
  /// if the initClient function needs params (e.g. a path for the HiveBox,
  /// since you cannot call path_provider on to other isolate without jumping through hoops),
  /// you can pass these params here.
  /// Note that the Map must only contain types that can be sent over Isolates.
  static Future<IsolateClient> spawn(InitClient initClient,
      {Map<String, dynamic>? params}) async {
    final client = IsolateClient._(createClient: initClient, params: params);

    client._globalReceivePort = ReceivePort('package:ferry/ferry_isolate.dart');

    final completer = Completer();

    unawaited(client._globalReceivePort.first.then((value) {
      assert(value is SendPort);
      client._globalSendPort = value;
      completer.complete();
    }));

    await Isolate.spawn(_isolateMain,
        _IsolateInit(initClient, client._globalReceivePort.sendPort, params),
        debugName:
            params?['debugName'] ?? 'package:ferry/ferry.dart:IsolateClient');

    await completer.future;

    return client;
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
      OperationRequest<TData, TVars> request,
      [NextTypedLink<TData, TVars>? forward]) {
    final receivePort = ReceivePort();

    _globalSendPort.send(RequestCommand(
      receivePort.sendPort,
      request,
    ));

    late final SendPort cancelPort;

    final queue = StreamQueue(receivePort);

    queue.next.then((value) {
      assert(value is SendPort);
      cancelPort = value;
    });

    return queue.rest.map<OperationResponse<TData, TVars>>((o) {
      final OperationResponse response = o;
      return OperationResponse<TData, TVars>(
        operationRequest: request,
        linkException: response.linkException,
        graphqlErrors: response.graphqlErrors,
        dataSource: response.dataSource,
        extensions: response.extensions,
        data: response.data as TData,
      );
    }).doOnCancel(() {
      cancelPort.send(null);
    });
  }

  /// read the given query from the cache. returns null if the result of the
  /// query is not cached
  Future<TData?> readQuery<TData extends Object, TVars>(
      OperationRequest<TData, TVars> request,
      {bool optimistic = true}) {
    final receivePort = ReceivePort();
    _globalSendPort.send(ReadQueryCommand(receivePort.sendPort, request,
        optimistic: optimistic));
    return receivePort.first.then((value) {
      receivePort.close();
      return value as TData?;
    });
  }

  Future<void> writeQuery<TData extends Object, TVars>(
    OperationRequest<TData, TVars> request,
    TData response, {
    OperationRequest<TData, TVars>? optimisticRequest,
  }) {
    final receivePort = ReceivePort();
    _globalSendPort.send(WriteQueryCommand(
        receivePort.sendPort, request, response, optimisticRequest));
    return receivePort.first.then((value) {
      receivePort.close();
      return null;
    });
  }

  Future<void> clearCache() {
    final receivePort = ReceivePort();
    _globalSendPort.send(ClearCacheCommand(receivePort.sendPort));
    return receivePort.first.then((value) {
      receivePort.close();
      return null;
    });
  }

  @override
  Future<void> dispose() async {
    final receivePort = ReceivePort();
    _globalSendPort.send(DisposeCommand(receivePort.sendPort));
    await _globalReceivePort.first;
    _globalReceivePort.close();
    return super.dispose();
  }
}

class _IsolateInit {
  final InitClient initClient;
  final SendPort sendPort;
  final Map<String, dynamic>? params;

  _IsolateInit(this.initClient, this.sendPort, this.params);
}

void _isolateMain(_IsolateInit init) async {
  final client = await init.initClient(params: init.params ?? {});

  final sendPort = init.sendPort;

  final mainToIsolateStream = ReceivePort();

  sendPort.send(mainToIsolateStream.sendPort);

  mainToIsolateStream.listen((message) {
    handleCommand(client, message as IsolateCommand, mainToIsolateStream);
  });
}
