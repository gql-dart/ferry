import 'dart:async';

import 'package:ferry_exec/ferry_exec.dart';
import 'package:rxdart/rxdart.dart';

/// Allows multiple requests to be made by adding requests to the
/// [requestController].
///
/// To refetch an operation, simply add a new request of the same type and with
/// the same [OperationRequest.requestId].
///
/// To implement pagination, include an [OperationRequest.updateResult] callback.
///
/// If [OperationRequest.executeOnListen] == `true`, the operation will be
/// immediately executed when the stream returned by [request] is first
/// listened to.
class RequestControllerTypedLink extends TypedLink {
  late StreamController<OperationRequest> requestController;
  StreamController<OperationRequest>? _defaultRequestController;

  RequestControllerTypedLink([
    StreamController<OperationRequest>? controller,
  ]) {
    /// Set default request controller if none is provided
    requestController =
        controller ??= _defaultRequestController = StreamController.broadcast();
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    request, [
    forward,
  ]) {
    var initial = true;
    Stream<OperationResponse<TData, TVars>>? prev;
    Stream<OperationResponse<TData, TVars>>? current;

    return requestController.stream
        .whereType<OperationRequest<TData, TVars>>()
        .where(
          (req) => req.requestId == null
              ? identical(req, request)
              : req.requestId == request.requestId,
        )
        .doOnData((req) {
      if (req.updateResult == null) {
        prev = null;
      } else {
        prev = current;
      }
      current = forward!(req);
    }).switchMap((_) {
      if (prev == null) return current!;
      current = CombineLatestStream.combine2<OperationResponse<TData, TVars>?,
          OperationResponse<TData, TVars>, OperationResponse<TData, TVars>>(
        prev!,
        current!,
        (previous, response) => OperationResponse<TData, TVars>(
          operationRequest: response.operationRequest,
          data: response.operationRequest.updateResult!(
            previous?.data,
            response.data,
          ),
          dataSource: response.dataSource,
          linkException: response.linkException,
          graphqlErrors: response.graphqlErrors,
        ),
      ).shareValue();
      return current!;
    }).doOnListen(
      () {
        if (initial && request.executeOnListen) {
          scheduleMicrotask(() => requestController.add(request));
        }
        initial = false;
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _defaultRequestController?.close();
  }
}
