import 'package:path/path.dart' as p;
import 'package:build/build.dart';

String outputPath(
  String inputPath,
  String outputDir,
) {
  final pathSegments = p.url.split(inputPath);
  pathSegments.insert(pathSegments.length - 1, outputDir);
  return p.joinAll(pathSegments);
}

AssetId outputAssetId(
  AssetId inputAssetId,
  String extension,
  String outputDir,
) =>
    AssetId(
      inputAssetId.package,
      outputPath(inputAssetId.path, outputDir),
    ).changeExtension(extension);

// create a path for the serializers output in same directory as schema
List<String> getSerializerPathSegments(
  AssetId schemaId,
  String outputDir,
) =>
    AssetId(
      schemaId.package,
      outputPath(schemaId.path, outputDir),
    ).pathSegments
      ..removeLast()
      ..add('serializers.gql.dart');

/// The path to the generated '.g.dart' file for a given input
String generatedFilePath(
  AssetId inputId,
  String extension,
) =>
    inputId.changeExtension(_generatedFileExtension(extension)).uri.path;

String _generatedFileExtension(String sourceExtension) {
  final parts = sourceExtension.split('.');
  final dartExtension = parts.removeLast();
  assert(dartExtension == 'dart', 'Unrecognized file type');
  parts.add('g.dart');
  return parts.join('.');
}
