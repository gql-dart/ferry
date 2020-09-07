import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import 'package:normalize/src/policies/type_policy.dart';
import 'package:normalize/src/utils/resolve_data_id.dart';
import './base_config.dart';

class NormalizeConfig extends BaseConfig {
  final void Function(String dataId, Map<String, dynamic> value) write;
  final bool addTypename;

  NormalizeConfig({
    @required Map<String, dynamic> Function(String dataId) read,
    @required Map<String, dynamic> variables,
    @required Map<String, TypePolicy> typePolicies,
    @required String referenceKey,
    @required Map<String, FragmentDefinitionNode> fragmentMap,
    @required DataIdResolver dataIdFromObject,
    @required this.write,
    @required this.addTypename,
  }) : super(
          read: read,
          variables: variables,
          typePolicies: typePolicies,
          referenceKey: referenceKey,
          fragmentMap: fragmentMap,
          dataIdFromObject: dataIdFromObject,
        );
}
