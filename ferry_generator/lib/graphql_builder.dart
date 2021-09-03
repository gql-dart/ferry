import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql_code_builder/ast.dart';
import 'package:gql_code_builder/data.dart';
import 'package:gql_code_builder/var.dart';
import 'package:gql_code_builder/schema.dart';
import 'package:gql_code_builder/serializer.dart';
import 'package:path/path.dart' as p;
import 'package:glob/glob.dart';

import 'src/utils/locations.dart';
import 'src/utils/config.dart';
import 'src/utils/helpers.dart';
import 'src/utils/reader.dart';
import 'src/utils/writer.dart';
import 'src/utils/add_introspection.dart';
import 'src/codegen/req.dart';
import 'src/allocators/gql_allocator.dart';
import 'src/allocators/pick_allocator.dart';

Builder graphqlBuilder(
  BuilderOptions options,
) =>
    GraphqlBuilder(options.config);

class GraphqlBuilder implements Builder {
  final AssetId schemaId;
  final bool shouldAddTypenames;
  final Map<String, Reference> typeOverrides;
  final Set<Reference> customSerializers;
  final EnumFallbackConfig enumFallbackConfig;
  final String outputDir;
  final String sourceExtension;

  GraphqlBuilder(Map<String, dynamic> config)
      : schemaId = AssetId.parse(config['schema'] as String),
        shouldAddTypenames = config['add_typenames'] ?? true,
        typeOverrides = getTypeOverrides(config['type_overrides']),
        customSerializers = getCustomSerializers(config['custom_serializers']),
        enumFallbackConfig = getEnumFallbackConfig(config),
        outputDir = config['output_dir'] ?? '__generated__',
        sourceExtension = config['source_extension'] ?? '.graphql';

  final localFileExtensions = <String>[
    astExtension,
    dataExtension,
    varExtension,
    reqExtension,
    schemaExtension
  ];

  @override
  Map<String, List<String>> get buildExtensions => {
        '{{inputDir}}/{{file}}$sourceExtension': [
          ...localFileExtensions
              .map((extension) => '{{inputDir}}/$outputDir/{{file}}$extension')
        ],
        r'$lib$': [
          // buildExtensions already include the 'lib' path segment, so we must remove it here
          p.joinAll(getSerializerPathSegments(schemaId, outputDir).skip(1)),
        ],
      };

  /// Writes all [localFileExtensions] outputs next to their source files
  Future<void> writeLocalOutputs(BuildStep buildStep) async {
    final doc = await readDocument(buildStep, sourceExtension);
    final schema = await readDocument(buildStep, sourceExtension, schemaId);

    final libs = <String, Library>{
      astExtension: buildAstLibrary(doc),
      dataExtension: buildDataLibrary(
        shouldAddTypenames ? addTypenames(doc) : doc,
        addTypenames(schema),
        p.basename(generatedFilePath(buildStep.inputId, dataExtension)),
        typeOverrides,
      ),
      varExtension: buildVarLibrary(
        doc,
        addTypenames(schema),
        p.basename(generatedFilePath(buildStep.inputId, varExtension)),
        typeOverrides,
      ),
      reqExtension: buildReqLibrary(
        doc,
        p.basename(generatedFilePath(buildStep.inputId, reqExtension)),
      ),
      schemaExtension: buildSchemaLibrary(
        doc,
        p.basename(generatedFilePath(buildStep.inputId, schemaExtension)),
        typeOverrides,
        enumFallbackConfig,
      ),
    };

    for (var entry in libs.entries) {
      final generatedAsset =
          outputAssetId(buildStep.inputId, entry.key, outputDir);
      final schemaOutputAsset =
          outputAssetId(schemaId, schemaExtension, outputDir);
      final allocator = GqlAllocator(
        buildStep.inputId.uri.toString(),
        sourceExtension,
        generatedAsset.uri.toString(),
        schemaOutputAsset.uri.toString(),
        outputDir,
      );

      await writeDocument(generatedAsset, entry.value, allocator, buildStep);
    }
  }

  /// Writes a global serializer output
  Future<void> writeSerializerOutputs(BuildStep buildStep) async {
    /// BuiltValue classes with serializers. These will be added automatically
    /// using `@SerializersFor`.
    final builtClasses =
        SplayTreeSet<ClassElement>((a, b) => a.name.compareTo(b.name));

    /// Non BuiltValue classes with serializers (i.e. inline fragment classes).
    /// These need to be added manually since `@SerializersFor` only recognizes
    /// BuiltValue classes.
    final nonBuiltClasses =
        SplayTreeSet<ClassElement>((a, b) => a.name.compareTo(b.name));

    final generatedFiles = Glob('lib/**.gql.dart');

    await for (final input in buildStep.findAssets(generatedFiles)) {
      final lib = await buildStep.resolver.libraryFor(input);
      lib.units
          .expand((cu) => cu.types)
          .where((c) => hasSerializer(c) && isBuiltValue(c))
          .forEach(builtClasses.add);
      lib.units
          .expand((cu) => cu.types)
          .where(
            (c) => hasSerializer(c) && !isBuiltValue(c),
          )
          .forEach(nonBuiltClasses.add);
    }

    final additionalSerializers = <Expression>{
      // GraphQL Operation serializer
      refer(
        'OperationSerializer',
        'package:gql_code_builder/src/serializers/operation_serializer.dart',
      ).call([]),
      // User-defined custom serializers
      ...customSerializers.map((ref) => ref.call([])),
      // Serializers from data classes that aren't caught by `@SerializersFor`
      ...nonBuiltClasses.map<Expression>(
        (c) => refer(c.name, c.source.uri.toString()).property('serializer'),
      ),
    };

    final library = buildSerializerLibrary(
      builtClasses,
      'serializers.gql.g.dart',
      additionalSerializers,
    );

    final allocator = PickAllocator(
      doNotPick: ['package:built_value/serializer.dart'],
      include: [
        'package:built_collection/built_collection.dart',
        ...typeOverrides.values.map((ref) => ref.url).whereType<String>()
      ],
    );

    final outputId = AssetId(
      buildStep.inputId.package,
      p.joinAll(getSerializerPathSegments(schemaId, outputDir)),
    );

    await writeDocument(outputId, library, allocator, buildStep);
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final isSerializer = buildStep.allowedOutputs
        .any((assetId) => assetId.pathSegments.last == 'serializers.gql.dart');

    if (isSerializer) {
      await writeSerializerOutputs(buildStep);
    } else {
      await writeLocalOutputs(buildStep);
    }
  }
}
