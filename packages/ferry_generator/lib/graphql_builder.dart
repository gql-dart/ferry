import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql_code_builder/ast.dart';
import 'package:gql_code_builder/data.dart';
import 'package:gql_code_builder/var.dart';
import 'package:gql_code_builder/schema.dart';
import 'package:path/path.dart' as p;

import 'src/utils/locations.dart';
import 'src/utils/config.dart';
import 'src/utils/reader.dart';
import 'src/utils/writer.dart';
import 'src/utils/add_introspection.dart';
import 'src/codegen/req.dart';
import 'src/allocators/gql_allocator.dart';

Builder graphqlBuilder(
  BuilderOptions options,
) =>
    GraphqlBuilder(options.config);

class GraphqlBuilder implements Builder {
  BuilderConfig config;

  GraphqlBuilder(Map<String, dynamic> config) : config = BuilderConfig(config);

  final localFileExtensions = <String>[
    astExtension,
    dataExtension,
    varExtension,
    reqExtension,
    schemaExtension
  ];

  @override
  Map<String, List<String>> get buildExtensions => {
        '{{dir}}/{{file}}${config.sourceExtension}': [
          ...localFileExtensions.map(
              (extension) => '{{dir}}/${config.outputDir}/{{file}}$extension')
        ],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {

    print("jooo ${buildStep.inputId}");

    final doc = await readDocument(buildStep, config.sourceExtension);
    final schema =
        await readDocument(buildStep, config.sourceExtension, config.schemaId);

    if ((config.whenExtensionConfig.generateMaybeWhenExtensionMethod ||
            config.whenExtensionConfig.generateWhenExtensionMethod) &&
        !config.shouldAddTypenames) {
      throw StateError(
          'When extensions require add_typenames to be true. Consider setting add_typenames to true in your build.yaml or disabling when_extensions in your build.yaml.');
    }

    final schemaOutputAsset =
    outputAssetId(config.schemaId, schemaExtension, config.outputDir);

    final schemaUrl =
     schemaOutputAsset.uri.toString();
    final schemaAllocator = GqlAllocator(
      buildStep.inputId.uri.toString(),
      config.sourceExtension,
      outputAssetId(buildStep.inputId, schemaExtension, config.outputDir).uri.toString(),
      schemaUrl,
      config.outputDir,
    );

    final varAllocator = schemaAllocator;
    final libs = <String, Library>{
      astExtension: buildAstLibrary(doc),
      dataExtension: buildDataLibrary(
        config.shouldAddTypenames ? addTypenames(doc) : doc,
        addTypenames(schema),
        p.basename(generatedFilePath(buildStep.inputId, dataExtension)),
        config.typeOverrides,
        config.whenExtensionConfig,
      ),
      varExtension: buildVarLibrary(
        doc,
        addTypenames(schema),
        p.basename(generatedFilePath(buildStep.inputId, varExtension)),
        config.typeOverrides,
          varAllocator
      ),
      reqExtension: buildReqLibrary(
        doc,
        p.basename(generatedFilePath(buildStep.inputId, reqExtension)),
      ),
      schemaExtension: buildSchemaLibrary(
        doc,
        p.basename(generatedFilePath(buildStep.inputId, schemaExtension)),
        config.typeOverrides,
        config.enumFallbackConfig,
        generatePossibleTypesMap: config.shouldGeneratePossibleTypes,
        allocator: schemaAllocator,
      ),
    };

    for (var entry in libs.entries) {
      final generatedAsset =
          outputAssetId(buildStep.inputId, entry.key, config.outputDir);
      final schemaOutputAsset =
          outputAssetId(config.schemaId, schemaExtension, config.outputDir);

      final allocator =

      entry.key == schemaExtension ? schemaAllocator :
      entry.key == varExtension ? varAllocator :

      GqlAllocator(
        buildStep.inputId.uri.toString(),
        config.sourceExtension,
        generatedAsset.uri.toString(),
        schemaOutputAsset.uri.toString(),
        config.outputDir,
      );

      await writeDocument(generatedAsset, entry.value, allocator, buildStep);
    }
  }
}
