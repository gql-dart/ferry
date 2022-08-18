import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group('Variables Bool External', () {
    final query = parseString('''
      query TestQuery(\$a: Boolean) {
        __typename
        posts {
          id
          __typename
          author {
            id
            __typename
            name
          }
          title
          comments(b: \$a) {
            id
            __typename
            commenter {
              id
              __typename
              name
            }
          }
        }
      }
    ''');

    final variables = {'a': true};

    final normalizedMap = {
      'Query': {
        '__typename': 'Query',
        'posts': [
          {'\$ref': 'Post:123'}
        ]
      },
      'Post:123': {
        'id': '123',
        '__typename': 'Post',
        'author': {'\$ref': 'Author:1'},
        'title': 'My awesome blog post',
        'comments({"b":true})': [
          {'\$ref': 'Comment:324'}
        ]
      },
      'Author:1': {'id': '1', '__typename': 'Author', 'name': 'Paul'},
      'Comment:324': {
        'id': '324',
        '__typename': 'Comment',
        'commenter': {'\$ref': 'Author:2'}
      },
      'Author:2': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
    };

    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: sharedResponse,
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
        equals(sharedResponse),
      );
    });
  });
}
