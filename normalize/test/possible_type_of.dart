import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

void main() {
  group('Normalizing and denormalizing with possible type of', () {
    test('Mutiple fragments', () {
      final possibleTypeOf = {
        'Author': {'User'},
        'Audience': {'User'},
      };
      final document = parseString('''
        fragment FAudience on Audience {
          __typename
          id
          numHands
          isClapping
        }
        fragment FUser on User {
          id
          __typename
          name
        }
        query {
          users {
            ... on Author {
              __typename
              id
              isGoodAuthor
            }
            ...FAudience
            ...FUser
          }
        }
      ''');
      final data = {
        'users': [
          {
            '__typename': 'Author',
            'id': '1',
            'name': 'Knud',
            'isGoodAuthor': true,
          },
          {
            '__typename': 'Audience',
            'id': 'a',
            'name': 'Lars',
            'numHands': 2,
            'isClapping': false
          },
        ],
      };

      final normalizedMap = {
        'Author:1': {
          '__typename': 'Author',
          'id': '1',
          'name': 'Knud',
          'isGoodAuthor': true
        },
        'Audience:a': {
          '__typename': 'Audience',
          'id': 'a',
          'numHands': 2,
          'isClapping': false,
          'name': 'Lars'
        },
        'Query': {
          'users': [
            {r'$ref': 'Author:1'},
            {r'$ref': 'Audience:a'}
          ]
        },
      };
      final normalizedResult = {};
      normalizeOperation(
        read: (dataId) => normalizedResult[dataId],
        write: (dataId, value) => normalizedResult[dataId] = value,
        document: document,
        data: data,
        acceptPartialData: false,
        possibleTypeOf: possibleTypeOf,
      );
      expect(
        normalizedResult,
        equals(normalizedMap),
      );

      expect(
        denormalizeOperation(
          document: document,
          handleException: false,
          read: (dataId) => normalizedMap[dataId],
          possibleTypeOf: possibleTypeOf,
        ),
        equals(data),
      );
    });
  });
}
