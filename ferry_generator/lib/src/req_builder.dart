import "dart:async";

import "package:build/build.dart";
import "package:path/path.dart";
import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/source.dart";

import './req/operation_req.dart';
import './req/fragment_req.dart';

/// Builds GraphQL type-safe request builder
Builder reqBuilder(
  BuilderOptions options,
) =>
    ReqBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

class ReqBuilder implements Builder {
  final AssetId schemaId;

  ReqBuilder(
    this.schemaId,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [reqExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(reqExtension))
        .uri
        .path;

    final library = _buildReqLibrary(
      doc,
      basename(generatedPartUrl),
    );

    return writeDocument(
      library,
      buildStep,
      reqExtension,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );
  }
}

Library _buildReqLibrary(
  SourceNode docSource,
  String partUrl,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partUrl))
        ..body.addAll(
          [
            ...buildOperationReqClasses(
              docSource,
            ),
            ...buildFragmentReqClasses(
              docSource,
            )
          ],
        ),
    );
