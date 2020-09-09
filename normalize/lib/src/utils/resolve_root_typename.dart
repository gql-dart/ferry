import 'package:gql/ast.dart';
import '../policies/type_policy.dart';

final defaultRootTypenames = {
  OperationType.query: 'Query',
  OperationType.mutation: 'Mutation',
  OperationType.subscription: 'Subscription',
};

String typenameForOperationType(
  OperationType operationType,
  Map<String, TypePolicy> typePolicies,
) {
  switch (operationType) {
    case OperationType.query:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.queryType,
                orElse: () => null,
              )
              ?.key ??
          defaultRootTypenames[OperationType.query];
    case OperationType.mutation:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.mutationType,
                orElse: () => null,
              )
              ?.key ??
          defaultRootTypenames[OperationType.mutation];
    case OperationType.subscription:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.subscriptionType,
                orElse: () => null,
              )
              ?.key ??
          defaultRootTypenames[OperationType.subscription];
  }
  return null;
}

String resolveRootTypename(
  OperationDefinitionNode operationDefinition,
  Map<String, TypePolicy> typePolicies,
) =>
    typenameForOperationType(
      operationDefinition.type,
      typePolicies,
    );
