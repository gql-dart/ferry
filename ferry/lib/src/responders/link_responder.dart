import 'dart:async';
import 'package:gql_link/gql_link.dart';

import 'package:ferry/src/responder.dart';
import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';

/// Fetches the operation from the [link], mapping the result to an
/// [OperationResponse].
class LinkResponder extends Responder {
  final Link link;

  const LinkResponder(this.link);

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) =>
      link.request(operationRequest.execRequest).transform(
            StreamTransformer.fromHandlers(
              handleData: (response, sink) => sink.add(
                OperationResponse(
                  operationRequest: operationRequest,
                  data: (response.data == null || response.data.isEmpty)
                      ? null
                      : operationRequest.parseData(response.data),
                  graphqlErrors: response.errors,
                  dataSource: DataSource.Link,
                ),
              ),
              handleError: (error, stackTrace, sink) => sink.add(
                OperationResponse(
                  operationRequest: operationRequest,
                  linkException: error is LinkException
                      ? error
                      : ServerException(
                          originalException: error,
                          parsedResponse: null,
                        ),
                  dataSource: DataSource.Link,
                ),
              ),
            ),
          );
}
