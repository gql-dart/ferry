import 'package:gql/ast.dart';

import './type_policy.dart';
import '../utils/resolve_data_id.dart';

class NormalizeConfig {
  final void Function(String dataId, Map<String, dynamic> value) merge;
  final Map<String, dynamic> variables;
  final Map<String, TypePolicy> typePolicies;
  final String referenceKey;
  final Map<String, FragmentDefinitionNode> fragmentMap;
  final bool addTypename;
  final DataIdResolver dataIdFromObject;

  NormalizeConfig({
    this.merge,
    this.variables,
    this.typePolicies,
    this.referenceKey,
    this.fragmentMap,
    this.addTypename,
    this.dataIdFromObject,
  });
}
