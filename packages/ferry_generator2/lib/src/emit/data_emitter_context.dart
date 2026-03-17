import "package:gql/ast.dart";

import "../config/builder_config.dart";
import "../context/generator_context.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../logging/sink.dart";
import "../schema/schema.dart";
import "../utils/docs.dart";
import "collection_helpers.dart";
import "data_emitter_types.dart";

const utilsImportAlias = "_gqlUtils";
const utilsPrefix = "$utilsImportAlias.";

class DataEmitterContext {
  final GeneratorContext context;
  final DocumentIR document;
  final SchemaIndex schema;
  final Map<FragmentName, String> fragmentSourceUrls;
  final String? utilsUrl;
  final CollectionPolicy collections;

  final Set<String> extraImports = {};
  final Map<FragmentName, FragmentInfo> fragmentInfo = {};
  final Set<String> generatedClasses = {};
  final Set<String> generatedInterfaces = {};
  final Map<String, SelectionSetIR> fragmentInterfaceSelections = {};
  final Map<String, FragmentName> interfaceKeyToFragmentName = {};
  bool needsUtilsImport = false;

  DataEmitterContext({
    required this.context,
    required this.document,
    required this.schema,
    required this.fragmentSourceUrls,
    required this.utilsUrl,
  }) : collections = CollectionPolicy(
          config: context.config,
          overrides: context.config.typeOverrides,
        );

  LogSink get log => context.log;
  BuilderConfig get config => context.config;

  String? typeDescription(TypeName typeName) {
    if (!config.generateDocs) return null;
    final definition = schema.lookupType(NameNode(value: typeName.value));
    return definition?.description?.value;
  }

  String? fieldDescription({
    required TypeName parentTypeName,
    required FieldName fieldName,
    required bool isSynthetic,
  }) {
    if (!config.generateDocs || isSynthetic) return null;
    final parentDefinition =
        schema.lookupType(NameNode(value: parentTypeName.value));
    if (parentDefinition == null) return null;
    final fieldDefinition = schema.lookupFieldDefinitionNode(
      parentDefinition,
      NameNode(value: fieldName.value),
    );
    return fieldDefinition?.description?.value;
  }

  List<String> docsForType(TypeName typeName) =>
      docLines(typeDescription(typeName));
}
