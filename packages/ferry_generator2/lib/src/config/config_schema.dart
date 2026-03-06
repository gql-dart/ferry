import "package:yaml/yaml.dart";

// Internal config schema model for parsing and warnings.

enum ConfigValueType { boolean, string, stringOrNumber, stringList }

class ConfigParseResult<T> {
  final T value;
  final List<String> warnings;

  const ConfigParseResult({
    required this.value,
    required this.warnings,
  });
}

sealed class ConfigField<T> {
  const ConfigField();

  ConfigParseResult<T> parse(Object? value, String path);
}

class ConfigLeaf<T> extends ConfigField<T> {
  final ConfigValueType type;
  final T defaultValue;

  const ConfigLeaf(this.type, this.defaultValue);

  @override
  ConfigParseResult<T> parse(Object? value, String path) {
    if (value == null) {
      return ConfigParseResult(value: defaultValue, warnings: const []);
    }
    return ConfigParseResult(
      value: _parseValue(value, path),
      warnings: const [],
    );
  }

  T _parseValue(Object? value, String path) {
    return switch (type) {
      ConfigValueType.boolean => _parseBool(value, path) as T,
      ConfigValueType.string => _parseString(value, path) as T,
      ConfigValueType.stringOrNumber => _parseStringOrNumber(value, path) as T,
      ConfigValueType.stringList => _parseStringList(value, path) as T,
    };
  }

  bool _parseBool(Object? value, String path) {
    if (value is bool) return value;
    throw ArgumentError.value(value, path, "Expected a boolean");
  }

  String? _parseString(Object? value, String path) {
    if (value is String) return value;
    throw ArgumentError.value(value, path, "Expected a string");
  }

  String? _parseStringOrNumber(Object? value, String path) {
    if (value is String) return value;
    if (value is num) return value.toString();
    throw ArgumentError.value(value, path, "Expected a string or number");
  }

  List<String> _parseStringList(Object? value, String path) {
    if (value is YamlList) {
      return _parseStringListEntries(value.toList(), path);
    }
    if (value is List) {
      return _parseStringListEntries(value, path);
    }
    throw ArgumentError.value(value, path, "Expected a list of strings");
  }

  List<String> _parseStringListEntries(List<Object?> values, String path) {
    final entries = <String>[];
    for (final entry in values) {
      if (entry is! String) {
        throw ArgumentError.value(entry, path, "Expected a list of strings");
      }
      entries.add(entry);
    }
    return entries;
  }
}

class ConfigSection extends ConfigField<Map<String, Object?>> {
  final ConfigSchema schema;

  const ConfigSection(this.schema);

  @override
  ConfigParseResult<Map<String, Object?>> parse(Object? value, String path) {
    return schema.parse(value, contextOverride: path);
  }
}

class ConfigMapOf extends ConfigField<Map<String, Object?>> {
  final String context;
  final ConfigField? valueField;

  const ConfigMapOf({
    required this.context,
    this.valueField,
  });

  @override
  ConfigParseResult<Map<String, Object?>> parse(Object? value, String path) {
    final map = _expectMap(value, path);
    final warnings = <String>[];
    final output = <String, Object?>{};
    for (final entry in map.entries) {
      final key = entry.key;
      final entryValue = entry.value;
      if (valueField == null) {
        output[key] = entryValue;
        continue;
      }
      final parsed = valueField!.parse(entryValue, "$context.$key");
      output[key] = parsed.value;
      warnings.addAll(parsed.warnings);
    }
    return ConfigParseResult(value: output, warnings: warnings);
  }
}

class ConfigSchema {
  final String context;
  final Map<String, ConfigField> fields;

  const ConfigSchema(this.context, this.fields);

  ConfigParseResult<Map<String, Object?>> parse(
    Object? value, {
    String? contextOverride,
  }) {
    final resolvedContext = contextOverride ?? context;
    final map = _expectMap(value, resolvedContext);
    final warnings = <String>[];
    final unknown = map.keys
        .whereType<String>()
        .where((key) => !fields.containsKey(key))
        .toList()
      ..sort();
    if (unknown.isNotEmpty) {
      warnings.add(
        "Unknown config option(s) at $resolvedContext: ${unknown.join(', ')}",
      );
    }

    final output = <String, Object?>{};
    for (final entry in fields.entries) {
      final key = entry.key;
      final field = entry.value;
      final fieldPath =
          resolvedContext == "options" ? key : "$resolvedContext.$key";
      final parsed = field.parse(map[key], fieldPath);
      output[key] = parsed.value;
      warnings.addAll(parsed.warnings);
    }
    return ConfigParseResult(value: output, warnings: warnings);
  }
}

