import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';
import 'package:gql_code_builder/source.dart';
import 'package:gql_code_builder/src/built_class.dart';
import 'package:gql_code_builder/src/common.dart';

List<Class> buildOperationReqClasses(
  SourceNode docSource,
) =>
    docSource.document.definitions
        .whereType<OperationDefinitionNode>()
        .map(_buildOperationReqClass)
        .toList();

Class _buildOperationReqClass(
  OperationDefinitionNode node,
) {
  final dataTypeRef = refer('${builtClassName(node.name!.value)}Data', '#data');
  final nullableDataTypeRef = TypeReference(
    (b) => b
      ..symbol = dataTypeRef.symbol
      ..url = dataTypeRef.url
      ..isNullable = true,
  );

  final varTypeRef = refer('${builtClassName(node.name!.value)}Vars', '#var');

  return builtClass(
    name: '${node.name!.value}Req',
    getters: [
      Method(
        (b) => b
          ..returns = varTypeRef
          ..type = MethodType.getter
          ..name = 'vars',
      ),
      Method(
        (b) => b
          ..returns = refer(
            'Operation',
            'package:gql_exec/gql_exec.dart',
          )
          ..type = MethodType.getter
          ..name = 'operation',
      ),
      Method(
        (b) => b
          ..returns = refer(
            'Request',
            'package:gql_exec/gql_exec.dart',
          )
          ..type = MethodType.getter
          ..name = 'execRequest'
          ..lambda = true
          ..body = refer(
            'Request',
            'package:gql_exec/gql_exec.dart',
          ).call([], {
            'operation': refer('operation'),
            'variables': refer('vars').property('toJson').call([]),
          }).code,
      ),
      Method(
        (b) => b
          ..returns = TypeReference(
            (b) => b
              ..symbol = 'String'
              ..isNullable = true,
          )
          ..type = MethodType.getter
          ..name = 'requestId',
      ),
      Method(
        (b) => b
          ..annotations.addAll([
            refer('BuiltValueField', 'package:built_value/built_value.dart')
                .call([], {
              'serialize': refer('false'),
            }),
          ])
          ..returns = FunctionType(
            (b) => b
              ..isNullable = true
              ..returnType = nullableDataTypeRef
              ..requiredParameters = ListBuilder<Reference>([
                nullableDataTypeRef,
                nullableDataTypeRef,
              ]),
          )
          ..type = MethodType.getter
          ..name = 'updateResult',
      ),
      Method(
        (b) => b
          ..returns = nullableDataTypeRef
          ..type = MethodType.getter
          ..name = 'optimisticResponse',
      ),
      Method(
        (b) => b
          ..returns = TypeReference(
            (b) => b
              ..symbol = 'String'
              ..isNullable = true,
          )
          ..type = MethodType.getter
          ..name = 'updateCacheHandlerKey',
      ),
      Method(
        (b) => b
          ..returns = TypeReference(
            (b) => b
              ..symbol = 'Map<String, dynamic>'
              ..isNullable = true,
          )
          ..type = MethodType.getter
          ..name = 'updateCacheHandlerContext',
      ),
      Method(
        (b) => b
          ..returns = TypeReference(
            (b) => b
              ..symbol = 'FetchPolicy'
              ..url = 'package:ferry_exec/ferry_exec.dart'
              ..isNullable = true,
          )
          ..type = MethodType.getter
          ..name = 'fetchPolicy',
      ),
      Method(
        (b) => b
          ..returns = refer('bool')
          ..type = MethodType.getter
          ..name = 'executeOnListen',
      ),
      Method(
        (b) => b
          ..annotations.add(refer('override'))
          ..returns = nullableDataTypeRef
          ..name = 'parseData'
          ..requiredParameters.add(
            Parameter(
              (b) => b
                ..type = refer('Map<String, dynamic>')
                ..name = 'json',
            ),
          )
          ..lambda = true
          ..body = dataTypeRef.property('fromJson').call([refer('json')]).code,
      ),
    ],
    initializers: {
      'operation': refer('Operation', 'package:gql_exec/gql_exec.dart').call(
        [],
        {
          'document': refer('document', '#ast'),
          'operationName': literalString(node.name!.value),
        },
      ),
      'executeOnListen': literalTrue,
    },
  ).rebuild(
    (b) => b
      ..implements.add(
        TypeReference(
          (b) => b
            ..symbol = 'OperationRequest'
            ..url = 'package:ferry_exec/ferry_exec.dart'
            ..types.addAll([
              dataTypeRef,
              varTypeRef,
            ]),
        ),
      ),
  );
}
