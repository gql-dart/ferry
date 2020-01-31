import 'package:gql/ast.dart';

import '../client/query_request.dart';

OperationType operationType(QueryRequest request) =>
    request.operation.document.definitions
        .whereType<OperationDefinitionNode>()
        .firstWhere((operationNode) =>
            operationNode.name.value == request.operation.operationName)
        .type;
