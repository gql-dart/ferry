@TestOn('vm')

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:test/test.dart';
import 'test_utils.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
const _queryPath = '$_package|lib/queries.graphql';

const _schema = r'''
schema {
  query: Query
}

"""Root query docs."""
type Query {
  book(filter: BookFilter, genre: Genre): Book
}

"""Book docs."""
type Book {
  "Title docs."
  title: String!
}

"""Filter docs."""
input BookFilter {
  "Author docs."
  author: String
}

"""Genre docs."""
enum Genre {
  "Fiction docs."
  FICTION
}
''';

const _query = r'''
query BookById($filter: BookFilter, $genre: Genre) {
  book(filter: $filter, genre: $genre) {
    title
  }
}
''';

void main() {
  test('emits schema docs when enabled', () async {
    final assets = <String, String>{
      _schemaPath: _schema,
      _queryPath: _query,
    };

    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': _schemaPath,
        },
        'docs': {
          'enabled': true,
        },
      }),
    );

    final result = await testBuilder(
      builder,
      assets,
      rootPackage: _package,
      generateFor: {_queryPath, _schemaPath},
    );

    expect(result.succeeded, isTrue);

    final sources = extractGeneratedDartSources(result.readerWriter, _package);
    final dataPath = generatedDartAssetIdForInput(
      _package,
      'lib/queries.graphql',
      '.data.gql.dart',
    );
    final varsPath = generatedDartAssetIdForInput(
      _package,
      'lib/queries.graphql',
      '.var.gql.dart',
    );
    final schemaPath = generatedDartAssetIdForInput(
      _package,
      'lib/schema.graphql',
      '.schema.gql.dart',
    );

    final libraries = await resolveGeneratedLibraries(
      sources,
      [dataPath, varsPath, schemaPath],
      rootPackage: _package,
    );

    _expectDataDocs(libraries[dataPath]!);
    _expectVarsDocs(libraries[varsPath]!);
    _expectSchemaDocs(libraries[schemaPath]!);
  });
}

void _expectDataDocs(LibraryElement library) {
  final bookClass = library.getClass('GBookByIdData_book');
  expect(bookClass, isNotNull);
  expect(
    bookClass!.documentationComment,
    contains('Book docs.'),
  );
  final titleField =
      bookClass.fields.singleWhere((field) => field.name == 'title');
  expect(
    titleField.documentationComment,
    contains('Title docs.'),
  );
}

void _expectVarsDocs(LibraryElement library) {
  final varsClass = library.getClass('GBookByIdVars');
  expect(varsClass, isNotNull);
  final filterField =
      varsClass!.fields.singleWhere((field) => field.name == 'filter');
  final genreField =
      varsClass.fields.singleWhere((field) => field.name == 'genre');
  expect(filterField.documentationComment, contains('Filter docs.'));
  expect(genreField.documentationComment, contains('Genre docs.'));
}

void _expectSchemaDocs(LibraryElement library) {
  final enumElement = library.getEnum('GGenre');
  expect(enumElement, isNotNull);
  expect(enumElement!.documentationComment, contains('Genre docs.'));
  final fiction =
      enumElement.constants.singleWhere((value) => value.name == 'FICTION');
  expect(fiction.documentationComment, contains('Fiction docs.'));

  final inputElement = library.getClass('GBookFilter');
  expect(inputElement, isNotNull);
  expect(inputElement!.documentationComment, contains('Filter docs.'));
  final authorField =
      inputElement.fields.singleWhere((field) => field.name == 'author');
  expect(authorField.documentationComment, contains('Author docs.'));
}
