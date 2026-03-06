import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../utils/naming.dart";
import "../source/source.dart";

Library buildAstLibrary(DocumentSource source) {
  final definitions = source.document.definitions.map(
    (def) => declareConst(identifier(definitionName(def)))
        .assign(astFromNode(def))
        .statement,
  );

  final document = declareConst("document")
      .assign(
        refer(
          "DocumentNode",
          "package:gql/ast.dart",
        ).call(
          [],
          {
            "definitions": literalList(
              source.getRefs().map(
                    (ref) => Reference(
                      ref.symbol,
                      "${ref.url}#ast",
                    ),
                  ),
            ),
          },
        ),
      )
      .statement;

  return Library(
    (b) => b..body.addAll([...definitions, document]),
  );
}

Expression astFromNode(Node node) => node.accept(const _AstPrintVisitor());

Reference _ref(String node) => refer(node, "package:gql/ast.dart");

Expression _node(
  String node, [
  Map<String, Expression> namedArguments = const {},
]) =>
    _ref(node).call([], namedArguments);

class _AstPrintVisitor extends Visitor<Expression> {
  const _AstPrintVisitor();

  Expression _acceptOne(Node? node) =>
      node != null ? node.accept(this) : literalNull;

  List<Expression> _acceptMany(List<Node> nodes) =>
      nodes.map(_acceptOne).toList(growable: false);

  Expression _list(List<Node>? nodes) =>
      nodes != null ? literalList(_acceptMany(nodes)) : literalNull;

  @override
  Expression visitArgumentNode(ArgumentNode node) => _node(
        "ArgumentNode",
        {
          "name": _acceptOne(node.name),
          "value": _acceptOne(node.value),
        },
      );

  @override
  Expression visitBooleanValueNode(BooleanValueNode node) => _node(
        "BooleanValueNode",
        {
          "value": literalBool(node.value),
        },
      );

  @override
  Expression visitDefaultValueNode(DefaultValueNode node) => _node(
        "DefaultValueNode",
        {
          "value": _acceptOne(node.value),
        },
      );

