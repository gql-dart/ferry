import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql_code_builder/data.dart';
import 'package:gql_code_builder/schema.dart';
import 'package:yaml/yaml.dart';

const astExtension = '.ast.gql.dart';
const dataExtension = '.data.gql.dart';
const varExtension = '.var.gql.dart';
const reqExtension = '.req.gql.dart';
const schemaExtension = '.schema.gql.dart';

class BuilderConfig {
  final AssetId? schemaId;
  final List<AssetId>? schemaIds;
  final bool shouldAddTypenames;
  final bool shouldGeneratePossibleTypes;
  final bool shouldGenerateVarsCreateFactories;
  final Map<String, Reference> typeOverrides;
  final Set<Reference> customSerializers;
  final EnumFallbackConfig enumFallbackConfig;
  final String outputDir;
  final String sourceExtension;
  final InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig;
  final DataClassConfig dataClassConfig;
  final TriStateValueConfig triStateOptionalsConfig;
  final DataToJsonMode dataToJsonMode;

  BuilderConfig(Map<String, dynamic> config)
      : schemaId = config['schema'] == null
            ? null
            : AssetId.parse(config['schema'] as String),
        schemaIds = (config['schemas'] as YamlList?)
            ?.map((dynamic schema) => AssetId.parse(schema as String))
            .toList(),
        shouldAddTypenames = config['add_typenames'] ?? true,
        shouldGenerateVarsCreateFactories =
            config['vars_create_factories'] ?? false,
        typeOverrides = _getTypeOverrides(config['type_overrides']),
        shouldGeneratePossibleTypes =
            config['generate_possible_types_map'] ?? true,
        customSerializers = _getCustomSerializers(config['custom_serializers']),
        enumFallbackConfig = _getEnumFallbackConfig(config),
        outputDir = config['output_dir'] ?? '__generated__',
        sourceExtension = config['source_extension'] ?? '.graphql',
        whenExtensionConfig = _getWhenExtensionConfig(config),
        dataClassConfig = _getDataClassConfig(config),
        triStateOptionalsConfig = _getTriStateOptionalsConfig(config),
        dataToJsonMode = getDataToJsonModeFromConfig(config);
}

DataClassConfig _getDataClassConfig(Map<String, dynamic> config) {
  final dataClassConfig = switch (config) {
    {
      'data_class_config': {
        'reuse_fragments': final reuseFragments,
      }
    } =>
      DataClassConfig(reuseFragments: reuseFragments == true),
    _ => const DataClassConfig(reuseFragments: false),
  };

  return dataClassConfig;
}

InlineFragmentSpreadWhenExtensionConfig _getWhenExtensionConfig(
    Map<String, dynamic> config) {
  if (config['when_extensions'] == null) {
    return const InlineFragmentSpreadWhenExtensionConfig(
      generateMaybeWhenExtensionMethod: false,
      generateWhenExtensionMethod: false,
    );
  }
  final whenExtensionYamlMap = config['when_extensions'] as YamlMap;
  return InlineFragmentSpreadWhenExtensionConfig(
    generateMaybeWhenExtensionMethod:
        whenExtensionYamlMap['maybeWhen'] ?? false,
    generateWhenExtensionMethod: whenExtensionYamlMap['when'] ?? false,
  );
}

Map<String, Reference> _getTypeOverrides(YamlMap? typeOverrideConfig) {
  if (typeOverrideConfig == null) return {};

  return Map.fromEntries(
    typeOverrideConfig.entries.map(
      (entry) => MapEntry(
        entry.key as String,
        Reference(
          entry.value['name'] as String?,
          entry.value['import'] as String?,
        ),
      ),
    ),
  );
}

Set<Reference> _getCustomSerializers(YamlList? customSerializersConfig) {
  if (customSerializersConfig == null) return {};

  return customSerializersConfig
      .map(
        (dynamic configMap) => Reference(
          configMap['name'] as String?,
          configMap['import'] as String?,
        ),
      )
      .toSet();
}

EnumFallbackConfig _getEnumFallbackConfig(Map<String, dynamic>? config) {
  if (config == null) {
    return EnumFallbackConfig(
      fallbackValueMap: {},
      generateFallbackValuesGlobally: false,
      globalEnumFallbackName: null,
    );
  }

  return EnumFallbackConfig(
    globalEnumFallbackName:
        (config['global_enum_fallback_name'] ?? 'gUnknownEnumValue') as String,
    generateFallbackValuesGlobally: config['global_enum_fallbacks'] == true,
    fallbackValueMap: _enumFallbackMap(config['enum_fallbacks']),
  );
}

Map<String, String> _enumFallbackMap(YamlMap? enumFallbacks) {
  if (enumFallbacks == null) return {};

  return Map.fromEntries(
    enumFallbacks.entries.map(
      (entry) => MapEntry(
        entry.key as String,
        entry.value as String,
      ),
    ),
  );
}

TriStateValueConfig _getTriStateOptionalsConfig(Map<String, dynamic>? config) {
  final Object? configValue = config?['tristate_optionals'];

  if (configValue is bool) {
    return configValue
        ? TriStateValueConfig.onAllNullableFields
        : TriStateValueConfig.never;
  }

  return TriStateValueConfig.never;
}

enum DataToJsonMode {
  // accept dynamic and then call toJson() on it.
  // used for legacy compatibility
  dynamicParam,
  // only accept the Data type
  typeSafe;

  Reference getDataToJsonParamType(
    Reference dataTypeRef,
  ) {
    return switch (this) {
      DataToJsonMode.dynamicParam => refer('dynamic'),
      DataToJsonMode.typeSafe => dataTypeRef,
    };
  }
}

DataToJsonMode getDataToJsonModeFromConfig(Map<String, dynamic>? config) {
  final Object? configValue = config?['data_to_json'];

  const defaultMode = DataToJsonMode.typeSafe;

  return switch (configValue) {
    'type_safe' => DataToJsonMode.typeSafe,
    'dynamic_param' => DataToJsonMode.dynamicParam,
    null => defaultMode,
    _ => throw ArgumentError.value(
        configValue,
        'data_to_json',
        'Invalid value for data_to_json, expected one of: type_safe, dynamic_param',
      ),
  };
}
