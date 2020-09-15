import 'package:gql/ast.dart';

Map<String, FragmentDefinitionNode> getFragmentMap(DocumentNode document) => {
      for (var fragmentDefinition
          in document.definitions.whereType<FragmentDefinitionNode>())
        fragmentDefinition.name.value: fragmentDefinition
    };
