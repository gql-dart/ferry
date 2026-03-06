@TestOn('vm')

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:test/test.dart';
import 'test_utils.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
final _schemaOut = generatedDartAssetIdForInput(
  _package,
  _schemaPath,
  '.schema.gql.dart',
);

const _schema = r'''
schema {
  query: Query
}

directive @oneOf on INPUT_OBJECT

input ColorInput {
  red: Int!
}

input SearchBy @oneOf {
  id: ID
  tags: [String]
  color: ColorInput
  switch: String
}

type Query {
  dummy(by: SearchBy!): String
}
''';

void main() {
  test('@oneOf input objects generate sealed sum types', () async {
    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': _schemaPath,
          'add_typenames': false,
        },
        'data_classes': {
          'utils': {
            'equals': true,
            'hash_code': true,
          },
        },
        'outputs': {
          'ast': false,
          'data': false,
          'vars': false,
          'req': false,
          'schema': true,
        },
        'collections': {
          'mode': 'unmodifiable',
        },
      }),
    );

    final result = await testBuilder(
      builder,
      {_schemaPath: _schema},
      rootPackage: _package,
      generateFor: {_schemaPath},
    );
    final sources = extractGeneratedDartSources(result.readerWriter, _package);

    final libraries = await resolveGeneratedLibraries(
      sources,
      {_schemaOut},
      rootPackage: _package,
    );
    final library = libraries[_schemaOut]!;

    await _expectLibraryNoErrors(library);

    final base = _classByName(library, 'GSearchBy');
    expect(base.isSealed, isTrue);
    expect(base.isAbstract, isTrue);

    final variantId = _classByName(library, 'GSearchBy_id');
    expect(variantId.supertype?.element.name, 'GSearchBy');
    _expectNonNullDartType(variantId.getField('id')!.type, 'String');

    final variantTags = _classByName(library, 'GSearchBy_tags');
    expect(variantTags.supertype?.element.name, 'GSearchBy');
    _expectListType(
      variantTags.getField('tags')!.type,
      elementName: 'String',
      elementNullable: true,
      listNullable: false,
    );

    final variantSwitch = _classByName(library, 'GSearchBy_Gswitch');
    expect(variantSwitch.supertype?.element.name, 'GSearchBy');
    _expectNonNullDartType(variantSwitch.getField('Gswitch')!.type, 'String');

    final color = _classByName(library, 'GColorInput');
    expect(color.getMethod('=='), isNotNull);
    expect(color.getGetter('hashCode'), isNotNull);

    final source = readGeneratedDartSource(sources, _schemaOut);
    expect(
      source,
      contains('throw ArgumentError.value(json,'),
      reason: 'fromJson should validate the oneOf shape.',
    );
    expect(
      source,
      contains(r'final _$entry = json.entries.single'),
      reason: 'fromJson should read the single oneOf entry once.',
    );
    expect(
      source,
      contains(r'switch (_$entry.key)'),
      reason: 'fromJson should dispatch by key using a switch statement.',
    );
    expect(
      source,
      contains('tags = List.unmodifiable(tags)'),
      reason:
          'oneOf variants should wrap list values when collections are unmodifiable.',
    );
    expect(
      source,
      contains("schema.utils.gql.dart'"),
      reason: 'Schema library should import utils when equals/hashCode are on.',
    );
    expect(
      source,
      contains('as _gqlUtils'),
      reason: 'Schema library should import utils when equals/hashCode are on.',
    );
    expect(
      source,
      contains('_gqlUtils.deepEquals(toJson(), other.toJson())'),
      reason: 'Input objects should implement equality when enabled.',
    );
    expect(
      source,
      contains('_gqlUtils.deepHash(toJson())'),
      reason: 'Input objects should implement hashCode when enabled.',
    );
  });
}

Future<void> _expectLibraryNoErrors(LibraryElement library) async {
  final sourcePath = library.firstFragment.source.fullName;
  final result = await library.session.getErrors(sourcePath);
  if (result is! ErrorsResult) return;
  final errors = result.diagnostics
      .where(
        (diagnostic) =>
            diagnostic.diagnosticCode.severity == DiagnosticSeverity.ERROR,
      )
      .toList();
  expect(errors, isEmpty, reason: errors.join('\n'));
}

ClassElement _classByName(LibraryElement library, String name) {
  return library.classes.firstWhere((element) => element.name == name);
}

void _expectNonNullDartType(DartType type, String name) {
  expect(type.nullabilitySuffix, NullabilitySuffix.none);
  final interfaceType = type as InterfaceType;
  expect(interfaceType.element.name, name);
}

void _expectListType(
  DartType type, {
  required String elementName,
  required bool elementNullable,
  required bool listNullable,
}) {
  final listType = type as InterfaceType;
  expect(listType.element.name, 'List');
  expect(
    listType.nullabilitySuffix,
    listNullable ? NullabilitySuffix.question : NullabilitySuffix.none,
  );

  final elementType = listType.typeArguments.single;
  final elementInterface = elementType as InterfaceType;
  expect(elementInterface.element.name, elementName);
  expect(
    elementType.nullabilitySuffix,
    elementNullable ? NullabilitySuffix.question : NullabilitySuffix.none,
  );
}
