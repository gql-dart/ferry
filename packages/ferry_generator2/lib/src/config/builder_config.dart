import "package:build/build.dart";
import "package:pub_semver/pub_semver.dart";

import "config_schema.dart";
import "../logging/diagnostics.dart";

const astExtension = ".ast.gql.dart";
const dataExtension = ".data.gql.dart";
const varExtension = ".var.gql.dart";
const reqExtension = ".req.gql.dart";
const schemaExtension = ".schema.gql.dart";
const utilsExtension = ".utils.gql.dart";

class BuilderConfig {
  final AssetId? schemaId;
  final bool shouldAddTypenames;
  final bool shouldGeneratePossibleTypes;
  final Map<String, TypeOverrideConfig> typeOverrides;
  final EnumFallbackConfig enumFallbackConfig;
  final CollectionConfig collections;
  final String outputDir;
  final String sourceExtension;
  final InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig;
  final DataClassConfig dataClassConfig;
  final TriStateValueConfig triStateOptionalsConfig;
  final bool format;
  final Version? formatterLanguageVersion;
  final LoggingConfig logging;
  final OutputsConfig outputs;
  final bool generateCopyWith;
  final bool generateEquals;
  final bool generateHashCode;
  final bool generateToString;
  final bool generateDocs;
  final bool emitFormatOff;

  factory BuilderConfig(Map<String, dynamic> config) =>
      BuilderConfig.parse(config).config;

  static BuilderConfigParseResult parse(Map<String, dynamic> config) {
    final parsed = configSchema.parse(config);
    final values = parsed.value;
    final warnings = [...parsed.warnings];

    final schemaConfig =
        (values["schema"] ?? const <String, Object?>{}) as Map<String, Object?>;
    final schemaFile = schemaConfig["file"] as String?;
    final schemaFiles = schemaConfig["files"];
    if (schemaFiles != null) {
      throw ArgumentError.value(
        schemaFiles,
        "schema.files",
        "Multiple schemas are no longer supported. Use schema.file.",
      );
    }

    final outputsConfig = (values["outputs"] ?? const <String, Object?>{})
        as Map<String, Object?>;
    final dataClassesConfig = (values["data_classes"] ??
        const <String, Object?>{}) as Map<String, Object?>;
    final collectionsConfig = (values["collections"] ??
        const <String, Object?>{}) as Map<String, Object?>;
    final whenExtensionsConfig = (dataClassesConfig["when_extensions"] ??
        const <String, Object?>{}) as Map<String, Object?>;
    final utilsConfig = (dataClassesConfig["utils"] ??
        const <String, Object?>{}) as Map<String, Object?>;
    final varsConfig =
        (values["vars"] ?? const <String, Object?>{}) as Map<String, Object?>;
    final docsConfig =
        (values["docs"] ?? const <String, Object?>{}) as Map<String, Object?>;
    final formattingConfig = (values["formatting"] ?? const <String, Object?>{})
        as Map<String, Object?>;
    final loggingConfig = (values["logging"] ?? const <String, Object?>{})
        as Map<String, Object?>;
    final enumsConfig =
        (values["enums"] ?? const <String, Object?>{}) as Map<String, Object?>;
    final enumsFallbackConfig = (enumsConfig["fallback"] ??
        const <String, Object?>{}) as Map<String, Object?>;
    final scalarsConfig = (values["scalars"] ?? const <String, Object?>{})
        as Map<String, Object?>;

    final format = formattingConfig["enabled"] as bool;
    final formatterLanguageVersionValue =
        formattingConfig["language_version"] as String?;
    final formatterLanguageVersion =
        _getFormatterLanguageVersion(formatterLanguageVersionValue);

    final builderConfig = BuilderConfig._(
      schemaId: _parseSchemaId(schemaFile),
      shouldAddTypenames: schemaConfig["add_typenames"] as bool,
      shouldGeneratePossibleTypes:
          schemaConfig["generate_possible_types_map"] as bool,
      typeOverrides: _getTypeOverrides(scalarsConfig),
      enumFallbackConfig: _getEnumFallbackConfig(enumsFallbackConfig),
      collections: _getCollectionsConfig(collectionsConfig),
      outputDir: schemaConfig["output_dir"] as String,
      sourceExtension: schemaConfig["source_extension"] as String,
      whenExtensionConfig: _getWhenExtensionConfig(whenExtensionsConfig),
      dataClassConfig: _getDataClassConfig(dataClassesConfig),
      triStateOptionalsConfig: _getTriStateOptionalsConfig(
        varsConfig["tristate_optionals"] as bool,
      ),
      format: format,
      formatterLanguageVersion: formatterLanguageVersion,
      logging: _getLoggingConfig(loggingConfig),
      emitFormatOff: formattingConfig["emit_format_off"] as bool,
      outputs: _getOutputsConfig(outputsConfig),
      generateCopyWith: utilsConfig["copy_with"] as bool,
      generateEquals: utilsConfig["equals"] as bool,
      generateHashCode: utilsConfig["hash_code"] as bool,
      generateToString: utilsConfig["to_string"] as bool,
      generateDocs: docsConfig["enabled"] as bool,
    );

    _validateOutputs(builderConfig.outputs);
    if (!format && formatterLanguageVersion != null) {
      warnings.add(
        "formatting.language_version is ignored when formatting.enabled is false.",
      );
    }

    return BuilderConfigParseResult(
      config: builderConfig,
      warnings: warnings,
    );
  }

