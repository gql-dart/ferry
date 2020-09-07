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

    test('can use custom read function on root field', () {
      final queryPolicy = TypePolicy(
        queryType: true,
        fields: {
          'posts': FieldPolicy(
            read: (existing, options) {
              final postRef = existing[0];
              expect(options.isReference(postRef), equals(true));
              final resolvedPost = options.resolveReference(postRef);
              final authorRef = resolvedPost['author'];
              expect(options.isReference(authorRef), equals(true));
              final resolvedAuthor = options.resolveReference(authorRef);
              return [
                {
                  'id': resolvedPost['id'],
                  '__typename': 'Post',
                  'author': {
                    ...resolvedAuthor,
                    'id': '456',
                  }
                },
              ];
            },
          )
        },
      );

      final denormalized = {
        '__typename': 'Query',
        'posts': [
          {
            'id': '123',
            '__typename': 'Post',
            'author': {
              'id': '456',
              '__typename': 'Author',
              'name': 'Paul',
            },
          }
        ]
      };

      expect(
          denormalizeOperation(
            document: query,
            read: (dataId) => sharedNormalizedMap[dataId],
            typePolicies: {
              'Query': queryPolicy,
            },
          ),
          equals(denormalized));
    });

    test('can use custom read function on child field', () {
      final postPolicy = TypePolicy(
        fields: {
          'title': FieldPolicy(
            read: (existing, options) => existing.toUpperCase(),
          )
        },
      );

      final denormalized = {
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
            'title': 'MY AWESOME BLOG POST',
            'comments': [
              {
                'id': '324',
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

      expect(
          denormalizeOperation(
            document: query,
            read: (dataId) => sharedNormalizedMap[dataId],
            typePolicies: {
              'Post': postPolicy,
            },
          ),
          equals(denormalized));
    });
  });
}
