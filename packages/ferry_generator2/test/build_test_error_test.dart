@TestOn('vm')

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:test/test.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
const _queryPath = '$_package|lib/operations.graphql';
const _fragmentPath = '$_package|lib/fragments.graphql';

const _schema = r'''
schema {
  query: Query
}

directive @fieldOnly(arg: String!) on FIELD

interface Character {
  id: ID!
  name: String!
}

type Human implements Character {
  id: ID!
  name: String!
  homePlanet: String
}

type Droid implements Character {
  id: ID!
  name: String!
  primaryFunction: String
}

interface Author {
  name: String!
}

type Person implements Author {
  name: String!
  age: Int
}

type Book {
  id: ID!
  title: String!
  author: Author!
}

input BookFilter {
  author: String
}

type Query {
  books(filter: BookFilter): [Book!]!
  book(id: ID!): Book
  hero: Character
}
''';

void main() {
  test('fails when selecting a field that does not exist', () async {
    const document = r'''
query Books {
  books {
    missingField
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Failed to find type for field missingField on Book',
    );
  });

  test('fails when fragment spread is not defined or imported', () async {
    const document = r'''
query Books {
  books {
    ...BookFragment
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Missing fragment definition for BookFragment',
      extraAssets: {
        _fragmentPath: r'''
fragment BookFragment on Book {
  id
}
''',
      },
    );
  });

  test('fails when req output enabled without ast output', () async {
    const document = r'''
query Books {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'outputs.req requires outputs.ast to be true.',
      config: const {
        'outputs': {
          'req': true,
          'ast': false,
          'data': true,
          'vars': true,
          'schema': true,
        },
      },
    );
  });

  test('fails when req output enabled without data output', () async {
    const document = r'''
query Books {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'outputs.req requires outputs.data to be true.',
      config: const {
        'outputs': {
          'req': true,
          'ast': true,
          'data': false,
          'vars': true,
          'schema': true,
        },
      },
    );
  });

  test('fails when req output enabled without vars output', () async {
    const document = r'''
query Books {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'outputs.req requires outputs.vars to be true.',
      config: const {
        'outputs': {
          'req': true,
          'ast': true,
          'data': true,
          'vars': false,
          'schema': true,
        },
      },
    );
  });

  test('fails on inline fragment with unknown type condition', () async {
    const document = r'''
query Books {
  books {
    ... on UnknownType {
      id
    }
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Missing type definition for UnknownType',
    );
  });

  test('fails on fragment definition with unknown type condition', () async {
    const document = r'''
fragment UnknownFragment on UnknownType {
  id
}

query Books {
  books {
    ...UnknownFragment
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Missing type definition for UnknownType',
    );
  });

  test('fails on unnamed operation', () async {
    const document = r'''
query {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Operations must be named',
    );
  });

  test('fails on duplicate operation names', () async {
    const document = r'''
query Books {
  books {
    id
  }
}

query Books {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Duplicate operation definition Books',
    );
  });

  test('fails on duplicate fragment names', () async {
    const document = r'''
fragment BookFragment on Book {
  id
}

fragment BookFragment on Book {
  title
}

query Books {
  books {
    ...BookFragment
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Duplicate fragment definition BookFragment',
    );
  });

  test('fails on fragment spread cycles', () async {
    const document = r'''
fragment A on Book {
  ...B
}

fragment B on Book {
  ...A
}

query Books {
  books {
    ...A
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Fragment spread cycle detected at A',
    );
  });

  test('fails when add_typenames is false for polymorphic selection', () async {
    const document = r'''
query Hero {
  hero {
    ... on Human {
      id
    }
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage:
          'Polymorphic selections require schema.add_typenames to be true.',
      config: const {
        'schema': {
          'file': _schemaPath,
          'add_typenames': false,
        },
      },
    );
  });

  test('fails when when_extensions enabled without add_typenames', () async {
    const document = r'''
query Books {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage:
          'When extensions require schema.add_typenames to be true.',
      config: const {
        'schema': {
          'file': _schemaPath,
          'add_typenames': false,
        },
        'data_classes': {
          'when_extensions': {
            'when': true,
          },
        },
      },
    );
  });

  test('fails when selecting subfields on a scalar', () async {
    const document = r'''
query Books {
  books {
    title {
      length
    }
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage:
          'Field title of type String must not have a selection set',
    );
  });

  test('fails when missing selection set on object field', () async {
    const document = r'''
query Books {
  books {
    author
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Field author of type Author must have a selection set',
    );
  });

  test('fails on incompatible inline fragment type condition', () async {
    const document = r'''
query Books {
  books {
    ... on Droid {
      id
    }
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Type condition Droid is not applicable to Book',
    );
  });

  test('fails on incompatible fragment spread type condition', () async {
    const document = r'''
fragment DroidFragment on Droid {
  id
}

query Books {
  books {
    ...DroidFragment
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Type condition Droid is not applicable to Book',
    );
  });

  test('fails on unknown argument', () async {
    const document = r'''
query Book {
  book(id: "1", foo: "bar") {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Unknown argument foo on field book',
    );
  });

  test('fails on missing required argument', () async {
    const document = r'''
query Book {
  book {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Missing required argument id on field book',
    );
  });

  test('fails on wrong argument type', () async {
    const document = r'''
query Book {
  book(id: true) {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Invalid value for argument id on field book',
    );
  });

  test('fails when variable has non-input type', () async {
    const document = r'''
query Book($book: Book) {
  book(id: "1") {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Variable book has non-input type Book',
    );
  });

  test('fails when variable is used but not defined', () async {
    const document = r'''
query Book {
  book(id: $id) {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Variable id is used but not defined in operation Book',
    );
  });

  test('fails when variable is defined but not used', () async {
    const document = r'''
query Book($id: ID!) {
  book(id: "1") {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Variable id is defined but not used in operation Book',
    );
  });

  test('fails on unknown directive', () async {
    const document = r'''
query Book {
  book(id: "1") {
    id @unknown
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Unknown directive @unknown',
    );
  });

  test('fails on directive used in wrong location', () async {
    const document = r'''
fragment BookFragment on Book @fieldOnly(arg: "x") {
  id
}

query Books {
  books {
    ...BookFragment
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage:
          'Directive @fieldOnly cannot be used on FRAGMENT_DEFINITION',
    );
  });

  test('fails on missing directive argument', () async {
    const document = r'''
query Books {
  books {
    id @skip
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Missing required argument if on directive @skip',
    );
  });

  test('fails on wrong directive argument type', () async {
    const document = r'''
query Books {
  books {
    id @skip(if: "no")
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Invalid value for argument if on directive @skip',
    );
  });

  test('fails on unknown directive argument', () async {
    const document = r'''
query Books {
  books {
    id @skip(if: true, extra: true)
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage: 'Unknown argument extra on directive @skip',
    );
  });

  test('fails on alias collisions', () async {
    const document = r'''
query Books {
  books {
    value: title
    value: author {
      name
    }
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage:
          'Conflicting fields for response key value on Book: title vs author',
    );
  });

  test('fails on unknown enum fallback names', () async {
    const document = r'''
query Books {
  books {
    id
  }
}
''';

    await _expectBuildFailure(
      document: document,
      expectedMessage:
          'Unknown enum(s) in enums.fallback.per_enum: MissingEnum',
      config: const {
        'enums': {
          'fallback': {
            'per_enum': {
              'MissingEnum': 'gUnknownMissingEnum',
            },
          },
        },
      },
    );
  });
}

Future<void> _expectBuildFailure({
  required String document,
  required String expectedMessage,
  Map<String, String> extraAssets = const {},
  Map<String, Object?> config = const {},
  String schema = _schema,
}) async {
  final builderConfig = {
    'schema': {
      'file': _schemaPath,
      'add_typenames': true,
    },
    ...config,
  };
  final builder = () {
    try {
      return graphqlBuilder(BuilderOptions(builderConfig));
    } catch (error) {
      expect(error.toString(), contains(expectedMessage));
      return null;
    }
  }();
  if (builder == null) {
    return;
  }

  final assets = <String, Object>{
    _schemaPath: schema,
    _queryPath: document,
    ...extraAssets,
  };

  final result = await testBuilder(
    builder,
    assets,
    rootPackage: _package,
    generateFor: {_queryPath},
  );

  expect(result.succeeded, isFalse);
  expect(result.errors.join('\n'), contains(expectedMessage));
}
