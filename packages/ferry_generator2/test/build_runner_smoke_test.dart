import 'dart:io';
import 'dart:math';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'test_ast_utils.dart' as ast_utils;

const _compileSmokeSource = '''
import 'package:ferry_generator2_smoke/__generated__/operations.data.gql.dart';
import 'package:ferry_generator2_smoke/__generated__/operations.req.gql.dart';
void _check(bool condition, String message) {
  if (!condition) {
    throw StateError(message);
  }
}

void main() {
  final req = GSearchResultsQueryReq();
  _check(req.vars == null, 'vars should be null');
  _check(req.varsToJson().isEmpty, 'varsToJson should be empty');
  _check(
    req.operation.operationName == 'SearchResultsQuery',
    'operation name mismatch',
  );
  _check(req.execRequest.variables.isEmpty, 'execRequest variables not empty');

  final dataJson = <String, Object?>{
    '__typename': 'Query',
    'search': <Object?>[
      <String, Object?>{
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
        'friends': <Object?>[],
        'appearsIn': <Object?>['NEWHOPE'],
      },
      <String, Object?>{
        '__typename': 'Droid',
        'id': '2000',
        'name': 'R2-D2',
        'friends': <Object?>[],
        'appearsIn': <Object?>['EMPIRE'],
      },
      <String, Object?>{
        '__typename': 'Starship',
      },
    ],
  };

  final parsed = req.parseData(dataJson);
  _check(parsed != null, 'parseData returned null');
  final result = parsed!;
  _check(result.G__typename == 'Query', 'root typename mismatch');

  final search = result.search ?? const <GSearchResultsQueryData_search?>[];
  _check(search.length == 3, 'search length mismatch');

  final first = search[0];
  _check(first is GSearchResultsQueryData_search__asHuman, 'expected Human');
  if (first is GSearchResultsQueryData_search__asHuman) {
    _check(first.id == '1000', 'human id mismatch');
    _check(first.name == 'Luke', 'human name mismatch');
    _check(first.appearsIn.length == 1, 'human appearsIn length mismatch');
    _check(
      first.appearsIn.first?.toJson() == 'NEWHOPE',
      'human appearsIn value mismatch',
    );
    _check(first.friends != null, 'human friends null');
    _check(first.friends!.isEmpty, 'human friends not empty');
  }

  final second = search[1];
  _check(second is GSearchResultsQueryData_search__asDroid, 'expected Droid');
  if (second is GSearchResultsQueryData_search__asDroid) {
    _check(second.id == '2000', 'droid id mismatch');
    _check(second.name == 'R2-D2', 'droid name mismatch');
    _check(second.appearsIn.length == 1, 'droid appearsIn length mismatch');
    _check(
      second.appearsIn.first?.toJson() == 'EMPIRE',
      'droid appearsIn value mismatch',
    );
  }

  final third = search[2];
  _check(third is GSearchResultsQueryData_search__unknown, 'expected unknown');
  _check(third?.G__typename == 'Starship', 'unknown typename mismatch');

  final jsonRoundTrip = result.toJson();
  final roundTripSearch = jsonRoundTrip['search'];
  _check(roundTripSearch is List<Object?>, 'round trip search not list');
  if (roundTripSearch is List<Object?>) {
    _check(roundTripSearch.length == 3, 'round trip search length mismatch');
  }

  final emptyData = GSearchResultsQueryData(
    G__typename: 'Query',
    search: <GSearchResultsQueryData_search?>[],
  );
  final emptyJson = emptyData.toJson();
  _check(emptyJson['__typename'] == 'Query', 'empty typename mismatch');
  final emptySearch = emptyJson['search'];
  _check(emptySearch is List<Object?>, 'empty search not list');
  if (emptySearch is List<Object?>) {
    _check(emptySearch.isEmpty, 'empty search not empty');
  }

  final unknown = GSearchResultsQueryData_search__unknown(
    G__typename: 'Starship',
  );
  _check(
    unknown.toJson()['__typename'] == 'Starship',
    'unknown toJson mismatch',
  );
}
''';

