import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";

Library buildReqLibrary(SourceNode docSource) => Library(
      (b) => b.body
        ..addAll(
          _buildOperationReqClasses(docSource.flatDocument),
        ),
    );

List<Class> _buildOperationReqClasses(DocumentNode doc) => doc.definitions
    .whereType<OperationDefinitionNode>()
    .map(_buildOperationReqClass)
    .toList();

Class _buildOperationReqClass(OperationDefinitionNode node) {
  final name = node.name.value;
  final dataTypeRef = refer("\$${node.name.value}", "#data");
  final gqlClientUrl = "package:ferry/ferry.dart";

  return Class(
    (b) => b
      ..name = name
      ..extend = TypeReference(
        (b) => b
          ..symbol = "QueryRequest"
          ..url = gqlClientUrl
          ..types.add(dataTypeRef),
      )
      ..constructors = ListBuilder<Constructor>([
        _buildFactoryConstructor(node),
        _buildPrivateConstructor(node),
      ])
      ..methods = ListBuilder<Method>(
        <Method>[
          _buildParse(node),
          _buildCopyWith(node),
        ],
      ),
  );
}

Constructor _buildFactoryConstructor(OperationDefinitionNode node) {
  final name = node.name.value;
  final varBuilderRef = refer("${name}VarBuilder", "#var");
  final dataTypeRef = refer("\$${node.name.value}", "#data");
  final gqlClientUrl = "package:ferry/ferry.dart";

  return Constructor(
    (b) => b
      ..factory = true
      ..optionalParameters = ListBuilder<Parameter>([
        Parameter(
          (b) => b
            ..named = true
            ..name = "buildVars"
            ..type = FunctionType(
              (b) => b
                ..returnType = varBuilderRef
                ..requiredParameters = ListBuilder<Reference>([varBuilderRef]),
            ),
        ),
        Parameter(
          (b) => b
            ..named = true
            ..name = "queryId"
            ..type = refer("String"),
        ),
        Parameter(
          (b) => b
            ..named = true
            ..name = "updateResult"
            ..type = FunctionType(
              (b) => b
                ..returnType = dataTypeRef
                ..requiredParameters = ListBuilder<Reference>([
                  dataTypeRef,
                  dataTypeRef,
                ]),
            ),
        ),
        Parameter(
          (b) => b
            ..named = true
            ..name = "optimisticResponse"
            ..type = refer("Map<String, dynamic>"),
        ),
        Parameter(
          (b) => b
            ..named = true
            ..name = "updateCacheHandlerKey",
        ),
        Parameter(
          (b) => b
            ..named = true
            ..name = "context"
            ..type = refer("Context", "package:gql_exec/gql_exec.dart"),
        ),
        Parameter(
          (b) => b
            ..named = true
            ..name = "fetchPolicy"
            ..type = refer("FetchPolicy", gqlClientUrl),
        ),
      ])
      ..lambda = true
      ..body = refer(name).property("_").call(
        [],
        {
          "operation": refer(name, "#op"),
          "variables": refer("buildVars").notEqualTo(refer("null")).conditional(
                refer("buildVars").call(
                  [varBuilderRef.call([])],
                ).property("variables"),
                refer("const {}"),
              ),
          "context": refer("context").notEqualTo(
            refer("null").conditional(
              refer("context"),
              refer("Context", "package:gql_exec/gql_exec.dart")
                  .constInstance([]),
            ),
          ),
          "queryId": refer("queryId"),
          "updateResult": refer("updateResult"),
          "optimisticResponse": refer("optimisticResponse"),
          "updateCacheHandlerKey": refer("updateCacheHandlerKey"),
          "fetchPolicy": refer("fetchPolicy"),
        },
      ).code,
  );
}

List<Parameter> _buildParams(OperationDefinitionNode node) {
  final dataTypeRef = refer("\$${node.name.value}", "#data");
  final gqlClientUrl = "package:ferry/ferry.dart";

  return [
    Parameter(
      (b) => b
        ..named = true
        ..name = "operation"
        ..type = refer("Operation", "package:gql_exec/gql_exec.dart"),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "variables"
        ..type = refer("Map<String, dynamic>"),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "context"
        ..type = refer("Context", "package:gql_exec/gql_exec.dart"),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "queryId"
        ..type = refer("String"),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "updateResult"
        ..type = FunctionType(
          (b) => b
            ..returnType = dataTypeRef
            ..requiredParameters = ListBuilder<Reference>([
              dataTypeRef,
              dataTypeRef,
            ]),
        ),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "optimisticResponse"
        ..type = refer("Map<String, dynamic>"),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "updateCacheHandlerKey"
        ..type = refer("String"),
    ),
    Parameter(
      (b) => b
        ..named = true
        ..name = "fetchPolicy"
        ..type = refer("FetchPolicy", gqlClientUrl),
    ),
  ];
}

Constructor _buildPrivateConstructor(OperationDefinitionNode node) {
  return Constructor(
    (b) => b
      ..name = "_"
      ..optionalParameters = ListBuilder<Parameter>(_buildParams(node))
      ..lambda = true
      ..initializers = ListBuilder<Code>([
        refer("super").call(
          [],
          {
            "operation": refer("operation"),
            "variables": refer("variables"),
            "context": refer("context"),
            "queryId": refer("queryId"),
            "updateResult": refer("updateResult"),
            "optimisticResponse": refer("optimisticResponse"),
            "updateCacheHandlerKey": refer("updateCacheHandlerKey"),
            "fetchPolicy": refer("fetchPolicy"),
          },
        ).code
      ]),
  );
}

Method _buildCopyWith(OperationDefinitionNode node) => Method(
      (b) => b
        ..annotations.add(refer("override"))
        ..returns = refer(node.name.value)
        ..name = "copyWith"
        ..optionalParameters = ListBuilder<Parameter>(_buildParams(node))
        ..lambda = true
        ..body = refer(node.name.value).property("_").call(
          [],
          {
            "operation": CodeExpression(Code("operation ?? this.operation")),
            "variables": CodeExpression(Code("variables ?? this.variables")),
            "context": CodeExpression(Code("context ?? this.context")),
            "queryId": CodeExpression(Code("queryId ?? this.queryId")),
            "updateResult":
                CodeExpression(Code("updateResult ?? this.updateResult")),
            "optimisticResponse": CodeExpression(
                Code("optimisticResponse ?? this.optimisticResponse")),
            "updateCacheHandlerKey": CodeExpression(
                Code("updateCacheHandlerKey ?? this.updateCacheHandlerKey")),
            "fetchPolicy":
                CodeExpression(Code("fetchPolicy ?? this.fetchPolicy")),
          },
        ).code,
    );

Method _buildParse(OperationDefinitionNode node) => Method(
      (b) => b
        ..annotations.add(refer("override"))
        ..returns = refer("\$${node.name.value}", "#data")
        ..name = "parseData"
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..type = refer("Map<String, dynamic>")
              ..name = "json",
          ),
        )
        ..lambda = true
        ..body = refer(
          "\$${node.name.value}",
          "#data",
        ).call([refer("json")]).code,
    );
