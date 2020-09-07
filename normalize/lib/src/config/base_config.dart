import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src//utils/resolve_data_id.dart';
import 'package:normalize/src/policies/type_policy.dart';

abstract class BaseConfig {
  final Map<String, dynamic> Function(String dataId) read;
  final Map<String, dynamic> variables;
  final Map<String, TypePolicy> typePolicies;
  final String referenceKey;
  final Map<String, FragmentDefinitionNode> fragmentMap;
  final DataIdResolver dataIdFromObject;

  BaseConfig({
    @required this.read,
    @required this.variables,
    @required this.typePolicies,
    @required this.referenceKey,
    @required this.fragmentMap,
    @required this.dataIdFromObject,
  });
}
