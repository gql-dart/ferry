import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/operation_request.dart';

import 'package:ferry/src/responder.dart';

class RequestControllerResponder extends Responder {
  /// A stream controller that handles all [OperationRequest]s.
  final StreamController<OperationRequest> requestController;

  RequestControllerResponder({
    StreamController<OperationRequest> controller,
  }) : requestController = controller ?? StreamController.broadcast();

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    request, [
    forward,
  ]) {
    var initial = true;

    return requestController.stream
        .whereType<OperationRequest<TData, TVars>>()
        .where((req) => request.requestId == req.requestId)

        /// TODO should we just use a startWith(request) here instead of the doOnListen?
        .switchMap(
          (req) => forward(req),
        )
        .doOnListen(
      () async {
        if (initial && request.executeOnListen) {
          await Future.delayed(Duration.zero);
          requestController.add(request);
        }
        initial = false;
      },
    );
  }

  @override
  Future<void> dispose() => requestController.close();
}
