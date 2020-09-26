import 'dart:async';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import 'package:normalize/utils.dart';

import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';
import 'package:ferry/src/responder.dart';

/// Adds `__typename` to each node of the operation.
class AddTypenameResponder extends Responder {
  const AddTypenameResponder();

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> req, [
    forward,
  ]) =>
      forward(_addTypename(req));

  OperationRequest<TData, TVars> _addTypename<TData, TVars>(
    OperationRequest<TData, TVars> request,
  ) =>
      (request as dynamic).rebuild(
        (b) => b
          ..operation = Operation(
            document: transform(
              request.operation.document,
              [AddTypenameVisitor()],
            ),
            operationName: request.operation.operationName,
          ),
      );
}
