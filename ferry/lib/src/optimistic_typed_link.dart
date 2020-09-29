import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ferry_exec/ferry_exec.dart';

/// Creates a response stream, starting with an optimistic [OperationResponse]
/// if a [OperationRequest.optimisticResponse] is provided.
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
