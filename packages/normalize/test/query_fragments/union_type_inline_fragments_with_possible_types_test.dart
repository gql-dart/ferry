import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('Union Type Inline Fragments With Possible Types', () {
    final query = parseString('''
      query TestQuery {
        booksAndAuthors {
          id
          __typename
          ... on Book {
            title
          }
          ... on Author {
            name
          }
        }
      }
    ''');

    final data = {
      'booksAndAuthors': [
        {'id': '123', '__typename': 'Book', 'title': 'My awesome blog post'},
        {'id': '324', '__typename': 'Author', 'name': 'Nicole'}
      ]
    };

    final normalizedMap = {
      'Query': {
        'booksAndAuthors': [
          {'\$ref': 'Book:123'},
          {'\$ref': 'Author:324'}
        ]
      },
      'Book:123': {
        'id': '123',
        '__typename': 'Book',
        'title': 'My awesome blog post'
      },
      'Author:324': {'id': '324', '__typename': 'Author', 'name': 'Nicole'}
    };
    final possibleTypes = {
      'BookAndAuthor': {'Book', 'Author'}
    };
    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: data,
        possibleTypes: possibleTypes,
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
          possibleTypes: possibleTypes,
        ),
        equals(data),
      );
    });
  });
}
