import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "src/selection/add_typenames.dart";
import "src/utils/allocator.dart";
import "src/emit/ast_builder.dart";
import "src/config/builder_config.dart";
import "src/emit/data_emitter.dart";
import "src/utils/locations.dart";
import "src/source/reader.dart";
import "src/emit/req_emitter.dart";
import "src/schema/schema.dart";
import "src/emit/schema_emitter.dart";
import "src/selection/selection_resolver.dart";
import "src/ir/builder.dart";
import "src/ir/names.dart";
import "src/source/source.dart";
import "src/emit/utils_emitter.dart";
import "src/emit/vars_emitter.dart";
import "src/utils/writer.dart";
import "src/selection/validation.dart";
import "src/logging/build_log_sink.dart";
import "src/logging/diagnostics.dart";
import "src/context/generator_context.dart";

Builder graphqlBuilder(BuilderOptions options) =>
    GraphqlBuilder(options.config);

class GraphqlBuilder implements Builder {
  final BuilderConfig config;
  final List<String> _configWarnings;
  bool _didLogConfigWarnings = false;
  _SchemaCache? _schemaCache;

  factory GraphqlBuilder(Map<String, dynamic> config) {
    final result = BuilderConfig.parse(config);
    return GraphqlBuilder._(result.config, result.warnings);
  }

  GraphqlBuilder._(this.config, this._configWarnings);

