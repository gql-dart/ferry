import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group('Simple', () {
    final query = parseString('''
      query TestQuery {
        __typename
        posts {
          id
          __typename
          author {
            id
            __typename
            name
          }
          title
          comments {
            id
            __typename
            commenter {
              id
              __typename
              name
            }
          }
        }
      }
    ''');

    test('Produces correct normalized object', () {
      final normalizedResult = {};
      normalizeOperation(
        read: (dataId) => normalizedResult[dataId],
        write: (dataId, value) => normalizedResult[dataId] = value,
        document: query,
        data: sharedResponse,
      );

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });

    test('Produces correct nested data object', () {
      expect(
          denormalizeOperation(
            document: query,
            read: (dataId) => sharedNormalizedMap[dataId],
          ),
          equals(sharedResponse));
    });
  });
}
