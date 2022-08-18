import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group('Multiple Operations', () {
    test('With operationName', () async {
      final query = parseString('''
        query FirstQuery {
          author {
            id
          }
        }
        query TestQuery {
          posts {
            id
            author {
              id
              name
            }
            title
            comments {
              id
              commenter {
                id
                name
              }
            }
          }
        }
      ''');

      expect(
        await denormalizeOperation(
          document: query,
          read: (dataId) async => sharedNormalizedMap[dataId],
          operationName: 'TestQuery',
          addTypename: true,
        ),
        equals(sharedResponse),
      );

      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        addTypename: true,
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: sharedResponse,
        operationName: 'TestQuery',
      );

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });

    test('Without operationName', () async {
      final query = parseString('''
        query TestQuery {
          posts {
            id
            author {
              id
              name
            }
            title
            comments {
              id
              commenter {
                id
                name
              }
            }
          }
        }

        query FirstQuery {
          author {
            id
          }
        }
      ''');
      expect(
        await denormalizeOperation(
          document: query,
          read: (dataId) async => sharedNormalizedMap[dataId],
          addTypename: true,
        ),
        equals(sharedResponse),
      );

      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        addTypename: true,
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: sharedResponse,
        operationName: 'TestQuery',
      );

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });
  });
}
