@TestOn('vm')

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:test/test.dart';
import 'test_utils.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
const _fragmentPath = '$_package|lib/fragments.graphql';
const _queryPath = '$_package|lib/queries.graphql';

const _fragmentDataPath = '$_package|lib/__generated__/fragments.data.gql.dart';
const _queryVarPath = '$_package|lib/__generated__/queries.var.gql.dart';
const _queryReqPath = '$_package|lib/__generated__/queries.req.gql.dart';

const _schema = r'''
schema {
  query: Query
}

interface Author {
  displayName: String!
}

type Person implements Author {
  displayName: String!
  firstName: String!
  lastName: String!
}

type Company implements Author {
  displayName: String!
  name: String!
}

interface Book {
  title: String!
  author: Author!
  tagMatrix: [[String!]!]!
  relatedBooks: [[Book!]!]!
}

type Textbook implements Book {
  title: String!
  author: Author!
  courses: [String!]!
  tagMatrix: [[String!]!]!
  relatedBooks: [[Book!]!]!
}

type ColoringBook implements Book {
  title: String!
  author: Author!
  colors: [String!]!
  tagMatrix: [[String!]!]!
  relatedBooks: [[Book!]!]!
}

input BookFilter {
  author: String
  tagIds: [ID!]
}

type Query {
  books: [Book!]!
  book(id: ID, filter: BookFilter): Book
}
''';

const _fragments = r'''
fragment AuthorFragment on Author {
  displayName
  ... on Person {
    firstName
    lastName
  }
  ... on Company {
    name
  }
}

fragment BookFragment on Book {
  author {
    ...AuthorFragment
  }
  title
  tagMatrix
  relatedBooks {
    title
    author {
      ...AuthorFragment
    }
  }
  ... on Textbook {
    courses
  }
  ... on ColoringBook {
    colors
  }
}
''';

const _queries = r'''
#import "fragments.graphql"

query Books {
  books {
    ...BookFragment
  }
}

query BookById($id: ID, $filter: BookFilter) {
  book(id: $id, filter: $filter) {
    ...BookFragment
  }
}
''';

class _Scenario {
  final String name;
  final Map<String, Object?> config;
  final bool expectTristate;
  final bool expectWhenExtensions;
  final bool expectUnmodifiable;

  const _Scenario({
    required this.name,
    required this.config,
    required this.expectTristate,
    required this.expectWhenExtensions,
    required this.expectUnmodifiable,
  });
}

class _ResolvedLibraries {
  final LibraryElement fragmentsData;
  final LibraryElement vars;
  final LibraryElement req;

  const _ResolvedLibraries({
    required this.fragmentsData,
    required this.vars,
    required this.req,
  });
}

class _ScenarioResult {
  final Map<String, String> sources;
  final _ResolvedLibraries libraries;

  const _ScenarioResult({
    required this.sources,
    required this.libraries,
  });
}

void main() {
  final scenarios = <_Scenario>[
    _Scenario(
      name: 'tristate + when + plain collections',
      config: _scenarioConfig(
        tristate: true,
        whenExtensions: true,
        collectionsMode: 'plain',
      ),
      expectTristate: true,
      expectWhenExtensions: true,
      expectUnmodifiable: false,
    ),
    _Scenario(
      name: 'tristate + when + unmodifiable collections',
      config: _scenarioConfig(
        tristate: true,
        whenExtensions: true,
        collectionsMode: 'unmodifiable',
      ),
      expectTristate: true,
      expectWhenExtensions: true,
      expectUnmodifiable: true,
    ),
    _Scenario(
      name: 'no tristate + plain collections',
      config: _scenarioConfig(
        tristate: false,
        whenExtensions: false,
        collectionsMode: 'plain',
      ),
      expectTristate: false,
      expectWhenExtensions: false,
      expectUnmodifiable: false,
    ),
    _Scenario(
      name: 'no tristate + unmodifiable collections',
      config: _scenarioConfig(
        tristate: false,
        whenExtensions: false,
        collectionsMode: 'unmodifiable',
      ),
      expectTristate: false,
      expectWhenExtensions: false,
      expectUnmodifiable: true,
    ),
  ];

  for (final scenario in scenarios) {
    test('analysis: ${scenario.name}', () async {
      final result = await _runScenario(scenario);
      await _expectNoErrors(result.libraries);

      _expectIssue610Typing(result.libraries.fragmentsData);
      _expectNestedListTypes(result.libraries.fragmentsData);
      _expectWhenExtensions(
        result.libraries.fragmentsData,
        expectWhenExtensions: scenario.expectWhenExtensions,
      );
      _expectVarTypes(
        result.libraries.vars,
        expectTristate: scenario.expectTristate,
      );
      _expectReqGenerics(result.libraries.req);
      _expectDataToJsonSignature(result.libraries.req);
      _expectReqDocumentDefinitions(result.libraries.req);
      final dataSource = readGeneratedDartSource(
        result.sources,
        _fragmentDataPath,
      );
      final varsSource = readGeneratedDartSource(
        result.sources,
        _queryVarPath,
      );
      _expectUnmodifiableCollections(
        dataSource,
        varsSource,
        expectUnmodifiable: scenario.expectUnmodifiable,
      );
    });
  }
}

