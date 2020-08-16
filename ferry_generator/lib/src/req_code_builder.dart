import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/built_class.dart";
import "package:gql_code_builder/src/common.dart";

Library buildReqLibrary(
  SourceNode docSource,
  String partUrl,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partUrl))
        ..body.addAll(
          _buildOperationReqClasses(
            docSource,
          ),
        ),
    );

List<Class> _buildOperationReqClasses(
  SourceNode docSource,
) =>
    docSource.document.definitions
        .whereType<OperationDefinitionNode>()
        .map(_buildOperationReqClass)
        .toList();

Class _buildOperationReqClass(
  OperationDefinitionNode node,
) {
  final dataTypeRef = refer("${builtClassName(node.name.value)}Data", "#data");
  final varTypeRef = refer("${builtClassName(node.name.value)}Vars", "#var");
  final gqlClientUrl = "package:ferry/ferry.dart";

  return builtClass(
    name: node.name.value,
    getters: [
      Method(
        (b) => b
          ..returns = varTypeRef
          ..type = MethodType.getter
          ..name = "vars",
      ),
      Method(
        (b) => b
          ..returns = refer(
            "Operation",
            "package:gql_exec/gql_exec.dart",
          )
          ..type = MethodType.getter
          ..name = "operation",
      ),
      Method(
        (b) => b
          ..returns = refer(
            "Request",
            "package:gql_exec/gql_exec.dart",
          )
          ..type = MethodType.getter
          ..name = "execRequest"
          ..lambda = true
          ..body = refer(
            "Request",
            "package:gql_exec/gql_exec.dart",
          ).call([], {
            "operation": refer("operation"),
            "variables": refer("vars").property("toJson").call([]),
          }).code,
      ),
      Method(
        (b) => b
          ..annotations
              .add(refer("nullable", "package:built_value/built_value.dart"))
          ..returns = refer("String")
          ..type = MethodType.getter
          ..name = "requestId",
      ),
      Method(
        (b) => b
          ..annotations.addAll([
            refer("nullable", "package:built_value/built_value.dart"),
            refer("BuiltValueField", "package:built_value/built_value.dart")
                .call([], {
              "serialize": refer("false"),
            }),
          ])
          ..returns = FunctionType(
            (b) => b
              ..returnType = dataTypeRef
              ..requiredParameters = ListBuilder<Reference>([
                dataTypeRef,
                dataTypeRef,
              ]),
          )
          ..type = MethodType.getter
          ..name = "updateResult",
      ),
      Method(
        (b) => b
          ..annotations
              .add(refer("nullable", "package:built_value/built_value.dart"))
          ..returns = dataTypeRef
          ..type = MethodType.getter
          ..name = "optimisticResponse",
      ),
      Method(
        (b) => b
          ..annotations
              .add(refer("nullable", "package:built_value/built_value.dart"))
          ..returns = refer("String")
          ..type = MethodType.getter
          ..name = "updateCacheHandlerKey",
      ),
      Method(
        (b) => b
          ..annotations
              .add(refer("nullable", "package:built_value/built_value.dart"))
          ..returns = refer("Map<String, dynamic>")
          ..type = MethodType.getter
          ..name = "updateCacheHandlerContext",
      ),
      Method(
        (b) => b
          ..annotations
              .add(refer("nullable", "package:built_value/built_value.dart"))
          ..returns = refer("FetchPolicy", gqlClientUrl)
          ..type = MethodType.getter
          ..name = "fetchPolicy",
      ),
      Method(
        (b) => b
          ..annotations.add(refer("override"))
          ..returns = dataTypeRef
          ..name = "parseData"
          ..requiredParameters.add(
            Parameter(
              (b) => b
                ..type = refer("Map<String, dynamic>")
                ..name = "json",
            ),
          )
          ..lambda = true
          ..body = dataTypeRef.property("fromJson").call([refer("json")]).code,
      ),
    ],
    initializers: {
      "operation": refer("Operation", "package:gql_exec/gql_exec.dart").call(
        [],
        {
          "document": refer("document", "#ast"),
          "operationName": literalString(node.name.value),
        },
      ),
    },
  ).rebuild(
    (b) => b
      ..implements.add(
        TypeReference(
          (b) => b
            ..symbol = "OperationRequest"
            ..url = gqlClientUrl
            ..types.addAll([
              dataTypeRef,
              varTypeRef,
            ]),
        ),
      ),
  );
}
