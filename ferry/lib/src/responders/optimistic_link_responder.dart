import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ferry/src/responder.dart';
import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/cache.dart';
import 'package:ferry/src/responders/link_responder.dart';

/// Creates a response stream, starting with an optimistic [OperationResponse]
/// if a [OperationRequest.optimisticResponse] is provided, then removes the
/// optimistic patch from the cache once the network response is received.
class OptimisticLinkResponder extends Responder {
  final LinkResponder _linkResponder;
  final Cache cache;

  OptimisticLinkResponder(Link link, this.cache)
      : _linkResponder = LinkResponder(link);

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) =>
      operationRequest.optimisticResponse == null
          ? _linkResponder.responseStream(operationRequest)
          : _linkResponder
              .responseStream(operationRequest)
              .startWith(
                OperationResponse(
                  operationRequest: operationRequest,
                  data: operationRequest.optimisticResponse,
                  dataSource: DataSource.Optimistic,
                ),
              )
              .doOnData(
              (response) {
                if (response.dataSource != DataSource.Optimistic) {
                  cache.removeOptimisticPatch(
                    response.operationRequest.requestId,
                  );
                }
              },
            );
}
