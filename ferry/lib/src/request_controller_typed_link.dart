import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

/// Allows multiple requests to be made by adding requests to the
/// [requestController].
///
/// To refetch an operation, simply add a new request of the same type and with
/// the same [OperationRequest.requestId].
///
/// To implement pagination, include an [OperationRequest.requestId] callback.
///
/// If [OperationRequest.executeOnListen] == `true`, the operation will be
/// immediately executed when the stream returned by [request] is first
/// listened to.
class RequestControllerTypedLink extends TypedLink {
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
    ValueConnectableStream<OperationResponse<TData, TVars>> prev;
    final subs = <StreamSubscription>[];

    final cancelSubs = () => subs
      ..forEach((sub) => sub.cancel())
      ..clear();

    return requestController.stream
        .whereType<OperationRequest<TData, TVars>>()
        .where((req) => request.requestId == req.requestId)
        // TODO
        // .doOnCancel(cancelSubs)
        .switchMap(
      (req) {
        StreamSubscription sub;
        Stream<OperationResponse<TData, TVars>> stream;
        if (req.updateResult == null) {
          stream = forward(req);
          cancelSubs();
        } else {
          stream = CombineLatestStream.combine2<OperationResponse<TData, TVars>,
              OperationResponse<TData, TVars>, OperationResponse<TData, TVars>>(
            prev ?? Stream.value(null),
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
          );
        }
        prev = stream.doOnCancel(() => sub.cancel()).publishValue();
        sub = prev.connect();
        subs.add(sub);
        return prev;
      },
    ).doOnListen(
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
