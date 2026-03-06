import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'test_ast_utils.dart' as ast_utils;
import 'test_utils.dart';

const _package = 'end_to_end_test';
const _outputDir = '__generated__';
const _dataExtension = '.data.gql.dart';
const _varExtension = '.var.gql.dart';
const _reqExtension = '.req.gql.dart';
const _astExtension = '.ast.gql.dart';
const _schemaExtension = '.schema.gql.dart';

const _schemaInput = 'lib/graphql/schema.graphql';
const _aliasedHeroInput = 'lib/aliases/aliased_hero.graphql';
const _aliasVarFragmentInput = 'lib/aliases/alias_var_fragment.graphql';
const _heroNoVarsInput = 'lib/no_vars/hero_no_vars.graphql';
const _heroForEpisodeInput = 'lib/interfaces/hero_for_episode.graphql';
const _conditionalTypeFragmentInput =
    'lib/interfaces/conditional_type_fragment.graphql';
const _unconditionalTypeFragmentInput =
    'lib/interfaces/unconditional_type_fragment.graphql';
const _nestedDuplicateFragmentsInput =
    'lib/fragments/nested_duplicate_fragments.graphql';
const _multipleFragmentsInput = 'lib/fragments/multiple_fragments.graphql';
const _heroWithFragmentsInput = 'lib/fragments/hero_with_fragments.graphql';
const _conditionalFragmentInput = 'lib/fragments/conditional_fragment.graphql';
const _listArgumentInput = 'lib/variables/list_argument.graphql';
const _createReviewInput = 'lib/variables/create_review.graphql';
const _createCustomFieldInput = 'lib/variables/create_custom_field.graphql';
const _reviewWithDateInput = 'lib/scalars/review_with_date.graphql';

late Map<String, String> _generatedSources;
late Map<String, LibraryElement> _libraries;

