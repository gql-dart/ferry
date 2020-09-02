import 'dart:async';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql/ast.dart';
import 'package:normalize/normalize.dart';

import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/plugins/plugin.dart';

/// Adds `__typename` to each node of the operation.
class AddTypenamePlugin extends Plugin {
  @override
  StreamTransformer<OperationRequest<TData, TVars>,
          OperationRequest<TData, TVars>>
      buildRequestTransformer<TData, TVars>() =>
          StreamTransformer.fromBind((stream) => stream.map(_addTypename));

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
