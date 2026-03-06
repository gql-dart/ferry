import "package:gql/ast.dart";

import "../schema/schema.dart";
import "names.dart";

enum GraphQLTypeKind {
  object,
  interface,
  union,
  enumType,
  inputObject,
  scalar,
  unknown,
}

class NamedTypeInfo {
  final TypeName name;
  final GraphQLTypeKind kind;

  const NamedTypeInfo({
    required this.name,
    required this.kind,
  });
}

GraphQLTypeKind typeKindFor(SchemaIndex schema, TypeName typeName) {
  final def = schema.lookupType(NameNode(value: typeName.value));
  return switch (def) {
    ObjectTypeDefinitionNode() => GraphQLTypeKind.object,
    InterfaceTypeDefinitionNode() => GraphQLTypeKind.interface,
    UnionTypeDefinitionNode() => GraphQLTypeKind.union,
    EnumTypeDefinitionNode() => GraphQLTypeKind.enumType,
    InputObjectTypeDefinitionNode() => GraphQLTypeKind.inputObject,
    ScalarTypeDefinitionNode() => GraphQLTypeKind.scalar,
    _ => GraphQLTypeKind.unknown,
  };
}