  @override
  Map<String, List<String>> get buildExtensions {
    final outputs = <String>[];

    if (config.outputs.ast) {
      outputs.add("{{dir}}/${config.outputDir}/{{file}}$astExtension");
    }
    if (config.outputs.data) {
      outputs.add("{{dir}}/${config.outputDir}/{{file}}$dataExtension");
    }
    if (config.outputs.vars) {
      outputs.add("{{dir}}/${config.outputDir}/{{file}}$varExtension");
    }
    if (config.outputs.req) {
      outputs.add("{{dir}}/${config.outputDir}/{{file}}$reqExtension");
    }
    if (config.outputs.schema) {
      outputs.add("{{dir}}/${config.outputDir}/{{file}}$schemaExtension");
    }
    if (config.generateEquals || config.generateHashCode) {
      outputs.add("{{dir}}/${config.outputDir}/{{file}}$utilsExtension");
    }

    if (outputs.isEmpty) {
      return const {};
    }

    return {
      "{{dir}}/{{file}}${config.sourceExtension}": outputs,
    };
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final logSink = BuildLogSink(
      config: config.logging,
      inputId: buildStep.inputId,
    );
    final context = GeneratorContext(
      config: config,
      log: logSink,
    );
    logSink.emit(
      LogEvent(
        level: LogLevel.info,
        category: LogCategory.build,
        message: "Starting build.",
      ),
    );
    if (!_didLogConfigWarnings) {
      for (final warning in _configWarnings) {
        logSink.emit(
          LogEvent(
            level: LogLevel.warn,
            category: LogCategory.config,
            message: warning,
          ),
        );
      }
      _didLogConfigWarnings = true;
    }

    if (!config.outputs.ast &&
        !config.outputs.data &&
        !config.outputs.vars &&
        !config.outputs.req &&
        !config.outputs.schema) {
      return;
    }

    final schemaId = config.schemaId;
    if (schemaId == null) {
      throw StateError("No schema configured for ${buildStep.inputId}");
    }

    final schemaCache = await _loadSchema(buildStep, logSink);
    final schemaSource = schemaCache.source;
    final schemaIndex = schemaCache.index;

    if ((config.whenExtensionConfig.generateMaybeWhenExtensionMethod ||
            config.whenExtensionConfig.generateWhenExtensionMethod) &&
        !config.shouldAddTypenames) {
      throw StateError(
        "When extensions require schema.add_typenames to be true. Consider setting schema.add_typenames to true or disabling data_classes.when_extensions in your build.yaml.",
      );
    }

    _validateEnumFallbacks(schemaIndex, config.enumFallbackConfig);
    final sourceUrl = buildStep.inputId.uri.toString();
    final schemaUrl = schemaId.uri.toString();

    Future<void> writeOutput(
      String extension,
      Library library,
      AssetId outputId,
    ) {
      final allocator = GeneratorAllocator(
        sourceUrl: sourceUrl,
        sourceExtension: config.sourceExtension,
        currentUrl: outputId.uri.toString(),
        outputDir: config.outputDir,
        schemaUrl: schemaUrl,
      );
      return writeLibrary(
        outputId: outputId,
        library: library,
        buildStep: buildStep,
        config: config,
        allocator: allocator,
      );
    }

    if (buildStep.inputId == schemaId) {
      final utilsUrl = (config.generateEquals || config.generateHashCode)
          ? outputAssetId(
              buildStep.inputId,
              utilsExtension,
              config.outputDir,
            ).uri.toString()
          : null;
      final outputs = <String>[];
      if (config.outputs.ast) {
        final outputId = outputAssetId(
          buildStep.inputId,
          astExtension,
          config.outputDir,
        );
        await writeOutput(
          astExtension,
          buildAstLibrary(schemaSource),
          outputId,
        );
        outputs.add("ast");
      }

      if (config.outputs.schema) {
        final outputId = outputAssetId(
          buildStep.inputId,
          schemaExtension,
          config.outputDir,
        );
        await writeOutput(
          schemaExtension,
          buildSchemaLibrary(
            schema: schemaIndex,
            config: config,
            utilsUrl: utilsUrl,
          ),
          outputId,
        );
        outputs.add("schema");
      }

      if (config.generateEquals || config.generateHashCode) {
        final outputId = outputAssetId(
          buildStep.inputId,
          utilsExtension,
          config.outputDir,
        );
        await writeOutput(
          utilsExtension,
          buildUtilsLibrary(),
          outputId,
        );
        outputs.add("utils");
      }
      if (outputs.isNotEmpty) {
        logSink.emit(
          LogEvent(
            level: LogLevel.info,
            category: LogCategory.emit,
            message: "Emitted schema outputs: ${outputs.join(', ')}.",
          ),
        );
      }
      return;
    }

    final docSource = await readDocument(
      buildStep,
      config.sourceExtension,
    );
    final sourceWithTypenames =
        config.shouldAddTypenames ? addTypenamesToSource(docSource) : docSource;

    final documentIndex = DocumentIndex(sourceWithTypenames.flatDocument);
    logSink.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.validation,
        message:
            "Document has ${documentIndex.operations.length} operations and ${documentIndex.fragments.length} fragments.",
      ),
    );
    logSink.emit(
      LogEvent(
        level: LogLevel.info,
        category: LogCategory.validation,
        message: "Validating document.",
      ),
    );
    final validationStopwatch = Stopwatch()..start();
    DocumentValidator(
      schema: schemaIndex,
      documentIndex: documentIndex,
    ).validate(sourceWithTypenames.flatDocument);
    validationStopwatch.stop();
    logSink.emit(
      LogEvent(
        level: LogLevel.info,
        category: LogCategory.validation,
        message: "Validation complete.",
      ),
    );
    logSink.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.validation,
        message:
            "Validation took ${validationStopwatch.elapsedMilliseconds}ms.",
      ),
    );

    final irStopwatch = Stopwatch()..start();
    final documentIr = buildDocumentIr(
      schema: schemaIndex,
      context: context,
      documentIndex: documentIndex,
    );
    irStopwatch.stop();
    logSink.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.ir,
        message: "Built IR in ${irStopwatch.elapsedMilliseconds}ms.",
      ),
    );

    final fragmentSourceUrls = _fragmentSourceUrls(sourceWithTypenames);

    final utilsUrl = (config.generateEquals || config.generateHashCode)
        ? outputAssetId(schemaId, utilsExtension, config.outputDir)
            .uri
            .toString()
        : null;
    final ownedFragments = sourceWithTypenames.document.definitions
        .whereType<FragmentDefinitionNode>();
    final ownedOperations = sourceWithTypenames.document.definitions
        .whereType<OperationDefinitionNode>();
    logSink.emit(
      LogEvent(
        level: LogLevel.info,
        category: LogCategory.emit,
        message:
            "Emitting outputs for ${ownedOperations.length} operations and ${ownedFragments.length} fragments.",
      ),
    );

    final emitStopwatch = Stopwatch()..start();
    final dataEmitter = DataEmitter(
      context: context,
      document: documentIr,
      schema: schemaIndex,
      fragmentSourceUrls: fragmentSourceUrls,
      utilsUrl: utilsUrl,
    );
    final varsEmitter = VarsEmitter(
      context: context,
      schema: schemaIndex,
      document: documentIr,
      utilsUrl: utilsUrl,
    );
    final reqEmitter = ReqEmitter(
      context: context,
      documentIndex: documentIndex,
      document: documentIr,
      fragmentSourceUrls: fragmentSourceUrls,
      utilsUrl: utilsUrl,
    );

    if (config.outputs.ast) {
      final outputId = outputAssetId(
        buildStep.inputId,
        astExtension,
        config.outputDir,
      );
      await writeOutput(
        astExtension,
        buildAstLibrary(sourceWithTypenames),
        outputId,
      );
    }

    if (config.outputs.data) {
      final outputId = outputAssetId(
        buildStep.inputId,
        dataExtension,
        config.outputDir,
      );
      await writeOutput(
        dataExtension,
        dataEmitter.buildLibrary(
          ownedFragments: ownedFragments,
          ownedOperations: ownedOperations,
        ),
        outputId,
      );
    }

    if (config.outputs.vars) {
      final outputId = outputAssetId(
        buildStep.inputId,
        varExtension,
        config.outputDir,
      );
      final varsLibrary = varsEmitter.buildLibrary(
        ownedFragments: ownedFragments,
        ownedOperations: ownedOperations,
      );
      if (varsLibrary != null) {
        await writeOutput(
          varExtension,
          varsLibrary,
          outputId,
        );
      }
    }

    if (config.outputs.req) {
      final outputId = outputAssetId(
        buildStep.inputId,
        reqExtension,
        config.outputDir,
      );
      await writeOutput(
        reqExtension,
        reqEmitter.buildLibrary(
          ownedFragments: ownedFragments,
          ownedOperations: ownedOperations,
        ),
        outputId,
      );
    }
    emitStopwatch.stop();
    logSink.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.emit,
        message: "Emit phase took ${emitStopwatch.elapsedMilliseconds}ms.",
      ),
    );
  }

  Future<_SchemaCache> _loadSchema(
    BuildStep buildStep,
    BuildLogSink logSink,
  ) async {
    final schemaId = config.schemaId!;
    final digest = (await buildStep.digest(schemaId)).toString();
    final cached = _schemaCache;
    if (cached != null &&
        cached.schemaId == schemaId &&
        cached.digest == digest) {
      logSink.emit(
        LogEvent(
          level: LogLevel.debug,
          category: LogCategory.schema,
          message: "Using cached schema document.",
        ),
      );
      return cached;
    }

    final schemaStopwatch = Stopwatch()..start();
    final schemaSource = await readDocument(
      buildStep,
      config.sourceExtension,
      schemaId,
    );
    schemaStopwatch.stop();
    final schemaIndex = SchemaIndex.fromDocuments([schemaSource.flatDocument]);
    final cache = _SchemaCache(
      schemaId: schemaId,
      digest: digest,
      source: schemaSource,
      index: schemaIndex,
    );
    _schemaCache = cache;
    logSink.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.config,
        message: "Config: ${config.summary()}",
      ),
    );
    logSink.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.schema,
        message: "Parsed schema in ${schemaStopwatch.elapsedMilliseconds}ms.",
      ),
    );
    logSink.emit(
      LogEvent(
        level: LogLevel.info,
        category: LogCategory.schema,
        message: "Loaded schema document.",
      ),
    );
    return cache;
  }
}

final class _SchemaCache {
  final AssetId schemaId;
  final String digest;
  final DocumentSource source;
  final SchemaIndex index;

  const _SchemaCache({
    required this.schemaId,
    required this.digest,
    required this.source,
    required this.index,
  });
}

void _validateEnumFallbacks(
  SchemaIndex schema,
  EnumFallbackConfig config,
) {
  if (config.fallbackValueMap.isEmpty) return;
  final unknown = config.fallbackValueMap.keys
      .where(
        (name) =>
            schema
                .lookupTypeAs<EnumTypeDefinitionNode>(NameNode(value: name)) ==
            null,
      )
      .toList()
    ..sort();
  if (unknown.isNotEmpty) {
    throw StateError(
      "Unknown enum(s) in enums.fallback.per_enum: ${unknown.join(', ')}",
    );
  }
}

Map<FragmentName, String> _fragmentSourceUrls(DocumentSource source) {
  final urls = <FragmentName, String>{};

  void collect(DocumentSource current) {
    for (final fragment
        in current.document.definitions.whereType<FragmentDefinitionNode>()) {
      urls[FragmentName(fragment.name.value)] = current.url;
    }
    for (final entry in current.imports) {
      collect(entry);
    }
  }

  collect(source);
  return urls;
}
