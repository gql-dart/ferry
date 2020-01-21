import "dart:async";

import "package:build/build.dart";

import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import './req_code_builder.dart';

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
    final schema = await readDocument(buildStep, schemaId);

    final library = buildReqLibrary(
      doc,
      schema,
      buildStep.inputId.changeExtension(opExtension).uri.toString(),
      buildStep.inputId.changeExtension(varExtension).uri.toString(),
      buildStep.inputId.changeExtension(dataExtension).uri.toString(),
    );

    return writeDocument(
      library,
      buildStep,
      reqExtension,
    );
  }
}
