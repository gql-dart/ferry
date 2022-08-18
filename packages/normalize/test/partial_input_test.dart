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
        }
      ]
    };

Map<String, dynamic> get partialQueryData {
  final partial = fullQueryData;
  partial['posts'][0].remove('title');
  return partial;
}

const normalizedQueryData = {
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

void main() {
  group('normalizeOperation acceptPartialData behavior', () {
    test('Accepts partial data by default', () async {
      final normalizedResult = {};

      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: partialQueryData,
      );

      expect(
        normalizedResult,
        equals(normalizedQueryData),
      );
    });

    test('Rejects partial data when acceptPartialData=false', () async {
      final normalizedResult = {};

      await expectLater(
        () => normalizeOperation(
          read: (dataId) async => normalizedResult[dataId],
          write: (dataId, value) async => normalizedResult[dataId] = value,
          acceptPartialData: false,
          document: query,
          data: partialQueryData,
        ),
        throwsA(isA<PartialDataException>().having(
          (e) => e.path,
          'An accurate path',
          ['posts', 'title'],
        )),
      );
    });

    test('Accepts explicit null when acceptPartialData=false', () async {
      final normalizedResult = {};

      await normalizeOperation(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
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
    test('rejects partial data', () async {
      expect(
        await validateOperationDataStructure(
          handleException: true,
          document: query,
          data: partialQueryData,
        ),
        equals(false),
      );

      await expectLater(
        () => validateOperationDataStructure(
          document: query,
          data: partialQueryData,
        ),
        throwsA(isA<PartialDataException>().having(
          (e) => e.path,
          'An accurate path',
          ['posts', 'title'],
        )),
      );
    });

    test('accepts valid data', () async {
      expect(
        await validateOperationDataStructure(
          document: query,
          data: fullQueryData,
        ),
        equals(true),
      );
    });

    test('rejects null data', () async {
      await expectLater(
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

    test('rejects partial data', () async {
      final partialFragmentData = {
        'id': '123',
        '__typename': 'Post',
      };

      expect(
        await validateFragmentDataStructure(
          data: partialFragmentData,
          document: fragment,
          handleException: true,
        ),
        equals(false),
      );

      await expectLater(
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

    test('accepts valid data', () async {
      final fullFragmentData = {
        'id': '123',
        '__typename': 'Post',
        'title': null,
      };

      expect(
        await validateFragmentDataStructure(
          data: fullFragmentData,
          document: fragment,
        ),
        equals(true),
      );
    });
    test('rejects null data', () async {
      await expectLater(
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
