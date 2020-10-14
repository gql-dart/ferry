import 'package:test/test.dart';
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

void main() {
  test('Accepts partial data by default', () {
    final normalizedResult = {};

    final data = {
      '__typename': 'Query',
      'posts': [
        {
          'id': '123',
          '__typename': 'Post',
        }
      ]
    };

    final query = parseString('''
      query TestQuery {
        posts {
          __typename
          id
          title
        }
      }
    ''');

    normalizeOperation(
      read: (dataId) => normalizedResult[dataId],
      write: (dataId, value) => normalizedResult[dataId] = value,
      document: query,
      data: data,
    );

    expect(
      normalizedResult,
      equals({
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'title': null,
        },
      }),
    );
  });

  test('Rejects partial data when acceptPartialData=false', () {
    final normalizedResult = {};

    final data = {
      '__typename': 'Query',
      'posts': [
        {
          'id': '123',
          '__typename': 'Post',
        }
      ]
    };

    final query = parseString('''
      query TestQuery {
        posts {
          id
          title
        }
      }
    ''');

    expect(
      () => normalizeOperation(
        read: (dataId) => normalizedResult[dataId],
        write: (dataId, value) => normalizedResult[dataId] = value,
        document: query,
        acceptPartialData: false,
        data: data,
      ),
      throwsA(isA<PartialDataException>().having(
        (e) => e.path,
        'An accurate path',
        ['posts', 'title'],
      )),
    );
  });

  test('Accepts explicit null when acceptPartialData=false', () {
    final normalizedResult = {};

    final data = {
      '__typename': 'Query',
      'posts': [
        {
          'id': '123',
          '__typename': 'Post',
          'title': null,
        }
      ]
    };

    final query = parseString('''
      query TestQuery {
        posts {
          id
          __typename
          title
        }
      }
    ''');

    normalizeOperation(
      read: (dataId) => normalizedResult[dataId],
      write: (dataId, value) => normalizedResult[dataId] = value,
      document: query,
      data: data,
      acceptPartialData: false,
    );

    expect(
      normalizedResult,
      equals({
        'Query': {
          'posts': [
            {'\$ref': 'Post:123'}
          ]
        },
        'Post:123': {
          'id': '123',
          '__typename': 'Post',
          'title': null,
        },
      }),
    );
  });
}
