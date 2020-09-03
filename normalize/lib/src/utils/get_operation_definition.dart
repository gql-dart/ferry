import 'package:gql/ast.dart';

/// Returns the AST Node for the GraphQL Operation.
OperationDefinitionNode getOperationDefinition(
  DocumentNode document,
  String operationName,
) =>
    operationName != null
        ? document.definitions.whereType<OperationDefinitionNode>().firstWhere(
              (definition) => definition.name.value == operationName,
              orElse: () => throw (Exception(
                  'Could not find operationName "$operationName"')),
            )
        : document.definitions.whereType<OperationDefinitionNode>().first;