void main() {
  setUpAll(() async {
    final fixtureRoot = p.join(
      Directory.current.path,
      'test',
      'fixtures',
      'end_to_end_test',
    );
    final sourceAssets = await _loadGraphqlAssets(
      fixtureRoot,
      packageName: _package,
    );

    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': 'end_to_end_test|lib/graphql/schema.graphql',
          'add_typenames': true,
        },
        'vars': {
          'tristate_optionals': true,
        },
        'data_classes': {
          'utils': {
            'copy_with': true,
            'equals': true,
            'hash_code': true,
            'to_string': true,
          },
        },
        'scalars': {
          'Date': {
            'type': 'CustomDate',
            'import': 'package:custom/date.dart',
            'from_json': 'customDateFromJson',
            'to_json': 'customDateToJson',
          },
        },
      }),
    );

    final result = await testBuilder(
      builder,
      sourceAssets,
      rootPackage: _package,
      generateFor: sourceAssets.keys.toSet(),
    );

    _generatedSources =
        extractGeneratedDartSources(result.readerWriter, _package);
    _libraries = await resolveGeneratedLibraries(
      _generatedSources,
      {
        _assetId(_schemaInput, _schemaExtension),
        _assetId(_aliasedHeroInput, _dataExtension),
        _assetId(_aliasVarFragmentInput, _reqExtension),
        _assetId(_aliasVarFragmentInput, _varExtension),
        _assetId(_aliasVarFragmentInput, _dataExtension),
        _assetId(_heroNoVarsInput, _reqExtension),
        _assetId(_heroForEpisodeInput, _dataExtension),
        _assetId(_conditionalTypeFragmentInput, _dataExtension),
        _assetId(_unconditionalTypeFragmentInput, _dataExtension),
        _assetId(_nestedDuplicateFragmentsInput, _dataExtension),
        _assetId(_multipleFragmentsInput, _dataExtension),
        _assetId(_conditionalFragmentInput, _dataExtension),
        _assetId(_heroWithFragmentsInput, _varExtension),
        _assetId(_heroWithFragmentsInput, _dataExtension),
        _assetId(_listArgumentInput, _varExtension),
        _assetId(_createReviewInput, _varExtension),
        _assetId(_createCustomFieldInput, _varExtension),
        _assetId(_reviewWithDateInput, _varExtension),
        _assetId(_reviewWithDateInput, _dataExtension),
      },
      rootPackage: _package,
    );
  });

  test('schema input skips data/vars/req outputs', () {
    expect(
      _generatedSources.containsKey(_assetId(_schemaInput, _dataExtension)),
      isFalse,
    );
    expect(
      _generatedSources.containsKey(_assetId(_schemaInput, _varExtension)),
      isFalse,
    );
    expect(
      _generatedSources.containsKey(_assetId(_schemaInput, _reqExtension)),
      isFalse,
    );
    expect(
      _generatedSources.containsKey(_assetId(_schemaInput, _astExtension)),
      isTrue,
    );
  });

  test('schema output includes enums, inputs, possible types, tristate',
      () async {
    final library = _libraryFor(_schemaInput, _schemaExtension);
    expect(_enumIn(library, 'GEpisode'), isNotNull);

    final reviewInput = _classIn(library, 'GReviewInput');
    final commentaryField = _fieldIn(reviewInput, 'commentary');
    _expectValueType(commentaryField.type, (inner) {
      expect(_isDartCoreString(inner), isTrue);
    });

    final possibleTypes = _possibleTypesMap(library);
    expect(possibleTypes.keys, containsAll(['Character', 'SearchResult']));
    expect(possibleTypes['Character'], containsAll(['Human', 'Droid']));
    expect(
      possibleTypes['SearchResult'],
      containsAll(['Human', 'Droid', 'Starship']),
    );
  });

  test('per-enum fallback config emits enum-specific fallback', () async {
    final fixtureRoot = p.join(
      Directory.current.path,
      'test',
      'fixtures',
      'end_to_end_test',
    );
    final sourceAssets = await _loadGraphqlAssets(
      fixtureRoot,
      packageName: _package,
    );

    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': 'end_to_end_test|lib/graphql/schema.graphql',
          'add_typenames': true,
        },
        'enums': {
          'fallback': {
            'per_enum': {
              'Episode': 'gUnknownEpisode',
            },
          },
        },
      }),
    );

    final result = await testBuilder(
      builder,
      sourceAssets,
      rootPackage: _package,
      generateFor: sourceAssets.keys.toSet(),
    );

    final sources = extractGeneratedDartSources(result.readerWriter, _package);
    final schemaAssetId = _assetId(_schemaInput, _schemaExtension);
    final resolvedLibraries = await resolveGeneratedLibraries(
      sources,
      {schemaAssetId},
      rootPackage: _package,
    );
    final library = resolvedLibraries[schemaAssetId];
    if (library == null) {
      throw StateError('Missing schema output for per-enum config test.');
    }

    final episodeEnum = _enumIn(library, 'GEpisode');
    final hasFallback = episodeEnum.constants
        .any((constant) => constant.name == 'gUnknownEpisode');
    expect(hasFallback, isTrue);

    final unit = await _resolvedUnit(library);
    final enumDecl = _enumDecl(unit, 'GEpisode');
    final fromJson = _enumMethod(enumDecl, 'fromJson');
    expect(
      _switchDefaultReturnsEnumValue(fromJson, 'GEpisode', 'gUnknownEpisode'),
      isTrue,
    );
  });

  test('aliases use response keys and alias fields', () async {
    final library = _libraryFor(_aliasedHeroInput, _dataExtension);
    expect(_classIn(library, 'GAliasedHeroData'), isNotNull);

    final unit = await _resolvedUnit(library);
    final empireClass =
        ast_utils.classDecl(unit, 'GAliasedHeroData_empireHero');
    final jediClass = ast_utils.classDecl(unit, 'GAliasedHeroData_jediHero');

    final empireFromJson =
        ast_utils.factoryConstructor(empireClass, 'fromJson');
    final empireToJson = _methodDecl(empireClass, 'toJson');
    final jediFromJson = ast_utils.factoryConstructor(jediClass, 'fromJson');
    final jediToJson = _methodDecl(jediClass, 'toJson');

    expect(_containsIndexWithString(empireFromJson, 'from'), isTrue);
    expect(_containsIndexWithString(empireToJson, 'from'), isTrue);
    expect(_containsIndexWithString(jediFromJson, 'from'), isTrue);
    expect(_containsIndexWithString(jediToJson, 'from'), isTrue);
  });

  test('alias fragment vars and data reuse', () async {
    final varsLibrary = _libraryFor(_aliasVarFragmentInput, _varExtension);
    final postsVars = _classIn(varsLibrary, 'GPostsVars');
    final fragmentVars = _classIn(varsLibrary, 'GPostFragmentVars');
    expect(_fieldIn(postsVars, 'userId').type, isA<InterfaceType>());
    expect(_fieldIn(fragmentVars, 'userId').type, isA<InterfaceType>());
    expect(_isDartCoreString(_fieldIn(postsVars, 'userId').type), isTrue);
    expect(_isDartCoreString(_fieldIn(fragmentVars, 'userId').type), isTrue);

    final dataLibrary = _libraryFor(_aliasVarFragmentInput, _dataExtension);
    final postFragment = _classIn(dataLibrary, 'GPostFragmentData');
    expect(postFragment.fields.any((field) => field.name == 'isFavorited'),
        isTrue);
    expect(postFragment.fields.any((field) => field.name == 'isLiked'), isTrue);
    expect(dataLibrary.getClass('GPostsData_posts'), isNull);
  });

  test('no-vars operation omits vars output and uses null vars in request',
      () async {
    final varsAssetId = _assetId(_heroNoVarsInput, _varExtension);
    expect(_generatedSources.containsKey(varsAssetId), isFalse);

    final reqLibrary = _libraryFor(_heroNoVarsInput, _reqExtension);
    final reqClass = _classIn(reqLibrary, 'GHeroNoVarsReq');
    final opRequestType = reqClass.interfaces.firstWhere(
      (type) => type.element.name == 'OperationRequest',
      orElse: () =>
          throw StateError('OperationRequest not found on GHeroNoVarsReq'),
    );
    expect(opRequestType.typeArguments, hasLength(2));
    expect(_typeName(opRequestType.typeArguments.first), 'GHeroNoVarsData');
    expect(opRequestType.typeArguments.last.isDartCoreNull, isTrue);
  });

  test('interface selections include inline fragment variants', () async {
    final library = _libraryFor(_heroForEpisodeInput, _dataExtension);
    final heroBase = _classIn(library, 'GHeroForEpisodeData_hero');
    expect(heroBase.isSealed, isTrue);

    final asDroid = _classIn(library, 'GHeroForEpisodeData_hero__asDroid');
    _classIn(library, 'GHeroForEpisodeData_hero__unknown');
    final implementsDroid =
        asDroid.interfaces.any((type) => type.element.name == 'GDroidFragment');
    expect(implementsDroid, isTrue);
  });

  test(
      'conditional type fragment does not add interface implements to base or variant',
      () async {
    final library = _libraryFor(_conditionalTypeFragmentInput, _dataExtension);
    final heroClass =
        _classIn(library, 'GHeroConditionalTypeFragmentData_hero');
    final heroVariant =
        _classIn(library, 'GHeroConditionalTypeFragmentData_hero__asHuman');
    final baseImplements = heroClass.interfaces.any(
      (type) => type.element.name == 'GHumanName',
    );
    final variantImplements = heroVariant.interfaces.any(
      (type) => type.element.name == 'GHumanName',
    );
    expect(baseImplements, isFalse);
    expect(variantImplements, isFalse);
  });

  test('unconditional type fragment implements on variant only', () async {
    final library =
        _libraryFor(_unconditionalTypeFragmentInput, _dataExtension);
    final heroClass =
        _classIn(library, 'GHeroUnconditionalTypeFragmentData_hero');
    final heroVariant =
        _classIn(library, 'GHeroUnconditionalTypeFragmentData_hero__asHuman');
    final baseImplements = heroClass.interfaces.any(
      (type) => type.element.name == 'GHumanName',
    );
    final variantImplements = heroVariant.interfaces.any(
      (type) => type.element.name == 'GHumanName',
    );
    expect(baseImplements, isFalse);
    expect(variantImplements, isTrue);
  });

  test('nested duplicate fragments reuse child fragment data', () async {
    final library = _libraryFor(_nestedDuplicateFragmentsInput, _dataExtension);
    _classIn(library, 'GSearchResultsQueryData_search__unknown');
    _classIn(library, 'GFriendInfoData');
    expect(library.getClass('GCharacterDetailsData_friends'), isNull);
  });

  test('multiple fragments merge into a single selection class', () async {
    final library = _libraryFor(_multipleFragmentsInput, _dataExtension);
    final heroClass = _classIn(library, 'GHeroWith2FragmentsData_hero');
    expect(heroClass.fields.any((field) => field.name == 'id'), isTrue);
    expect(heroClass.fields.any((field) => field.name == 'name'), isTrue);
  });

  test('conditional fragment spread does not add interface implements',
      () async {
    final library = _libraryFor(_conditionalFragmentInput, _dataExtension);
    final heroClass = _classIn(library, 'GHeroConditionalFragmentData_hero');
    final implementsFragment = heroClass.interfaces.any(
      (type) => type.element.name == 'GHeroName',
    );
    expect(implementsFragment, isFalse);
  });

  test('fragment variables propagate to fragment vars', () async {
    final varsLibrary = _libraryFor(_heroWithFragmentsInput, _varExtension);
    final comparisonVars = _classIn(varsLibrary, 'GcomparisonFieldsVars');
    final heroVars = _classIn(varsLibrary, 'GHeroWithFragmentsVars');

    final comparisonField = _fieldIn(comparisonVars, 'first');
    final heroField = _fieldIn(heroVars, 'first');
    _expectValueType(comparisonField.type, (inner) {
      expect(_isDartCoreInt(inner), isTrue);
    });
    _expectValueType(heroField.type, (inner) {
      expect(_isDartCoreInt(inner), isTrue);
    });
    expect(varsLibrary.getClass('GheroDataVars'), isNull);

    final dataLibrary = _libraryFor(_heroWithFragmentsInput, _dataExtension);
    _classIn(dataLibrary, 'GheroDataData');
    expect(
      dataLibrary
          .getClass('GcomparisonFieldsData_friendsConnection_edges_node'),
      isNull,
    );
  });

  test('list variables and input objects are typed correctly', () async {
    final listVarsLibrary = _libraryFor(_listArgumentInput, _varExtension);
    final listVars = _classIn(listVarsLibrary, 'GreviewsWithListArgumentVars');
    final starsField = _fieldIn(listVars, 'stars');
    _expectValueType(starsField.type, (inner) {
      final listType = _asInterfaceType(inner);
      expect(listType.isDartCoreList, isTrue);
      expect(listType.typeArguments.single.isDartCoreInt, isTrue);
    });
    final episodeField = _fieldIn(listVars, 'episode');
    expect(_typeName(episodeField.type), 'GEpisode');

    final createReviewLibrary = _libraryFor(_createReviewInput, _varExtension);
    final createReviewVars = _classIn(createReviewLibrary, 'GCreateReviewVars');
    final reviewEpisode = _fieldIn(createReviewVars, 'episode');
    _expectValueType(reviewEpisode.type, (inner) {
      expect(_typeName(inner), 'GEpisode');
    });
    final reviewField = _fieldIn(createReviewVars, 'review');
    expect(_typeName(reviewField.type), 'GReviewInput');

    final createCustomLibrary =
        _libraryFor(_createCustomFieldInput, _varExtension);
    final createCustomVars =
        _classIn(createCustomLibrary, 'GCreateCustomFieldVars');
    final inputField = _fieldIn(createCustomVars, 'input');
    expect(_typeName(inputField.type), 'GCustomFieldInput');
  });

  test('custom scalar overrides appear in vars and data', () async {
    final varsLibrary = _libraryFor(_reviewWithDateInput, _varExtension);
    final varsUnit = await _resolvedUnit(varsLibrary);
    final varsClass = ast_utils.classDecl(varsUnit, 'GReviewWithDateVars');
    final createdAtType = _fieldTypeAnnotation(varsClass, 'createdAt');
    expect(createdAtType.toSource(), contains('CustomDate'));
    expect(createdAtType.toSource(), contains('Value'));

    final dataLibrary = _libraryFor(_reviewWithDateInput, _dataExtension);
    final unit = await _resolvedUnit(dataLibrary);
    final reviewClass =
        ast_utils.classDecl(unit, 'GReviewWithDateData_createReview');
    final createdAtDataType = _fieldTypeAnnotation(reviewClass, 'createdAt');
    expect(createdAtDataType.toSource(), contains('CustomDate'));
    final fromJson = ast_utils.factoryConstructor(reviewClass, 'fromJson');
    final toJson = _methodDecl(reviewClass, 'toJson');
    expect(_containsMethodInvocation(fromJson, 'customDateFromJson'), isTrue);
    expect(_containsMethodInvocation(toJson, 'customDateToJson'), isTrue);
  });

  test('request classes expose execRequest and parseData', () async {
    final reqLibrary = _libraryFor(_heroNoVarsInput, _reqExtension);
    final reqClass = _classIn(reqLibrary, 'GHeroNoVarsReq');
    expect(_hasGetter(reqClass, 'execRequest'), isTrue);
    expect(_declaresMethod(reqClass, 'parseData'), isTrue);
    expect(_declaresMethod(reqClass, 'copyWith'), isTrue);
    expect(_declaresMethod(reqClass, '=='), isTrue);
    expect(_declaresGetter(reqClass, 'hashCode'), isTrue);
    expect(_declaresMethod(reqClass, 'toString'), isTrue);

    final fragmentReqLibrary =
        _libraryFor(_aliasVarFragmentInput, _reqExtension);
    final fragmentReq = _classIn(fragmentReqLibrary, 'GPostFragmentReq');
    expect(_declaresMethod(fragmentReq, 'copyWith'), isTrue);
    expect(_declaresMethod(fragmentReq, '=='), isTrue);
    expect(_declaresGetter(fragmentReq, 'hashCode'), isTrue);
    expect(_declaresMethod(fragmentReq, 'toString'), isTrue);
  });

  test('data classes include copyWith and overrides', () async {
    final library = _libraryFor(_heroForEpisodeInput, _dataExtension);
    final heroData = _classIn(library, 'GHeroForEpisodeData');
    expect(_declaresMethod(heroData, 'copyWith'), isTrue);
    expect(_declaresMethod(heroData, '=='), isTrue);
    expect(_declaresGetter(heroData, 'hashCode'), isTrue);
    expect(_declaresMethod(heroData, 'toString'), isTrue);
  });

  test('data classes omit utilities when disabled', () async {
    final fixtureRoot = p.join(
      Directory.current.path,
      'test',
      'fixtures',
      'end_to_end_test',
    );
    final sourceAssets = await _loadGraphqlAssets(
      fixtureRoot,
      packageName: _package,
    );

    final builder = graphqlBuilder(
      BuilderOptions({
        'schema': {
          'file': 'end_to_end_test|lib/graphql/schema.graphql',
          'add_typenames': true,
        },
        'vars': {
          'tristate_optionals': true,
        },
        'data_classes': {
          'utils': {
            'copy_with': false,
            'equals': false,
            'hash_code': false,
            'to_string': false,
          },
        },
      }),
    );

    final result = await testBuilder(
      builder,
      sourceAssets,
      rootPackage: _package,
      generateFor: {
        'end_to_end_test|lib/interfaces/hero_for_episode.graphql',
      },
    );

    final sources = extractGeneratedDartSources(result.readerWriter, _package);
    final assetId = _assetId(_heroForEpisodeInput, _dataExtension);
    final resolvedLibraries = await resolveGeneratedLibraries(
      sources,
      {assetId},
      rootPackage: _package,
    );
    final library = resolvedLibraries[assetId];
    if (library == null) {
      throw StateError('Missing data output for utilities-disabled test.');
    }

    final heroData = _classIn(library, 'GHeroForEpisodeData');
    expect(_declaresMethod(heroData, 'copyWith'), isFalse);
    expect(_declaresMethod(heroData, '=='), isFalse);
    expect(_declaresGetter(heroData, 'hashCode'), isFalse);
    expect(_declaresMethod(heroData, 'toString'), isFalse);

    final reqAssetId = _assetId(_heroForEpisodeInput, _reqExtension);
    final resolvedReqs = await resolveGeneratedLibraries(
      sources,
      {reqAssetId},
      rootPackage: _package,
    );
    final reqLibrary = resolvedReqs[reqAssetId];
    if (reqLibrary == null) {
      throw StateError('Missing request output for utilities-disabled test.');
    }
    final reqClass = _classIn(reqLibrary, 'GHeroForEpisodeReq');
    expect(_declaresMethod(reqClass, 'copyWith'), isFalse);
    expect(_declaresMethod(reqClass, '=='), isFalse);
    expect(_declaresGetter(reqClass, 'hashCode'), isFalse);
    expect(_declaresMethod(reqClass, 'toString'), isFalse);
  });
}

