import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../context/generator_context.dart";
import "../schema/schema.dart";
import "data_emitter_classes.dart";
import "data_emitter_context.dart";
import "data_emitter_fragments.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../logging/diagnostics.dart";

class DataEmitter {
  final DataEmitterContext _ctx;

  DataEmitter._(this._ctx);

  factory DataEmitter({
    required GeneratorContext context,
    required DocumentIR document,
    required SchemaIndex schema,
    required Map<FragmentName, String> fragmentSourceUrls,
    required String? utilsUrl,
  }) {
    final ctx = DataEmitterContext(
      context: context,
      document: document,
      schema: schema,
      fragmentSourceUrls: fragmentSourceUrls,
      utilsUrl: utilsUrl,
    );
    indexFragments(ctx: ctx);
    return DataEmitter._(ctx);
  }

  Library buildLibrary({
    required Iterable<FragmentDefinitionNode> ownedFragments,
    required Iterable<OperationDefinitionNode> ownedOperations,
  }) {
    final specs = <Spec>[];
    _ctx.needsUtilsImport = false;

    for (final fragment in ownedFragments) {
      final fragmentInterfaces = buildFragmentInterfaces(
        ctx: _ctx,
        fragment: fragment,
      );
      specs.addAll(fragmentInterfaces.specs);

      final fragmentData = buildFragmentData(
        ctx: _ctx,
        fragment: fragment,
      );
      specs.addAll(fragmentData.specs);
    }

    for (final operation in ownedOperations) {
      final operationData = buildOperationData(
        ctx: _ctx,
        operation: operation,
      );
      specs.addAll(operationData.specs);
    }

    _ctx.log.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.data,
        message: "Emitted ${specs.length} data specs.",
      ),
    );

    final directives = <Directive>[
      if (_ctx.needsUtilsImport && _ctx.utilsUrl != null)
        Directive.import(_ctx.utilsUrl!, as: utilsImportAlias),
      ..._ctx.extraImports.map(Directive.import),
    ];
    return Library(
      (b) => b
        ..directives.addAll(directives)
        ..body.addAll(specs),
    );
  }
}
