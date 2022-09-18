import 'dart:isolate';

import 'package:ferry/ferry.dart';
import 'package:meta/meta.dart';

enum RequestResponseType { initial, data, error, done }

@internal
class RequestResponse {
  final RequestResponseType type;
  final OperationResponse? data;
  final SendPort? sendPort;
  final Object? exception;
  final StackTrace? stackTrace;

  factory RequestResponse.data(OperationResponse? data) {
    return RequestResponse._(type: RequestResponseType.data, data: data);
  }

  factory RequestResponse.error(Object? error, StackTrace? stack) {
    return RequestResponse._(
      type: RequestResponseType.error,
      exception: error,
      stackTrace: stack,
    );
  }

  factory RequestResponse.initialCancelSendPort(SendPort sendPort) {
    return RequestResponse._(
        type: RequestResponseType.initial, sendPort: sendPort);
  }

  factory RequestResponse.done() {
    return const RequestResponse._(type: RequestResponseType.done);
  }

  const RequestResponse._({
    required this.type,
    this.data,
    this.sendPort,
    this.exception,
    this.stackTrace,
  });
}
