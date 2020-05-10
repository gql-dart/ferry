import "package:test/test.dart";
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

void main() {
  group("Normalizing and denormalizing fragments", () {
    test("Simple fragment", () {
      final fragment = parseString("""
        fragment user on Author {
          id
          name
        }
      """);
      final data = {"id": "1", "name": "Paul"};

      final normalizedMap = {
        "Author:1": {"id": "1", "__typename": "Author", "name": "Paul"},
      };

      expect(
        denormalizeFragment(
          fragment: fragment,
          idFields: {"id": "1"},
          reader: (dataId) => normalizedMap[dataId],
        ),
        equals(data),
      );

      final normalizedResult = {};
      normalizeFragment(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        fragment: fragment,
        idFields: {"id": "1"},
        data: data,
      );
      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test("Nested entities", () {
      final fragment = parseString("""
        fragment commentData on Comment {
          id
          commenter {
            id
            __typename
            name
          }
        }
      """);

      final data = {
        "id": "324",
        "commenter": {"id": "2", "__typename": "Author", "name": "Nicole"}
      };

      final normalizedMap = {
        "Comment:324": {
          "id": "324",
          "__typename": "Comment",
          "commenter": {"\$ref": "Author:2"}
        },
        "Author:2": {"id": "2", "__typename": "Author", "name": "Nicole"}
      };

      expect(
        denormalizeFragment(
          fragment: fragment,
          idFields: {"id": "324"},
          reader: (dataId) => normalizedMap[dataId],
        ),
        equals(data),
      );

      final normalizedResult = {};
      normalizeFragment(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        fragment: fragment,
        idFields: {"id": "324"},
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test("Nested entities with addTypename", () {
      final fragment = parseString("""
        fragment commentData on Comment {
          id
          commenter {
            id
            name
          }
        }
      """);

      final data = {
        "id": "324",
        "__typename": "Comment",
        "commenter": {"id": "2", "__typename": "Author", "name": "Nicole"}
      };

      final normalizedMap = {
        "Comment:324": {
          "id": "324",
          "__typename": "Comment",
          "commenter": {"\$ref": "Author:2"}
        },
        "Author:2": {"id": "2", "__typename": "Author", "name": "Nicole"}
      };

      expect(
        denormalizeFragment(
          fragment: fragment,
          idFields: {"id": "324"},
          reader: (dataId) => normalizedMap[dataId],
          addTypename: true,
        ),
        equals(data),
      );

      final normalizedResult = {};
      normalizeFragment(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        fragment: fragment,
        idFields: {"id": "324"},
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });

    test("Multiple named fragment definitions", () {
      final fragment = parseString("""
        fragment user on Author {
          id
          name
        }
        
        fragment commentData on Comment {
          id
          commenter {
            id
            __typename
            name
          }
        }
      """);

      final data = {
        "id": "324",
        "commenter": {"id": "2", "__typename": "Author", "name": "Nicole"}
      };

      final normalizedMap = {
        "Comment:324": {
          "id": "324",
          "__typename": "Comment",
          "commenter": {"\$ref": "Author:2"}
        },
        "Author:2": {"id": "2", "__typename": "Author", "name": "Nicole"}
      };
      expect(
        denormalizeFragment(
          fragment: fragment,
          fragmentName: "commentData",
          idFields: {"id": "324"},
          reader: (dataId) => normalizedMap[dataId],
        ),
        equals(data),
      );

      final normalizedResult = {};
      normalizeFragment(
        writer: (dataId, value) => normalizedResult[dataId] = value,
        fragment: fragment,
        fragmentName: "commentData",
        idFields: {"id": "324"},
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });
  });
}
