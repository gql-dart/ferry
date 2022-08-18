import 'package:gql/language.dart';
import 'package:normalize/normalize.dart';
import 'package:normalize/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Root Fragments', () {
    final query = parseString('''
      fragment AuthorFragment on Query {
        __typename
        person {
          __typename
          id
          name
          age
        }
      }
    ''');
    final normalizedData = {
      'Person:1': {'__typename': 'Person', 'id': 1, 'name': 'Bob', 'age': null},
      'Query': {
        '__typename': 'Query',
        'person': {r'$ref': 'Person:1'}
      }
    };
    final data = {
      '__typename': 'Query',
      'person': {
        'id': 1,
        '__typename': 'Person',
        'name': 'Bob',
        'age': null,
      }
    };
    test('Produces correct normalized object', () async {
      final normalizedResult = {};
      await normalizeFragment(
        read: (dataId) async => normalizedResult[dataId],
        write: (dataId, value) async => normalizedResult[dataId] = value,
        document: query,
        data: data,
        possibleTypes: {
          'Person': {'Author'}
        },
        idFields: {},
      );

      expect(
        normalizedResult,
        equals(normalizedData),
      );
    });
    test('Produces correct denormalized object', () async {
      final result = await denormalizeFragment(
        read: (dataId) async => normalizedData[dataId],
        document: query,
        possibleTypes: {
          'Person': {'Author'}
        },
        idFields: {},
      );

      expect(
        result,
        equals(data),
      );
    });
    test('Validate Fragment', () async {
      await validateFragmentDataStructure(document: query, data: data);
    });
  });

  group('Nested root types', () {
    final document = parseString('''
          query Q {
            __typename
            name
            q {
              __typename
              age
            }
          }

        ''');
    final data = {
      '__typename': 'Query',
      'name': 'Bob',
      'q': {'__typename': 'Query', 'age': 31}
    };
    final normalizedData = {
      'Query': {
        '__typename': 'Query',
        'q': {r'$ref': 'Query'},
        'name': 'Bob',
        'age': 31
      }
    };
    test('Normalizes nested root types', () async {
      final normalized = {};
      await normalizeOperation(
        write: (key, data) async {
          normalized[key] = data;
        },
        read: (key) async => normalized[key],
        document: document,
        data: data,
      );
      expect(normalized, equals(normalizedData));
    });
    test('Denormalizes nested root types', () async {
      expect(
          await denormalizeOperation(
            read: (key) async => normalizedData[key],
            document: document,
          ),
          equals(data));
    });
    test('Validate Query', () async {
      await validateOperationDataStructure(document: document, data: data);
    });
  });
}