String _uuidV4() {
  final random = Random.secure();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  String hex(int value) => value.toRadixString(16).padLeft(2, '0');
  return '${hex(bytes[0])}${hex(bytes[1])}${hex(bytes[2])}${hex(bytes[3])}-'
      '${hex(bytes[4])}${hex(bytes[5])}-'
      '${hex(bytes[6])}${hex(bytes[7])}-'
      '${hex(bytes[8])}${hex(bytes[9])}-'
      '${hex(bytes[10])}${hex(bytes[11])}${hex(bytes[12])}'
      '${hex(bytes[13])}${hex(bytes[14])}${hex(bytes[15])}';
}

Future<void> _copyDirectory(Directory source, Directory destination) async {
  await for (final entity in source.list(followLinks: false)) {
    final newPath = p.join(destination.path, p.basename(entity.path));
    if (entity is Directory) {
      final newDir = Directory(newPath);
      await newDir.create(recursive: true);
      await _copyDirectory(entity, newDir);
    } else if (entity is File) {
      await entity.copy(newPath);
    }
  }
}

Set<String> _implementsNames(ClassDeclaration classDecl) {
  final clause = classDecl.implementsClause;
  if (clause == null) return const {};
  return clause.interfaces.map((type) => type.name.lexeme).toSet();
}

Set<String> _switchCaseStrings(ConstructorDeclaration ctor) {
  final body = ctor.body;
  if (body is! BlockFunctionBody) {
    throw StateError('Expected block body in factory constructor');
  }
  final switchStmt = body.block.statements
      .whereType<SwitchStatement>()
      .firstWhere((_) => true);
  final labels = <String>{};
  for (final member in switchStmt.members) {
    if (member
        case SwitchCase(
          expression: StringLiteral(stringValue: final value?),
        )) {
      labels.add(value);
      continue;
    }
    if (member
        case SwitchPatternCase(
          guardedPattern: GuardedPattern(
            pattern: ConstantPattern(
              expression: StringLiteral(stringValue: final value?),
            ),
          ),
        )) {
      labels.add(value);
    }
  }
  return labels;
}

bool _containsStringLiteral(CompilationUnit unit, String substring) {
  final visitor = _StringLiteralVisitor(substring);
  unit.visitChildren(visitor);
  return visitor.found;
}

bool _containsListFromJson(CompilationUnit unit) {
  final visitor = _ListFromJsonVisitor();
  unit.visitChildren(visitor);
  return visitor.found;
}

class _StringLiteralVisitor extends RecursiveAstVisitor<void> {
  final String substring;
  bool found = false;

  _StringLiteralVisitor(this.substring);

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    final value = node.stringValue;
    if (value != null && value.contains(substring)) {
      found = true;
    }
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitAdjacentStrings(AdjacentStrings node) {
    final value = node.stringValue;
    if (value != null && value.contains(substring)) {
      found = true;
    }
    super.visitAdjacentStrings(node);
  }
}

class _ListFromJsonVisitor extends RecursiveAstVisitor<void> {
  bool found = false;

  @override
  void visitMethodInvocation(MethodInvocation node) {
    final target = node.target;
    if (target is SimpleIdentifier &&
        target.name == 'List' &&
        node.methodName.name == 'fromJson') {
      found = true;
    }
    super.visitMethodInvocation(node);
  }
}

