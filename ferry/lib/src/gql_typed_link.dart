import 'dart:async';
import 'package:gql_link/gql_link.dart';
import 'package:ferry_exec/ferry_exec.dart';

export 'package:gql_link/gql_link.dart';

/// A terminating link which defers execution to the provided `gql_link`,
/// mapping the result to an [OperationResponse].
///
/// Any errors received by the `gql_link` are included in the
/// [OperationResponse.linkException].
class GqlTypedLink extends TypedLink {
  final Link link;

  const GqlTypedLink(this.link);

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
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
