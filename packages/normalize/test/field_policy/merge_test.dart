import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('FetchPolicy.merge', () {
    test('can merge arrays on root field', () {
      final query = parseString('''
        query TestQuery {
          posts {
            id
          }
        }
      ''');

      final response = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '456',
            '__typename': 'Post',
          }
        ]
      };

      final existing = <String, dynamic>{
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
        },
      };

      final result = {
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
        },
        'Post:456': {
          'id': '456',
          '__typename': 'Post',
        },
      };

      normalizeOperation(
        addTypename: true,
        data: response,
        document: query,
        read: (dataId) => existing[dataId],
        write: (dataId, value) => existing[dataId] = value,
        typePolicies: {
          'Query': TypePolicy(
            queryType: true,
            fields: {
              'posts': FieldPolicy(
                merge: (existing, incoming, options) {
                  return [...existing ?? const [], ...incoming];
                },
              )
            },
          ),
        },
      );

      expect(existing, equals(result));
    });

    test('can merge arrays on child field', () {
      final query = parseString('''
        query TestQuery {
          posts {
            id
            comments {
              id
            }
          }
        }
      ''');

      const response = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '123',
            '__typename': 'Post',
            'comments': [
              {
                'id': '876',
                '__typename': 'Comment',
              }
            ]
          }
        ]
      };

      final existing = <String, dynamic>{
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'comments': [
            {'\$ref': 'Comment:324'},
          ]
        },
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
        },
      };

      const result = {
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'comments': [
            {'\$ref': 'Comment:324'},
            {'\$ref': 'Comment:876'}
          ]
        },
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
        },
        'Comment:876': {
          'id': '876',
          '__typename': 'Comment',
        },
      };

      normalizeOperation(
        addTypename: true,
        data: response,
        document: query,
        read: (dataId) => existing[dataId],
        write: (dataId, value) => existing[dataId] = value,
        typePolicies: {
          'Post': TypePolicy(
            fields: {
              'comments': FieldPolicy(
                merge: (existing, incoming, options) {
                  return [...existing ?? const [], ...incoming];
                },
              )
            },
          ),
        },
      );

      expect(existing, equals(result));
    });

    test('can replace data', () {
      final query = parseString('''
        query TestQuery {
          posts {
            id
            comments {
              id
            }
          }
        }
      ''');

      const response = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '123',
            '__typename': 'Post',
            'comments': [
              {
                'id': '876',
                '__typename': 'Comment',
              }
            ]
          }
        ]
      };

      final existing = {};

      const result = {
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'comments': [
            {
              'id': '876',
              '__typename': 'Comment',
            }
          ]
        },
        'Comment:876': {
          'id': '876',
          '__typename': 'Comment',
        },
      };

      normalizeOperation(
        addTypename: true,
        data: response,
        document: query,
        read: (dataId) => existing[dataId],
        write: (dataId, value) => existing[dataId] = value,
        typePolicies: {
          'Post': TypePolicy(
            fields: {
              'comments': FieldPolicy(
                merge: (_, incoming, options) {
                  return [options.readField(options.field, incoming[0])];
                },
              )
            },
          ),
        },
      );

      expect(existing, equals(result));
    });

    test('can merge maps', () {
      final query = parseString('''
      query PostAuthorWithName {
        posts {
          id
          author {
            name
          }
        }
      }
    ''');

      final response = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '123',
            '__typename': 'Post',
            'author': {
              '__typename': 'Author',
              'name': 'Paul',
            },
          }
        ]
      };

      final existing = <String, dynamic>{
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'author': {
            '__typename': 'Author',
            'age': '54',
          },
        },
      };

      final result = {
        'Query': {
          '__typename': 'Query',
          'posts': [
            {'\$ref': 'Post:123'},
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'author': {
            '__typename': 'Author',
            'age': '54',
            'name': 'Paul',
          },
        },
      };

      normalizeOperation(
        addTypename: true,
        data: response,
        document: query,
        read: (dataId) => existing[dataId],
        write: (dataId, value) => existing[dataId] = value,
        typePolicies: {
          'Post': TypePolicy(
            fields: {
              'author': FieldPolicy(
                merge: (existing, incoming, options) {
                  return <String, dynamic>{
                    ...existing ?? const {},
                    ...incoming
                  };
                },
              )
            },
          ),
        },
      );

      expect(existing, equals(result));
    });
  });
}
