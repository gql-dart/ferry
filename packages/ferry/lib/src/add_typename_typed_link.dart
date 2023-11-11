import 'dart:async';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import 'package:normalize/utils.dart';
import 'package:ferry_exec/ferry_exec.dart';

/// Adds `__typename` to each node of the operation.
class AddTypenameTypedLink extends TypedLink {
  const AddTypenameTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> req, [
    forward,
  ]) =>
      forward!(_addTypename(req));

  OperationRequest<TData, TVars> _addTypename<TData, TVars>(
    OperationRequest<TData, TVars> request,
  ) =>
      request.transformOperation(
        (op) => Operation(
          document: transform(
            op.document,
            [
              AddTypenameVisitor(),
            ],
          ),
          operationName: request.operation.operationName,
        ),
      );
}
