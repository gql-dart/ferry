import "dart:async";

import "package:build/build.dart";
import "package:gql/language.dart";

import "source.dart";

Set<AssetId> _getImports(
  String source,
  String sourceExtension, {
  AssetId? from,
}) {
  final imports = <Uri>{};

  final patterns = [
    RegExp(r'^#\s*import\s+"([^"]+)"', multiLine: true),
    RegExp(r"^#\s*import\s+'([^']+)'", multiLine: true),
  ];

  for (final pattern in patterns) {
    for (final match in pattern.allMatches(source)) {
      final path = match.group(1);
      if (path != null) {
        imports.add(
          Uri.parse(
            path.endsWith(sourceExtension) ? path : "$path$sourceExtension",
          ),
        );
      }
    }
  }

  return imports
      .map(
        (import) => AssetId.resolve(
          import,
          from: from,
        ),
      )
      .toSet();
}

Future<DocumentSource> _assetToSource(
  BuildStep buildStep,
  AssetId assetId,
  String sourceExtension,
) async {
  final sourceString = await buildStep.readAsString(assetId);
  final imports = _getImports(
    sourceString,
    sourceExtension,
    from: assetId,
  );

  final url = assetId.uri.toString();

  return DocumentSource(
    url: url,
    document: parseString(
      sourceString,
      url: url,
    ),
    imports: await Stream.fromIterable(imports)
        .asyncMap(
          (importedAssetId) => _assetToSource(
            buildStep,
            importedAssetId,
            sourceExtension,
          ),
        )
        .toSet(),
  );
}

Future<DocumentSource> readDocument(
  BuildStep buildStep,
  String sourceExtension, [
  AssetId? rootId,
]) =>
    _assetToSource(
      buildStep,
      rootId ?? buildStep.inputId,
      sourceExtension,
    );
