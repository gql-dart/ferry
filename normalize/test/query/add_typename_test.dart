import "package:test/test.dart";
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group(
    "Add Typename",
    () {
      test(
        "Simple query",
        () {
          final query = parseString("""
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
          """);
          expect(
            denormalize(
              query: query,
              reader: (dataId) => sharedNormalizedMap[dataId],
              addTypename: true,
            ),
            equals(sharedResponse),
          );
        },
      );

      test(
        "Inline Fragments",
        () {
          final query = parseString("""
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
          """);
          expect(
            denormalize(
              query: query,
              reader: (dataId) => sharedNormalizedMap[dataId],
              addTypename: true,
            ),
            equals(sharedResponse),
          );
        },
      );

      test(
        "Fragment Definition",
        () {
          final query = parseString("""
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
          """);
          expect(
            denormalize(
              query: query,
              reader: (dataId) => sharedNormalizedMap[dataId],
              addTypename: true,
            ),
            equals(sharedResponse),
          );
        },
      );
    },
  );
}
