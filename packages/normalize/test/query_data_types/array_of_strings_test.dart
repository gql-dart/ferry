import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('Array of Strings', () {
    final query = parseString('''
      query TestQuery {
        posts {
          id
          __typename
          tags
        }
      }
    ''');

    final data = {
      'posts': [
        {
          'id': '123',
          '__typename': 'Post',
          'tags': ['olle', 'kalle']
        }
      ]
    };

    final normalizedMap = {
      'Query': {
        'posts': [
          {'\$ref': 'Post:123'}
        ]
      },
      'Post:123': {
        'id': '123',
        '__typename': 'Post',
        'tags': ['olle', 'kalle']
      }
    };

    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: data,
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
        ),
        equals(data),
      );
    });
  });
}
