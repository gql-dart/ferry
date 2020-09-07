import 'package:gql/ast.dart';
import '../policies/type_policy.dart';

String resolveRootTypename(
  OperationDefinitionNode operationDefinition,
  Map<String, TypePolicy> typePolicies,
) {
  switch (operationDefinition.type) {
    case OperationType.query:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.queryType,
                orElse: () => null,
              )
              ?.key ??
          'Query';
    case OperationType.mutation:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.mutationType,
                orElse: () => null,
              )
              ?.key ??
          'Mutation';
    case OperationType.subscription:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.subscriptionType,
                orElse: () => null,
              )
              ?.key ??
          'Subscription';
  }
  return null;
}
