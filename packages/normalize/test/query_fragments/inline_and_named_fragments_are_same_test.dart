import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('Union Type Inline Fragments With Possible Types', () {
    final inlineFragmentQuery = parseString('''
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
    final namedFragmentQuery = parseString('''
      query TestQuery {
        booksAndAuthors {
          id
          __typename
          ...BookFragment
          ...AuthorFragment
        }
      }
      fragment BookFragment on Book {
        title
      }
      fragment AuthorFragment on Author {
        name
      }
    ''');

    final data = {
      'booksAndAuthors': [
        {'id': '123', '__typename': 'Book', 'title': 'My awesome blog post'},
        {'id': '324', '__typename': 'Author', 'name': 'Nicole'}
      ]
    };
    final dataDeserializedWithoutPossibleTypes = {
      'booksAndAuthors': [
        {
          'id': '123',
          '__typename': 'Book',
          'title': 'My awesome blog post',
        },
        {'id': '324', '__typename': 'Author', 'name': 'Nicole'}
      ]
    };

    final normalizedMapWithPossibleTypes = {
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
    final normalizedMapWithoutPossibleTypes = {
      'Query': {
        'booksAndAuthors': [
          {'\$ref': 'Book:123'},
          {'\$ref': 'Author:324'}
        ]
      },
      'Book:123': {
        'id': '123',
        '__typename': 'Book',
        'title': 'My awesome blog post',
      },
      'Author:324': {
        'id': '324',
        '__typename': 'Author',
        'name': 'Nicole',
      }
    };
    final possibleTypes = {
      'BookAndAuthor': {'Book', 'Author'}
    };
    test('Produces same normalized object with possible types', () async {
      final inlineNormalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => inlineNormalizedResult[dataId],
        write: (dataId, value) async => inlineNormalizedResult[dataId] = value,
        document: inlineFragmentQuery,
        data: data,
        possibleTypes: possibleTypes,
      );
      final namedFragmentNormalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => namedFragmentNormalizedResult[dataId],
        write: (dataId, value) async => namedFragmentNormalizedResult[dataId] = value,
        document: inlineFragmentQuery,
        data: data,
        possibleTypes: possibleTypes,
      );

      expect(
        inlineNormalizedResult,
        equals(namedFragmentNormalizedResult),
      );
      expect(
        inlineNormalizedResult,
        equals(normalizedMapWithPossibleTypes),
      );
    });
    test('Produces same normalized object without possible types', () async {
      final inlineNormalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => inlineNormalizedResult[dataId],
        write: (dataId, value) async => inlineNormalizedResult[dataId] = value,
        document: inlineFragmentQuery,
        data: data,
      );
      final namedFragmentNormalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => namedFragmentNormalizedResult[dataId],
        write: (dataId, value) async => namedFragmentNormalizedResult[dataId] = value,
        document: inlineFragmentQuery,
        data: data,
      );

      expect(
        inlineNormalizedResult,
        equals(namedFragmentNormalizedResult),
      );
      expect(
        inlineNormalizedResult,
        equals(normalizedMapWithoutPossibleTypes),
      );
    });

    test('Produces correct nested data object with possible types', () async {
      expect(
        await denormalizeOperation(
          document: inlineFragmentQuery,
          read: (dataId) async => normalizedMapWithPossibleTypes[dataId],
          possibleTypes: possibleTypes,
        ),
        equals(
          await denormalizeOperation(
            document: namedFragmentQuery,
            read: (dataId) async => normalizedMapWithPossibleTypes[dataId],
            possibleTypes: possibleTypes,
          ),
        ),
      );
      expect(
        await denormalizeOperation(
          document: inlineFragmentQuery,
          read: (dataId) async => normalizedMapWithPossibleTypes[dataId],
          possibleTypes: possibleTypes,
        ),
        equals(data),
      );
    });

    test('Produces correct nested data object without possible types', () async {
      expect(
        await denormalizeOperation(
          document: inlineFragmentQuery,
          read: (dataId) async => normalizedMapWithoutPossibleTypes[dataId],
        ),
        equals(
          await denormalizeOperation(
            document: namedFragmentQuery,
            read: (dataId) async => normalizedMapWithoutPossibleTypes[dataId],
          ),
        ),
      );
      expect(
        await denormalizeOperation(
          document: inlineFragmentQuery,
          read: (dataId) async => normalizedMapWithoutPossibleTypes[dataId],
        ),
        equals(dataDeserializedWithoutPossibleTypes),
      );
    });
  });
}
