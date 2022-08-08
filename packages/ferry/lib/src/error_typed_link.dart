import 'dart:async';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_link/gql_link.dart';

/// Catches [Exception]s in the link chain and converts them into data.
///
/// Emits the exception as the [OperationResponse.linkException] property.
///
/// [ErrorTypedLink] catches the following types of exceptions:
///
/// 1. Exceptions thrown when forwarding the TypedLink
/// 2. Stream.error events emitted by any downstream TypedLink
///
/// In order to ensure that [Exception]s are caught, [ErrorTypedLink] should be
/// placed at the very beginning of the [TypedLink] chain.
class ErrorTypedLink extends TypedLink {
  const ErrorTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) {
    try {
      return forward!(operationRequest).transform(
        StreamTransformer.fromHandlers(
          handleError: (error, stackTrace, sink) => sink.add(
            OperationResponse(
              operationRequest: operationRequest,
              linkException: error is LinkException
                  ? error
                  : TypedLinkException(error, stackTrace),
              dataSource: DataSource.None,
            ),
          ),
        ),
      );
    } catch (error, stackTrace) {
      return Stream.value(
        OperationResponse(
          operationRequest: operationRequest,
          linkException: error is LinkException
              ? error
              : TypedLinkException(error, stackTrace),
          dataSource: DataSource.None,
        ),
      );
    }
  }
}