  const BuilderConfig._({
    required this.schemaId,
    required this.shouldAddTypenames,
    required this.shouldGeneratePossibleTypes,
    required this.typeOverrides,
    required this.enumFallbackConfig,
    required this.collections,
    required this.outputDir,
    required this.sourceExtension,
    required this.whenExtensionConfig,
    required this.dataClassConfig,
    required this.triStateOptionalsConfig,
    required this.format,
    required this.formatterLanguageVersion,
    required this.logging,
    required this.outputs,
    required this.generateCopyWith,
    required this.generateEquals,
    required this.generateHashCode,
    required this.generateToString,
    required this.generateDocs,
    required this.emitFormatOff,
  });

  String summary() {
    final schema = schemaId?.toString() ?? "unset";
    final scalars = typeOverrides.length;
    final outputs = _outputsSummary();
    final logging = _loggingSummary();
    return "schema=$schema, outputs=$outputs, addTypenames=$shouldAddTypenames, "
        "possibleTypes=$shouldGeneratePossibleTypes, scalars=$scalars, "
        "collections=${collections.mode.name}, format=$format, "
        "formatter=${formatterLanguageVersion ?? 'default'}, "
        "docs=${generateDocs ? 'on' : 'off'}, utils=${_utilsSummary()}, "
        "logging=$logging";
  }

  String _outputsSummary() {
    final enabled = <String>[];
    if (outputs.ast) enabled.add("ast");
    if (outputs.data) enabled.add("data");
    if (outputs.vars) enabled.add("vars");
    if (outputs.req) enabled.add("req");
    if (outputs.schema) enabled.add("schema");
    return enabled.join("|");
  }

  String _utilsSummary() {
    final enabled = <String>[];
    if (generateCopyWith) enabled.add("copyWith");
    if (generateEquals) enabled.add("equals");
    if (generateHashCode) enabled.add("hashCode");
    if (generateToString) enabled.add("toString");
    if (enabled.isEmpty) return "off";
    return enabled.join("|");
  }

  String _loggingSummary() {
    final categories = logging.categories.isEmpty
        ? "all"
        : logging.categories.map((category) => category.name).join("|");
    return "${logging.level.name}/${logging.format.name}/$categories";
  }
}

class BuilderConfigParseResult {
  final BuilderConfig config;
  final List<String> warnings;

  const BuilderConfigParseResult({
    required this.config,
    required this.warnings,
  });
}

void _validateOutputs(OutputsConfig outputs) {
  if (outputs.req && !outputs.ast) {
    throw StateError("outputs.req requires outputs.ast to be true.");
  }
  if (outputs.req && !outputs.data) {
    throw StateError("outputs.req requires outputs.data to be true.");
  }
  if (outputs.req && !outputs.vars) {
    throw StateError("outputs.req requires outputs.vars to be true.");
  }
}

