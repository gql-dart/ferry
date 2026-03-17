import "package:gql/ast.dart";

NamedTypeNode? unwrapNamedType(TypeNode node) {
  if (node is NamedTypeNode) return node;
  if (node is ListTypeNode) return unwrapNamedType(node.type);
  return null;
}

String? unwrapNamedTypeName(TypeNode node) => unwrapNamedType(node)?.name.value;

bool isListType(TypeNode node) => node is ListTypeNode;

bool isNonNullType(TypeNode node) => node.isNonNull;

TypeNode makeTypeNodeNullable(TypeNode node) {
  if (node is NamedTypeNode) {
    return NamedTypeNode(isNonNull: false, name: node.name);
  }
  if (node is ListTypeNode) {
    return ListTypeNode(isNonNull: false, type: node.type);
  }
  throw UnsupportedError("Unsupported type node");
}
