import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";

Library buildReqLibrary(
  SourceNode docSource,
) =>
    Library(
      (b) => b.body
        ..addAll(
          _buildOperationReqClasses(
            docSource.flatDocument,
          ),
        ),
    );

List<Class> _buildOperationReqClasses(
  DocumentNode doc,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .map(_buildOperationReqClass)
        .toList();

Class _buildOperationReqClass(
  OperationDefinitionNode node,
) {
  final name = node.name.value;
  final varBuilderRef = refer("${name}VarBuilder", "#var");
  final dataTypeRef = refer("\$${node.name.value}", "#data");
  final gqlClientUrl = "package:ferry/ferry.dart";

  return Class(
    (b) => b
      ..name = name
      ..extend = TypeReference((b) => b
        ..symbol = "QueryRequest"
        ..url = gqlClientUrl
        ..types.add(dataTypeRef))
      ..constructors = ListBuilder<Constructor>(
        <Constructor>[
          Constructor(
            (b) => b
              ..optionalParameters = ListBuilder<Parameter>(
                <Parameter>[
                  Parameter(
                    (b) => b
                      ..named = true
                      ..name = "buildVars"
                      ..type = FunctionType(
                        (b) => b
                          ..returnType = varBuilderRef
                          ..requiredParameters = ListBuilder<Reference>(
                            <Reference>[
                              varBuilderRef,
                            ],
                          ),
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
                      ..type = FunctionType((b) => b
                        ..returnType = dataTypeRef
                        ..requiredParameters = ListBuilder<Reference>(
                            <Reference>[dataTypeRef, dataTypeRef])),
                  ),
                  Parameter(
                    (b) => b
                      ..named = true
                      ..name = "optimisticResponse"
                      ..type = refer("Map<String, dynamic>"),
                  ),
                  Parameter((b) => b
                    ..named = true
                    ..name = "updateCacheHandlerKey"),
                  Parameter(
                    (b) => b
                      ..named = true
                      ..name = "updateCacheHandlerData"
                      ..type = refer("Map<String, dynamic>"),
                  ),
                  Parameter(
                    (b) => b
                      ..named = true
                      ..name = "context"
                      ..type =
                          refer("Context", "package:gql_exec/gql_exec.dart"),
                  ),
                  Parameter(
                    (b) => b
                      ..named = true
                      ..name = "fetchPolicy"
                      ..type = refer("FetchPolicy", gqlClientUrl),
                  ),
                ],
              )
              ..initializers = ListBuilder<Code>(
                <Code>[
                  refer(
                    "super",
                  ).call(
                    [],
                    {
                      "operation": refer(name, "#op"),
                      "variables": refer("buildVars")
                          .notEqualTo(refer("null"))
                          .conditional(
                              refer("buildVars").call(
                                <Expression>[
                                  varBuilderRef.call([]),
                                ],
                              ).property("variables"),
                              refer("const {}")),
                      "context": refer("context").notEqualTo(
                        refer("null").conditional(
                          refer("context"),
                          refer("Context", "package:gql_exec/gql_exec.dart")
                              .constInstance([]),
                        ),
                      ),
                      "queryId": refer("queryId").notEqualTo(
                        refer("null").conditional(
                          refer("queryId"),
                          refer("Uuid", "package:uuid/uuid.dart")
                              .call([])
                              .property("v4")
                              .call([]),
                        ),
                      ),
                      "updateResult": refer("updateResult"),
                      "optimisticResponse": refer("optimisticResponse"),
                      "updateCacheHandlerKey": refer("updateCacheHandlerKey"),
                      "updateCacheHandlerData": refer("updateCacheHandlerData"),
                      "fetchPolicy": refer("fetchPolicy"),
                    },
                  ).code,
                ],
              ),
          ),
        ],
      )
      ..methods = ListBuilder<Method>(<Method>[_buildParse(node, "#data")]),
  );
}

Method _buildParse(OperationDefinitionNode node, String dataDocUrl) =>
    Method((b) => b
      ..returns = refer("\$${node.name.value}", dataDocUrl)
      ..name = "parseData"
      ..requiredParameters.add(Parameter((b) => b
        ..type = refer("Map<String, dynamic>")
        ..name = "json"))
      ..lambda = true
      ..body =
          refer("\$${node.name.value}", dataDocUrl).call([refer("json")]).code);