Future<Map<String, Object>> _loadGraphqlAssets(
  String fixtureRoot, {
  required String packageName,
}) async {
  final assets = <String, Object>{};
  final libRoot = Directory(p.join(fixtureRoot, 'lib'));
  if (!await libRoot.exists()) {
    throw StateError('Missing fixture lib directory at ${libRoot.path}');
  }

  await for (final entity
      in libRoot.list(recursive: true, followLinks: false)) {
    if (entity is! File || !entity.path.endsWith('.graphql')) {
      continue;
    }
    final relativePath = p.relative(entity.path, from: fixtureRoot);
    final assetPath = p.posix.joinAll(p.split(relativePath));
    assets['$packageName|$assetPath'] = await entity.readAsString();
  }

  if (assets.isEmpty) {
    throw StateError('No fixture GraphQL files found in $fixtureRoot');
  }

  return assets;
}

String _assetId(String inputPath, String extension) {
  return generatedDartAssetIdForInput(
    _package,
    inputPath,
    extension,
    outputDir: _outputDir,
  );
}

LibraryElement _libraryFor(String inputPath, String extension) {
  final assetId = _assetId(inputPath, extension);
  final library = _libraries[assetId];
  if (library == null) {
    throw StateError('Missing generated library for $assetId');
  }
  return library;
}