Map<String, Object?> _expectMap(Object? value, String path) {
  if (value == null) return {};
  if (value is YamlMap) return Map<String, Object?>.from(value);
  if (value is Map) return Map<String, Object?>.from(value);
  throw ArgumentError.value(value, path, "Expected a map");
}

const schemaSchema = ConfigSchema("schema", {
  "file": ConfigLeaf<String?>(ConfigValueType.string, null),
  "files": ConfigLeaf<String?>(ConfigValueType.string, null),
  "add_typenames": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "generate_possible_types_map":
      ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "output_dir": ConfigLeaf<String>(ConfigValueType.string, "__generated__"),
  "source_extension": ConfigLeaf<String>(ConfigValueType.string, ".graphql"),
});

const outputsSchema = ConfigSchema("outputs", {
  "ast": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "data": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "vars": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "req": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "schema": ConfigLeaf<bool>(ConfigValueType.boolean, true),
});

const whenExtensionsSchema = ConfigSchema("data_classes.when_extensions", {
  "when": ConfigLeaf<bool>(ConfigValueType.boolean, false),
  "maybe_when": ConfigLeaf<bool>(ConfigValueType.boolean, false),
});

const utilsSchema = ConfigSchema("data_classes.utils", {
  "copy_with": ConfigLeaf<bool>(ConfigValueType.boolean, false),
  "equals": ConfigLeaf<bool>(ConfigValueType.boolean, false),
  "hash_code": ConfigLeaf<bool>(ConfigValueType.boolean, false),
  "to_string": ConfigLeaf<bool>(ConfigValueType.boolean, false),
});

const dataClassesSchema = ConfigSchema("data_classes", {
  "reuse_fragments": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "when_extensions": ConfigSection(whenExtensionsSchema),
  "utils": ConfigSection(utilsSchema),
});

const collectionsSchema = ConfigSchema("collections", {
  "mode": ConfigLeaf<String>(ConfigValueType.string, "plain"),
});

const varsSchema = ConfigSchema("vars", {
  "tristate_optionals": ConfigLeaf<bool>(ConfigValueType.boolean, false),
});

const docsSchema = ConfigSchema("docs", {
  "enabled": ConfigLeaf<bool>(ConfigValueType.boolean, false),
});

const formattingSchema = ConfigSchema("formatting", {
  "enabled": ConfigLeaf<bool>(ConfigValueType.boolean, true),
  "language_version": ConfigLeaf<String?>(ConfigValueType.stringOrNumber, null),
  "emit_format_off": ConfigLeaf<bool>(ConfigValueType.boolean, false),
});

const loggingSchema = ConfigSchema("logging", {
  "level": ConfigLeaf<String>(ConfigValueType.string, "warn"),
  "format": ConfigLeaf<String>(ConfigValueType.string, "text"),
  "categories": ConfigLeaf<List<String>>(ConfigValueType.stringList, const []),
});

const enumsFallbackSchema = ConfigSchema("enums.fallback", {
  "global": ConfigLeaf<bool>(ConfigValueType.boolean, false),
  "name": ConfigLeaf<String>(ConfigValueType.string, "gUnknownEnumValue"),
  "per_enum": ConfigMapOf(context: "enums.fallback.per_enum"),
});

const enumsSchema = ConfigSchema("enums", {
  "fallback": ConfigSection(enumsFallbackSchema),
});

const scalarSchema = ConfigSchema("scalars.<name>", {
  "type": ConfigLeaf<String?>(ConfigValueType.string, null),
  "import": ConfigLeaf<String?>(ConfigValueType.string, null),
  "from_json": ConfigLeaf<String?>(ConfigValueType.string, null),
  "to_json": ConfigLeaf<String?>(ConfigValueType.string, null),
});

const configSchema = ConfigSchema("options", {
  "schema": ConfigSection(schemaSchema),
  "outputs": ConfigSection(outputsSchema),
  "data_classes": ConfigSection(dataClassesSchema),
  "collections": ConfigSection(collectionsSchema),
  "vars": ConfigSection(varsSchema),
  "docs": ConfigSection(docsSchema),
  "formatting": ConfigSection(formattingSchema),
  "logging": ConfigSection(loggingSchema),
  "enums": ConfigSection(enumsSchema),
  "scalars": ConfigMapOf(
    context: "scalars",
    valueField: ConfigSection(scalarSchema),
  ),
});
