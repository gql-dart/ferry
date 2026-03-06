import "package:code_builder/code_builder.dart";

import "../utils/naming.dart";

class EmitterField {
  final String name;
  final Reference typeRef;
  final bool isNullable;

  const EmitterField({
    required this.name,
    required this.typeRef,
    required this.isNullable,
  });
}

Method buildCopyWithMethod(String className, List<EmitterField> fields) {
  final parameters = <Parameter>[];
  final args = <String, Expression>{};

  for (final field in fields) {
    final paramType =
        field.isNullable ? field.typeRef : nullableTypeReference(field.typeRef);
    parameters.add(
      Parameter(
        (b) => b
          ..name = field.name
          ..type = paramType
          ..named = true,
      ),
    );

    if (field.isNullable) {
      final isSetName = copyWithIsSetName(field.name);
      parameters.add(
        Parameter(
          (b) => b
            ..name = isSetName
            ..type = refer("bool")
            ..named = true
            ..defaultTo = const Code("false"),
        ),
      );
      args[field.name] = conditionalExpression(
        refer(isSetName),
        refer(field.name),
        refer("this").property(field.name),
      );
    } else {
      args[field.name] =
          refer(field.name).ifNullThen(refer("this").property(field.name));
    }
  }

  final constructorCall = refer(className).call([], args);
  return Method(
    (b) => b
      ..name = "copyWith"
      ..returns = refer(className)
      ..optionalParameters.addAll(parameters)
      ..body = Block.of([constructorCall.returned.statement]),
  );
}

Method buildEqualsMethod(String className, List<String> comparisons) {
  final body = comparisons.isEmpty
      ? "return identical(this, other) || other is $className;"
      : "return identical(this, other) || "
          "(other is $className && ${comparisons.join(" && ")});";

  return Method(
    (b) => b
      ..name = "operator =="
      ..annotations.add(refer("override"))
      ..returns = refer("bool")
      ..requiredParameters.add(
        Parameter(
          (b) => b
            ..name = "other"
            ..type = refer("Object"),
        ),
      )
      ..body = Code(body),
  );
}

Method buildHashCodeGetter(List<String> entries) {
  final body = entries.length == 1
      ? const Code("return runtimeType.hashCode;")
      : entries.length <= 20
          ? Code("return Object.hash(${entries.join(", ")});")
          : Code("return Object.hashAll([${entries.join(", ")}]);");
  return Method(
    (b) => b
      ..annotations.add(refer("override"))
      ..name = "hashCode"
      ..type = MethodType.getter
      ..returns = refer("int")
      ..body = body,
  );
}

Method buildToStringMethod(String className, List<String> fieldNames) {
  final parts = fieldNames.map((name) => "$name: \$$name").join(", ");
  final value = fieldNames.isEmpty ? "$className()" : "$className($parts)";
  return Method(
    (b) => b
      ..annotations.add(refer("override"))
      ..name = "toString"
      ..returns = refer("String")
      ..body = Code("return '$value';"),
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

String copyWithIsSetName(String propertyName) =>
    identifier("${propertyName}IsSet");

Reference nullableTypeReference(Reference reference) {
  if (reference is FunctionType) {
    return reference.rebuild((b) => b..isNullable = true);
  }
  if (reference is TypeReference) {
    return reference.rebuild((b) => b..isNullable = true);
  }
  return TypeReference(
    (b) => b
      ..symbol = reference.symbol
      ..url = reference.url
      ..isNullable = true,
  );
}
