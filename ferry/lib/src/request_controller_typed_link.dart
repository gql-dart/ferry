import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

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
        .doOnDone(cancelSubs)
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
        prev = stream.doOnDone(() => sub.cancel()).publishValue();
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
