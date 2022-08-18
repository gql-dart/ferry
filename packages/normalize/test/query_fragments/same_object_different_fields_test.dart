import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group('Fragments With Same Object But Different Fields', () {
    final query = parseString('''
      query TestQuery {
        __typename
        posts {
          __typename
          id
          title
          comments {
            __typename
            id
              commenter {
              __typename
              id
              name
            }
          }
          ... PostAuthorVerboseFragment
          ... PostAuthorMinimalFragment
        }
      }
      fragment PostAuthorVerboseFragment on Post {
        __typename
        id
        author {
          __typename
          id
          name
        }
      }
      fragment PostAuthorMinimalFragment on Post {
        __typename
        id
        author {
          __typename
          id
        }
      }
    ''');

    test('Produces correct nested data object', () async {
      expect(
        await denormalizeOperation(
          document: query,
          read: (dataId) async => sharedNormalizedMap[dataId],
        ),
        equals(sharedResponse),
      );
    });
  });
}
