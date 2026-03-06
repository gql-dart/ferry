@TestOn('vm')

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:test/test.dart';
import 'test_utils.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
const _queryPath = '$_package|lib/query.graphql';
final _schemaOut = generatedDartAssetIdForInput(
  _package,
  _schemaPath,
  '.schema.gql.dart',
);
final _varsOut =
    generatedDartAssetIdForInput(_package, _queryPath, '.var.gql.dart');

const _schema = r'''
schema {
  query: Query
}

input DuplicateNullChecksInput {
  nullableText: String
}

type Query {
  duplicateNullChecks(input: DuplicateNullChecksInput): String
}
''';

const _query = r'''
query DuplicateNullChecks($nullableText: String) {
  duplicateNullChecks(input: {nullableText: $nullableText})
}
''';

void main() {
  test('schema and vars toJson avoid UNNECESSARY_NULL_COMPARISON', () async {
    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': _schemaPath,
          'add_typenames': false,
        },
        'vars': {
          'tristate_optionals': false,
        },
        'outputs': {
          'ast': false,
          'data': false,
          'vars': true,
          'req': false,
          'schema': true,
        },
      }),
    );

    final result = await testBuilder(
      builder,
      {
        _schemaPath: _schema,
        _queryPath: _query,
      },
      rootPackage: _package,
      generateFor: {
        _schemaPath,
        _queryPath,
      },
    );

    final sources = extractGeneratedDartSources(result.readerWriter, _package);
    final libraries = await resolveGeneratedLibraries(
      sources,
      {
        _schemaOut,
        _varsOut,
      },
      rootPackage: _package,
    );
    for (final library in libraries.values) {
      final diagnostics = await _diagnosticsForLibrary(library);
      final nullComparisonWarnings = diagnostics
          .where(
            (diagnostic) =>
                diagnostic.diagnosticCode.name == 'UNNECESSARY_NULL_COMPARISON',
          )
          .toList();

      expect(
        nullComparisonWarnings,
        isEmpty,
        reason:
            'Expected nullable-input toJson generation to avoid UNNECESSARY_NULL_COMPARISON.',
      );
    }
  });
}

Future<List<Diagnostic>> _diagnosticsForLibrary(LibraryElement library) async {
  final sourcePath = library.firstFragment.source.fullName;
  final result = await library.session.getErrors(sourcePath);
  if (result is! ErrorsResult) return const <Diagnostic>[];
  return result.diagnostics;
}
