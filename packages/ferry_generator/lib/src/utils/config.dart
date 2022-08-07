import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql_code_builder/schema.dart';
import 'package:yaml/yaml.dart';

const astExtension = '.ast.gql.dart';
const dataExtension = '.data.gql.dart';
const varExtension = '.var.gql.dart';
const reqExtension = '.req.gql.dart';
const schemaExtension = '.schema.gql.dart';

class BuilderConfig {
  final AssetId schemaId;
  final bool shouldAddTypenames;
  final bool shouldGeneratePossibleTypes;
  final Map<String, Reference> typeOverrides;
  final Set<Reference> customSerializers;
  final EnumFallbackConfig enumFallbackConfig;
  final String outputDir;
  final String sourceExtension;

  BuilderConfig(Map<String, dynamic> config)
      : schemaId = AssetId.parse(config['schema'] as String),
        shouldAddTypenames = config['add_typenames'] ?? true,
        typeOverrides = _getTypeOverrides(config['type_overrides']),
        shouldGeneratePossibleTypes = config['generate_possible_types_map'] ?? true,
        customSerializers = _getCustomSerializers(config['custom_serializers']),
        enumFallbackConfig = _getEnumFallbackConfig(config),
        outputDir = config['output_dir'] ?? '__generated__',
        sourceExtension = config['source_extension'] ?? '.graphql';
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
        globalEnumFallbackName: null);
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