  @override
  Expression visitDirectiveDefinitionNode(DirectiveDefinitionNode node) =>
      _node(
        "DirectiveDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "args": _list(node.args),
          "locations": literalList(
            node.locations.map(_directiveLocation),
          ),
          "repeatable": literalBool(node.repeatable),
        },
      );

  @override
  Expression visitDirectiveNode(DirectiveNode node) => _node(
        "DirectiveNode",
        {
          "name": _acceptOne(node.name),
          "arguments": _list(node.arguments),
        },
      );

  @override
  Expression visitDocumentNode(DocumentNode node) => _node(
        "DocumentNode",
        {
          "definitions": _list(node.definitions),
        },
      );

  @override
  Expression visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) => _node(
        "EnumTypeDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "values": _list(node.values),
        },
      );

  @override
  Expression visitEnumTypeExtensionNode(EnumTypeExtensionNode node) => _node(
        "EnumTypeExtensionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "values": _list(node.values),
        },
      );

  @override
  Expression visitEnumValueDefinitionNode(EnumValueDefinitionNode node) =>
      _node(
        "EnumValueDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
        },
      );

  @override
  Expression visitEnumValueNode(EnumValueNode node) => _node(
        "EnumValueNode",
        {
          "name": _acceptOne(node.name),
        },
      );

  @override
  Expression visitFieldDefinitionNode(FieldDefinitionNode node) => _node(
        "FieldDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "args": _list(node.args),
          "type": _acceptOne(node.type),
        },
      );

  @override
  Expression visitFieldNode(FieldNode node) => _node(
        "FieldNode",
        {
          "name": _acceptOne(node.name),
          "alias": _acceptOne(node.alias),
          "arguments": _list(node.arguments),
          "directives": _list(node.directives),
          "selectionSet": _acceptOne(node.selectionSet),
        },
      );

  @override
  Expression visitFloatValueNode(FloatValueNode node) => _node(
        "FloatValueNode",
        {
          "value": literalString(node.value),
        },
      );

  @override
  Expression visitFragmentDefinitionNode(FragmentDefinitionNode node) => _node(
        "FragmentDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "typeCondition": _acceptOne(node.typeCondition),
          "directives": _list(node.directives),
          "selectionSet": _acceptOne(node.selectionSet),
        },
      );

  @override
  Expression visitFragmentSpreadNode(FragmentSpreadNode node) => _node(
        "FragmentSpreadNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
        },
      );

  @override
  Expression visitInlineFragmentNode(InlineFragmentNode node) => _node(
        "InlineFragmentNode",
        {
          "typeCondition": _acceptOne(node.typeCondition),
          "directives": _list(node.directives),
          "selectionSet": _acceptOne(node.selectionSet),
        },
      );

  @override
  Expression visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      _node(
        "InputObjectTypeDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  ) =>
      _node(
        "InputObjectTypeExtensionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitInputValueDefinitionNode(InputValueDefinitionNode node) =>
      _node(
        "InputValueDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "type": _acceptOne(node.type),
          "defaultValue": _acceptOne(node.defaultValue),
        },
      );

  @override
  Expression visitIntValueNode(IntValueNode node) => _node(
        "IntValueNode",
        {
          "value": literalString(node.value),
        },
      );

  @override
  Expression visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      _node(
        "InterfaceTypeDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "interfaces": _list(node.interfaces),
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) =>
      _node(
        "InterfaceTypeExtensionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "interfaces": _list(node.interfaces),
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitListTypeNode(ListTypeNode node) => _node(
        "ListTypeNode",
        {
          "type": _acceptOne(node.type),
          "isNonNull": literalBool(node.isNonNull),
        },
      );

  @override
  Expression visitListValueNode(ListValueNode node) => _node(
        "ListValueNode",
        {
          "values": _list(node.values),
        },
      );

  @override
  Expression visitNameNode(NameNode node) => _node(
        "NameNode",
        {
          "value": literalString(node.value),
        },
      );

  @override
  Expression visitNamedTypeNode(NamedTypeNode node) => _node(
        "NamedTypeNode",
        {
          "name": _acceptOne(node.name),
          "isNonNull": literalBool(node.isNonNull),
        },
      );

  @override
  Expression visitNullValueNode(NullValueNode node) => _node("NullValueNode");

  @override
  Expression visitObjectFieldNode(ObjectFieldNode node) => _node(
        "ObjectFieldNode",
        {
          "name": _acceptOne(node.name),
          "value": _acceptOne(node.value),
        },
      );

  @override
  Expression visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      _node(
        "ObjectTypeDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "interfaces": _list(node.interfaces),
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) =>
      _node(
        "ObjectTypeExtensionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "interfaces": _list(node.interfaces),
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitObjectValueNode(ObjectValueNode node) => _node(
        "ObjectValueNode",
        {
          "fields": _list(node.fields),
        },
      );

  @override
  Expression visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) =>
      _node(
        "OperationDefinitionNode",
        {
          "type": _opType(node.type),
          "name": _acceptOne(node.name),
          "variableDefinitions": _list(node.variableDefinitions),
          "directives": _list(node.directives),
          "selectionSet": _acceptOne(node.selectionSet),
        },
      );

  @override
  Expression visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  ) =>
      _node(
        "OperationTypeDefinitionNode",
        {
          "operation": _opType(node.operation),
          "type": _acceptOne(node.type),
        },
      );

  @override
  Expression visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      _node(
        "ScalarTypeDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
        },
      );

  @override
  Expression visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  ) =>
      _node(
        "ScalarTypeExtensionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
        },
      );

  @override
  Expression visitSchemaDefinitionNode(SchemaDefinitionNode node) => _node(
        "SchemaDefinitionNode",
        {
          "directives": _list(node.directives),
          "operationTypes": _list(node.operationTypes),
        },
      );

  @override
  Expression visitSchemaExtensionNode(SchemaExtensionNode node) => _node(
        "SchemaExtensionNode",
        {
          "directives": _list(node.directives),
          "operationTypes": _list(node.operationTypes),
        },
      );

  @override
  Expression visitSelectionSetNode(SelectionSetNode node) => _node(
        "SelectionSetNode",
        {
          "selections": _list(node.selections),
        },
      );

  @override
  Expression visitStringValueNode(StringValueNode node) => _node(
        "StringValueNode",
        {
          "value": literalString(node.value),
          "isBlock": literalBool(node.isBlock),
        },
      );

  @override
  Expression visitTypeConditionNode(TypeConditionNode node) => _node(
        "TypeConditionNode",
        {
          "on": _acceptOne(node.on),
        },
      );

  @override
  Expression visitUnionTypeDefinitionNode(UnionTypeDefinitionNode node) =>
      _node(
        "UnionTypeDefinitionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "types": _list(node.types),
        },
      );

  @override
  Expression visitUnionTypeExtensionNode(UnionTypeExtensionNode node) => _node(
        "UnionTypeExtensionNode",
        {
          "name": _acceptOne(node.name),
          "directives": _list(node.directives),
          "types": _list(node.types),
        },
      );

  @override
  Expression visitVariableDefinitionNode(VariableDefinitionNode node) => _node(
        "VariableDefinitionNode",
        {
          "variable": _acceptOne(node.variable),
          "type": _acceptOne(node.type),
          "defaultValue": _acceptOne(node.defaultValue),
          "directives": _list(node.directives),
        },
      );

  @override
  Expression visitVariableNode(VariableNode node) => _node(
        "VariableNode",
        {
          "name": _acceptOne(node.name),
        },
      );
}