ClassElement _classIn(LibraryElement library, String name) {
  final element = library.getClass(name);
  if (element == null) {
    throw StateError(
      'Missing class $name in ${library.firstFragment.source.uri}',
    );
  }
  return element;
}

EnumElement _enumIn(LibraryElement library, String name) {
  final element = library.getEnum(name);
  if (element == null) {
    throw StateError(
      'Missing enum $name in ${library.firstFragment.source.uri}',
    );
  }
  return element;
}

FieldElement _fieldIn(ClassElement element, String name) {
  final field = element.fields.firstWhere(
    (candidate) => candidate.name == name,
    orElse: () => throw StateError('Missing field $name on ${element.name}'),
  );
  return field;
}

bool _declaresMethod(ClassElement element, String name) {
  return element.methods.any((method) => method.name == name);
}

bool _declaresGetter(ClassElement element, String name) {
  return element.getters.any((getter) => getter.name == name);
}

bool _hasGetter(ClassElement element, String name) {
  if (_declaresGetter(element, name)) {
    return true;
  }
  for (final supertype in element.allSupertypes) {
    if (supertype.element.getGetter(name) != null) {
      return true;
    }
  }
  return false;
}

void _expectValueType(
  DartType type,
  void Function(DartType) innerCheck,
) {
  final interface = _asInterfaceType(type);
  expect(interface.element.name, 'Value');
  expect(interface.typeArguments, hasLength(1));
  innerCheck(interface.typeArguments.single);
}

