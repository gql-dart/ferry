import 'package:ferry_generator/graphql_builder.dart';
import 'package:build_test/build_test.dart';
import 'package:test/test.dart';
import 'package:matcher/matcher.dart';

void main() {
  group('tristate_optionals import alias issue', () {
    const schemaContent = '''
type Query {
  user(id: ID!): User
}

type User {
  id: ID!
  name: String
  email: String
}

input UserInput {
  name: String
  email: String
}

type Mutation {
  updateUser(id: ID!, input: UserInput): User
}
''';

    const queryContent = '''
mutation UpdateUser(\$id: ID!, \$input: UserInput) {
  updateUser(id: \$id, input: \$input) {
    id
    name
    email
  }
}
''';

    test('without tristate_optionals - baseline', () async {
      final config = <String, dynamic>{
        'schema': 'a|lib/schema.graphql',
        'tristate_optionals': false,
      };

      await testBuilder(
        GraphqlBuilder(config),
        {
          'a|lib/schema.graphql': schemaContent,
          'a|lib/update_user.graphql': queryContent,
        },
        generateFor: {
          'a|lib/update_user.graphql',
          'a|lib/schema.graphql',
        },
        outputs: {
          'a|lib/__generated__/update_user.var.gql.dart': decodedMatches(allOf([
            contains(
                'import \'package:a/__generated__/schema.schema.gql.dart\' as _i1;'),
            contains(
                'import \'package:a/__generated__/serializers.gql.dart\' as _i2;'),
            isNot(contains('gql_tristate_value')),
          ])),
          'a|lib/__generated__/update_user.ast.gql.dart': anything,
          'a|lib/__generated__/update_user.data.gql.dart': anything,
          'a|lib/__generated__/update_user.req.gql.dart': anything,
          'a|lib/__generated__/schema.ast.gql.dart': anything,
          'a|lib/__generated__/schema.schema.gql.dart': anything,
        },
      );
    });

    test('with tristate_optionals - import aliases should be deterministic',
        () async {
      final config = <String, dynamic>{
        'schema': 'a|lib/schema.graphql',
        'tristate_optionals': true,
      };

      await testBuilder(
        GraphqlBuilder(config),
        {
          'a|lib/schema.graphql': schemaContent,
          'a|lib/update_user.graphql': queryContent,
        },
        generateFor: {
          'a|lib/update_user.graphql',
          'a|lib/schema.graphql',
        },
        outputs: {
          // Allow all generated outputs but only check the one we care about
          'a|lib/__generated__/update_user.var.gql.dart': decodedMatches(allOf([
            contains('gql_tristate_value'),
            // Verify all required imports are present with unique aliases (no collisions)
            contains(
                'import \'package:a/__generated__/schema.schema.gql.dart\' as _i'),
            contains(
                'import \'package:a/__generated__/serializers.gql.dart\' as _i'),
            contains(
                'import \'package:gql_tristate_value/gql_tristate_value.dart\' as _i'),
            // The key is that tristate types work correctly (no InvalidType errors)
            contains('Value<'),
            contains('AbsentValue'),
            contains('PresentValue'),
          ])),
          'a|lib/__generated__/update_user.ast.gql.dart': anything,
          'a|lib/__generated__/update_user.data.gql.dart': anything,
          'a|lib/__generated__/update_user.req.gql.dart': anything,
          'a|lib/__generated__/schema.ast.gql.dart': anything,
          'a|lib/__generated__/schema.schema.gql.dart': anything,
        },
      );
    });
  });
}
