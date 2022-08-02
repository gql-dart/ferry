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
  List<String> get pathSegments =>
      outputAssetId(config.schemaId, '', config.outputDir).pathSegments
        ..removeLast()
        ..add(outputFileName);

  @override
  Map<String, List<String>> get buildExtensions => {
        // buildExtensions already include the 'lib' path segment, so we must remove it here
        r'$lib$': [p.joinAll(pathSegments.skip(1))],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
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

    final _generatedFiles = Glob('lib/**.gql.dart');

    await for (final input in buildStep.findAssets(_generatedFiles)) {
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
      config.schemaId.package,
      p.joinAll(pathSegments),
    );

    await writeDocument(outputId, library, allocator, buildStep);
  }
}
