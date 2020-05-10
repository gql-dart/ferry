import "package:test/test.dart";
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group("Alias", () {
    final query = parseString("""
      query TestQuery {
        posts {
          id
          __typename
          olle: author {
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

    final data = {
      "posts": [
        {
          "id": "123",
          "__typename": "Post",
          "olle": {"id": "1", "__typename": "Author", "name": "Paul"},
          "title": "My awesome blog post",
          "comments": [
            {
              "id": "324",
              "__typename": "Comment",
              "commenter": {"id": "2", "__typename": "Author", "name": "Nicole"}
            }
          ]
        }
      ]
    };

    test("Produces correct normalized object", () {
      final normalizedResult = {};
      normalize(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        query: query,
        data: data,
      );

      expect(
        normalizedResult,
        equals(sharedNormalizedMap),
      );
    });

    test("Produces correct nested data object", () {
      expect(
        denormalize(
          query: query,
          reader: (dataId) => sharedNormalizedMap[dataId],
        ),
        equals(data),
      );
    });
  });
}
