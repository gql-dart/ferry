import "package:test/test.dart";
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';
import '../shared_data.dart';

void main() {
  group("Variables Object Simple", () {
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
          comments(a: { b: 1, c: "asd" }) {
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

    final normalizedMap = {
      "Query": {
        "posts": [
          {"\$ref": "Post:123"}
        ]
      },
      "Post:123": {
        "id": "123",
        "__typename": "Post",
        "author": {"\$ref": "Author:1"},
        "title": "My awesome blog post",
        'comments({"a":{"b":"1","c":"asd"}})': [
          {"\$ref": "Comment:324"}
        ]
      },
      "Author:1": {"id": "1", "__typename": "Author", "name": "Paul"},
      "Comment:324": {
        "id": "324",
        "__typename": "Comment",
        "commenter": {"\$ref": "Author:2"}
      },
      "Author:2": {"id": "2", "__typename": "Author", "name": "Nicole"}
    };

    test("Produces correct normalized object", () {
      final normalizedResult = {};
      normalize(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        query: query,
        data: sharedResponse,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test("Produces correct nested data object", () {
      expect(
        denormalize(
          query: query,
          reader: (dataId) => normalizedMap[dataId],
        ),
        equals(sharedResponse),
      );
    });
  });
}
