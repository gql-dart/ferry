import "package:code_builder/code_builder.dart";

Library buildUtilsLibrary() {
  final specs = <Spec>[
    _buildListEqualsHelper(deep: false),
    _buildListEqualsHelper(deep: true),
    _buildListHashHelper(deep: false),
    _buildListHashHelper(deep: true),
    _buildDeepEqualsHelper(),
    _buildDeepHashHelper(),
  ];

  return Library(
    (b) => b..body.addAll(specs),
  );
}

Expression _pragmaPreferInline() =>
    refer("pragma").call([literalString("vm:prefer-inline")]);

Method _buildListEqualsHelper({required bool deep}) {
  final name = deep ? "listEqualsDeep" : "listEquals";
  final elementCheck =
      deep ? r"!deepEquals(left[_$i], right[_$i])" : r"left[_$i] != right[_$i]";
  return Method(
    (b) => b
      ..name = name
      ..returns = refer("bool")
      ..types.add(refer("T"))
      ..annotations.add(_pragmaPreferInline())
      ..requiredParameters.addAll([
        Parameter(
          (b) => b
            ..name = "left"
            ..type = TypeReference(
              (b) => b
                ..symbol = "List"
                ..isNullable = true
                ..types.add(refer("T")),
            ),
        ),
        Parameter(
          (b) => b
            ..name = "right"
            ..type = TypeReference(
              (b) => b
                ..symbol = "List"
                ..isNullable = true
                ..types.add(refer("T")),
            ),
        ),
      ])
      ..body = Code(
        [
          "if (identical(left, right)) return true;",
          "if (left == null || right == null) return false;",
          r"final _$length = left.length;",
          r"if (_$length != right.length) return false;",
          r"for (var _$i = 0; _$i < _$length; _$i++) {",
          "  if ($elementCheck) return false;",
          "}",
          "return true;",
        ].join("\n"),
      ),
  );
}

Method _buildListHashHelper({required bool deep}) {
  final name = deep ? "listHashDeep" : "listHash";
  final elementHash = deep ? r"deepHash(_$value)" : r"_$value";
  final body = deep
      ? [
          "if (values == null) return 0;",
          r"var _$hash = 0;",
          r"for (final _$value in values) {",
          "  _\$hash = Object.hash(_\$hash, $elementHash);",
          "}",
          r"return _$hash;",
        ]
      : [
          "if (values == null) return 0;",
          "return Object.hashAll(values);",
        ];
  return Method(
    (b) => b
      ..name = name
      ..returns = refer("int")
      ..types.add(refer("T"))
      ..annotations.add(_pragmaPreferInline())
      ..requiredParameters.add(
        Parameter(
          (b) => b
            ..name = "values"
            ..type = TypeReference(
              (b) => b
                ..symbol = "List"
                ..isNullable = true
                ..types.add(refer("T")),
            ),
        ),
      )
      ..body = Code(body.join("\n")),
  );
}

Method _buildDeepEqualsHelper() {
  return Method(
    (b) => b
      ..name = "deepEquals"
      ..returns = refer("bool")
      ..annotations.add(_pragmaPreferInline())
      ..requiredParameters.addAll([
        Parameter((b) => b
          ..name = "left"
          ..type = refer("Object?")),
        Parameter((b) => b
          ..name = "right"
          ..type = refer("Object?")),
      ])
      ..body = Code(
        [
          "if (identical(left, right)) return true;",
          "if (left == null || right == null) return false;",
          "if (left is List && right is List) {",
          "  return listEqualsDeep(left, right);",
          "}",
          "if (left is Map && right is Map) {",
          "  if (left.length != right.length) return false;",
          r"  for (final _$entry in left.entries) {",
          r"    if (!right.containsKey(_$entry.key)) return false;",
          r"    if (!deepEquals(_$entry.value, right[_$entry.key])) return false;",
          "  }",
          "  return true;",
          "}",
          "return left == right;",
        ].join("\n"),
      ),
  );
}

Method _buildDeepHashHelper() {
  return Method(
    (b) => b
      ..name = "deepHash"
      ..returns = refer("int")
      ..annotations.add(_pragmaPreferInline())
      ..requiredParameters.add(
        Parameter((b) => b
          ..name = "value"
          ..type = refer("Object?")),
      )
      ..body = Code(
        [
          "if (value == null) return 0;",
          "if (value is List) {",
          "  return listHashDeep(value);",
          "}",
          "if (value is Map) {",
          "  return Object.hashAllUnordered(",
          "    value.entries.map(",
          r"      (_$entry) => Object.hash(",
          r"        deepHash(_$entry.key),",
          r"        deepHash(_$entry.value),",
          "      ),",
          "    ),",
          "  );",
          "}",
          "return value.hashCode;",
        ].join("\n"),
      ),
  );
}
