import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart';
import 'package:test/test.dart';

Map<String, dynamic> get fullQueryData => {
      '__typename': 'Query',
      'posts': [
        {
          'id': '123',
          '__typename': 'Post',
          'title': null,
        },
        {
          'id': '1234',
          '__typename': 'Post',
          'title': null,
        }
      ],
      'onePost': {
        'id': '123',
        '__typename': 'Post',
        'title': null,
      }
    };

Map<String, dynamic> get partialPostsQueryData {
  final partial = fullQueryData;
  partial['posts'][0].remove('title');
  return partial;
}

Map<String, dynamic> get partialOnePostQueryData {
  final partial = fullQueryData;
  partial['onePost'].remove('title');
  return partial;
}

const normalizedQueryData = {
  'Query': {
    'posts': [
      {'\$ref': 'Post:123'},
      {'\$ref': 'Post:1234'}
    ],
    'onePost': {'\$ref': 'Post:123'}
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
    'title': null,
  },
  'Post:1234': {
    'id': '1234',
    '__typename': 'Post',
    'title': null,
  },
};

final query = parseString('''
      query TestQuery {
        posts {
          __typename
          id
          title
        }
        onePost {
          __typename
          id
          title
        }
      }
    ''');

void main() {
  group('normalizeOperation acceptPartialData behavior', () {
    test('Accepts partial data by default', () {
      final normalizedResult = {};

      normalizeOperation(
        read: (dataId) => normalizedResult[dataId],
        write: (dataId, value) => normalizedResult[dataId] = value,
        document: query,
        data: partialPostsQueryData,
      );

      expect(
        normalizedResult,
        equals(normalizedQueryData),
      );
    });

    test('Rejects partial data when acceptPartialData=false', () {
      final normalizedResult = {};

      expect(
        () => normalizeOperation(
          read: (dataId) => normalizedResult[dataId],
          write: (dataId, value) => normalizedResult[dataId] = value,
          acceptPartialData: false,
          document: query,
          data: partialPostsQueryData,
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

      normalizeOperation(
        read: (dataId) => normalizedResult[dataId],
        write: (dataId, value) => normalizedResult[dataId] = value,
        acceptPartialData: false,
        document: query,
        data: fullQueryData,
      );

      expect(
        normalizedResult,
        equals(normalizedQueryData),
      );
    });
  });

  group('validateOperationDataStructure', () {
    test('rejects partial data', () {
      expect(
        validateOperationDataStructure(
          handleException: true,
          document: query,
          data: partialOnePostQueryData,
        ),
        equals(false),
      );

      expect(
        () => validateOperationDataStructure(
          document: query,
          data: partialOnePostQueryData,
        ),
        throwsA(isA<PartialDataException>().having(
          (e) => e.path,
          'An accurate path',
          const ['onePost', 'title'],
        )),
      );
    });

    test('accepts valid data', () {
      expect(
        validateOperationDataStructure(
          document: query,
          data: fullQueryData,
        ),
        equals(true),
      );
    });

    test('rejects null data', () {
      expect(
        () => validateOperationDataStructure(data: null, document: query),
        throwsA(isA<PartialDataException>().having(
          (e) => e.path,
          'An empty path',
          [],
        )),
      );
    });
  });

  group('validateFragmentDataStructure', () {
    final fragment = parseString('''
      fragment foo on Post {
          id
          title
      }
    ''');

    test('rejects partial data', () {
      final partialFragmentData = {
        'id': '123',
        '__typename': 'Post',
      };

      expect(
        validateFragmentDataStructure(
          data: partialFragmentData,
          document: fragment,
          handleException: true,
        ),
        equals(false),
      );

      expect(
        () => validateFragmentDataStructure(
          data: partialFragmentData,
          document: fragment,
        ),
        throwsA(isA<PartialDataException>().having(
          (e) => e.path,
          'An accurate path',
          ['title'],
        )),
      );
    });

    test('accepts valid data', () {
      final fullFragmentData = {
        'id': '123',
        '__typename': 'Post',
        'title': null,
      };

      expect(
        validateFragmentDataStructure(
          data: fullFragmentData,
          document: fragment,
        ),
        equals(true),
      );
    });
    test('rejects null data', () {
      expect(
        () => validateFragmentDataStructure(data: null, document: fragment),
        throwsA(isA<PartialDataException>().having(
          (e) => e.path,
          'An empty path',
          [],
        )),
      );
    });
  });
}