Expression _opType(OperationType type) {
  switch (type) {
    case OperationType.query:
      return _ref("OperationType.query");
    case OperationType.mutation:
      return _ref("OperationType.mutation");
    case OperationType.subscription:
      return _ref("OperationType.subscription");
  }
}

Expression _directiveLocation(DirectiveLocation location) {
  switch (location) {
    case DirectiveLocation.query:
      return _ref("DirectiveLocation.query");
    case DirectiveLocation.mutation:
      return _ref("DirectiveLocation.mutation");
    case DirectiveLocation.subscription:
      return _ref("DirectiveLocation.subscription");
    case DirectiveLocation.field:
      return _ref("DirectiveLocation.field");
    case DirectiveLocation.fragmentDefinition:
      return _ref("DirectiveLocation.fragmentDefinition");
    case DirectiveLocation.fragmentSpread:
      return _ref("DirectiveLocation.fragmentSpread");
    case DirectiveLocation.inlineFragment:
      return _ref("DirectiveLocation.inlineFragment");
    case DirectiveLocation.variableDefinition:
      return _ref("DirectiveLocation.variableDefinition");
    case DirectiveLocation.schema:
      return _ref("DirectiveLocation.schema");
    case DirectiveLocation.scalar:
      return _ref("DirectiveLocation.scalar");
    case DirectiveLocation.object:
      return _ref("DirectiveLocation.object");
    case DirectiveLocation.fieldDefinition:
      return _ref("DirectiveLocation.fieldDefinition");
    case DirectiveLocation.argumentDefinition:
      return _ref("DirectiveLocation.argumentDefinition");
    case DirectiveLocation.interface:
      return _ref("DirectiveLocation.interface");
    case DirectiveLocation.union:
      return _ref("DirectiveLocation.union");
    case DirectiveLocation.enumDefinition:
      return _ref("DirectiveLocation.enumDefinition");
    case DirectiveLocation.enumValue:
      return _ref("DirectiveLocation.enumValue");
    case DirectiveLocation.inputObject:
      return _ref("DirectiveLocation.inputObject");
    case DirectiveLocation.inputFieldDefinition:
      return _ref("DirectiveLocation.inputFieldDefinition");
  }
}
