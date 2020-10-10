import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

/// Returns the response stream from the next link in the chain, immediately
/// emitting a response with the optimistic data.
class OptimisticTypedLink extends TypedLink {
  const OptimisticTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    forward,
  ]) =>
      request.optimisticResponse == null
          ? forward(request)
          : forward(request).startWith(
              OperationResponse(
                operationRequest: request,
                data: request.optimisticResponse,
                dataSource: DataSource.Optimistic,
              ),
            );
}
