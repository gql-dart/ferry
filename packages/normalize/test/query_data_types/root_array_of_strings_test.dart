import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

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
