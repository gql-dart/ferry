import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:test/test.dart';

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

    test('Doesn\'t lose fields', () async {
      final normalizedResult = {};
      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
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
