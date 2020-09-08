import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/resolve_data_id.dart';

class NormalizationConfig {
  final Map<String, dynamic> Function(String dataId) read;
  final Map<String, dynamic> variables;
  final Map<String, TypePolicy> typePolicies;
  final String referenceKey;
  final Map<String, FragmentDefinitionNode> fragmentMap;
  final DataIdResolver dataIdFromObject;
  final bool addTypename;

  NormalizationConfig({
    @required this.read,
    @required this.variables,
    @required this.typePolicies,
    @required this.referenceKey,
    @required this.fragmentMap,
    @required this.dataIdFromObject,
    @required this.addTypename,
  });
}
