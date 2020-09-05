import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

void main() {
  group('Null Object', () {
    final query = parseString('''
      query TestQuery(\$postIds: [ID!]!) {
        postsByIds(ids: \$postIds) {
          id
          __typename
          title
        }
      }
    ''');

    final variables = {
      'postIds': ['non-existent-id']
    };

    final data = {
      'postsByIds': [null]
    };

    final normalizedMap = {
      'Query': {
        'postsByIds({"ids":["non-existent-id"]})': [null]
      }
    };

    test('Produces correct normalized object', () {
      final normalizedResult = {};
      normalize(
        merge: (dataId, value) =>
            (normalizedResult[dataId] ??= {}).addAll(value),
        query: query,
        data: data,
        variables: variables,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Produces correct nested data object', () {
      expect(
          denormalize(
            query: query,
            read: (dataId) => normalizedMap[dataId],
            variables: variables,
          ),
          equals(data));
    });
  });
}
