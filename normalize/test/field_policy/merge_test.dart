import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group('FieldPolicy.read method', () {
    final query = parseString('''
      query TestQuery {
        __typename
        posts {
          __typename
          id
          author {
            __typename
            id
            name
          }
          title
          comments {
            __typename
            id
            commenter {
              __typename
              id
              name
            }
          }
        }
      }
    ''');

    test('can use custom merge function on root field', () {
      final queryPolicy = TypePolicy(
        queryType: true,
        fields: {
          'posts': FieldPolicy(
            merge: (existing, incoming, options) {
              if (existing is List && incoming is List) {
                return [...existing, ...incoming];
              }
              return incoming;
            },
          )
        },
      );

      final response = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '456',
            '__typename': 'Post',
            'author': {
              'id': '1',
              '__typename': 'Author',
              'name': 'Paul',
            },
            'title': 'My second blog post',
            'comments': []
          }
        ]
      };

      final existingNormalizedMap = {...sharedNormalizedMap};

      final resultNormalizedMap = {
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
            {'\$ref': 'Post:456'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'author': {'\$ref': 'Author:1'},
          'title': 'My awesome blog post',
          'comments': [
            {'\$ref': 'Comment:324'}
          ]
        },
        'Post:456': {
          'id': '456',
          '__typename': 'Post',
          'author': {'\$ref': 'Author:1'},
          'title': 'My second blog post',
          'comments': []
        },
        'Author:1': {
          'id': '1',
          '__typename': 'Author',
          'name': 'Paul',
        },
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
          'commenter': {'\$ref': 'Author:2'},
        },
        'Author:2': {
          'id': '2',
          '__typename': 'Author',
          'name': 'Nicole',
        }
      };

      normalizeOperation(
        data: response,
        document: query,
        read: (dataId) => existingNormalizedMap[dataId],
        write: (dataId, value) => existingNormalizedMap[dataId] = value,
        typePolicies: {
          'Query': queryPolicy,
        },
      );

      expect(existingNormalizedMap, equals(resultNormalizedMap));
    });

    test('can use custom merge function on child field', () {
      final queryPolicy = TypePolicy(
        fields: {
          'comments': FieldPolicy(
            merge: (existing, incoming, options) {
              if (existing is List && incoming is List) {
                return [...existing, ...incoming];
              }
              return incoming;
            },
          )
        },
      );

      final response = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '123',
            '__typename': 'Post',
            'author': {
              'id': '1',
              '__typename': 'Author',
              'name': 'Paul',
            },
            'title': 'My awesome blog post',
            'comments': [
              {
                'id': '876',
                '__typename': 'Comment',
                'commenter': {
                  'id': '2',
                  '__typename': 'Author',
                  'name': 'Nicole',
                }
              }
            ]
          }
        ]
      };

      final existingNormalizedMap = {...sharedNormalizedMap};

      final resultNormalizedMap = {
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'author': {'\$ref': 'Author:1'},
          'title': 'My awesome blog post',
          'comments': [
            {'\$ref': 'Comment:324'},
            {'\$ref': 'Comment:876'}
          ]
        },
        'Author:1': {
          'id': '1',
          '__typename': 'Author',
          'name': 'Paul',
        },
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
          'commenter': {'\$ref': 'Author:2'},
        },
        'Comment:876': {
          'id': '876',
          '__typename': 'Comment',
          'commenter': {'\$ref': 'Author:2'},
        },
        'Author:2': {
          'id': '2',
          '__typename': 'Author',
          'name': 'Nicole',
        }
      };

      normalizeOperation(
        data: response,
        document: query,
        read: (dataId) => existingNormalizedMap[dataId],
        write: (dataId, value) => existingNormalizedMap[dataId] = value,
        typePolicies: {
          'Post': queryPolicy,
        },
      );

      expect(existingNormalizedMap, equals(resultNormalizedMap));
    });
  });
}
