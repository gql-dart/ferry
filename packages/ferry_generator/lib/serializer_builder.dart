import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
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
    final inputToOutputMap = <String, List<String>>{};
    if (config.schemaId != null) {
      // buildExtensions already include the 'lib' path segment, so we must remove it here
      inputToOutputMap[r'$lib$'] = [
        p.joinAll(pathSegments(config.schemaId!).skip(1))
      ];
    }

    if (config.schemaIds != null) {
      for (final schemaId in config.schemaIds!) {
        inputToOutputMap[schemaId.path] = [p.joinAll(pathSegments(schemaId))];
      }
    }

    return inputToOutputMap;
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
      await buildSchema(
          buildStep, config.schemaId!, _generatedFiles, _excludeFiles);
    }

    if (config.schemaIds != null) {
      for (final schemaId in config.schemaIds!) {
        if (schemaId == buildStep.inputId) {
          var dirPath = p.dirname(schemaId.path);
          final _generatedFiles = Glob('$dirPath/**.gql.dart');
          await buildSchema(buildStep, schemaId, _generatedFiles, []);
          break;
        }
      }
    }
  }

  FutureOr<void> buildSchema(BuildStep buildStep, AssetId schemaId,
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
        'package:gql_code_builder_serializers/gql_code_builder_serializers.dart',
      ).call([]),
      // User-defined custom serializers
      ...config.customSerializers.map((ref) => ref.call([])),
      // Serializers from data classes that aren't caught by `@SerializersFor`
      ...nonBuiltClasses.map<Expression>(
        (c) => refer(c.name, c.source.uri.toString()).property('serializer'),
      ),
    };

    // if the schema is defined in a different package
    // we need to import the serializers from that package
    // and add them to the serializers of this package
    final isExternalSchema = schemaId != buildStep.inputId;
    final externalSerializersExpression = isExternalSchema
        ? refer('serializers',
                _externalSchemaSerializersImport(schemaId, config))
            .property('serializers')
        : null;

    final library = buildSerializerLibrary(
      builtClasses,
      outputFileName.replaceFirst('.gql.dart', '.gql.g.dart'),
      additionalSerializers,
      externalSerializersExpression,
    );

    final allocator = PickAllocator(doNotPick: [
      'package:built_value/serializer.dart',
    ], include: [
      'package:built_collection/built_collection.dart',
      'package:ferry_exec/ferry_exec.dart',
      ...config.typeOverrides.values.map((ref) => ref.url).whereType<String>(),
      if (isExternalSchema) _externalSchemaImport(schemaId, config),
    ], aliasedImports: {
      if (isExternalSchema)
        _externalSchemaSerializersImport(schemaId, config):
            '_\$external_serializers',
    });

    final outputId = AssetId(
      buildStep.inputId.package,
      p.joinAll(pathSegments(schemaId)),
    );

    await writeDocument(outputId, library, allocator, buildStep);
  }
}

String _externalSchemaImport(AssetId schemaId, BuilderConfig config) {
  final outPutId = outputAssetId(schemaId, schemaExtension, config.outputDir);

  return 'package:${outPutId.package}/${outPutId.path.replaceFirst(RegExp('^lib/'), '')}';
}

String _externalSchemaSerializersImport(
    AssetId schemaId, BuilderConfig config) {
  final outPutId = outputAssetId(schemaId, schemaExtension, config.outputDir);

  final serializersPathSegments = outPutId.pathSegments
    ..removeAt(0)
    ..removeLast()
    ..add('serializers.gql.dart');

  final outPutPath = p.joinAll(serializersPathSegments);

  return 'package:${outPutId.package}/$outPutPath';
}

Expression withCustomSerializers(
  Expression serializersExpression,
  Set<Expression> customSerializers,
) =>
    customSerializers.fold(
      serializersExpression,
      (exp, serializer) => exp.cascade("add").call([serializer]),
    );

Library buildSerializerLibrary(
  Set<ClassElement> builtClasses,
  String partDirectiveUrl,
  Set<Expression> additionalSerializers,
  Expression? externalSerializers,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partDirectiveUrl))
        ..body.addAll([
          withCustomSerializers(
            declareFinal(
              "_serializersBuilder",
              type: refer(
                  "SerializersBuilder", "package:built_value/serializer.dart"),
            )
                .assign(
                  refer(r"_$serializers"),
                )
                .property("toBuilder")
                .call([]),
            additionalSerializers,
          )
              ._conditionalWrap(
                externalSerializers != null,
                (expr) => expr.cascade("addAll").call([externalSerializers!]),
              )
              .cascade("addPlugin")
              .call([
            refer(
              "StandardJsonPlugin",
              "package:built_value/standard_json_plugin.dart",
            ).call([])
          ]).statement,
          refer("@SerializersFor", "package:built_value/serializer.dart").call([
            literalList(
              builtClasses
                  .map<Reference>(
                    (c) => refer(c.name, c.source.uri.toString()),
                  )
                  .toList()
                ..sort((a, b) => a.symbol!.compareTo(b.symbol!)),
            )
          ]),
          declareFinal("serializers",
                  type: refer(
                      "Serializers", "package:built_value/serializer.dart"))
              .assign(refer("_serializersBuilder"))
              .property("build")
              .call([]).statement,
        ]),
    );

extension on Expression {
  Expression _conditionalWrap(
          bool condition, Expression Function(Expression) wrap) =>
      condition ? wrap(this) : this;
}
