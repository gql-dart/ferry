import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

class RequestControllerTypedLink extends TypedLink {
  /// A stream controller that handles all [OperationRequest]s.
  final StreamController<OperationRequest> requestController;

  RequestControllerTypedLink([
    StreamController<OperationRequest> controller,
  ]) : requestController = controller ?? StreamController.broadcast();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    request, [
    forward,
  ]) {
    var initial = true;
    var prev = BehaviorSubject<OperationResponse<TData, TVars>>.seeded(null);

    return requestController.stream
        .whereType<OperationRequest<TData, TVars>>()
        .where((req) => request.requestId == req.requestId)
        .switchMap(
          (req) => prev = req.updateResult == null
              ? forward(req).shareValue()
              : CombineLatestStream.combine2<
                  OperationResponse<TData, TVars>,
                  OperationResponse<TData, TVars>,
                  OperationResponse<TData, TVars>>(
                  prev,
                  forward(req),
                  (previous, response) => OperationResponse(
                    operationRequest: response.operationRequest,
                    data: response.operationRequest.updateResult(
                      previous?.data,
                      response.data,
                    ),
                    dataSource: response.dataSource,
                    linkException: response.linkException,
                    graphqlErrors: response.graphqlErrors,
                  ),
                ).shareValue(),
        )
        .doOnListen(
      () {
        if (initial && request.executeOnListen) {
          scheduleMicrotask(() => requestController.add(request));
        }
        initial = false;
      },
    );
  }

  @override
  Future<void> dispose() => requestController.close();
}
