import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../ir/model.dart";
import "../ir/names.dart";
import "../ir/types.dart";

class FragmentInfo {
  final FragmentName name;
  final TypeName typeCondition;
  final SelectionSetIR selectionSet;
  final Set<TypeName> inlineTypes;

  const FragmentInfo({
    required this.name,
    required this.typeCondition,
    required this.selectionSet,
    required this.inlineTypes,
  });
}

class FieldSpec {
  final String responseKey;
  final String propertyName;
  final TypeNode typeNode;
  final NamedTypeInfo namedType;
  final Reference typeRef;
  final Reference namedTypeRef;
  final SelectionSetIR? selectionSet;
  final String? description;

  const FieldSpec({
    required this.responseKey,
    required this.propertyName,
    required this.typeNode,
    required this.namedType,
    required this.typeRef,
    required this.namedTypeRef,
    required this.selectionSet,
    required this.description,
  });
}

String stripPrefix(String name) {
  if (name.startsWith("G")) {
    return name.substring(1);
  }
  return name;
}

Expression nullGuard(Expression valueExpr, Expression innerExpr) {
  return CodeExpression(
    Block.of([
      valueExpr.code,
      const Code(" == null ? null : "),
      innerExpr.code,
    ]),
  );
}

Expression conditionalExpression(
  Expression condition,
  Expression whenTrue,
  Expression whenFalse,
) {
  return CodeExpression(
    Block.of([
      condition.code,
      const Code(" ? "),
      whenTrue.code,
      const Code(" : "),
      whenFalse.code,
    ]),
  );
}

TypeReference mapStringDynamicType() => TypeReference(
      (b) => b
        ..symbol = "Map"
        ..types.addAll([
          refer("String"),
          refer("dynamic"),
        ]),
    );

TypeReference listDynamicType() => TypeReference(
      (b) => b
        ..symbol = "List"
        ..types.add(refer("dynamic")),
    );
