import 'dart:async';
import 'dart:isolate';
import 'package:ferry/ferry.dart';
import 'package:ferry/src/isolate/isolate_commands.dart';
import 'package:ferry/src/isolate/request_response_message.dart';
import 'package:rxdart/rxdart.dart';

/// a top-level or static function,
/// which asynchronously creates a ferry client, given a some params.
/// the messageMainPort can be used to send arbitrary messages from the isolate to main
/// from example for token refresh. You can also create a ReceivePort here and send
/// its sendPort to the messageHandler for establishing a two-way communication.
/// if you don't pass a messageHandler, the sendMessageToMessageHandler SendPort will be null.
typedef InitClient<InitParams> = Future<TypedLinkWithCacheAndRequestController>
    Function(
  InitParams params,
  SendPort? sendMessageToMessageHandler,
);

/// A [TypedLink} that executes requests of a [Client] in
/// another isolate to avoid jank on heavy requests
class IsolateClient extends TypedLink {
  late final ReceivePort _globalReceivePort;

  late final ReceivePort? _messageHandlerReceivePort;

  late final SendPort _commandSendPort;

  IsolateClient._();

  /// Create a new [IsolateClient]. The IsolateClient will spawn a new Isolate,
  /// and create a standard [Client] on this Isolate given the passed [InitClient]
  /// function.
  /// initClient must a static or top-level function in order to be send over the isolate.
  /// if the initClient function needs params (e.g. a path for the HiveBox,
  /// since you cannot call path_provider on to other isolate without jumping through hoops),
  /// you can pass these params here.
  /// Note that params must only contain types that can be sent over Isolates.
  /// This essentials means, only data that you could also serialize to JSON.
  /// Note: isolates are not supported on the web. On the web, please use the standard Client.
  static Future<IsolateClient> create<InitParams>(
      InitClient<InitParams> initClient,
      {required InitParams params,
      void Function(Object?)? messageHandler}) async {
    final client = IsolateClient._();

    client._globalReceivePort =
        ReceivePort('package:ferry/ferry_isolate.dart:main');

    // setup custom messages from isolate -> main if necessary
    if (messageHandler != null) {
      client._messageHandlerReceivePort =
          ReceivePort('package:ferry/ferry_isolate.dart:messageHandler');
      client._messageHandlerReceivePort!.listen(messageHandler);
    } else {
      client._messageHandlerReceivePort = null;
    }

    final completer = Completer();

    // the first message
    unawaited(client._globalReceivePort.first.then((value) {
      assert(value is SendPort,
          'internal error: the first message sent must be the SendPort');
      client._commandSendPort = value;
      completer.complete();
    }));

    unawaited(Isolate.spawn<_IsolateInit<InitParams>>(
        _isolateClientEntryPoint,
        _IsolateInit<InitParams>(
          initClient,
          client._globalReceivePort.sendPort,
          client._messageHandlerReceivePort?.sendPort,
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

    _commandSendPort.send(RequestCommand<TData, TVars>(
      receivePort.sendPort,
      request,
    ));

    SendPort? cancelPort;

    return receivePort.doOnCancel(() => cancelPort?.send(null)).transform(
          StreamTransformer.fromHandlers(
              handleData: (o, sink) {
                switch ((o as RequestResponse).type) {
                  case RequestResponseType.initial:
                    assert(cancelPort == null);
                    cancelPort = o.sendPort;
                    break;
                  case RequestResponseType.error:
                    sink.addError(o.exception!, o.stackTrace);
                    break;
                  case RequestResponseType.data:
                    final response = o.data!;

                    /// TODO:
                    /// consider adding the original response
                    /// instead of creating a new OperationResponse
                    /// cons: the identity of the request will change
                    /// and == on the request will not work anymore
                    /// (with stand gql: 0.14.0)
                    sink.add(OperationResponse<TData, TVars>(
                      operationRequest: request,
                      linkException: response.linkException,
                      graphqlErrors: response.graphqlErrors,
                      dataSource: response.dataSource,
                      extensions: response.extensions,
                      data: response.data as TData?,
                    ));
                    break;
                  case RequestResponseType.done:
                    sink.close();
                    break;
                }
              },
              handleError: (err, stack, sink) => sink.addError(err, stack),
              handleDone: (sink) => sink.close()),
        );
  }

  /// read the given query from the cache. returns null if the result of the
  /// query is not cached
  Future<TData?> readQuery<TData extends Object, TVars>(
      OperationRequest<TData, TVars> request,
      {bool optimistic = true}) {
    return _handleSingleResponseCommand((sendPort) =>
        ReadQueryCommand(sendPort, request, optimistic: optimistic));
  }

  Future<void> writeQuery<TData extends Object, TVars>(
    OperationRequest<TData, TVars> request,
    TData response, {
    OperationRequest<TData, TVars>? optimisticRequest,
  }) {
    return _handleSingleResponseCommand((sendPort) =>
        WriteQueryCommand(sendPort, request, response, optimisticRequest));
  }

  Future<void> clearCache() {
    return _handleSingleResponseCommand(
        (sendPort) => ClearCacheCommand(sendPort));
  }

  /// run garbage collection on the cache
  Future<Set<String>> gcCache() {
    return _handleSingleResponseCommand((sendPort) => GcCommand(sendPort));
  }

  Future<void> evict(String dataID,
      {String? fieldName,
      Map<String, dynamic>? args,
      OperationRequest? optimisticRequest}) {
    return _handleSingleResponseCommand((sendPort) => EvictDataIdCommand(
        sendPort, dataID, fieldName, args, optimisticRequest));
  }

  Future<TData?> readFragment<TData, TVars>(
      FragmentRequest<TData, TVars> request,
      {bool optimistic = true}) {
    return _handleSingleResponseCommand(
      (sendPort) =>
          (ReadFragmentCommand(sendPort, request, optimistic: optimistic)),
    );
  }

  Future<void> writeFragment<TData, TVars>(
      FragmentRequest<TData, TVars> request, TData data,
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

  Future<void> removeOptimisticPatch(OperationRequest request) {
    return _handleSingleResponseCommand(
        (sendPort) => RemoveOptimisticPatch(sendPort, request));
  }

  @override
  Future<void> dispose() async {
    final receivePort = ReceivePort();
    _commandSendPort.send(DisposeCommand(receivePort.sendPort));
    await receivePort.first;
    receivePort.close();
    _globalReceivePort.close();
    _messageHandlerReceivePort?.close();
    return super.dispose();
  }

  /// adds a request to the requestController of the client on the isolate
  /// this is useful for re-fetch and pagination
  /// see https://ferrygraphql.com/docs/pagination
  Future<void> addRequestToRequestController<TData, TVars>(
      OperationRequest<TData, TVars> request) {
    return _handleSingleResponseCommand(
        (sendPort) => AddRequestToRequestControllerCommand(sendPort, request));
  }

  // helper function for commands that only ever receive one message
  // to reduce boilerplate.
  Future<T> _handleSingleResponseCommand<T>(
      IsolateCommand Function(SendPort sendPort) commandBuilder) {
    final receivePort = ReceivePort();
    _commandSendPort.send(commandBuilder(receivePort.sendPort));
    return receivePort.first.then((value) {
      receivePort.close();
      if (value is RequestResponse && value.type == RequestResponseType.error) {
        return Future.error(value.exception!, value.stackTrace);
      }
      return value as T;
    });
  }
}

// initialization message, send when creating the client
class _IsolateInit<T> {
  final InitClient<T> initClient;
  final SendPort mainSendPort;
  final SendPort? messageHandlerSendPort;
  final T params;

  _IsolateInit(this.initClient, this.mainSendPort, this.messageHandlerSendPort,
      this.params);
}

/// this is the entry point called by Isolate.spawn
void _isolateClientEntryPoint<T>(_IsolateInit<T> init) async {
  //get the sendPort for isolate -> main communication
  final sendPort = init.mainSendPort;
  // create a receivePort for main -> isolate communication
  final mainToIsolateStream = ReceivePort();

  // create the real ferry client given the passed [InitClient] function
  final client = await init.initClient(
    init.params,
    init.messageHandlerSendPort,
  );
  //send the sendPort to the main isolate
  sendPort.send(mainToIsolateStream.sendPort);

  mainToIsolateStream.listen((message) {
    assert(message is IsolateCommand,
        'internal error: expected IsolateCommand, got $message');
    message as IsolateCommand;
    message.handle(client, mainToIsolateStream);
  });
}
