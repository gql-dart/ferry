import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../config/builder_config.dart";
import "../context/generator_context.dart";
import "data_emitter_context.dart";
import "emitter_helpers.dart";
import "../utils/naming.dart";
import "../selection/selection_resolver.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../logging/diagnostics.dart";

class ReqEmitter {
  final GeneratorContext context;
  final DocumentIndex documentIndex;
  final DocumentIR document;
  final Map<FragmentName, String> fragmentSourceUrls;
  final String? utilsUrl;
  bool _needsUtilsImport = false;

  ReqEmitter({
    required this.context,
    required this.documentIndex,
    required this.document,
    required this.fragmentSourceUrls,
    required this.utilsUrl,
  });

  BuilderConfig get config => context.config;

  Library buildLibrary({
    required Iterable<OperationDefinitionNode> ownedOperations,
    required Iterable<FragmentDefinitionNode> ownedFragments,
  }) {
    final specs = <Spec>[];
    _needsUtilsImport = config.generateEquals || config.generateHashCode;
    var operationCount = 0;
    var fragmentCount = 0;

    for (final operation in ownedOperations) {
      if (operation.name == null) continue;
      operationCount += 1;
      specs.add(_buildOperationReq(operation));
    }

    for (final fragment in ownedFragments) {
      fragmentCount += 1;
      specs.add(_buildFragmentReq(fragment));
    }
    context.log.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.req,
        message:
            "Emitted ${specs.length} req specs ($operationCount operations, $fragmentCount fragments).",
      ),
    );

    return Library(
      (b) => b
        ..directives.addAll(
          _needsUtilsImport && utilsUrl != null
              ? [Directive.import(utilsUrl!, as: utilsImportAlias)]
              : const [],
        )
        ..body.addAll(specs),
    );
  }

  Class _buildOperationReq(OperationDefinitionNode operation) {
    final operationName = operation.name!.value;
    final operationIr = document.operations[OperationName(operationName)];
    final hasVars = operationIr?.variables.isNotEmpty ??
        operation.variableDefinitions.isNotEmpty;
    final className = builtClassName("${operationName}Req");
    final dataTypeRef = Reference(
      builtClassName("${operationName}Data"),
      "#data",
    );
    final varsTypeRef = hasVars
        ? Reference(
            builtClassName("${operationName}Vars"),
            "#var",
          )
        : refer("Null");
    final opTypeRef = TypeReference(
      (b) => b
        ..symbol = "OperationRequest"
        ..url = "package:ferry_exec/ferry_exec.dart"
        ..types.addAll([dataTypeRef, varsTypeRef]),
    );
    final nullableDataType = _nullableReference(dataTypeRef);

    final documentExpr = _documentForOperation(
      operationName: operationName,
      fragmentNames: operationIr?.usedFragments ?? const <FragmentName>{},
    );

    final instanceFields = <Field>[
      Field(
        (b) => b
          ..name = "vars"
          ..modifier = FieldModifier.final$
          ..type = varsTypeRef
          ..assignment = hasVars ? null : const Code("null"),
      ),
      Field(
        (b) => b
          ..name = "operation"
          ..modifier = FieldModifier.final$
          ..type = refer("Operation", "package:gql_exec/gql_exec.dart"),
      ),
      Field(
        (b) => b
          ..name = "requestId"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "String"
              ..isNullable = true,
          ),
      ),
      Field(
        (b) => b
          ..name = "updateResult"
          ..modifier = FieldModifier.final$
          ..type = _nullableReference(
            FunctionType(
              (b) => b
                ..returnType = nullableDataType
                ..requiredParameters.addAll([
                  nullableDataType,
                  nullableDataType,
                ]),
            ),
          ),
      ),
      Field(
        (b) => b
          ..name = "optimisticResponse"
          ..modifier = FieldModifier.final$
          ..type = nullableDataType,
      ),
      Field(
        (b) => b
          ..name = "updateCacheHandlerKey"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "String"
              ..isNullable = true,
          ),
      ),
      Field(
        (b) => b
          ..name = "updateCacheHandlerContext"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "Map"
              ..types.addAll([
                refer("String"),
                refer("dynamic"),
              ])
              ..isNullable = true,
          ),
      ),
      Field(
        (b) => b
          ..name = "fetchPolicy"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "FetchPolicy"
              ..url = "package:ferry_exec/ferry_exec.dart"
              ..isNullable = true,
          ),
      ),
      Field(
        (b) => b
          ..name = "executeOnListen"
          ..modifier = FieldModifier.final$
          ..type = refer("bool"),
      ),
      Field(
        (b) => b
          ..name = "context"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "Context"
              ..url = "package:gql_exec/gql_exec.dart"
              ..isNullable = true,
          ),
      ),
    ];

    final fields = <Field>[
      ...instanceFields,
      Field(
        (b) => b
          ..name = "_document"
          ..static = true
          ..modifier = FieldModifier.constant
          ..type = refer("DocumentNode", "package:gql/ast.dart")
          ..assignment = documentExpr.code,
      ),
      Field(
        (b) => b
          ..name = "_operation"
          ..static = true
          ..modifier = FieldModifier.constant
          ..type = refer("Operation", "package:gql_exec/gql_exec.dart")
          ..assignment = refer(
            "Operation",
            "package:gql_exec/gql_exec.dart",
          ).constInstance(
            [],
            {
              "document": refer("_document"),
              "operationName": literalString(operationName),
            },
          ).code,
      ),
    ];

    final fieldSpecs = [
      _ReqFieldSpec(
        name: "vars",
        typeRef: varsTypeRef,
        isNullable: !hasVars || _isNullableReference(varsTypeRef),
      ),
      _ReqFieldSpec(
        name: "operation",
        typeRef: refer("Operation", "package:gql_exec/gql_exec.dart"),
        isNullable: false,
      ),
      _ReqFieldSpec(
        name: "requestId",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "String"
            ..isNullable = true,
        ),
        isNullable: true,
      ),
      _ReqFieldSpec(
        name: "updateResult",
        typeRef: _nullableReference(
          FunctionType(
            (b) => b
              ..returnType = nullableDataType
              ..requiredParameters.addAll([
                nullableDataType,
                nullableDataType,
              ]),
          ),
        ),
        isNullable: true,
      ),
      _ReqFieldSpec(
        name: "optimisticResponse",
        typeRef: nullableDataType,
        isNullable: true,
      ),
      _ReqFieldSpec(
        name: "updateCacheHandlerKey",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "String"
            ..isNullable = true,
        ),
        isNullable: true,
      ),
      _ReqFieldSpec(
        name: "updateCacheHandlerContext",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "Map"
            ..types.addAll([
              refer("String"),
              refer("dynamic"),
            ])
            ..isNullable = true,
        ),
        isNullable: true,
        isMap: true,
      ),
      _ReqFieldSpec(
        name: "fetchPolicy",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "FetchPolicy"
            ..url = "package:ferry_exec/ferry_exec.dart"
            ..isNullable = true,
        ),
        isNullable: true,
      ),
      _ReqFieldSpec(
        name: "executeOnListen",
        typeRef: refer("bool"),
        isNullable: false,
      ),
      _ReqFieldSpec(
        name: "context",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "Context"
            ..url = "package:gql_exec/gql_exec.dart"
            ..isNullable = true,
        ),
        isNullable: true,
      ),
    ];
    _markUtilsUsage(fieldSpecs);
    final copyWithFields = hasVars
        ? fieldSpecs
        : fieldSpecs.where((f) => f.name != "vars").toList();

    final constructorParams = <Parameter>[
      if (hasVars)
        Parameter(
          (b) => b
            ..name = "vars"
            ..named = true
            ..required = true
            ..toThis = true,
        ),
      Parameter(
        (b) => b
          ..name = "operation"
          ..named = true
          ..type = _nullableReference(
            refer("Operation", "package:gql_exec/gql_exec.dart"),
          ),
      ),
      Parameter(
        (b) => b
          ..name = "requestId"
          ..named = true
          ..toThis = true,
      ),
      Parameter(
        (b) => b
          ..name = "updateResult"
          ..named = true
          ..toThis = true,
      ),
      Parameter(
        (b) => b
          ..name = "optimisticResponse"
          ..named = true
          ..toThis = true,
      ),
      Parameter(
        (b) => b
          ..name = "updateCacheHandlerKey"
          ..named = true
          ..toThis = true,
      ),
      Parameter(
        (b) => b
          ..name = "updateCacheHandlerContext"
          ..named = true
          ..toThis = true,
      ),
      Parameter(
        (b) => b
          ..name = "fetchPolicy"
          ..named = true
          ..toThis = true,
      ),
      Parameter(
        (b) => b
          ..name = "executeOnListen"
          ..named = true
          ..toThis = true
          ..defaultTo = const Code("true"),
      ),
      Parameter(
        (b) => b
          ..name = "context"
          ..named = true
          ..toThis = true,
      ),
    ];

    final constructorInitializers = <Code>[
      const Code("operation = operation ?? _operation"),
    ];

    return Class(
      (b) => b
        ..name = className
        ..implements.add(opTypeRef)
        ..fields.addAll(fields)
        ..constructors.add(
          Constructor(
            (b) => b
              ..optionalParameters.addAll(constructorParams)
              ..initializers.addAll(constructorInitializers),
          ),
        )
        ..methods.addAll([
          Method(
            (b) => b
              ..name = "execRequest"
              ..type = MethodType.getter
              ..returns = refer("Request", "package:gql_exec/gql_exec.dart")
              ..lambda = true
              ..body = refer(
                "Request",
                "package:gql_exec/gql_exec.dart",
              ).call(
                [],
                {
                  "operation": refer("operation"),
                  "variables": refer("varsToJson").call([]),
                  "context": refer("context").ifNullThen(
                    refer("Context", "package:gql_exec/gql_exec.dart")
                        .constInstance([]),
                  ),
                },
              ).code,
          ),
          Method(
            (b) => b
              ..name = "parseData"
              ..returns = nullableDataType
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = "json"
                    ..type = refer("Map<String, dynamic>"),
                ),
              )
              ..lambda = true
              ..body =
                  dataTypeRef.property("fromJson").call([refer("json")]).code,
          ),
          Method(
            (b) => b
              ..name = "varsToJson"
              ..returns = refer("Map<String, dynamic>")
              ..lambda = true
              ..body = hasVars
                  ? refer("vars").property("toJson").call([]).code
                  : const Code("const <String, dynamic>{}"),
          ),
          Method(
            (b) => b
              ..name = "dataToJson"
              ..returns = refer("Map<String, dynamic>")
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = "data"
                    ..type = dataTypeRef,
                ),
              )
              ..lambda = true
              ..body = refer("data").property("toJson").call([]).code,
          ),
          Method(
            (b) => b
              ..name = "transformOperation"
              ..returns = opTypeRef
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = "transform"
                    ..type = FunctionType(
                      (b) => b
                        ..returnType =
                            refer("Operation", "package:gql_exec/gql_exec.dart")
                        ..requiredParameters.add(
                          refer(
                            "Operation",
                            "package:gql_exec/gql_exec.dart",
                          ),
                        ),
                    ),
                ),
              )
              ..body =
                  Code(_transformOperationBody(className, hasVars: hasVars)),
          ),
          if (config.generateCopyWith)
            buildCopyWithMethod(
              className,
              copyWithFields
                  .map(
                    (field) => EmitterField(
                      name: field.name,
                      typeRef: field.typeRef,
                      isNullable: field.isNullable,
                    ),
                  )
                  .toList(),
            ),
          if (config.generateEquals)
            buildEqualsMethod(
              className,
              fieldSpecs
                  .map(
                    (field) => _equalsExpressionForField(
                      field,
                      "other.${field.name}",
                    ),
                  )
                  .toList(),
            ),
          if (config.generateHashCode)
            buildHashCodeGetter([
              "runtimeType",
              ...fieldSpecs.map(_hashExpressionForField),
            ]),
          if (config.generateToString)
            buildToStringMethod(
              className,
              fieldSpecs.map((field) => field.name).toList(),
            ),
        ]),
    );
  }

  String _transformOperationBody(String className, {required bool hasVars}) =>
      """
return $className(
${hasVars ? "  vars: vars," : ""}
  operation: transform(operation),
  requestId: requestId,
  updateResult: updateResult,
  optimisticResponse: optimisticResponse,
  updateCacheHandlerKey: updateCacheHandlerKey,
  updateCacheHandlerContext: updateCacheHandlerContext,
  fetchPolicy: fetchPolicy,
  executeOnListen: executeOnListen,
  context: context,
);
""";

  Class _buildFragmentReq(FragmentDefinitionNode fragment) {
    final fragmentName = fragment.name.value;
    final fragmentIr = document.fragments[FragmentName(fragmentName)];
    final hasVars = fragmentIr?.variables.isNotEmpty ?? false;
    final className = builtClassName("${fragmentName}Req");
    final dataTypeRef = Reference(
      builtClassName("${fragmentName}Data"),
      "#data",
    );
    final varsTypeRef = hasVars
        ? Reference(
            builtClassName("${fragmentName}Vars"),
            "#var",
          )
        : refer("Null");
    final reqTypeRef = TypeReference(
      (b) => b
        ..symbol = "FragmentRequest"
        ..url = "package:ferry_exec/ferry_exec.dart"
        ..types.addAll([dataTypeRef, varsTypeRef]),
    );
    final nullableDataType = _nullableReference(dataTypeRef);

    final documentExpr = _documentForFragment(
      fragmentName: fragmentName,
      fragmentNames: fragmentIr?.usedFragments ?? const <FragmentName>{},
    );

    final fieldSpecs = [
      _ReqFieldSpec(
        name: "vars",
        typeRef: varsTypeRef,
        isNullable: !hasVars || _isNullableReference(varsTypeRef),
      ),
      _ReqFieldSpec(
        name: "document",
        typeRef: refer("DocumentNode", "package:gql/ast.dart"),
        isNullable: false,
      ),
      _ReqFieldSpec(
        name: "fragmentName",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "String"
            ..isNullable = true,
        ),
        isNullable: true,
      ),
      _ReqFieldSpec(
        name: "idFields",
        typeRef: TypeReference(
          (b) => b
            ..symbol = "Map"
            ..types.addAll([
              refer("String"),
              refer("dynamic"),
            ]),
        ),
        isNullable: false,
        isMap: true,
      ),
    ];
    _markUtilsUsage(fieldSpecs);
    final copyWithFields = hasVars
        ? fieldSpecs
        : fieldSpecs.where((f) => f.name != "vars").toList();

    final instanceFields = [
      Field(
        (b) => b
          ..name = "vars"
          ..modifier = FieldModifier.final$
          ..type = varsTypeRef
          ..assignment = hasVars ? null : const Code("null"),
      ),
      Field(
        (b) => b
          ..name = "document"
          ..modifier = FieldModifier.final$
          ..type = refer("DocumentNode", "package:gql/ast.dart"),
      ),
      Field(
        (b) => b
          ..name = "fragmentName"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "String"
              ..isNullable = true,
          ),
      ),
      Field(
        (b) => b
          ..name = "idFields"
          ..modifier = FieldModifier.final$
          ..type = TypeReference(
            (b) => b
              ..symbol = "Map"
              ..types.addAll([
                refer("String"),
                refer("dynamic"),
              ]),
          ),
      ),
    ];

    final constructorInitializers = <Code>[
      const Code("document = document ?? _document"),
    ];

    return Class(
      (b) => b
        ..name = className
        ..implements.add(reqTypeRef)
        ..fields.addAll([
          ...instanceFields,
          Field(
            (b) => b
              ..name = "_document"
              ..static = true
              ..modifier = FieldModifier.constant
              ..type = refer("DocumentNode", "package:gql/ast.dart")
              ..assignment = documentExpr.code,
          ),
        ])
        ..constructors.add(
          Constructor(
            (b) => b
              ..optionalParameters.addAll([
                if (hasVars)
                  Parameter(
                    (b) => b
                      ..name = "vars"
                      ..named = true
                      ..required = true
                      ..toThis = true,
                  ),
                Parameter(
                  (b) => b
                    ..name = "document"
                    ..named = true
                    ..type = _nullableReference(
                      refer("DocumentNode", "package:gql/ast.dart"),
                    ),
                ),
                Parameter(
                  (b) => b
                    ..name = "fragmentName"
                    ..named = true
                    ..toThis = true
                    ..defaultTo = Code("'$fragmentName'"),
                ),
                Parameter(
                  (b) => b
                    ..name = "idFields"
                    ..named = true
                    ..toThis = true
                    ..defaultTo = const Code("const <String, dynamic>{}"),
                ),
              ])
              ..initializers.addAll(constructorInitializers),
          ),
        )
        ..methods.addAll([
          Method(
            (b) => b
              ..name = "parseData"
              ..returns = nullableDataType
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = "json"
                    ..type = refer("Map<String, dynamic>"),
                ),
              )
              ..lambda = true
              ..body =
                  dataTypeRef.property("fromJson").call([refer("json")]).code,
          ),
          Method(
            (b) => b
              ..name = "varsToJson"
              ..returns = refer("Map<String, dynamic>")
              ..lambda = true
              ..body = hasVars
                  ? refer("vars").property("toJson").call([]).code
                  : const Code("const <String, dynamic>{}"),
          ),
          Method(
            (b) => b
              ..name = "dataToJson"
              ..returns = refer("Map<String, dynamic>")
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = "data"
                    ..type = dataTypeRef,
                ),
              )
              ..lambda = true
              ..body = refer("data").property("toJson").call([]).code,
          ),
          if (config.generateCopyWith)
            buildCopyWithMethod(
              className,
              copyWithFields
                  .map(
                    (field) => EmitterField(
                      name: field.name,
                      typeRef: field.typeRef,
                      isNullable: field.isNullable,
                    ),
                  )
                  .toList(),
            ),
          if (config.generateEquals)
            buildEqualsMethod(
              className,
              fieldSpecs
                  .map(
                    (field) => _equalsExpressionForField(
                      field,
                      "other.${field.name}",
                    ),
                  )
                  .toList(),
            ),
          if (config.generateHashCode)
            buildHashCodeGetter([
              "runtimeType",
              ...fieldSpecs.map(_hashExpressionForField),
            ]),
          if (config.generateToString)
            buildToStringMethod(
              className,
              fieldSpecs.map((field) => field.name).toList(),
            ),
        ]),
    );
  }

  Expression _documentForOperation({
    required String operationName,
    required Set<FragmentName> fragmentNames,
  }) {
    final definitionRefs = _definitionRefsForOperation(
      operationName: operationName,
      fragmentNames: fragmentNames,
    );
    return _documentExpression(definitionRefs);
  }

  Expression _documentForFragment({
    required String fragmentName,
    required Set<FragmentName> fragmentNames,
  }) {
    final definitionRefs = _definitionRefsForOperation(
      operationName: null,
      fragmentNames: {...fragmentNames, FragmentName(fragmentName)},
    );
    return _documentExpression(definitionRefs);
  }

  Expression _documentExpression(List<Expression> definitionRefs) =>
      refer("DocumentNode", "package:gql/ast.dart").constInstance(
        [],
        {
          "definitions": literalConstList(definitionRefs),
        },
      );

  List<Expression> _definitionRefsForOperation({
    required String? operationName,
    required Set<FragmentName> fragmentNames,
  }) {
    final refs = <Expression>[];
    var foundOperation = false;
    for (final definition in documentIndex.document.definitions) {
      if (definition is OperationDefinitionNode) {
        final name = definition.name?.value;
        if (name == null || name != operationName) {
          continue;
        }
        refs.add(_definitionRef(name));
        foundOperation = true;
      } else if (definition is FragmentDefinitionNode) {
        final name = definition.name.value;
        if (!fragmentNames.contains(FragmentName(name))) {
          continue;
        }
        final fragmentKey = FragmentName(name);
        refs.add(
          _definitionRef(
            name,
            sourceUrl: fragmentSourceUrls[fragmentKey],
          ),
        );
      }
    }

    if (operationName != null && !foundOperation) {
      throw StateError("Missing operation definition for $operationName");
    }
    if (refs.isEmpty) {
      throw StateError("No definitions found for request document");
    }
    return refs;
  }

  Expression _definitionRef(
    String definitionName, {
    String? sourceUrl,
  }) {
    final url = sourceUrl == null ? "#ast" : "$sourceUrl#ast";
    return Reference(identifier(definitionName), url);
  }

  Reference _nullableReference(Reference reference) {
    if (reference is FunctionType) {
      return reference.rebuild((b) => b..isNullable = true);
    }
    if (reference is TypeReference) {
      return reference.rebuild((b) => b..isNullable = true);
    }
    return TypeReference(
      (b) => b
        ..symbol = reference.symbol
        ..url = reference.url
        ..isNullable = true,
    );
  }

  void _markUtilsUsage(List<_ReqFieldSpec> fieldsList) {
    if (!config.generateEquals && !config.generateHashCode) {
      return;
    }
    if (fieldsList.any((field) => field.isMap || field.name == "vars")) {
      _needsUtilsImport = true;
    }
  }
}

class _ReqFieldSpec {
  final String name;
  final Reference typeRef;
  final bool isNullable;
  final bool isMap;

  const _ReqFieldSpec({
    required this.name,
    required this.typeRef,
    required this.isNullable,
    this.isMap = false,
  });
}

bool _isNullableReference(Reference reference) {
  if (reference is FunctionType) {
    return reference.isNullable ?? false;
  }
  if (reference is TypeReference) {
    return reference.isNullable ?? false;
  }
  return reference.symbol == "Null";
}

String _equalsExpressionForField(
  _ReqFieldSpec field,
  String right,
) {
  // Avoid collision with the `operator ==(Object other)` parameter name.
  final left = field.name == "other" ? "this.other" : field.name;
  if (field.name == "vars") {
    return "${utilsPrefix}deepEquals(varsToJson(), other.varsToJson())";
  }
  if (field.isMap) {
    return "${utilsPrefix}deepEquals($left, $right)";
  }
  return "$left == $right";
}

String _hashExpressionForField(_ReqFieldSpec field) {
  if (field.name == "vars") {
    return "${utilsPrefix}deepHash(varsToJson())";
  }
  if (field.isMap) {
    return "${utilsPrefix}deepHash(${field.name})";
  }
  return field.name;
}
