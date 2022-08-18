import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group('Named Fragments', () {
    final query = parseString('''
      query TestQuery {
        __typename
        posts {
          id
          __typename
          author {
            ...authorFragment
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

      fragment authorFragment on Author {
        id
        __typename
        ...personFragment
      }

      fragment personFragment on Person {
        name
      }
    ''');

    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeOperation(
          read: (dataId) async => normalizedResult[dataId],
          write: (dataId, value) async => normalizedResult[dataId] = value,
          document: query,
          data: sharedResponse,
          possibleTypes: {
            'Person': {'Author'}
          });

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });

    test('Produces correct nested data object', () async {
      expect(
        await denormalizeOperation(
            document: query,
            read: (dataId) async => sharedNormalizedMap[dataId],
            possibleTypes: {
              'Person': {'Author'}
            }),
        equals(sharedResponse),
      );
    });
  });
}
