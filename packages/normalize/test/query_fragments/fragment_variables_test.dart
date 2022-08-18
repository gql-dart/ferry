import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

void main() {
  group('Fragment Variables', () {
    final fragment = parseString('''
      fragment authorFragment on Author {
        id
        __typename
        posts(first: \$first) {
          id
        __typename
        }
      }
    ''');

    final normalizedMap = {
      'Post:123': {
        'id': 123,
        '__typename': 'Post',
      },
      'Author:1': {
        'id': 1,
        '__typename': 'Author',
        'posts({"first":10})': [
          {'\$ref': 'Post:123'}
        ]
      },
    };

    final response = {
      '__typename': 'Author',
      'id': 1,
      'posts': [
        {
          'id': 123,
          '__typename': 'Post',
        }
      ],
    };

    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeFragment(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: fragment,
        data: response,
        idFields: {'id': 1},
        variables: {'first': 10},
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Produces correct nested data object', () async {
      expect(
        await denormalizeFragment(
          document: fragment,
          read: (dataId) async => normalizedMap[dataId],
          variables: {'first': 10},
          idFields: {'id': 1},
        ),
        equals(response),
      );
    });
  });
}
