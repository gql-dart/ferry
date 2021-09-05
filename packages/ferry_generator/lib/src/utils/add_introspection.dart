import 'package:gql/ast.dart';
import 'package:gql_code_builder/source.dart';

const typenameField = FieldDefinitionNode(
  name: NameNode(
    value: '__typename',
  ),
  type: NamedTypeNode(
    name: NameNode(
      value: 'String',
    ),
    isNonNull: true,
  ),
);

class AddTypenameField extends TransformingVisitor {
  @override
  ObjectTypeDefinitionNode visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      ObjectTypeDefinitionNode(
        name: node.name,
        description: node.description,
        directives: node.directives,
        fields: [
          typenameField,
          ...node.fields,
        ],
        interfaces: node.interfaces,
        span: node.span,
      );

  @override
  InterfaceTypeDefinitionNode visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      InterfaceTypeDefinitionNode(
        name: node.name,
        fields: [
          typenameField,
          ...node.fields,
        ],
        directives: node.directives,
        description: node.description,
        span: node.span,
      );

  @override
  FieldNode visitFieldNode(
    FieldNode node,
  ) {
    if (node.selectionSet == null) {
      return node;
    }

    final hasTypename = node.selectionSet!.selections
        .whereType<FieldNode>()
        .any((node) => node.name.value == '__typename');

    if (hasTypename) return node;

    return FieldNode(
      name: node.name,
      alias: node.alias,
      arguments: node.arguments,
      directives: node.directives,
      selectionSet: SelectionSetNode(
        selections: <SelectionNode>[
          FieldNode(
            name: NameNode(value: '__typename'),
          ),
          ...node.selectionSet!.selections,
        ],
      ),
    );
  }

  @override
  FragmentDefinitionNode visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  ) {
    final hasTypename = node.selectionSet.selections
        .whereType<FieldNode>()
        .any((node) => node.name.value == '__typename');

    if (hasTypename) return node;

    return FragmentDefinitionNode(
      name: node.name,
      typeCondition: node.typeCondition,
      directives: node.directives,
      selectionSet: SelectionSetNode(
        selections: <SelectionNode>[
          FieldNode(
            name: NameNode(value: '__typename'),
          ),
          ...node.selectionSet.selections,
        ],
      ),
    );
  }

  @override
  OperationDefinitionNode visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) {
    final hasTypename = node.selectionSet.selections
        .whereType<FieldNode>()
        .any((node) => node.name.value == '__typename');

    if (hasTypename) return node;

    return OperationDefinitionNode(
      type: node.type,
      name: node.name,
      variableDefinitions: node.variableDefinitions,
      directives: node.directives,
      selectionSet: SelectionSetNode(
        selections: <SelectionNode>[
          FieldNode(
            name: NameNode(value: '__typename'),
          ),
          ...node.selectionSet.selections,
        ],
      ),
    );
  }
}

DocumentNode _transform(DocumentNode doc) => transform(
      doc,
      [
        AddTypenameField(),
      ],
    );

SourceNode addTypenames(SourceNode source) => SourceNode(
      url: source.url,
      document: _transform(source.document),
      imports: source.imports.map(addTypenames).toSet(),
    );
