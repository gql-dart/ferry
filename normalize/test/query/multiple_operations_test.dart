import "package:test/test.dart";
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group("Multiple Operations", () {
    test("With operationName", () {
      final query = parseString("""
        query FirstQuery {
          author {
            id
            __typename
          }
        }

        query TestQuery {
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
      """);

      expect(
        denormalize(
          query: query,
          reader: (dataId) => sharedNormalizedMap[dataId],
          operationName: "TestQuery",
          addTypename: true,
        ),
        equals(sharedResponse),
      );

      final normalizedResult = {};
      normalize(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        query: query,
        data: sharedResponse,
        operationName: "TestQuery",
      );

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });

    test("Without operationName", () {
      final query = parseString("""
        query TestQuery {
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

        query FirstQuery {
          author {
            id
            __typename
          }
        }
      """);
      expect(
        denormalize(
            query: query,
            reader: (dataId) => sharedNormalizedMap[dataId],
            addTypename: true),
        equals(sharedResponse),
      );

      final normalizedResult = {};
      normalize(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        query: query,
        data: sharedResponse,
        operationName: "TestQuery",
      );

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });
  });
}
