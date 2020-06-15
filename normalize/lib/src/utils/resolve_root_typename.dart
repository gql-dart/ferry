import 'package:gql/ast.dart';
import '../options/type_policy.dart';

String resolveRootTypename(
  OperationDefinitionNode operationDefinition,
  Map<String, TypePolicy> typePolicies,
) {
  switch (operationDefinition.type) {
    case OperationType.query:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.queryType,
                orElse: () {},
              )
              ?.key ??
          'Query';
    case OperationType.mutation:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.mutationType,
                orElse: () {},
              )
              ?.key ??
          'Mutation';
    case OperationType.subscription:
      return typePolicies?.entries
              ?.firstWhere(
                (entry) => entry.value.subscriptionType,
                orElse: () {},
              )
              ?.key ??
          'Subscription';
  }
}
