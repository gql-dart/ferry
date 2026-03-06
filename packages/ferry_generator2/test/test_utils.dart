import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:path/path.dart' as p;

Map<String, String> extractGeneratedDartSources(
  TestReaderWriter readerWriter,
  String package,
) {
  final outputs = <String, String>{};
  final prefix = '.dart_tool/build/generated/$package/';
  for (final asset in readerWriter.testing.assets) {
    if (!asset.path.startsWith(prefix) || !asset.path.endsWith('.dart')) {
      continue;
    }
    final logicalPath = asset.path.substring(prefix.length);
    final logicalId = AssetId(package, logicalPath);
    outputs[logicalId.toString()] = readerWriter.testing.readString(asset);
  }

  if (outputs.isEmpty) {
    throw StateError('No generated Dart outputs found.');
  }

  return outputs;
}

String generatedDartAssetIdForInput(
  String package,
  String inputPath,
  String extension, {
  String outputDir = '__generated__',
}) {
  final path =
      inputPath.contains('|') ? AssetId.parse(inputPath).path : inputPath;
  final dir = p.posix.dirname(path);
  final fileName = p.posix.basenameWithoutExtension(path);
  final generatedPath = p.posix.join(dir, outputDir, '$fileName$extension');
  return AssetId(package, generatedPath).toString();
}

String readGeneratedDartSource(
  Map<String, String> sources,
  String assetId,
) {
  final source = sources[assetId];
  if (source == null) {
    throw StateError('Missing generated output for $assetId');
  }
  return source;
}

Future<Map<String, LibraryElement>> resolveGeneratedLibraries(
  Map<String, String> sources,
  Iterable<String> assetIds, {
  required String rootPackage,
}) {
  return resolveSources(
    sources,
    (resolver) async {
      final libraries = <String, LibraryElement>{};
      for (final assetId in assetIds) {
        libraries[assetId] = await resolver.libraryFor(AssetId.parse(assetId));
      }
      return libraries;
    },
    rootPackage: rootPackage,
    readAllSourcesFromFilesystem: true,
  );
}
