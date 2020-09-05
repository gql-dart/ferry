import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

void main() {
  group('Root Array of Strings', () {
    final query = parseString('''
      query TestQuery {
        tags
      }
    ''');

    final data = {
      'tags': ['tag1', 'tag2', 'tag3']
    };

    final normalizedMap = {
      'Query': {
        'tags': ['tag1', 'tag2', 'tag3']
      }
    };

    test('Produces correct normalized object', () {
      final normalizedResult = {};
      normalize(
        merge: (dataId, value) =>
            (normalizedResult[dataId] ??= {}).addAll(value),
        query: query,
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test('Produces correct nested data object', () {
      expect(
        denormalize(
          query: query,
          read: (dataId) => normalizedMap[dataId],
        ),
        equals(data),
      );
    });
  });
}
