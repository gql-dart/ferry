import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql_code_builder/serializer.dart';
import 'package:path/path.dart' as p;
import 'package:glob/glob.dart';

import 'src/utils/config.dart';
import 'src/utils/locations.dart';
import 'src/utils/writer.dart';
import 'src/allocators/pick_allocator.dart';

Builder serializerBuilder(
  BuilderOptions options,
) =>
    SerializerBuilder(options.config);

class SerializerBuilder implements Builder {
  BuilderConfig config;

  SerializerBuilder(Map<String, dynamic> config)
      : config = BuilderConfig(config);

  final outputFileName = 'serializers.gql.dart';

  // create a path for the serializers output in same directory as schema
  List<String> pathSegments(AssetId schemaId) =>
      outputAssetId(schemaId, '', config.outputDir).pathSegments
        ..removeLast()
        ..add(outputFileName);

  @override
  Map<String, List<String>> get buildExtensions {
    final temp = <String, List<String>>{};
    if (config.schemaId != null) {
      // buildExtensions already include the 'lib' path segment, so we must remove it here
      temp[r'$lib$'] = [p.joinAll(pathSegments(config.schemaId!).skip(1))];
    }

    if (config.schemaIds != null) {
      for (final schemaId in config.schemaIds!) {
        temp[schemaId.path] = [p.joinAll(pathSegments(schemaId))];
      }
    }

    return temp;
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    if (buildStep.inputId.path == r'lib/$lib$' && config.schemaId != null) {
      final _generatedFiles = Glob('lib/**.gql.dart');
      final _excludeFiles = <Glob>[];
      if (config.schemaIds != null) {
        for (final schemaId in config.schemaIds!) {
          var dirPath = p.dirname(schemaId.path);
          _excludeFiles.add(Glob('$dirPath/**.gql.dart'));
        }
      }
      await _build(buildStep, config.schemaId!, _generatedFiles, _excludeFiles);
    }

    if (config.schemaIds != null) {
      for (final schemaId in config.schemaIds!) {
        if (schemaId == buildStep.inputId) {
          var dirPath = p.dirname(schemaId.path);
          final _generatedFiles = Glob('$dirPath/**.gql.dart');
          await _build(buildStep, schemaId, _generatedFiles, []);
          break;
        }
      }
    }
  }

  FutureOr<void> _build(BuildStep buildStep, AssetId schemaId,
      Glob generatedFiles, List<Glob> excludeFiles) async {
    /// BuiltValue classes with serializers. These will be added automatically
    /// using `@SerializersFor`.
    final builtClasses =
        SplayTreeSet<ClassElement>((a, b) => a.name.compareTo(b.name));

    /// Non BuiltValue classes with serializers (i.e. inline fragment classes).
    /// These need to be added manually since `@SerializersFor` only recognizes
    /// BuiltValue classes.
    final nonBuiltClasses =
        SplayTreeSet<ClassElement>((a, b) => a.name.compareTo(b.name));

    final hasSerializer = (ClassElement c) => c.fields.any((field) =>
        field.isStatic &&
        field.name == 'serializer' &&
        field.type.element?.name == 'Serializer' &&
        field.type.element?.source?.uri.toString() ==
            'package:built_value/serializer.dart');

    final isBuiltValue = (ClassElement c) => c.allSupertypes.any((interface) =>
        (interface.element.name == 'Built' ||
            interface.element.name == 'EnumClass') &&
        interface.element.source.uri.toString() ==
            'package:built_value/built_value.dart');

    final excludeFileIds = <String, AssetId>{};
    for (final excludeGlob in excludeFiles) {
      await for (final fileAssetId in buildStep.findAssets(excludeGlob)) {
        excludeFileIds[fileAssetId.path] = fileAssetId;
      }
    }

    await for (final input in buildStep.findAssets(generatedFiles)) {
      if (excludeFileIds.containsKey(input.path)) continue;
      final lib = await buildStep.resolver.libraryFor(input);
      lib.units
          .expand((cu) => cu.classes)
          .where((c) => hasSerializer(c) && isBuiltValue(c))
          .forEach(builtClasses.add);

      lib.units
          .expand((cu) => cu.classes)
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
      ...config.customSerializers.map((ref) => ref.call([])),
      // Serializers from data classes that aren't caught by `@SerializersFor`
      ...nonBuiltClasses.map<Expression>(
        (c) => refer(c.name, c.source.uri.toString()).property('serializer'),
      ),
    };

    final library = buildSerializerLibrary(
      builtClasses,
      outputFileName.replaceFirst('.gql.dart', '.gql.g.dart'),
      additionalSerializers,
    );

    final allocator = PickAllocator(
      doNotPick: ['package:built_value/serializer.dart'],
      include: [
        'package:built_collection/built_collection.dart',
        'package:ferry_exec/ferry_exec.dart',
        ...config.typeOverrides.values.map((ref) => ref.url).whereType<String>()
      ],
    );

    final outputId = AssetId(
      schemaId.package,
      p.joinAll(pathSegments(schemaId)),
    );

    await writeDocument(outputId, library, allocator, buildStep);
  }
}
