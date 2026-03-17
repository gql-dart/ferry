import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../config/builder_config.dart";

class CollectionPolicy {
  final BuilderConfig config;
  final Map<String, TypeOverrideConfig> overrides;

  const CollectionPolicy({
    required this.config,
    required this.overrides,
  });

  bool get enabled => config.collections.mode == CollectionMode.unmodifiable;

  bool needsWrapper(TypeNode node) {
    return needsCollectionWrapper(
      config: config,
      node: node,
      overrides: overrides,
    );
  }

  Expression wrapList({
    required Reference listTypeRef,
    required Expression innerExpr,
  }) {
    if (!enabled) return innerExpr;
    return listTypeRef.property("unmodifiable").call([innerExpr]);
  }

  Expression wrapMap({
    required String typeName,
    required Expression innerExpr,
  }) {
    if (!enabled) return innerExpr;
    final mapType = _mapOverrideTypeName(typeName, overrides);
    if (mapType == null) return innerExpr;
    return _mapUnmodifiableExpr(mapType, innerExpr);
  }

  String wrapConstructor({
    required TypeNode node,
    required String propertyName,
  }) {
    return collectionWrapperExpression(
      config: config,
      node: node,
      overrides: overrides,
      propertyName: propertyName,
    );
  }
}

bool isMapOverrideType(
  String typeName,
  Map<String, TypeOverrideConfig> overrides,
) {
  return _mapOverrideTypeName(typeName, overrides) != null;
}

bool needsCollectionWrapper({
  required BuilderConfig config,
  required TypeNode node,
  required Map<String, TypeOverrideConfig> overrides,
}) {
  if (config.collections.mode != CollectionMode.unmodifiable) {
    return false;
  }
  if (node is ListTypeNode) return true;
  if (node is NamedTypeNode) {
    return isMapOverrideType(node.name.value, overrides);
  }
  return false;
}

String collectionWrapperExpression({
  required BuilderConfig config,
  required TypeNode node,
  required Map<String, TypeOverrideConfig> overrides,
  required String propertyName,
}) {
  if (!needsCollectionWrapper(
    config: config,
    node: node,
    overrides: overrides,
  )) {
    return propertyName;
  }
  if (node is ListTypeNode) {
    if (node.isNonNull) {
      return "List.unmodifiable($propertyName)";
    }
    return "$propertyName == null ? null : List.unmodifiable($propertyName)";
  }
  if (node is NamedTypeNode) {
    final mapType = _mapOverrideTypeName(node.name.value, overrides);
    if (mapType != null) {
      if (node.isNonNull) {
        return "$mapType.unmodifiable($propertyName)";
      }
      return "$propertyName == null ? null : $mapType.unmodifiable($propertyName)";
    }
  }
  return propertyName;
}

Expression _mapUnmodifiableExpr(String mapType, Expression target) {
  return CodeExpression(
    Block.of([
      Code("$mapType.unmodifiable("),
      target.code,
      const Code(")"),
    ]),
  );
}

String? _mapOverrideTypeName(
  String typeName,
  Map<String, TypeOverrideConfig> overrides,
) {
  final overrideType = overrides[typeName]?.type;
  if (overrideType == null) return null;
  var trimmed = overrideType.trim();
  if (trimmed.endsWith("?")) {
    trimmed = trimmed.substring(0, trimmed.length - 1).trim();
  }
  final normalized = trimmed.replaceAll(" ", "");
  if (!RegExp(r'^([a-zA-Z_][\w\.]*\.)?Map<').hasMatch(normalized)) {
    return null;
  }
  return trimmed;
}