InterfaceType _asInterfaceType(DartType type) {
  if (type is InterfaceType) {
    return type;
  }
  throw StateError('Expected interface type, got ${type.runtimeType}');
}

String _typeName(DartType type) {
  if (type is InterfaceType) {
    final name = type.element.name;
    if (name != null && name.isNotEmpty) {
      return name;
    }
  }
  final display = type.getDisplayString().replaceAll('?', '');
  final parts = display.split('.');
  return parts.isNotEmpty ? parts.last : display;
}

bool _isDartCoreString(DartType type) =>
    type is InterfaceType && type.isDartCoreString;

bool _isDartCoreInt(DartType type) =>
    type is InterfaceType && type.isDartCoreInt;

Map<String, Set<String>> _possibleTypesMap(LibraryElement library) {
  final variable = library.topLevelVariables.firstWhere(
    (candidate) => candidate.name == 'possibleTypesMap',
    orElse: () => throw StateError(
      'Missing possibleTypesMap in ${library.firstFragment.source.uri}',
    ),
  );
  final value = variable.computeConstantValue();
  if (value == null) {
    throw StateError('possibleTypesMap has no constant value');
  }
  final mapValue = value.toMapValue();
  if (mapValue == null) {
    throw StateError('possibleTypesMap is not a const map');
  }

  final result = <String, Set<String>>{};
  for (final entry in mapValue.entries) {
    final key = entry.key?.toStringValue();
    final setValue = entry.value?.toSetValue();
    if (key == null || setValue == null) {
      throw StateError('Invalid entry in possibleTypesMap');
    }
    result[key] = setValue
        .map((value) => value.toStringValue())
        .whereType<String>()
        .toSet();
  }

  return result;
}

