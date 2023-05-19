import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group('Key Args', () {
    final query = parseString('''
      query TestQuery {
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
          comments(a: true, b: false) {
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

    const normalizedMap = {
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
        'comments({"b":false})': [
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

    const typePolicies = {
      'Post': TypePolicy(fields: {
        'comments': FieldPolicy(keyArgs: ['b'])
      })
    };

    test('Produces correct normalized object', () {
      final normalizedResult = {};
      normalizeOperation(
        read: (dataId) => normalizedResult[dataId],
        write: (dataId, value) => normalizedResult[dataId] = value,
        document: query,
        data: sharedResponse,
        typePolicies: typePolicies,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Produces correct nested data object', () {
      expect(
        denormalizeOperation(
          document: query,
          read: (dataId) => normalizedMap[dataId],
          typePolicies: typePolicies,
        ),
        equals(sharedResponse),
      );
    });
  });
}
