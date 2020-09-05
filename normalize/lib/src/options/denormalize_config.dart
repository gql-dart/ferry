import 'package:gql/ast.dart';

import './type_policy.dart';

class DenormalizeConfig {
  final Map<String, dynamic> Function(String dataId) read;
  final Map<String, dynamic> variables;
  final Map<String, TypePolicy> typePolicies;
  final String referenceKey;
  final Map<String, FragmentDefinitionNode> fragmentMap;
  bool returnPartialData;

  DenormalizeConfig({
    this.read,
    this.variables,
    this.typePolicies,
    this.referenceKey,
    this.fragmentMap,
    this.returnPartialData,
  });
}
