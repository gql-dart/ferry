import 'dart:async';
import 'dart:isolate';
import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/handle_command.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';
import 'package:rxdart/rxdart.dart';

/// a top-level or static function,
/// which asynchronously creates a ferry client, given a map of params
/// the messageMainPort can be used to send arbitrary messages from the isolate to main
/// from example for token refresh. You can also create a ReceivePort here and send
/// its sendPort to the messageHandler for establishing a two-way communication.
/// if you don't pass a messageHandler, the sendMessageToMessageHandler will be null.
typedef InitClient = Future<TypedLinkWithCache> Function(
  Map<String, dynamic> params,
  SendPort? sendMessageToMessageHandler,
);

typedef IsolateSpawn = Future<void> Function(
  void Function(_IsolateInit),
  _IsolateInit initParams,
);

/// A [TypedLink} that executes requests of a [Client] in
/// another isolate to avoid jank on heavy requests
class IsolateClient extends TypedLink {
  final InitClient createClient;

  late final ReceivePort _globalReceivePort;

  late final SendPort _commandSendPort;

  IsolateClient._({required this.createClient, Map<String, dynamic>? params});

  /// Create a new [IsolateClient]. The IsolateClient will spawn a new Isolate,
  /// and create a standard [Client] on this Isolate given the passed [InitClient]
  /// function.
  /// initClient must a static or top-level function in order to be send over the isolate.
  /// if the initClient function needs params (e.g. a path for the HiveBox,
  /// since you cannot call path_provider on to other isolate without jumping through hoops),
  /// you can pass these params here.
  /// Note that the Map must only contain types that can be sent over Isolates.
  /// The optional isolateSpawn parameter allows you to customize how the isolate is spawned.
  /// For example, you can use FlutterIsolate.spawn from package flutter_isolate in order
  /// to use platform channels on the ferry isolate.
  /// example:
  /// ```dart
  ///    IsolateClient.create(createClientFunction,
  ///            params: {"apiUrl": "https://my.api.com"},
  ///            messageHandler: (Object? message) => print(message),
  ///            isolateSpawn: (entryPoint, params) => FlutterIsolate.spawn(entryPoint, params),
  ///    );
  ///```
  /// If isolateSpawn is omitted, the default implementation of from dart:isolate Isolate.spawn
  /// is used.
  static Future<IsolateClient> create(InitClient initClient,
      {Map<String, dynamic>? params,
      void Function(Object?)? messageHandler,
      IsolateSpawn? isolateSpawn}) async {
    isolateSpawn ??= ((entryPoint, params) =>
        Isolate.spawn(entryPoint, params, debugName: 'package:ferry/ferry.dart:IsolateClient'));

    final client = IsolateClient._(createClient: initClient, params: params);

    client._globalReceivePort = ReceivePort('package:ferry/ferry_isolate.dart:main');

    final ReceivePort? messageHandlerReceivePort;

    // setup custom messages from isolate -> main if necessary
    if (messageHandler != null) {
      messageHandlerReceivePort = ReceivePort('package:ferry/ferry_isolate.dart:messageHandler');
      messageHandlerReceivePort.listen(messageHandler);
    } else {
      messageHandlerReceivePort = null;
    }

    final completer = Completer();

    // the first message
    unawaited(client._globalReceivePort.first.then((value) {
      assert(value is SendPort, 'internal error: the first message sent must be the SendPort');
      client._commandSendPort = value;
      completer.complete();
    }));

    unawaited(isolateSpawn(
        _isolateClientEntryPoint,
        _IsolateInit(
          initClient,
          client._globalReceivePort.sendPort,
          messageHandlerReceivePort?.sendPort,
          params,
        )));

    await completer.future;

    return client;
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
      OperationRequest<TData, TVars> request,
      [NextTypedLink<TData, TVars>? forward]) {
    final receivePort = ReceivePort();

    _commandSendPort.send(RequestCommand(
      receivePort.sendPort,
      request,
    ));

    SendPort? cancelPort;

    return receivePort.doOnCancel(() => cancelPort?.send(null)).transform(
          StreamTransformer.fromHandlers(
              handleData: (o, sink) {
                if (o is SendPort) {
                  cancelPort = o;
                } else if (o is IsolateClientException) {
                  sink.addError(
                      o,
                      o.originalStackTrace);
                } else if (o == "done") {
                  sink.close();
                } else {
                  final OperationResponse response = o;
                  sink.add(OperationResponse<TData, TVars>(
                    operationRequest: request,
                    linkException: response.linkException,
                    graphqlErrors: response.graphqlErrors,
                    dataSource: response.dataSource,
                    extensions: response.extensions,
                    data: response.data as TData?,
                  ));
                }
              },
              handleError: (err, stack, sink) => sink.addError(err, stack),
              handleDone: (sink) => sink.close()),
        );
  }

