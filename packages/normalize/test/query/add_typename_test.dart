import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

import '../shared_data.dart';

void main() {
  group(
    'Add Typename',
    () {
      test(
        'Simple query',
        () async {
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
            document: query,
            data: sharedResponse,
            write: (dataId, value) async => normalizedResult[dataId] = value,
          );

          expect(
            normalizedResult,
            equals(sharedNormalizedMap),
          );
        },
      );

      test(
        'Inline Fragments',
        () async {
          final query = parseString('''
            query TestQuery {
              posts {
                id
                author {
                  ...on Author {
                    id
                    name
                  }
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
              addTypename: true,
            ),
            equals(sharedResponse),
          );

          final normalizedResult = {};
          await normalizeOperation(
            read: (dataId) async => normalizedResult[dataId],
            addTypename: true,
            document: query,
            data: sharedResponse,
            write: (dataId, value) async => normalizedResult[dataId] = value,
          );

          expect(
            normalizedResult,
            equals(sharedNormalizedMap),
          );
        },
      );

      test(
        'Fragment Definition',
        () async {
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
                  ...commentsFragment
                }
              }
            }
          
            fragment commentsFragment on Comment {
              id
              commenter {
                id
                name
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
            document: query,
            data: sharedResponse,
            write: (dataId, value) async => normalizedResult[dataId] = value,
          );

          expect(
            normalizedResult,
            equals(sharedNormalizedMap),
          );
        },
      );
    },
  );
}
