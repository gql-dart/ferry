import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('Object and null array', () {
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
      'postIds': ['123', 'non-existent-id']
    };

    final data = {
      'postsByIds': [
        {'id': '123', '__typename': 'Post', 'title': 'My awesome blog post'},
        null
      ]
    };

    final normalizedMap = {
      'Query': {
        'postsByIds({"ids":["123","non-existent-id"]})': [
          {'\$ref': 'Post:123'},
          null
        ]
      },
      'Post:123': {
        'id': '123',
        '__typename': 'Post',
        'title': 'My awesome blog post'
      }
    };

    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: data,
        variables: variables,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Produces correct nested data object', () async {
      expect(
        await denormalizeOperation(
          document: query,
          read: (dataId) async => normalizedMap[dataId],
          variables: variables,
        ),
        equals(data),
      );
    });
  });
}