Map<String, Object?> _baseConfig() {
  return <String, Object?>{
    'schema': {
      'file': _schemaPath,
      'add_typenames': true,
    },
  };
}

Map<String, Object?> _scenarioConfig({
  required bool tristate,
  required bool whenExtensions,
  required String collectionsMode,
}) {
  final config = _baseConfig();
  config['vars'] = {
    'tristate_optionals': tristate,
  };
  if (whenExtensions) {
    config['data_classes'] = {
      'when_extensions': {
        'when': true,
        'maybe_when': true,
      },
    };
  }
  config['collections'] = {
    'mode': collectionsMode,
  };
  return config;
}

Future<_ScenarioResult> _runScenario(_Scenario scenario) async {
  final sources = await _runBuilder(scenario.config);
  final libraries = await _resolveGeneratedLibraries(sources);
  return _ScenarioResult(sources: sources, libraries: libraries);
}

Future<Map<String, String>> _runBuilder(Map<String, Object?> config) async {
  final sourceAssets = <String, String>{
    _schemaPath: _schema,
    _fragmentPath: _fragments,
    _queryPath: _queries,
  };

  final builder =
      graphqlBuilder(BuilderOptions(config.cast<String, dynamic>()));

  final result = await testBuilder(
    builder,
    sourceAssets,
    rootPackage: _package,
    generateFor: {
      _schemaPath,
      _fragmentPath,
      _queryPath,
    },
  );

  return extractGeneratedDartSources(result.readerWriter, _package);
}

Future<_ResolvedLibraries> _resolveGeneratedLibraries(
  Map<String, String> sources,
) async {
  return resolveSources(
    sources,
    (resolver) async {
      final fragmentsData = await resolver.libraryFor(
        AssetId.parse(_fragmentDataPath),
      );
      final vars = await resolver.libraryFor(AssetId.parse(_queryVarPath));
      final req = await resolver.libraryFor(AssetId.parse(_queryReqPath));
      return _ResolvedLibraries(
        fragmentsData: fragmentsData,
        vars: vars,
        req: req,
      );
    },
    rootPackage: _package,
    readAllSourcesFromFilesystem: true,
  );
}