class OutputsConfig {
  final bool ast;
  final bool data;
  final bool vars;
  final bool req;
  final bool schema;

  const OutputsConfig({
    this.ast = true,
    this.data = true,
    this.vars = true,
    this.req = true,
    this.schema = true,
  });
}

class DataClassConfig {
  final bool reuseFragments;

  const DataClassConfig({
    required this.reuseFragments,
  });
}

class InlineFragmentSpreadWhenExtensionConfig {
  final bool generateWhenExtensionMethod;
  final bool generateMaybeWhenExtensionMethod;

  const InlineFragmentSpreadWhenExtensionConfig({
    required this.generateWhenExtensionMethod,
    required this.generateMaybeWhenExtensionMethod,
  });
}

class EnumFallbackConfig {
  final bool generateFallbackValuesGlobally;
  final String globalEnumFallbackName;
  final Map<String, String> fallbackValueMap;

  const EnumFallbackConfig({
    required this.generateFallbackValuesGlobally,
    required this.globalEnumFallbackName,
    required this.fallbackValueMap,
  });
}

enum CollectionMode { plain, unmodifiable }

class CollectionConfig {
  final CollectionMode mode;

  const CollectionConfig({required this.mode});
}

class TypeOverrideConfig {
  final String? type;
  final String? import;
  final String? fromJsonFunctionName;
  final String? toJsonFunctionName;

  const TypeOverrideConfig({
    this.type,
    this.import,
    this.fromJsonFunctionName,
    this.toJsonFunctionName,
  });
}

enum TriStateValueConfig { onAllNullableFields, never }

AssetId? _parseSchemaId(Object? value) {
  if (value == null) return null;
  return AssetId.parse(value as String);
}

OutputsConfig _getOutputsConfig(Map<String, Object?> config) {
  if (config.isEmpty) return const OutputsConfig();
  return OutputsConfig(
    ast: config["ast"] as bool,
    data: config["data"] as bool,
    vars: config["vars"] as bool,
    req: config["req"] as bool,
    schema: config["schema"] as bool,
  );
}

CollectionConfig _getCollectionsConfig(Map<String, Object?> config) {
  final raw = config["mode"] as String;
  final value = raw.trim().toLowerCase();
  return CollectionConfig(
    mode: switch (value) {
      "plain" => CollectionMode.plain,
      "unmodifiable" => CollectionMode.unmodifiable,
      _ => throw ArgumentError.value(
          raw,
          "collections.mode",
          "Expected one of plain, unmodifiable",
        ),
    },
  );
}

Version? _getFormatterLanguageVersion(String? raw) {
  if (raw == null) return null;

  final normalized = _normalizeVersionString(raw.trim());
  try {
    return Version.parse(normalized);
  } catch (error) {
    throw ArgumentError.value(
      raw,
      "formatting.language_version",
      "Invalid version string",
    );
  }
}

String _normalizeVersionString(String value) {
  final trimmed = value.trim();
  final numeric = RegExp(r"^\d+(\.\d+){0,2}$");
  if (!numeric.hasMatch(trimmed)) return trimmed;
  final parts = trimmed.split(".");
  if (parts.length == 1) return "${parts[0]}.0.0";
  if (parts.length == 2) return "${parts[0]}.${parts[1]}.0";
  return trimmed;
}

LoggingConfig _getLoggingConfig(Map<String, Object?> config) {
  final level = _parseLogLevel(config["level"] as String);
  final format = _parseLogFormat(config["format"] as String);
  final rawCategories = config["categories"] as List<String>;
  final categories = _parseLogCategories(rawCategories);
  return LoggingConfig(
    level: level,
    format: format,
    categories: categories,
  );
}

LogLevel _parseLogLevel(String raw) {
  final value = raw.trim().toLowerCase();
  return switch (value) {
    "off" => LogLevel.off,
    "error" => LogLevel.error,
    "warn" => LogLevel.warn,
    "warning" => LogLevel.warn,
    "info" => LogLevel.info,
    "debug" => LogLevel.debug,
    "verbose" => LogLevel.debug,
    _ => throw ArgumentError.value(
        raw,
        "logging.level",
        "Expected one of off, error, warn, info, debug",
      ),
  };
}

