import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../config/builder_config.dart";
import "data_emitter_context.dart";
import "data_emitter_fields.dart";
import "data_emitter_types.dart";
import "../ir/types.dart";

Expression fromJsonExpression({
  required DataEmitterContext ctx,
  required FieldSpec field,
}) {
  final accessExpr = refer("json").index(literalString(field.responseKey));
  return _fromJsonForTypeNode(
    ctx: ctx,
    field: field,
    node: field.typeNode,
    valueExpr: accessExpr,
  );
}

Expression _fromJsonForTypeNode({
  required DataEmitterContext ctx,
  required FieldSpec field,
  required TypeNode node,
  required Expression valueExpr,
}) {
  if (node is ListTypeNode) {
    if (node.type is NamedTypeNode) {
      final innerNode = node.type as NamedTypeNode;
      final typeName = innerNode.name.value;
      final override = ctx.config.typeOverrides[typeName];
      if (canUseListFrom(
        ctx: ctx,
        typeName: typeName,
        namedType: field.namedType,
        override: override,
      )) {
        final scalarRef = scalarReference(ctx: ctx, typeName: typeName);
        final innerTypeRef = typeReferenceWithNullability(
          scalarRef,
          isNullable: !innerNode.isNonNull,
        );
        final listTypeRef = TypeReference(
          (b) => b
            ..symbol = "List"
            ..types.add(innerTypeRef),
        );
        final castExpr = valueExpr.asA(listDynamicType());
        final fromExpr = listTypeRef.property("from").call([castExpr]);
        final wrapped = _wrapListIfNeeded(
          ctx: ctx,
          node: node,
          field: field,
          innerExpr: fromExpr,
        );
        if (node.isNonNull) {
          return wrapped;
        }
        return nullGuard(valueExpr, wrapped);
      }
    }
    final innerExpr = _fromJsonForTypeNode(
      ctx: ctx,
      field: field,
      node: node.type,
      valueExpr: refer(r"_$e"),
    );
    final castExpr = valueExpr.asA(listDynamicType());
    final mapped = castExpr
        .property("map")
        .call([
          Method(
            (b) => b
              ..requiredParameters.add(
                Parameter((b) => b..name = r"_$e"),
              )
              ..lambda = true
              ..body = innerExpr.code,
          ).closure,
        ])
        .property("toList")
        .call([]);
    final wrapped = _wrapListIfNeeded(
      ctx: ctx,
      node: node,
      field: field,
      innerExpr: mapped,
    );
    if (node.isNonNull) {
      return wrapped;
    }
    return nullGuard(valueExpr, wrapped);
  }
  if (node is NamedTypeNode) {
    final typeName = node.name.value;
    final override = ctx.config.typeOverrides[typeName];
    final inner = _fromJsonForNamedType(
      ctx: ctx,
      typeName: typeName,
      namedType: field.namedType,
      override: override,
      field: field,
      valueExpr: valueExpr,
    );
    if (node.isNonNull) {
      return inner;
    }
    return nullGuard(valueExpr, inner);
  }
  throw StateError("Invalid type node");
}

Expression _fromJsonForNamedType({
  required DataEmitterContext ctx,
  required String typeName,
  required NamedTypeInfo namedType,
  required TypeOverrideConfig? override,
  required FieldSpec field,
  required Expression valueExpr,
}) {
  if (override?.fromJsonFunctionName != null) {
    return refer(override!.fromJsonFunctionName!).call([valueExpr]);
  }
  if (namedType.kind == GraphQLTypeKind.enumType) {
    return field.namedTypeRef.property("fromJson").call([
      valueExpr.asA(refer("String")),
    ]);
  }
  if (namedType.kind == GraphQLTypeKind.object ||
      namedType.kind == GraphQLTypeKind.interface ||
      namedType.kind == GraphQLTypeKind.union ||
      namedType.kind == GraphQLTypeKind.inputObject) {
    return field.namedTypeRef.property("fromJson").call([
      valueExpr.asA(mapStringDynamicType()),
    ]);
  }

  final scalarType = scalarReference(ctx: ctx, typeName: typeName);
  final castExpr = valueExpr.asA(scalarType);
  return ctx.collections.wrapMap(
    typeName: typeName,
    innerExpr: castExpr,
  );
}

Expression _wrapListIfNeeded({
  required DataEmitterContext ctx,
  required TypeNode node,
  required FieldSpec field,
  required Expression innerExpr,
}) {
  final listTypeRef = typeReferenceForTypeNode(node, field.namedTypeRef);
  final nonNullListRef = typeReferenceWithNullability(
    listTypeRef,
    isNullable: false,
  );
  return ctx.collections.wrapList(
    listTypeRef: nonNullListRef,
    innerExpr: innerExpr,
  );
}

Expression toJsonExpression({
  required DataEmitterContext ctx,
  required FieldSpec field,
  Expression? valueExpr,
}) {
  final targetExpr = valueExpr ?? refer(field.propertyName);
  return _toJsonForTypeNode(
    ctx: ctx,
    field: field,
    node: field.typeNode,
    valueExpr: targetExpr,
  );
}

Expression _toJsonForTypeNode({
  required DataEmitterContext ctx,
  required FieldSpec field,
  required TypeNode node,
  required Expression valueExpr,
}) {
  if (node is ListTypeNode) {
    final innerExpr = _toJsonForTypeNode(
      ctx: ctx,
      field: field,
      node: node.type,
      valueExpr: refer(r"_$e"),
    );
    final mapped = valueExpr
        .property("map")
        .call([
          Method(
            (b) => b
              ..requiredParameters.add(
                Parameter((b) => b..name = r"_$e"),
              )
              ..lambda = true
              ..body = innerExpr.code,
          ).closure,
        ])
        .property("toList")
        .call([]);
    if (node.isNonNull) {
      return mapped;
    }
    return nullGuard(valueExpr, mapped);
  }
  if (node is NamedTypeNode) {
    final typeName = node.name.value;
    final override = ctx.config.typeOverrides[typeName];
    final inner = _toJsonForNamedType(
      ctx: ctx,
      typeName: typeName,
      namedType: field.namedType,
      override: override,
      field: field,
      valueExpr: valueExpr,
    );
    if (node.isNonNull) {
      return inner;
    }
    return nullGuard(valueExpr, inner);
  }
  throw StateError("Invalid type node");
}

Expression _toJsonForNamedType({
  required DataEmitterContext ctx,
  required String typeName,
  required NamedTypeInfo namedType,
  required TypeOverrideConfig? override,
  required FieldSpec field,
  required Expression valueExpr,
}) {
  if (override?.toJsonFunctionName != null) {
    return refer(override!.toJsonFunctionName!).call([valueExpr]);
  }
  if (namedType.kind == GraphQLTypeKind.enumType) {
    return valueExpr.property("toJson").call([]);
  }
  if (namedType.kind == GraphQLTypeKind.object ||
      namedType.kind == GraphQLTypeKind.interface ||
      namedType.kind == GraphQLTypeKind.union ||
      namedType.kind == GraphQLTypeKind.inputObject) {
    return valueExpr.property("toJson").call([]);
  }
  return valueExpr;
}