Future<CompilationUnit> _resolvedUnit(LibraryElement library) async {
  final result = await library.session.getResolvedLibraryByElement(library);
  if (result is! ResolvedLibraryResult) {
    throw StateError(
      'Failed to resolve ${library.firstFragment.source.uri}',
    );
  }
  return result.units.first.unit;
}

EnumDeclaration _enumDecl(CompilationUnit unit, String name) {
  return unit.declarations
      .whereType<EnumDeclaration>()
      .firstWhere((decl) => decl.name.lexeme == name);
}

MethodDeclaration _enumMethod(EnumDeclaration enumDecl, String name) {
  return enumDecl.members
      .whereType<MethodDeclaration>()
      .firstWhere((member) => member.name.lexeme == name);
}

MethodDeclaration _methodDecl(ClassDeclaration classDecl, String name) {
  return classDecl.members
      .whereType<MethodDeclaration>()
      .firstWhere((member) => member.name.lexeme == name);
}

TypeAnnotation _fieldTypeAnnotation(
  ClassDeclaration classDecl,
  String fieldName,
) {
  for (final member in classDecl.members.whereType<FieldDeclaration>()) {
    for (final variable in member.fields.variables) {
      if (variable.name.lexeme == fieldName) {
        final type = member.fields.type;
        if (type == null) {
          throw StateError('Field $fieldName is missing a type annotation.');
        }
        return type;
      }
    }
  }
  throw StateError('Missing field $fieldName in ${classDecl.name.lexeme}');
}

