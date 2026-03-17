import "package:build/build.dart";
import "package:path/path.dart" as p;

String outputPath(String inputPath, String outputDir) {
  final pathSegments = p.url.split(inputPath);
  pathSegments.insert(pathSegments.length - 1, outputDir);
  return p.posix.joinAll(pathSegments);
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

String replaceSourceExtension(
  String path,
  String sourceExtension,
  String outputSuffix,
) {
  final escaped = RegExp.escape(sourceExtension);
  return path.replaceAll(RegExp("$escaped\$"), outputSuffix);
}
