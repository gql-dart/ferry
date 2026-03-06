@TestOn('vm')

import 'package:build_test/build_test.dart';
import 'package:ferry_generator2/graphql_builder.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

const _package = 'ferry_generator2';
const _schemaPath = '$_package|lib/schema.graphql';
const _queryPath = '$_package|lib/operations.graphql';

const _schema = r'''
schema {
  query: Query
}

type Book {
  id: ID!
}

type Query {
  books: [Book!]!
}

enum Episode {
  NEWHOPE
}
''';

const _document = r'''
query Books {
  books {
    id
  }
}
''';

void main() {
  test('logs warnings for unknown config entries', () async {
    final logs = <LogRecord>[];
    final config = <String, dynamic>{
      'schema': {
        'file': _schemaPath,
        'add_typenames': true,
        'unknown': true,
      },
      'collections': {
        'mode': 'plain',
      },
      'enums': {
        'fallback': {
          'per_enum': {
            'Episode': 'gUnknownEpisode',
          },
          'extra': true,
        },
        'extra': true,
      },
      'scalars': {
        'Date': {
          'type': 'CustomDate',
          'unknown': true,
        },
      },
      'unknown_top': true,
    };

    final assets = <String, Object>{
      _schemaPath: _schema,
      _queryPath: _document,
    };

    final result = await testBuilderFactories(
      [(options) => GraphqlBuilder(config)],
      assets,
      rootPackage: _package,
      generateFor: {_queryPath},
      onLog: logs.add,
    );

    expect(result.succeeded, isTrue);

    final messages = logs
        .where((record) => record.level >= Level.WARNING)
        .map((record) => record.message)
        .join('\n');

    expect(messages, contains('options: unknown_top'));
    expect(messages, contains('schema: unknown'));
    expect(messages, contains('enums: extra'));
    expect(messages, contains('enums.fallback: extra'));
    expect(messages, contains('scalars.Date: unknown'));
  });

  test('logs warning when language_version set but formatting disabled',
      () async {
    final logs = <LogRecord>[];
    final config = <String, dynamic>{
      'schema': {
        'file': _schemaPath,
        'add_typenames': true,
      },
      'collections': {
        'mode': 'plain',
      },
      'formatting': {
        'enabled': false,
        'language_version': '3.6',
      },
    };

    final assets = <String, Object>{
      _schemaPath: _schema,
      _queryPath: _document,
    };

    final result = await testBuilderFactories(
      [(options) => GraphqlBuilder(config)],
      assets,
      rootPackage: _package,
      generateFor: {_queryPath},
      onLog: logs.add,
    );

    expect(result.succeeded, isTrue);

    final messages = logs
        .where((record) => record.level >= Level.WARNING)
        .map((record) => record.message)
        .join('\n');

    expect(
      messages,
      contains(
        'formatting.language_version is ignored when formatting.enabled is false.',
      ),
    );
  });
}
