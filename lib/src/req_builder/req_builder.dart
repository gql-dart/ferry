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
    ReqBuilder();

class ReqBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [reqExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildReqLibrary(
      doc,
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