Future<void> _expectNoErrors(_ResolvedLibraries libraries) async {
  await _expectLibraryNoErrors(libraries.fragmentsData);
  await _expectLibraryNoErrors(libraries.vars);
  await _expectLibraryNoErrors(libraries.req);
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

void _expectIssue610Typing(LibraryElement library) {
  final classNames = library.classes.map((element) => element.name).toSet();
  expect(classNames.contains('GBookFragmentData__asPerson'), isFalse);
  expect(classNames.contains('GBookFragmentData__asCompany'), isFalse);

  final authorBase = _classByName(library, 'GAuthorFragmentData');
  expect(authorBase.isSealed, isTrue);

  final authorPerson = _classByName(library, 'GAuthorFragmentData__asPerson');
  expect(authorPerson.supertype?.element.name, 'GAuthorFragmentData');

  final authorCompany = _classByName(library, 'GAuthorFragmentData__asCompany');
  expect(authorCompany.supertype?.element.name, 'GAuthorFragmentData');

  final authorUnknown = _classByName(library, 'GAuthorFragmentData__unknown');
  expect(authorUnknown.supertype?.element.name, 'GAuthorFragmentData');

  final bookBase = _classByName(library, 'GBookFragmentData');
  expect(bookBase.isSealed, isTrue);

  final authorField = bookBase.getField('author');
  expect(authorField, isNotNull);
  _expectInterfaceType(
    authorField!.type,
    name: 'GAuthorFragmentData',
    nullable: false,
  );

  final bookUnknown = _classByName(library, 'GBookFragmentData__unknown');
  expect(bookUnknown.supertype?.element.name, 'GBookFragmentData');
}

void _expectNestedListTypes(LibraryElement library) {
  final bookBase = _classByName(library, 'GBookFragmentData');
  final tagField = bookBase.getField('tagMatrix');
  final relatedField = bookBase.getField('relatedBooks');
  expect(tagField, isNotNull);
  expect(relatedField, isNotNull);

  _expectNestedListType(
    tagField!.type,
    innerName: 'String',
    nullable: false,
  );
  _expectNestedListType(
    relatedField!.type,
    innerName: 'GBookFragmentData_relatedBooks',
    nullable: false,
  );
}

void _expectWhenExtensions(
  LibraryElement library, {
  required bool expectWhenExtensions,
}) {
  final extensionNames =
      library.extensions.map((element) => element.name).toSet();
  if (expectWhenExtensions) {
    expect(extensionNames, contains('GAuthorFragmentDataWhenExtension'));
    expect(extensionNames, contains('GBookFragmentDataWhenExtension'));
  } else {
    expect(
      extensionNames.contains('GAuthorFragmentDataWhenExtension'),
      isFalse,
    );
    expect(
      extensionNames.contains('GBookFragmentDataWhenExtension'),
      isFalse,
    );
  }
}

void _expectVarTypes(
  LibraryElement library, {
  required bool expectTristate,
}) {
  final varsClass = _classByName(library, 'GBookByIdVars');
  final idField = varsClass.getField('id');
  final filterField = varsClass.getField('filter');
  expect(idField, isNotNull);
  expect(filterField, isNotNull);

  if (expectTristate) {
    _expectValueType(idField!.type, innerName: 'String');
    _expectValueType(filterField!.type, innerName: 'GBookFilter');
  } else {
    _expectNullableInterfaceType(idField!.type, name: 'String');
    _expectNullableInterfaceType(filterField!.type, name: 'GBookFilter');
  }
}

void _expectReqGenerics(LibraryElement library) {
  final reqClass = _classByName(library, 'GBookByIdReq');
  final opInterface = reqClass.interfaces.firstWhere(
    (interfaceType) => interfaceType.element.name == 'OperationRequest',
  );
  expect(opInterface.typeArguments.length, 2);
  _expectInterfaceType(
    opInterface.typeArguments[0],
    name: 'GBookByIdData',
    nullable: false,
  );
  _expectInterfaceType(
    opInterface.typeArguments[1],
    name: 'GBookByIdVars',
    nullable: false,
  );
}

void _expectDataToJsonSignature(LibraryElement library) {
  final reqClass = _classByName(library, 'GBookByIdReq');
  final method = reqClass.getMethod('dataToJson');
  expect(method, isNotNull);
  final parameter = method!.formalParameters.single;
  final type = parameter.type;
  _expectInterfaceType(type, name: 'GBookByIdData', nullable: false);
}

void _expectReqDocumentDefinitions(LibraryElement library) {
  final booksDefs = _reqDefinitionNames(library, 'GBooksReq');
  final booksExpected = {
    'AuthorFragment',
    'BookFragment',
    'Books',
  };
  expect(
    booksDefs.toSet(),
    booksExpected,
  );
  expect(booksDefs.length, booksExpected.length);

  final bookByIdDefs = _reqDefinitionNames(library, 'GBookByIdReq');
  final bookByIdExpected = {
    'AuthorFragment',
    'BookFragment',
    'BookById',
  };
  expect(
    bookByIdDefs.toSet(),
    bookByIdExpected,
  );
  expect(bookByIdDefs.length, bookByIdExpected.length);
}

void _expectUnmodifiableCollections(
  String dataSource,
  String varsSource, {
  required bool expectUnmodifiable,
}) {
  final dataUnit = parseString(content: dataSource).unit;
  final varsUnit = parseString(content: varsSource).unit;
  final hasUnmodifiable = _containsUnmodifiableInvocation(dataUnit) ||
      _containsUnmodifiableInvocation(varsUnit);
  expect(hasUnmodifiable, expectUnmodifiable);
}

bool _containsUnmodifiableInvocation(CompilationUnit unit) {
  final visitor = _UnmodifiableInvocationVisitor();
  unit.visitChildren(visitor);
  return visitor.found;
}

class _UnmodifiableInvocationVisitor extends RecursiveAstVisitor<void> {
  bool found = false;

  @override
  void visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == 'unmodifiable') {
      found = true;
    }
    super.visitMethodInvocation(node);
  }
}

