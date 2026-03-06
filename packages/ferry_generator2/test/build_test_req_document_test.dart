@TestOn('vm')

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:test/test.dart';
import 'test_utils.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
const _queryPath = '$_package|lib/queries.graphql';
const _reqPath = '$_package|lib/__generated__/queries.req.gql.dart';

const _schema = r'''
schema {
  query: Query
}

type Author {
  name: String!
}

type Book {
  title: String!
  author: Author!
}

type Query {
  books: [Book!]!
}
''';

const _document = r'''
fragment TitleFields on Book {
  title
}

fragment AuthorFields on Author {
  name
}

fragment TitleWithAuthor on Book {
  ...TitleFields
  author {
    ...AuthorFields
  }
}

query BooksA {
  books {
    ...TitleFields
  }
}

query BooksB {
  books {
    ...TitleWithAuthor
  }
}
''';

void main() {
  test('request documents include only needed definitions', () async {
    final assets = <String, String>{
      _schemaPath: _schema,
      _queryPath: _document,
    };

    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': _schemaPath,
        },
      }),
    );

    final result = await testBuilder(
      builder,
      assets,
      rootPackage: _package,
      generateFor: {_queryPath},
    );

    expect(result.succeeded, isTrue);

    final sources = extractGeneratedDartSources(result.readerWriter, _package);
    final documents = await _resolveRequestDocuments(sources);

    expect(
      documents['GBooksAReq'],
      unorderedEquals(<String>[
        'BooksA',
        'TitleFields',
      ]),
    );
    expect(
      documents['GBooksBReq'],
      unorderedEquals(<String>[
        'BooksB',
        'TitleWithAuthor',
        'TitleFields',
        'AuthorFields',
      ]),
    );
  });
}

Future<Map<String, Set<String>>> _resolveRequestDocuments(
  Map<String, String> sources,
) {
  return resolveSources(
    sources,
    (resolver) async {
      final library = await resolver.libraryFor(AssetId.parse(_reqPath));
      return {
        'GBooksAReq': _definitionNamesFor(
          library.getClass('GBooksAReq'),
        ),
        'GBooksBReq': _definitionNamesFor(
          library.getClass('GBooksBReq'),
        ),
      };
    },
    rootPackage: _package,
    readAllSourcesFromFilesystem: true,
  );
}

Set<String> _definitionNamesFor(ClassElement? element) {
  if (element == null) {
    throw StateError('Missing request class in resolved library');
  }
  final documentField =
      element.fields.singleWhere((field) => field.name == '_document');
  final documentValue = documentField.computeConstantValue();
  if (documentValue == null) {
    throw StateError('Failed to evaluate _document const value');
  }

  final definitionsValue = documentValue.getField('definitions');
  final definitions = definitionsValue?.toListValue();
  if (definitions == null) {
    throw StateError('Missing definitions in DocumentNode');
  }

  return definitions.map(_definitionName).toSet();
}

String _definitionName(DartObject definition) {
  final nameNode = definition.getField('name');
  final nameValue = nameNode?.getField('value')?.toStringValue();
  if (nameValue == null) {
    throw StateError('Definition is missing a name');
  }
  return nameValue;
}
