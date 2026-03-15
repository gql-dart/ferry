import 'package:ferry_generator2/src/source/source.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:test/test.dart';

void main() {
  test('flatDocument visits transitive shared imports only once', () {
    final shared = _source(
      'package:test/shared.graphql',
      '''
fragment SharedFragment on Character {
  name
}

fragment SharedDetails on Character {
  appearsIn
}
''',
    );
    final left = _source(
      'package:test/left.graphql',
      '''
fragment LeftFragment on Character {
  ...SharedFragment
  id
}
''',
      imports: {shared},
    );
    final right = _source(
      'package:test/right.graphql',
      '''
fragment RightFragment on Character {
  ...SharedFragment
  friendsConnection(first: 3) {
    totalCount
  }
}
''',
      imports: {shared},
    );
    final root = _source(
      'package:test/root.graphql',
      '''
query RootQuery {
  hero(episode: JEDI) {
    ...LeftFragment
    ...RightFragment
  }
}
''',
      imports: {left, right},
    );

    final fragmentNames = root.flatDocument.definitions
        .whereType<FragmentDefinitionNode>()
        .map((fragment) => fragment.name.value)
        .toList();

    expect(
      fragmentNames,
      equals([
        'LeftFragment',
        'SharedFragment',
        'SharedDetails',
        'RightFragment',
      ]),
    );
  });

  test('getRefs keeps multiple definitions from one file', () {
    final shared = _source(
      'package:test/shared.graphql',
      '''
fragment SharedFragment on Character {
  name
}

fragment SharedDetails on Character {
  appearsIn
}
''',
    );

    final refs =
        shared.getRefs().map((ref) => '${ref.symbol}@${ref.url}').toSet();

    expect(
      refs,
      equals({
        'SharedFragment@package:test/shared.graphql',
        'SharedDetails@package:test/shared.graphql',
      }),
    );
  });
}

DocumentSource _source(
  String url,
  String source, {
  Set<DocumentSource> imports = const {},
}) {
  return DocumentSource(
    url: url,
    document: parseString(source, url: url),
    imports: imports,
  );
}
