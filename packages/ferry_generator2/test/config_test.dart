import 'package:ferry_generator2/src/config/builder_config.dart';
import 'package:ferry_generator2/src/logging/diagnostics.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

void main() {
  test('formatter language version accepts x.y', () {
    final config = BuilderConfig({
      'formatting': {
        'language_version': '3.4',
      },
    });

    expect(config.formatterLanguageVersion, Version(3, 4, 0));
  });

  test('formatter language version accepts numeric', () {
    final config = BuilderConfig({
      'formatting': {
        'language_version': 3.3,
      },
    });

    expect(config.formatterLanguageVersion, Version(3, 3, 0));
  });

  test('formatter language version accepts x.y.z', () {
    final config = BuilderConfig({
      'formatting': {
        'language_version': '3.6.1',
      },
    });

    expect(config.formatterLanguageVersion, Version(3, 6, 1));
  });

  test('formatter emit_format_off parses', () {
    final config = BuilderConfig({
      'formatting': {
        'emit_format_off': true,
      },
    });

    expect(config.emitFormatOff, isTrue);
  });

  test('per-enum fallback config parses', () {
    final config = BuilderConfig({
      'enums': {
        'fallback': {
          'per_enum': {
            'Episode': 'gUnknownEpisode',
          },
        },
      },
    });

    expect(
      config.enumFallbackConfig.fallbackValueMap['Episode'],
      'gUnknownEpisode',
    );
  });

  test('logging config parses', () {
    final config = BuilderConfig({
      'logging': {
        'level': 'debug',
        'format': 'json',
        'categories': ['ir', 'emit'],
      },
    });

    expect(config.logging.level, LogLevel.debug);
    expect(config.logging.format, LogFormat.json);
    expect(
      config.logging.categories,
      {LogCategory.ir, LogCategory.emit},
    );
  });

  test('logging verbose level maps to debug', () {
    final config = BuilderConfig({
      'logging': {
        'level': 'verbose',
      },
    });

    expect(config.logging.level, LogLevel.debug);
  });

  test('warns on unknown config entries', () async {
    final result = BuilderConfig.parse({
      'schema': {
        'file': 'ferry_generator2|lib/schema.graphql',
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
    });
    final messages = result.warnings.join('\n');
    expect(messages, contains('options: unknown_top'));
    expect(messages, contains('schema: unknown'));
    expect(messages, contains('enums: extra'));
    expect(messages, contains('enums.fallback: extra'));
    expect(messages, contains('scalars.Date: unknown'));
  });

  test('throws with path for invalid bool config', () {
    expect(
      () => BuilderConfig({
        'vars': {
          'tristate_optionals': 'nope',
        },
        'collections': {
          'mode': 'plain',
        },
      }),
      throwsA(
        isA<ArgumentError>().having(
          (error) => error.name,
          'name',
          'vars.tristate_optionals',
        ),
      ),
    );
  });

  test('throws with path for invalid scalar config', () {
    expect(
      () => BuilderConfig({
        'scalars': {
          'Date': 'String',
        },
        'collections': {
          'mode': 'plain',
        },
      }),
      throwsA(
        isA<ArgumentError>().having(
          (error) => error.name,
          'name',
          'scalars.Date',
        ),
      ),
    );
  });

  test('parses collection mode', () {
    final config = BuilderConfig({
      'collections': {
        'mode': 'unmodifiable',
      },
    });

    expect(config.collections.mode, CollectionMode.unmodifiable);
  });
}
