@TestOn('vm')

import 'package:ferry_generator/graphql_builder.dart';
import 'package:ferry_generator/serializer_builder.dart';
import 'package:build_test/build_test.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';
import 'files/schema.dart';

void main() {
  // main schema graphql files
  final mainSchemaPath = 'a|lib/schema.graphql';
  final mainQueryPath = 'a|lib/user/signin.graphql';
  final mainMutationPath = 'a|lib/user/signup.graphql';

  // main schema generated files
  final mainSchemaAstPath = 'a|lib/__generated__/schema.ast.gql.dart';
  final mainSchemaSchemaPath = 'a|lib/__generated__/schema.schema.gql.dart';
  // final mainSchemaSchemaGPath = 'a|lib/__generated__/schema.schema.gql.g.dart';
  final mainSchemaSerilizerPath = 'a|lib/__generated__/serializers.gql.dart';

  final mainSchemaQueryAstPath = 'a|lib/user/__generated__/signin.ast.gql.dart';
  final mainSchemaQueryDataPath =
      'a|lib/user/__generated__/signin.data.gql.dart';
  final mainSchemaQueryVarPath = 'a|lib/user/__generated__/signin.var.gql.dart';
  final mainSchemaQueryReqPath = 'a|lib/user/__generated__/signin.req.gql.dart';

  final mainSchemaMutationAstPath =
      'a|lib/user/__generated__/signup.ast.gql.dart';
  final mainSchemaMutationDataPath =
      'a|lib/user/__generated__/signup.data.gql.dart';
  final mainSchemaMutationVarPath =
      'a|lib/user/__generated__/signup.var.gql.dart';
  final mainSchemaMutationReqPath =
      'a|lib/user/__generated__/signup.req.gql.dart';

  // module1 schema graphql files
  final module1SchemaPath = 'a|lib/module1/schema1.graphql';
  final module1QueryPath = 'a|lib/module1/user/signin.graphql';
  final module1MutationPath = 'a|lib/module1/user/signup.graphql';

  final module1SchemaAstPath =
      'a|lib/module1/__generated__/schema1.ast.gql.dart';
  final module1SchemaSchemaPath =
      'a|lib/module1/__generated__/schema1.schema.gql.dart';
  // final module1SchemaSchemaGPath = 'a|lib/module1/__generated__/schema1.schema.gql.g.dart';
  final module1SchemaSerilizerPath =
      'a|lib/module1/__generated__/serializers.gql.dart';

  final module1SchemaQueryAstPath =
      'a|lib/module1/user/__generated__/signin.ast.gql.dart';
  final module1SchemaQueryDataPath =
      'a|lib/module1/user/__generated__/signin.data.gql.dart';
  final module1SchemaQueryVarPath =
      'a|lib/module1/user/__generated__/signin.var.gql.dart';
  final module1SchemaQueryReqPath =
      'a|lib/module1/user/__generated__/signin.req.gql.dart';

  final module1SchemaMutationAstPath =
      'a|lib/module1/user/__generated__/signup.ast.gql.dart';
  final module1SchemaMutationDataPath =
      'a|lib/module1/user/__generated__/signup.data.gql.dart';
  final module1SchemaMutationVarPath =
      'a|lib/module1/user/__generated__/signup.var.gql.dart';
  final module1SchemaMutationReqPath =
      'a|lib/module1/user/__generated__/signup.req.gql.dart';

  // module2 schema graphql files
  final module2SchemaPath = 'a|lib/module2/schema2.graphql';
  final module2QueryPath = 'a|lib/module2/user/signin.graphql';
  final module2MutationPath = 'a|lib/module2/user/signup.graphql';

  final module2SchemaAstPath =
      'a|lib/module2/__generated__/schema2.ast.gql.dart';
  final module2SchemaSchemaPath =
      'a|lib/module2/__generated__/schema2.schema.gql.dart';
  // final module2SchemaSchemaGPath = 'a|lib/module2/__generated__/schema2.schema.gql.g.dart';
  final module2SchemaSerilizerPath =
      'a|lib/module2/__generated__/serializers.gql.dart';

  final module2SchemaQueryAstPath =
      'a|lib/module2/user/__generated__/signin.ast.gql.dart';
  final module2SchemaQueryDataPath =
      'a|lib/module2/user/__generated__/signin.data.gql.dart';
  final module2SchemaQueryVarPath =
      'a|lib/module2/user/__generated__/signin.var.gql.dart';
  final module2SchemaQueryReqPath =
      'a|lib/module2/user/__generated__/signin.req.gql.dart';

  final module2SchemaMutationAstPath =
      'a|lib/module2/user/__generated__/signup.ast.gql.dart';
  final module2SchemaMutationDataPath =
      'a|lib/module2/user/__generated__/signup.data.gql.dart';
  final module2SchemaMutationVarPath =
      'a|lib/module2/user/__generated__/signup.var.gql.dart';
  final module2SchemaMutationReqPath =
      'a|lib/module2/user/__generated__/signup.req.gql.dart';

  late Map<String, dynamic> config;
  late Map<String, Object> sourceAssets;

  setUp(() async {
    config = <String, dynamic>{
      'schema': mainSchemaPath,
      'schemas': YamlList.wrap([module1SchemaPath, module2SchemaPath]),
    };

    sourceAssets = {
      mainSchemaPath: schema,
      mainQueryPath: query,
      mainMutationPath: mutation,
      module1SchemaPath: schema,
      module1QueryPath: query,
      module1MutationPath: mutation,
      module2SchemaPath: schema,
      module2QueryPath: query,
      module2MutationPath: mutation,
    };
  });

  group('graphql_builder', () {
    setUp(() async {});

    tearDown(() async {});

    test('success', () async {
      await testBuilder(
        GraphqlBuilder(config),
        sourceAssets,
        generateFor: {
          mainSchemaPath,
          mainQueryPath,
          mainMutationPath,
          module1SchemaPath,
          module1QueryPath,
          module1MutationPath,
          module2SchemaPath,
          module2QueryPath,
          module2MutationPath
        },
        outputs: {
          mainSchemaAstPath: decodedMatches(
              contains('const Platform = _i1.EnumTypeDefinitionNode(')),
          mainSchemaSchemaPath:
              decodedMatches(contains('class GPlatform extends EnumClass {')),
          mainSchemaQueryAstPath: decodedMatches(
              contains('const SignIn = _i1.OperationDefinitionNode(')),
          mainSchemaQueryDataPath: decodedMatches(contains(
              'import \'package:a/__generated__/serializers.gql.dart\' as _i1;\n')),
          mainSchemaQueryVarPath: decodedMatches(contains(
              'import \'package:a/__generated__/schema.schema.gql.dart\' as _i1;\n')),
          mainSchemaQueryReqPath:
              decodedMatches(contains('abstract class GSignInReq')),
          mainSchemaMutationAstPath: decodedMatches(
              contains('const SignUp = _i1.OperationDefinitionNode(')),
          mainSchemaMutationDataPath:
              decodedMatches(contains('abstract class GSignUpData')),
          mainSchemaMutationVarPath:
              decodedMatches(contains('abstract class GSignUpVars')),
          mainSchemaMutationReqPath:
              decodedMatches(contains('abstract class GSignUpReq')),
          module1SchemaAstPath: decodedMatches(
              contains('const Platform = _i1.EnumTypeDefinitionNode(')),
          module1SchemaSchemaPath:
              decodedMatches(contains('class GPlatform extends EnumClass {')),
          module1SchemaQueryAstPath: decodedMatches(
              contains('const SignIn = _i1.OperationDefinitionNode(')),
          module1SchemaQueryDataPath: decodedMatches(contains(
              'import \'package:a/module1/__generated__/serializers.gql.dart\' as _i1;\n')),
          module1SchemaQueryVarPath: decodedMatches(contains(
              'import \'package:a/module1/__generated__/schema1.schema.gql.dart\' as _i1;\n')),
          module1SchemaQueryReqPath:
              decodedMatches(contains('abstract class GSignInReq')),
          module1SchemaMutationAstPath: decodedMatches(
              contains('const SignUp = _i1.OperationDefinitionNode(')),
          module1SchemaMutationDataPath:
              decodedMatches(contains('abstract class GSignUpData')),
          module1SchemaMutationVarPath:
              decodedMatches(contains('abstract class GSignUpVars')),
          module1SchemaMutationReqPath:
              decodedMatches(contains('abstract class GSignUpReq')),
          module2SchemaAstPath: decodedMatches(
              contains('const Platform = _i1.EnumTypeDefinitionNode(')),
          module2SchemaSchemaPath:
              decodedMatches(contains('class GPlatform extends EnumClass {')),
          module2SchemaQueryAstPath: decodedMatches(
              contains('const SignIn = _i1.OperationDefinitionNode(')),
          module2SchemaQueryDataPath: decodedMatches(contains(
              'import \'package:a/module2/__generated__/serializers.gql.dart\' as _i1;\n')),
          module2SchemaQueryVarPath: decodedMatches(contains(
              'import \'package:a/module2/__generated__/schema2.schema.gql.dart\' as _i1;\n')),
          module2SchemaQueryReqPath:
              decodedMatches(contains('abstract class GSignInReq')),
          module2SchemaMutationAstPath: decodedMatches(
              contains('const SignUp = _i1.OperationDefinitionNode(')),
          module2SchemaMutationDataPath:
              decodedMatches(contains('abstract class GSignUpData')),
          module2SchemaMutationVarPath:
              decodedMatches(contains('abstract class GSignUpVars')),
          module2SchemaMutationReqPath:
              decodedMatches(contains('abstract class GSignUpReq')),
        },
      );
    });
  });

  group('serializer_builder', () {
    setUp(() async {});

    tearDown(() async {});

    test('success', () async {
      await testBuilder(
        SerializerBuilder(config),
        sourceAssets,
        generateFor: {
          r'a|lib/$lib$',
          module1SchemaPath,
          module2SchemaPath,
        },
        outputs: {
          mainSchemaSerilizerPath: decodedMatches(contains(
              'final SerializersBuilder _serializersBuilder = _\$serializers.toBuilder()')),
          module1SchemaSerilizerPath: decodedMatches(contains(
              'final SerializersBuilder _serializersBuilder = _\$serializers.toBuilder()')),
          module2SchemaSerilizerPath: decodedMatches(contains(
              'final SerializersBuilder _serializersBuilder = _\$serializers.toBuilder()')),
        },
      );
    });
  });
}