void main() {
  test(
    'build_runner smoke test with interface fragments',
    () async {
      final packageRoot = Directory.current.path;
      final ferryExecPath =
          p.normalize(p.join(packageRoot, '..', 'ferry_exec'));
      final fixtureRoot = p.join(
        packageRoot,
        'test',
        'fixtures',
        'build_runner_smoke',
      );
      final tempDir = await Directory.systemTemp
          .createTemp('ferry_generator2_smoke_${_uuidV4()}_');
      addTearDown(() async {
        if (await tempDir.exists()) {
          await tempDir.delete(recursive: true);
        }
      });

      await _copyDirectory(Directory(fixtureRoot), tempDir);

      final pubspecTemplate = File(
        p.join(tempDir.path, 'pubspec.template.yaml'),
      );
      final pubspec = File(p.join(tempDir.path, 'pubspec.yaml'));
      final updatedPubspec = (await pubspecTemplate.readAsString())
          .replaceAll('__FERRY_GENERATOR2_PATH__', packageRoot)
          .replaceAll('__FERRY_EXEC_PATH__', ferryExecPath);
      await pubspec.writeAsString(updatedPubspec);

      final pubGet = await Process.run(
        'dart',
        ['pub', 'get'],
        workingDirectory: tempDir.path,
      );
      expect(
        pubGet.exitCode,
        0,
        reason: 'dart pub get failed: ${pubGet.stderr}',
      );

      final buildResult = await Process.run(
        'dart',
        ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
        workingDirectory: tempDir.path,
      );
      expect(
        buildResult.exitCode,
        0,
        reason: 'build_runner failed: ${buildResult.stderr}\n'
            '${buildResult.stdout}',
      );

      final dataPath = p.join(
        tempDir.path,
        'lib',
        '__generated__',
        'operations.data.gql.dart',
      );
      final dataFile = File(dataPath);
      expect(
        await dataFile.exists(),
        isTrue,
        reason: 'Missing generated data at $dataPath',
      );

      final parseResult = parseFile(
        path: dataPath,
        featureSet: FeatureSet.latestLanguageVersion(),
      );
      final unit = parseResult.unit;
      final classNames = unit.declarations
          .whereType<ClassDeclaration>()
          .map((decl) => decl.name.lexeme)
          .toSet();
      expect(
        classNames,
        containsAll(<String>[
          'GFriendInfoData',
          'GFriendInfoData__asHuman',
          'GFriendInfoData__asDroid',
        ]),
      );
      expect(classNames.contains('GCharacterDetails__asHuman'), isFalse);
      expect(classNames.contains('GCharacterDetails__asDroid'), isFalse);

      final baseClass = ast_utils.classDecl(unit, 'GFriendInfoData');
      final fromJson = ast_utils.factoryConstructor(baseClass, 'fromJson');
      final caseLabels = _switchCaseStrings(fromJson);
      expect(caseLabels, containsAll(<String>['Human', 'Droid']));

      final humanClass = ast_utils.classDecl(unit, 'GFriendInfoData__asHuman');
      final humanImplements = _implementsNames(humanClass);
      expect(
        humanImplements,
        containsAll(<String>['GFriendInfo', 'GFriendInfo__asHuman']),
      );

      final droidClass = ast_utils.classDecl(unit, 'GFriendInfoData__asDroid');
      final droidImplements = _implementsNames(droidClass);
      expect(
        droidImplements,
        containsAll(<String>['GFriendInfo', 'GFriendInfo__asDroid']),
      );

      expect(_containsStringLiteral(unit, '#data'), isFalse);
      expect(_containsListFromJson(unit), isFalse);

      final toolDir = Directory(p.join(tempDir.path, 'tool'));
      await toolDir.create(recursive: true);
      final compileFile = File(p.join(toolDir.path, 'compile_smoke.dart'));
      await compileFile.writeAsString(_compileSmokeSource);

      final analyzeResult = await Process.run(
        'dart',
        ['analyze'],
        workingDirectory: tempDir.path,
      );
      expect(
        analyzeResult.exitCode,
        0,
        reason: 'dart analyze failed: ${analyzeResult.stderr}\n'
            '${analyzeResult.stdout}',
      );

      final compileOutDir = Directory(p.join(tempDir.path, 'build'));
      await compileOutDir.create(recursive: true);
      final exeName =
          Platform.isWindows ? 'compile_smoke.exe' : 'compile_smoke';
      final exePath = p.join(compileOutDir.path, exeName);
      final compileResult = await Process.run(
        'dart',
        [
          'compile',
          'exe',
          'tool/compile_smoke.dart',
          '-o',
          exePath,
        ],
        workingDirectory: tempDir.path,
      );
      expect(
        compileResult.exitCode,
        0,
        reason: 'dart compile failed: ${compileResult.stderr}\n'
            '${compileResult.stdout}',
      );

      final runResult = await Process.run(
        exePath,
        const [],
        workingDirectory: tempDir.path,
      );
      expect(
        runResult.exitCode,
        0,
        reason: 'compiled binary failed: ${runResult.stderr}\n'
            '${runResult.stdout}',
      );
    },
    timeout: const Timeout(Duration(minutes: 10)),
  );
}