bool _containsIndexWithString(AstNode node, String value) {
  final visitor = _IndexStringVisitor(value);
  node.visitChildren(visitor);
  return visitor.found;
}

bool _containsMethodInvocation(AstNode node, String name) {
  final visitor = _MethodInvocationVisitor(name);
  node.visitChildren(visitor);
  return visitor.found;
}

bool _switchDefaultReturnsEnumValue(
  MethodDeclaration method,
  String enumName,
  String valueName,
) {
  final body = method.body;
  if (body is! BlockFunctionBody) {
    throw StateError('Expected block body in ${method.name.lexeme}');
  }
  final switchStatement = body.block.statements
      .whereType<SwitchStatement>()
      .firstWhere((_) => true, orElse: () {
    throw StateError('Missing switch statement in ${method.name.lexeme}');
  });
  final defaultMember = switchStatement.members
      .whereType<SwitchDefault>()
      .firstWhere((_) => true, orElse: () {
    throw StateError('Missing default case in ${method.name.lexeme}');
  });
  final returnStatement = defaultMember.statements
      .whereType<ReturnStatement>()
      .firstWhere((_) => true, orElse: () {
    throw StateError('Missing return in default case');
  });
  return _isEnumValueReference(returnStatement.expression, enumName, valueName);
}

bool _isEnumValueReference(
  Expression? expression,
  String enumName,
  String valueName,
) {
  if (expression is PrefixedIdentifier) {
    return expression.prefix.name == enumName &&
        expression.identifier.name == valueName;
  }
  if (expression is PropertyAccess) {
    final target = expression.target;
    return target is SimpleIdentifier &&
        target.name == enumName &&
        expression.propertyName.name == valueName;
  }
  return false;
}

class _IndexStringVisitor extends RecursiveAstVisitor<void> {
  final String value;
  bool found = false;

  _IndexStringVisitor(this.value);

  @override
  void visitIndexExpression(IndexExpression node) {
    if (node.index is SimpleStringLiteral &&
        (node.index as SimpleStringLiteral).value == value) {
      found = true;
    }
    super.visitIndexExpression(node);
  }
}

class _MethodInvocationVisitor extends RecursiveAstVisitor<void> {
  final String name;
  bool found = false;

  _MethodInvocationVisitor(this.name);

  @override
  void visitMethodInvocation(MethodInvocation node) {
    if (node.methodName.name == name) {
      found = true;
    }
    super.visitMethodInvocation(node);
  }
}
