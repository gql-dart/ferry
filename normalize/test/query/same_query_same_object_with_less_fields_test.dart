import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

class Store {
  final Map<String, dynamic> _data = {};

  dynamic get(String dataId) => _data[dataId];
  // irrelevant:
  //void put(String dataId, dynamic value) => _data[dataId] = value;
}

void main() {
  group('Same Object with less fields in the Same Operation', () {
    final query = parseString('''
      query TestQuery {
        post {
          id
          __typename
          title
        }
        samePostWithLessFields {
          id
          __typename
        }
      }
    ''');

    final data = {
      'post': {
        'id': '123',
        '__typename': 'Post',
        'title': 'My awesome blog post',
      },
      'samePostWithLessFields': {
        '__typename': 'Post',
        'id': '123',
      },
    };

    final normalizedMap = {
      'Query': {
        'post': {'\$ref': 'Post:123'},
        'samePostWithLessFields': {'\$ref': 'Post:123'},
      },
      'Post:123': {
        'id': '123',
        '__typename': 'Post',
        'title': 'My awesome blog post',
      }
    };

    test('Doesn\'t lose fields', () {
      // Reason why I use store to `read` is to demonstrate that the data is missing when write and read closures are un-synced.
      // the cache package use normalizeOperation like this, and so the data is missing fields as shown in this (currently) failing test
      final store = Store();
      final normalizedResult = {};
      normalizeOperation(
        read: (dataId) => store.get(dataId),
        write: (dataId, value) => normalizedResult[dataId] = value,
        document: query,
        data: data,
      );

      expect(
        normalizedResult,
        equals(normalizedMap),
      );
    });
  });
}
