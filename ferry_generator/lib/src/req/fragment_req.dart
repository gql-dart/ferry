import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';
import 'package:gql_code_builder/source.dart';
import 'package:gql_code_builder/src/built_class.dart';
import 'package:gql_code_builder/src/common.dart';

List<Class> buildFragmentReqClasses(
  SourceNode docSource,
) =>
    docSource.document.definitions
        .whereType<FragmentDefinitionNode>()
        .map(_buildFragmentReqClass)
        .toList();

Class _buildFragmentReqClass(
  FragmentDefinitionNode node,
) {
  final dataTypeRef = refer('${builtClassName(node.name.value)}Data', '#data');
  final varTypeRef = refer('${builtClassName(node.name.value)}Vars', '#var');

  return builtClass(
    name: '${node.name.value}Req',
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
            'DocumentNode',
            'package:gql/ast.dart',
          )
          ..type = MethodType.getter
          ..name = 'document',
      ),
      Method(
        (b) => b
          ..returns = TypeReference(
            (b) => b
              ..symbol = 'String'
              ..isNullable = true,
          )
          ..type = MethodType.getter
          ..name = 'fragmentName',
      ),
      Method(
        (b) => b
          ..returns = refer('Map<String, dynamic>')
          ..type = MethodType.getter
          ..name = 'idFields',
      ),
      Method(
        (b) => b
          ..annotations.add(refer('override'))
          ..returns = TypeReference(
            (b) => b
              ..symbol = dataTypeRef.symbol
              ..url = dataTypeRef.url
              ..isNullable = true,
          )
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
      'document': refer('document', '#ast'),
      'fragmentName': literalString(node.name.value),
    },
  ).rebuild(
    (b) => b
      ..implements.add(
        TypeReference(
          (b) => b
            ..symbol = 'FragmentRequest'
            ..url = 'package:ferry_exec/ferry_exec.dart'
            ..types.addAll([
              dataTypeRef,
              varTypeRef,
            ]),
        ),
      ),
  );
}