LogFormat _parseLogFormat(String raw) {
  final value = raw.trim().toLowerCase();
  return switch (value) {
    "text" => LogFormat.text,
    "json" => LogFormat.json,
    _ => throw ArgumentError.value(
        raw,
        "logging.format",
        "Expected one of text, json",
      ),
  };
}

Set<LogCategory> _parseLogCategories(List<String> raw) {
  if (raw.isEmpty) return const <LogCategory>{};
  final categories = <LogCategory>{};
  for (final entry in raw) {
    final value = entry.trim().toLowerCase();
    categories.add(
      switch (value) {
        "config" => LogCategory.config,
        "validation" => LogCategory.validation,
        "schema" => LogCategory.schema,
        "ir" => LogCategory.ir,
        "data" => LogCategory.data,
        "vars" => LogCategory.vars,
        "req" => LogCategory.req,
        "emit" => LogCategory.emit,
        "build" => LogCategory.build,
        _ => throw ArgumentError.value(
            entry,
            "logging.categories",
            "Unknown log category",
          ),
      },
    );
  }
  return categories;
}

DataClassConfig _getDataClassConfig(Map<String, Object?> config) {
  return DataClassConfig(
    reuseFragments: config["reuse_fragments"] as bool,
  );
}

InlineFragmentSpreadWhenExtensionConfig _getWhenExtensionConfig(
  Map<String, Object?> config,
) {
  if (config.isEmpty) {
    return const InlineFragmentSpreadWhenExtensionConfig(
      generateMaybeWhenExtensionMethod: false,
      generateWhenExtensionMethod: false,
    );
  }
  return InlineFragmentSpreadWhenExtensionConfig(
    generateMaybeWhenExtensionMethod: config["maybe_when"] as bool,
    generateWhenExtensionMethod: config["when"] as bool,
  );
}

EnumFallbackConfig _getEnumFallbackConfig(Map<String, Object?> config) {
  if (config.isEmpty) {
    return const EnumFallbackConfig(
      fallbackValueMap: {},
      generateFallbackValuesGlobally: false,
      globalEnumFallbackName: "gUnknownEnumValue",
    );
  }

  return EnumFallbackConfig(
    globalEnumFallbackName: config["name"] as String,
    generateFallbackValuesGlobally: config["global"] as bool,
    fallbackValueMap: _enumFallbackMap(config["per_enum"]),
  );
}

Map<String, String> _enumFallbackMap(Object? enumFallbacks) {
  if (enumFallbacks == null) return {};
  if (enumFallbacks is! Map<String, Object?>) {
    throw ArgumentError.value(
      enumFallbacks,
      "enums.fallback.per_enum",
      "Expected a map of enum names to fallback values",
    );
  }
  final result = <String, String>{};
  for (final entry in enumFallbacks.entries) {
    final key = entry.key;
    final value = entry.value;
    if (value is! String) {
      throw ArgumentError.value(
        value,
        "enums.fallback.per_enum.$key",
        "Enum fallback values must be strings",
      );
    }
    result[key] = value;
  }
  return result;
}

TriStateValueConfig _getTriStateOptionalsConfig(bool configValue) {
  return configValue
      ? TriStateValueConfig.onAllNullableFields
      : TriStateValueConfig.never;
}

Map<String, TypeOverrideConfig> _getTypeOverrides(
  Map<String, Object?> overrides,
) {
  if (overrides.isEmpty) return {};

  return Map<String, TypeOverrideConfig>.fromEntries(overrides.entries.map(
    (entry) {
      final key = entry.key;
      final configMap = entry.value as Map<String, Object?>? ?? {};
      final config = TypeOverrideConfig(
        type: configMap["type"] as String?,
        import: configMap["import"] as String?,
        fromJsonFunctionName: configMap["from_json"] as String?,
        toJsonFunctionName: configMap["to_json"] as String?,
      );
      return MapEntry(key, config);
    },
  ));
}
