import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('Normalizing and denormalizing fragments', () {
    test('Simple fragment', () async {
      final fragment = parseString('''
        fragment user on Author {
          id
          name
        }
      ''');
      final data = {'id': '1', 'name': 'Paul'};

      final normalizedMap = {
        'Author:1': {'id': '1', '__typename': 'Author', 'name': 'Paul'},
      };

      expect(
        await denormalizeFragment(
          document: fragment,
          idFields: {'id': '1'},
          read: (dataId) async => normalizedMap[dataId],
        ),
        equals(data),
      );

      final normalizedResult = {};
      await normalizeFragment(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: fragment,
        idFields: {'id': '1'},
        data: data,
      );
      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Nested entities', () async {
      final fragment = parseString('''
        fragment commentData on Comment {
          id
          commenter {
            id
            __typename
            name
          }
        }
      ''');

      final data = {
        'id': '324',
        'commenter': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
      };

      final normalizedMap = {
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
          'commenter': {'\$ref': 'Author:2'}
        },
        'Author:2': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
      };

      expect(
        await denormalizeFragment(
          document: fragment,
          idFields: {'id': '324'},
          read: (dataId) async => normalizedMap[dataId],
        ),
        equals(data),
      );

      final normalizedResult = {};
      await normalizeFragment(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: fragment,
        idFields: {'id': '324'},
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Nested entities with addTypename', () async {
      final fragment = parseString('''
        fragment commentData on Comment {
          id
          commenter {
            id
            name
          }
        }
      ''');

      final data = {
        'id': '324',
        '__typename': 'Comment',
        'commenter': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
      };

      final normalizedMap = {
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
          'commenter': {'\$ref': 'Author:2'}
        },
        'Author:2': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
      };

      expect(
        await denormalizeFragment(
          document: fragment,
          idFields: {'id': '324'},
          read: (dataId) async => normalizedMap[dataId],
          addTypename: true,
        ),
        equals(data),
      );

      final normalizedResult = {};
      await normalizeFragment(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: fragment,
        idFields: {'id': '324'},
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Multiple named fragment definitions', () async {
      final fragment = parseString('''
        fragment user on Author {
          id
          name
        }
        
        fragment commentData on Comment {
          id
          commenter {
            id
            __typename
            name
          }
        }
      ''');

      final data = {
        'id': '324',
        'commenter': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
      };

      final normalizedMap = {
        'Comment:324': {
          'id': '324',
          '__typename': 'Comment',
          'commenter': {'\$ref': 'Author:2'}
        },
        'Author:2': {'id': '2', '__typename': 'Author', 'name': 'Nicole'}
      };
      expect(
        await denormalizeFragment(
          document: fragment,
          fragmentName: 'commentData',
          idFields: {'id': '324'},
          read: (dataId) async => normalizedMap[dataId],
        ),
        equals(data),
      );

      final normalizedResult = {};
      await normalizeFragment(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: fragment,
        fragmentName: 'commentData',
        idFields: {'id': '324'},
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Override __typename on denormalize', () async {
      final fragment = parseString('''
        fragment user on Author {
          id
          name
        }
      ''');
      final data = {'id': '1', 'name': 'Paul'};

      final normalizedMap = {
        'NotAuthor:1': {'id': '1', '__typename': 'Author', 'name': 'Paul'},
      };

      expect(
        await denormalizeFragment(
          document: fragment,
          idFields: {'id': '1', '__typename': 'NotAuthor'},
          read: (dataId) async => normalizedMap[dataId],
        ),
        equals(data),
      );
    });
  });
}
