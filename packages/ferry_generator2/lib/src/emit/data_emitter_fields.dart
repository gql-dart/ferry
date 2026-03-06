import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../config/builder_config.dart";
import "collection_helpers.dart";
import "data_emitter_context.dart";
import "data_emitter_types.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../ir/types.dart";
import "../utils/naming.dart";

List<FieldSpec> buildFieldSpecs({
  required DataEmitterContext ctx,
  required String baseName,
  required SelectionSetIR selectionSet,
}) {
  final fields = <FieldSpec>[];
  for (final selection in selectionSet.fields.values) {
    final fieldName = selection.responseKey.value;
    final propertyName = identifier(fieldName);
    final nestedBaseName = "${baseName}_$fieldName";
    final namedTypeName = selection.namedType.name.value;
    final namedTypeKind = selection.namedType.kind;

    final FragmentName? fragmentName = ctx.config.dataClassConfig.reuseFragments
        ? selection.selectionSet?.reuseFragment
        : null;
    Reference? namedTypeRef;

    if (fragmentName != null) {
      namedTypeRef =
          fragmentDataReference(ctx: ctx, fragmentName: fragmentName);
    } else if (namedTypeKind == GraphQLTypeKind.object ||
        namedTypeKind == GraphQLTypeKind.interface ||
        namedTypeKind == GraphQLTypeKind.union) {
      namedTypeRef = Reference(
        builtClassName(nestedBaseName),
        "#data",
      );
    } else if (namedTypeKind == GraphQLTypeKind.enumType ||
        namedTypeKind == GraphQLTypeKind.inputObject) {
      namedTypeRef = Reference(
        builtClassName(namedTypeName),
        "#schema",
      );
    } else if (namedTypeKind == GraphQLTypeKind.scalar) {
      namedTypeRef = scalarReference(ctx: ctx, typeName: namedTypeName);
    } else {
      namedTypeRef = refer("Object");
    }

    final typeRef = typeReferenceForTypeNode(
      selection.typeNode,
      namedTypeRef,
    );
    final description = ctx.fieldDescription(
      parentTypeName: selectionSet.parentTypeName,
      fieldName: selection.fieldName,
      isSynthetic: selection.isSynthetic,
    );

    fields.add(
      FieldSpec(
        responseKey: fieldName,
        propertyName: propertyName,
        typeNode: selection.typeNode,
        namedType: selection.namedType,
        typeRef: typeRef,
        namedTypeRef: namedTypeRef,
        selectionSet: selection.selectionSet,
        description: description,
      ),
    );
  }
  return fields;
}

Reference fragmentDataReference({
  required DataEmitterContext ctx,
  required FragmentName fragmentName,
}) {
  final url = ctx.fragmentSourceUrls[fragmentName];
  if (url == null) {
    return Reference(builtClassName("${fragmentName.value}Data"), "#data");
  }
  return Reference(builtClassName("${fragmentName.value}Data"), "$url#data");
}

Reference fragmentInterfaceReference({
  required DataEmitterContext ctx,
  required FragmentName fragmentName,
}) {
  final url = ctx.fragmentSourceUrls[fragmentName];
  if (url == null) {
    return Reference(builtClassName(fragmentName.value), "#data");
  }
  return Reference(builtClassName(fragmentName.value), "$url#data");
}

Reference scalarReference({
  required DataEmitterContext ctx,
  required String typeName,
}) {
  final override = ctx.config.typeOverrides[typeName];
  if (override?.type != null) {
    if (override!.import != null) {
      ctx.extraImports.add(override.import!);
    }
    return Reference(override.type);
  }

  return switch (typeName) {
    "Int" => refer("int"),
    "Float" => refer("double"),
    "Boolean" => refer("bool"),
    "ID" => refer("String"),
    "String" => refer("String"),
    _ => refer("Object"),
  };
}

bool isMapOverride({
  required DataEmitterContext ctx,
  required String typeName,
}) {
  return isMapOverrideType(typeName, ctx.config.typeOverrides);
}

Reference typeReferenceForTypeNode(
  TypeNode typeNode,
  Reference namedTypeRef,
) {
  if (typeNode is ListTypeNode) {
    return TypeReference(
      (b) => b
        ..symbol = "List"
        ..isNullable = !typeNode.isNonNull
        ..types.add(typeReferenceForTypeNode(typeNode.type, namedTypeRef)),
    );
  }
  if (typeNode is NamedTypeNode) {
    if (namedTypeRef is TypeReference) {
      return namedTypeRef.rebuild((b) => b..isNullable = !typeNode.isNonNull);
    }
    return TypeReference(
      (b) => b
        ..symbol = namedTypeRef.symbol
        ..url = namedTypeRef.url
        ..isNullable = !typeNode.isNonNull,
    );
  }
  throw StateError("Invalid type node");
}

bool canUseListFrom({
  required DataEmitterContext ctx,
  required String typeName,
  required NamedTypeInfo namedType,
  required TypeOverrideConfig? override,
}) {
  if (namedType.kind != GraphQLTypeKind.scalar) return false;
  if (override?.fromJsonFunctionName != null) return false;
  if (_isBuiltinScalarName(typeName)) return true;
  final overrideType = override?.type;
  if (overrideType == null) return false;
  final normalized = overrideType.replaceAll(" ", "");
  if (normalized == "Object" ||
      normalized == "Object?" ||
      normalized == "dynamic") {
    return false;
  }
  return true;
}

bool _isBuiltinScalarName(String typeName) => switch (typeName) {
      "Int" => true,
      "Float" => true,
      "Boolean" => true,
      "ID" => true,
      "String" => true,
      _ => false,
    };

Reference typeReferenceWithNullability(
  Reference typeRef, {
  required bool isNullable,
}) {
  if (typeRef is TypeReference) {
    return typeRef.rebuild((b) => b..isNullable = isNullable);
  }
  return TypeReference(
    (b) => b
      ..symbol = typeRef.symbol
      ..url = typeRef.url
      ..isNullable = isNullable,
  );
}

bool isNullableField(FieldSpec field) {
  final typeRef = field.typeRef;
  if (typeRef is TypeReference) {
    return typeRef.isNullable ?? false;
  }
  return false;
}