List<String> _reqDefinitionNames(
  LibraryElement library,
  String reqClassName,
) {
  final reqClass = _classByName(library, reqClassName);
  final documentField = reqClass.fields.firstWhere(
    (field) => field.name == '_document',
  );
  final documentValue = documentField.computeConstantValue();
  if (documentValue == null) {
    throw StateError('Missing const _document on $reqClassName');
  }
  final definitionsValue = documentValue.getField('definitions');
  final definitions = definitionsValue?.toListValue() ?? const <DartObject>[];
  return [
    for (final definition in definitions) _definitionName(definition),
  ];
}

String _definitionName(DartObject definition) {
  final nameValue = definition.getField('name');
  if (nameValue == null || nameValue.isNull) {
    return '<unnamed>';
  }
  return nameValue.getField('value')?.toStringValue() ?? '<unnamed>';
}

ClassElement _classByName(LibraryElement library, String name) {
  return library.classes.firstWhere(
    (element) => element.name == name,
    orElse: () => throw StateError('Missing class $name'),
  );
}

void _expectInterfaceType(
  DartType type, {
  required String name,
  required bool nullable,
}) {
  final interfaceType = type is InterfaceType ? type : null;
  if (interfaceType == null) {
    throw StateError('Expected $name to be an interface type.');
  }
  expect(interfaceType.element.name, name);
  expect(
    interfaceType.nullabilitySuffix,
    nullable ? NullabilitySuffix.question : NullabilitySuffix.none,
  );
}

void _expectNullableInterfaceType(
  DartType type, {
  required String name,
}) {
  _expectInterfaceType(type, name: name, nullable: true);
}

void _expectValueType(
  DartType type, {
  required String innerName,
}) {
  final interfaceType = type is InterfaceType ? type : null;
  if (interfaceType == null) {
    throw StateError('Expected Value<$innerName> to be an interface type.');
  }
  expect(interfaceType.element.name, 'Value');
  expect(interfaceType.typeArguments.length, 1);
  final innerType = interfaceType.typeArguments.first;
  _expectInterfaceType(innerType, name: innerName, nullable: false);
}

void _expectNestedListType(
  DartType type, {
  required String innerName,
  required bool nullable,
}) {
  final outer = type is InterfaceType ? type : null;
  if (outer == null) {
    throw StateError(
        'Expected List<List<$innerName>> to be an interface type.');
  }
  expect(outer.element.name, 'List');
  expect(
    outer.nullabilitySuffix,
    nullable ? NullabilitySuffix.question : NullabilitySuffix.none,
  );
  final innerList = outer.typeArguments.first;
  final innerInterface = innerList is InterfaceType ? innerList : null;
  if (innerInterface == null) {
    throw StateError('Expected inner List<$innerName> interface type.');
  }
  expect(innerInterface.element.name, 'List');
  expect(innerInterface.nullabilitySuffix, NullabilitySuffix.none);
  final innerElement = innerInterface.typeArguments.first;
  _expectInterfaceType(innerElement, name: innerName, nullable: false);
}
