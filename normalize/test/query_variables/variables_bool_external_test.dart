import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group('Variables Bool External', () {
    final query = parseString('''
      query TestQuery(\$a: Boolean) {
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

    test('Produces correct normalized object', () {
      final normalizedResult = {};
      normalize(
        merge: (dataId, value) =>
            (normalizedResult[dataId] ??= {}).addAll(value),
        query: query,
        data: sharedResponse,
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
        equals(sharedResponse),
      );
    });
  });
}