  /// read the given query from the cache. returns null if the result of the
  /// query is not cached
  Future<TData?> readQuery<TData extends Object, TVars>(OperationRequest<TData, TVars> request,
      {bool optimistic = true}) {
    return _handleSingleResponseCommand(
        (sendPort) => ReadQueryCommand(sendPort, request, optimistic: optimistic));
  }

  Future<void> writeQuery<TData extends Object, TVars>(
    OperationRequest<TData, TVars> request,
    TData response, {
    OperationRequest<TData, TVars>? optimisticRequest,
  }) {
    return _handleSingleResponseCommand(
        (sendPort) => WriteQueryCommand(sendPort, request, response, optimisticRequest));
  }

  Future<void> clearCache() {
    return _handleSingleResponseCommand((sendPort) => ClearCacheCommand(sendPort));
  }

  /// run garbage collection on the cache
  Future<Set<String>> gcCache() {
    return _handleSingleResponseCommand((sendPort) => GcCommand(sendPort));
  }

  Future<void> evict(String dataID,
      {String? fieldName, Map<String, dynamic>? args, OperationRequest? optimisticRequest}) {
    return _handleSingleResponseCommand(
        (sendPort) => EvictDataIdCommand(sendPort, dataID, fieldName, args, optimisticRequest));
  }

  Future<TData?> readFragment<TData, TVars>(FragmentRequest<TData, TVars> request,
      {bool optimistic = true}) {
    return _handleSingleResponseCommand(
      (sendPort) => (ReadFragmentCommand(sendPort, request, optimistic: optimistic)),
    );
  }

  Future<void> writeFragment<TData, TVars>(FragmentRequest<TData, TVars> request, TData data,
      {OperationRequest<TData, TVars>? optimisticRequest}) {
    return _handleSingleResponseCommand(
      (sendPort) => WriteFragmentCommand(
        sendPort,
        request,
        data,
        optimisticRequest,
      ),
    );
  }

  @override
  Future<void> dispose() async {
    final receivePort = ReceivePort();
    _commandSendPort.send(DisposeCommand(receivePort.sendPort));
    await receivePort.first;
    receivePort.close();
    _globalReceivePort.close();
    return super.dispose();
  }

  // helper function for commands that only ever receive one message
  // to reduce boilerplate.
  Future<T> _handleSingleResponseCommand<T>(
      IsolateCommand Function(SendPort sendPort) commandBuilder) {
    final receivePort = ReceivePort();
    _commandSendPort.send(commandBuilder(receivePort.sendPort));
    return receivePort.first.then((value) {
      receivePort.close();
      if (value is IsolateClientException) {
        return Future.error(value);
      }
      return value as T;
    });
  }
}

// initialization message, send when creating the client
class _IsolateInit {
  final InitClient initClient;
  final SendPort mainSendPort;
  final SendPort? messageHandlerSendPort;
  final Map<String, dynamic>? params;

  _IsolateInit(this.initClient, this.mainSendPort, this.messageHandlerSendPort, this.params);
}

/// this is the entry point called by Isolate.spawn
void _isolateClientEntryPoint(_IsolateInit init) async {
  //get the sendPort for isolate -> main communication
  final sendPort = init.mainSendPort;
  // create a receivePort for main -> isolate communication
  final mainToIsolateStream = ReceivePort();

  // create the real ferry client given the passed [InitClient] function
  final client = await init.initClient(init.params ?? {}, init.messageHandlerSendPort);
  //send the sendPort to the main isolate
  sendPort.send(mainToIsolateStream.sendPort);

  mainToIsolateStream.listen((message) {
    assert(message is IsolateCommand, 'internal error: expected IsolateCommand, got $message');
    handleCommand(
      client,
      message as IsolateCommand,
      mainToIsolateStream,
    );
  });
}
