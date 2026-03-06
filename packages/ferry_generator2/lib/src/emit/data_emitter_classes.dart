import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "data_emitter_context.dart";
import "data_emitter_fields.dart";
import "data_emitter_json.dart";
import "data_emitter_types.dart";
import "emitter_helpers.dart";
import "fragment_interface_refs.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../utils/naming.dart";
import "../utils/docs.dart";

({List<Spec> specs, DataEmitterContext ctx}) buildOperationData({
  required DataEmitterContext ctx,
  required OperationDefinitionNode operation,
}) {
  if (operation.name == null) {
    return (specs: const <Spec>[], ctx: ctx);
  }
  final operationIr =
      ctx.document.operations[OperationName(operation.name!.value)];
  if (operationIr == null) {
    return (specs: const <Spec>[], ctx: ctx);
  }
  final resolved = operationIr.selection;
  final baseName = "${operation.name!.value}Data";
  return (
    specs: buildSelectionSetClasses(
      ctx: ctx,
      baseName: baseName,
      selectionSet: resolved,
      classImplements: const [],
      fragmentName: null,
    ),
    ctx: ctx,
  );
}

List<Spec> buildSelectionSetClasses({
  required DataEmitterContext ctx,
  required String baseName,
  required SelectionSetIR selectionSet,
  required List<Reference> classImplements,
  required String? fragmentName,
}) {
  final className = builtClassName(baseName);
  if (!ctx.generatedClasses.add(className)) {
    return [];
  }

  final specs = <Spec>[];
  final interfaceSpreads = selectionSet.unconditionalFragmentSpreads;

  if (selectionSet.inlineFragments.isEmpty) {
    final fieldsList = buildFieldSpecs(
      ctx: ctx,
      baseName: baseName,
      selectionSet: selectionSet,
    );
    final implementsRefs = _interfaceRefs(
      ctx: ctx,
      fragmentSpreads: interfaceSpreads,
      parentTypeName: selectionSet.parentTypeName,
      baseImplements: classImplements,
    );
    specs.add(
      _buildConcreteClass(
        ctx: ctx,
        className: className,
        docs: ctx.docsForType(selectionSet.parentTypeName),
        fields: fieldsList,
        implementsRefs: implementsRefs,
        extendsRef: null,
        superFields: const [],
        usesSuperToJson: false,
      ),
    );
    specs
        .addAll(_buildNestedClasses(ctx, baseName, fieldsList, implementsRefs));
    return specs;
  }

  final baseFields = buildFieldSpecs(
    ctx: ctx,
    baseName: baseName,
    selectionSet: selectionSet,
  );

  final baseImplements = _interfaceRefs(
    ctx: ctx,
    fragmentSpreads: interfaceSpreads,
    parentTypeName: selectionSet.parentTypeName,
    baseImplements: classImplements,
  );
  specs.add(
    _buildPolymorphicBaseClass(
      ctx: ctx,
      className: className,
      docs: ctx.docsForType(selectionSet.parentTypeName),
      baseFields: baseFields,
      inlineTypeNames: selectionSet.inlineFragments.keys
          .map((typeName) => typeName.value)
          .toList(),
      implementsRefs: baseImplements,
    ),
  );
  final whenExtension = _buildWhenExtension(
    ctx: ctx,
    baseName: baseName,
    inlineTypeNames: selectionSet.inlineFragments.keys
        .map((typeName) => typeName.value)
        .toList(),
  );
  if (whenExtension != null) {
    specs.add(whenExtension);
  }
  specs.addAll(_buildNestedClasses(ctx, baseName, baseFields, baseImplements));

  for (final entry in selectionSet.inlineFragments.entries) {
    final typeName = entry.key.value;
    final inlineBaseName = "${baseName}__as$typeName";
    final inlineFields = buildFieldSpecs(
      ctx: ctx,
      baseName: inlineBaseName,
      selectionSet: entry.value,
    );
    final baseKeys = baseFields.map((field) => field.responseKey).toSet();
    final List<FieldSpec> mergedFields = [
      ...baseFields,
      ...inlineFields.where(
        (field) => !baseKeys.contains(field.responseKey),
      ),
    ];
    final inlineImplements = _interfaceRefs(
      ctx: ctx,
      fragmentSpreads: entry.value.unconditionalFragmentSpreads,
      parentTypeName: TypeName(typeName),
      baseImplements: classImplements,
    );
    final fragmentInfo = fragmentName == null
        ? null
        : ctx.fragmentInfo[FragmentName(fragmentName)];
    if (fragmentInfo != null &&
        fragmentInfo.inlineTypes.contains(TypeName(typeName))) {
      inlineImplements.add(
        refer(builtClassName("${fragmentName}__as$typeName")),
      );
    }
    specs.add(
      _buildConcreteClass(
        ctx: ctx,
        className: builtClassName(inlineBaseName),
        docs: ctx.docsForType(TypeName(typeName)),
        fields: mergedFields,
        implementsRefs: inlineImplements,
        extendsRef: refer(className),
        superFields: baseFields,
        usesSuperToJson: true,
      ),
    );
    specs.addAll(
      _buildNestedClasses(
        ctx,
        inlineBaseName,
        inlineFields
            .where((field) => !baseKeys.contains(field.responseKey))
            .toList(),
        inlineImplements,
      ),
    );
  }

  specs.add(
    _buildConcreteClass(
      ctx: ctx,
      className: builtClassName("${baseName}__unknown"),
      docs: ctx.docsForType(selectionSet.parentTypeName),
      fields: baseFields,
      implementsRefs: _interfaceRefs(
        ctx: ctx,
        fragmentSpreads: interfaceSpreads,
        parentTypeName: selectionSet.parentTypeName,
        baseImplements: classImplements,
      ),
      extendsRef: refer(className),
      superFields: baseFields,
      usesSuperToJson: true,
    ),
  );

  return specs;
}

Extension? _buildWhenExtension({
  required DataEmitterContext ctx,
  required String baseName,
  required List<String> inlineTypeNames,
}) {
  if (inlineTypeNames.isEmpty) return null;
  if (!ctx.config.whenExtensionConfig.generateWhenExtensionMethod &&
      !ctx.config.whenExtensionConfig.generateMaybeWhenExtensionMethod) {
    return null;
  }

  final className = builtClassName(baseName);
  final usedNames = <String>{"orElse", "_T"};
  final paramNames = <String, String>{};

  String uniqueParamName(String typeName) {
    var name = identifier(_uncapitalize(typeName));
    while (usedNames.contains(name)) {
      name = identifier("g$name");
    }
    usedNames.add(name);
    return name;
  }

  for (final typeName in inlineTypeNames) {
    paramNames[typeName] = uniqueParamName(typeName);
  }

  final orderedInlineTypeNames = [
    ...inlineTypeNames.where(
      (typeName) =>
          ctx.schema.lookupTypeAs<ObjectTypeDefinitionNode>(
            NameNode(value: typeName),
          ) !=
          null,
    ),
    ...inlineTypeNames.where(
      (typeName) =>
          ctx.schema.lookupTypeAs<ObjectTypeDefinitionNode>(
            NameNode(value: typeName),
          ) ==
          null,
    ),
  ];

  List<Code> buildSwitchCases(
      String Function(String typeName) returnStatement) {
    final usedCaseTypeNames = <String>{};
    final switchCases = <Code>[];
    for (final typeName in orderedInlineTypeNames) {
      final typeDef = ctx.schema.lookupType(NameNode(value: typeName));
      final concreteCaseTypes = typeDef is ObjectTypeDefinitionNode
          ? <String>{typeName}
          : (ctx.schema.possibleTypesMap()[typeName] ?? const <String>{});
      final unusedCaseTypes =
          concreteCaseTypes.difference(usedCaseTypeNames).toList()..sort();
      if (unusedCaseTypes.isEmpty) continue;
      usedCaseTypeNames.addAll(unusedCaseTypes);

      for (final caseType in unusedCaseTypes) {
        switchCases.add(Code("case '$caseType':"));
      }
      switchCases.add(Code(returnStatement(typeName)));
    }
    return switchCases;
  }

  final methods = <Method>[];
  if (ctx.config.whenExtensionConfig.generateWhenExtensionMethod) {
    final switchCases = buildSwitchCases(
      (typeName) =>
          "return ${paramNames[typeName]}(this as ${builtClassName("${baseName}__as$typeName")});",
    );
    methods.add(
      Method(
        (b) => b
          ..name = "when"
          ..returns = refer("_T")
          ..types.add(refer("_T"))
          ..optionalParameters.addAll([
            for (final typeName in inlineTypeNames)
              Parameter(
                (b) => b
                  ..name = paramNames[typeName]!
                  ..type = FunctionType(
                    (b) => b
                      ..returnType = refer("_T")
                      ..requiredParameters.add(
                        refer(
                          builtClassName("${baseName}__as$typeName"),
                        ),
                      ),
                  )
                  ..named = true
                  ..required = true,
              ),
            Parameter(
              (b) => b
                ..name = "orElse"
                ..type = FunctionType((b) => b..returnType = refer("_T"))
                ..named = true
                ..required = true,
            ),
          ])
          ..body = Block.of([
            const Code("switch(G__typename) {"),
            ...switchCases,
            const Code("default: return orElse();"),
            const Code("}"),
          ]),
      ),
    );
  }

  if (ctx.config.whenExtensionConfig.generateMaybeWhenExtensionMethod) {
    final switchCases = buildSwitchCases(
      (typeName) =>
          "return ${paramNames[typeName]} == null ? orElse() : ${paramNames[typeName]}(this as ${builtClassName("${baseName}__as$typeName")});",
    );
    methods.add(
      Method(
        (b) => b
          ..name = "maybeWhen"
          ..returns = refer("_T")
          ..types.add(refer("_T"))
          ..optionalParameters.addAll([
            for (final typeName in inlineTypeNames)
              Parameter(
                (b) => b
                  ..name = paramNames[typeName]!
                  ..type = FunctionType(
                    (b) => b
                      ..returnType = refer("_T")
                      ..isNullable = true
                      ..requiredParameters.add(
                        refer(
                          builtClassName("${baseName}__as$typeName"),
                        ),
                      ),
                  )
                  ..named = true
                  ..required = false,
              ),
            Parameter(
              (b) => b
                ..name = "orElse"
                ..type = FunctionType((b) => b..returnType = refer("_T"))
                ..named = true
                ..required = true,
            ),
          ])
          ..body = Block.of([
            const Code("switch(G__typename) {"),
            ...switchCases,
            const Code("default: return orElse();"),
            const Code("}"),
          ]),
      ),
    );
  }

  return Extension(
    (b) => b
      ..name = "${className}WhenExtension"
      ..on = refer(className)
      ..methods.addAll(methods),
  );
}

String _uncapitalize(String value) {
  if (value.isEmpty) return value;
  return "${value[0].toLowerCase()}${value.substring(1)}";
}

List<Spec> _buildNestedClasses(
  DataEmitterContext ctx,
  String baseName,
  List<FieldSpec> fieldsList,
  List<Reference> parentInterfaces,
) {
  final specs = <Spec>[];
  for (final field in fieldsList) {
    if (field.selectionSet == null ||
        field.selectionSet?.reuseFragment != null) {
      continue;
    }
    final nestedName = "${baseName}_${field.responseKey}";
    final nestedInterfaces = _nestedInterfaceRefsForField(
      ctx,
      parentInterfaces,
      field,
    );
    specs.addAll(
      buildSelectionSetClasses(
        ctx: ctx,
        baseName: nestedName,
        selectionSet: field.selectionSet!,
        classImplements: nestedInterfaces,
        fragmentName: null,
      ),
    );
  }
  return specs;
}

List<Reference> _nestedInterfaceRefsForField(
  DataEmitterContext ctx,
  List<Reference> parentInterfaces,
  FieldSpec field,
) {
  if (field.selectionSet == null) return const [];
  final refs = <Reference>[];
  for (final interfaceRef in parentInterfaces) {
    final symbol = interfaceRef.symbol;
    if (symbol == null || !symbol.startsWith("G")) continue;
    final interfaceKey = symbol.substring(1);
    final selectionSet = ctx.fragmentInterfaceSelections[interfaceKey];
    if (selectionSet == null) continue;
    final nestedField = selectionSet.fields[ResponseKey(field.responseKey)];
    if (nestedField?.selectionSet == null) continue;
    if (ctx.config.dataClassConfig.reuseFragments &&
        nestedField!.selectionSet?.reuseFragment != null) {
      continue;
    }
    final nestedKey = "${interfaceKey}_${field.responseKey}";
    final fragmentName = ctx.interfaceKeyToFragmentName[nestedKey] ??
        ctx.interfaceKeyToFragmentName[interfaceKey];
    if (fragmentName == null) continue;
    final url = ctx.fragmentSourceUrls[fragmentName];
    refs.add(
      Reference(
        builtClassName(nestedKey),
        url == null ? "#data" : "$url#data",
      ),
    );
  }
  return refs;
}

List<Reference> _interfaceRefs({
  required DataEmitterContext ctx,
  required Set<FragmentName> fragmentSpreads,
  required TypeName parentTypeName,
  required List<Reference> baseImplements,
}) {
  return fragmentInterfaceRefs(
    ctx: ctx,
    fragmentSpreads: fragmentSpreads,
    parentTypeName: parentTypeName,
    baseImplements: baseImplements,
  );
}

Class _buildPolymorphicBaseClass({
  required DataEmitterContext ctx,
  required String className,
  required List<String> docs,
  required List<FieldSpec> baseFields,
  required List<String> inlineTypeNames,
  required List<Reference> implementsRefs,
}) {
  return Class(
    (b) => b
      ..name = className
      ..abstract = true
      ..sealed = true
      ..docs.addAll(docs)
      ..implements.addAll(implementsRefs)
      ..fields.addAll(baseFields.map(_buildField))
      ..constructors.addAll([
        _buildConstructor(ctx, baseFields, null),
        _buildFromJsonFactory(ctx, className, baseFields, inlineTypeNames),
      ])
      ..methods.add(
        _buildToJsonMethod(ctx, baseFields, usesSuper: false),
      ),
  );
}

Class _buildConcreteClass({
  required DataEmitterContext ctx,
  required String className,
  required List<String> docs,
  required List<FieldSpec> fields,
  required List<Reference> implementsRefs,
  required Reference? extendsRef,
  required List<FieldSpec> superFields,
  required bool usesSuperToJson,
}) {
  final toJsonFields = usesSuperToJson
      ? fields.where((field) => !superFields.contains(field)).toList()
      : fields;
  final methods = <Method>[
    _buildToJsonMethod(ctx, toJsonFields, usesSuper: usesSuperToJson),
  ];
  if (ctx.config.generateCopyWith) {
    methods.add(
      buildCopyWithMethod(
        className,
        fields
            .map(
              (field) => EmitterField(
                name: field.propertyName,
                typeRef: field.typeRef,
                isNullable: isNullableField(field),
              ),
            )
            .toList(),
      ),
    );
  }
  if (ctx.config.generateEquals) {
    final comparisons = fields
        .map(
          (field) => _equalsExpressionForTypeNode(
            ctx,
            field.typeNode,
            field.propertyName,
            "other.${field.propertyName}",
          ),
        )
        .toList();
    methods.add(buildEqualsMethod(className, comparisons));
  }
  if (ctx.config.generateHashCode) {
    final entries = [
      "runtimeType",
      ...fields.map(
        (field) => _hashExpressionForTypeNode(
          ctx,
          field.typeNode,
          field.propertyName,
        ),
      ),
    ];
    methods.add(buildHashCodeGetter(entries));
  }
  if (ctx.config.generateToString) {
    methods.add(
      buildToStringMethod(
        className,
        fields.map((field) => field.propertyName).toList(),
      ),
    );
  }

  return Class(
    (b) => b
      ..name = className
      ..docs.addAll(docs)
      ..implements.addAll(implementsRefs)
      ..extend = extendsRef
      ..fields.addAll(
        fields.where((field) => !superFields.contains(field)).map(_buildField),
      )
      ..constructors.addAll([
        _buildConstructor(ctx, fields, extendsRef, superFields: superFields),
        _buildConcreteFromJson(ctx, className, fields),
      ])
      ..methods.addAll(methods),
  );
}

Constructor _buildConstructor(
  DataEmitterContext ctx,
  List<FieldSpec> fieldsList,
  Reference? extendsRef, {
  List<FieldSpec> superFields = const [],
}) {
  final wrapFields = fieldsList
      .where((field) => !superFields.contains(field))
      .where(
        (field) => ctx.collections.needsWrapper(field.typeNode),
      )
      .toList();
  final wrapFieldNames = wrapFields.map((field) => field.propertyName).toSet();

  final namedParameters = fieldsList.map((field) {
    final isRequired = field.typeRef is TypeReference
        ? !((field.typeRef as TypeReference).isNullable ?? false)
        : true;
    final shouldWrap = wrapFieldNames.contains(field.propertyName);
    final useToThis = !superFields.contains(field) && !shouldWrap;
    return Parameter(
      (b) => b
        ..name = field.propertyName
        ..named = true
        ..required = isRequired
        ..toThis = useToThis
        ..type = useToThis ? null : field.typeRef,
    );
  });

  final initializers = <Code>[];
  for (final field in wrapFields) {
    final propertyName = field.propertyName;
    final wrapper = ctx.collections.wrapConstructor(
      node: field.typeNode,
      propertyName: propertyName,
    );
    initializers.add(Code("$propertyName = $wrapper"));
  }
  if (extendsRef != null && superFields.isNotEmpty) {
    final args = superFields
        .map((field) => "${field.propertyName}: ${field.propertyName}")
        .join(", ");
    initializers.add(Code("super($args)"));
  }

  return Constructor(
    (b) => b
      ..constant = wrapFields.isEmpty && extendsRef == null
      ..optionalParameters.addAll(namedParameters)
      ..initializers.addAll(initializers),
  );
}

Constructor _buildFromJsonFactory(
  DataEmitterContext ctx,
  String className,
  List<FieldSpec> baseFields,
  List<String> inlineTypeNames,
) {
  final orderedInlineTypeNames = [
    ...inlineTypeNames.where(
      (typeName) =>
          ctx.schema.lookupTypeAs<ObjectTypeDefinitionNode>(
            NameNode(value: typeName),
          ) !=
          null,
    ),
    ...inlineTypeNames.where(
      (typeName) =>
          ctx.schema.lookupTypeAs<ObjectTypeDefinitionNode>(
            NameNode(value: typeName),
          ) ==
          null,
    ),
  ];

  final usedCaseTypeNames = <String>{};
  final switchCases = <Code>[];
  for (final typeName in orderedInlineTypeNames) {
    final typeDef = ctx.schema.lookupType(NameNode(value: typeName));
    final concreteCaseTypes = typeDef is ObjectTypeDefinitionNode
        ? <String>{typeName}
        : (ctx.schema.possibleTypesMap()[typeName] ?? const <String>{});
    final unusedCaseTypes =
        concreteCaseTypes.difference(usedCaseTypeNames).toList()..sort();
    if (unusedCaseTypes.isEmpty) continue;
    usedCaseTypeNames.addAll(unusedCaseTypes);

    for (final caseType in unusedCaseTypes) {
      switchCases.add(Code("case '$caseType':"));
    }
    switchCases.add(
      Code(
        "return ${builtClassName("${stripPrefix(className)}__as$typeName")}.fromJson(json);",
      ),
    );
  }
  final body = [
    Code("switch(json['__typename'] as String) {"),
    ...switchCases,
    Code(
      "default: return ${builtClassName("${stripPrefix(className)}__unknown")}.fromJson(json);",
    ),
    Code("}"),
  ];

  return Constructor(
    (b) => b
      ..name = "fromJson"
      ..factory = true
      ..requiredParameters.add(
        Parameter((b) => b
          ..name = "json"
          ..type = refer("Map<String, dynamic>")),
      )
      ..body = Block.of(body),
  );
}

Constructor _buildConcreteFromJson(
  DataEmitterContext ctx,
  String className,
  List<FieldSpec> fieldsList,
) {
  final args = <String, Expression>{};
  for (final field in fieldsList) {
    args[field.propertyName] = fromJsonExpression(ctx: ctx, field: field);
  }
  final constructorCall = refer(className).call([], args);

  return Constructor(
    (b) => b
      ..name = "fromJson"
      ..factory = true
      ..requiredParameters.add(
        Parameter((b) => b
          ..name = "json"
          ..type = mapStringDynamicType()),
      )
      ..body = Block.of([constructorCall.returned.statement]),
  );
}

Method _buildToJsonMethod(
  DataEmitterContext ctx,
  List<FieldSpec> fieldsList, {
  required bool usesSuper,
}) {
  final statements = <Code>[];
  if (usesSuper) {
    statements.add(const Code(r"final _$result = super.toJson();"));
  } else {
    statements.add(const Code(r"final _$result = <String, dynamic>{};"));
  }
  for (final field in fieldsList) {
    Expression valueRef = refer("this").property(field.propertyName);
    if (isNullableField(field)) {
      final localName = "_\$${field.propertyName}Value";
      statements.add(Code("final $localName = this.${field.propertyName};"));
      valueRef = refer(localName);
    }
    final target = refer(r"_$result").index(literalString(field.responseKey));
    final valueExpr = toJsonExpression(
      ctx: ctx,
      field: field,
      valueExpr: valueRef,
    );
    statements.add(target.assign(valueExpr).statement);
  }
  statements.add(refer(r"_$result").returned.statement);

  return Method(
    (b) => b
      ..name = "toJson"
      ..returns = mapStringDynamicType()
      ..body = Block.of(statements),
  );
}

Field _buildField(FieldSpec field) => Field(
      (b) => b
        ..name = field.propertyName
        ..docs.addAll(docLines(field.description))
        ..type = field.typeRef
        ..modifier = FieldModifier.final$,
    );

bool _requiresDeepList(TypeNode node, DataEmitterContext ctx) {
  if (node is ListTypeNode) return true;
  if (node is NamedTypeNode) {
    return isMapOverride(ctx: ctx, typeName: node.name.value);
  }
  return false;
}

String _equalsExpressionForTypeNode(
  DataEmitterContext ctx,
  TypeNode node,
  String left,
  String right,
) {
  // Avoid collision with the `operator ==(Object other)` parameter name.
  final leftExpr = left == "other" ? "this.other" : left;
  if (node is ListTypeNode) {
    ctx.needsUtilsImport = true;
    final helper =
        _requiresDeepList(node.type, ctx) ? "listEqualsDeep" : "listEquals";
    return "$utilsPrefix$helper($leftExpr, $right)";
  }
  if (node is NamedTypeNode) {
    final typeName = node.name.value;
    if (isMapOverride(ctx: ctx, typeName: typeName)) {
      ctx.needsUtilsImport = true;
      return "${utilsPrefix}deepEquals($leftExpr, $right)";
    }
    return "$leftExpr == $right";
  }
  throw StateError("Invalid type node");
}

String _hashExpressionForTypeNode(
  DataEmitterContext ctx,
  TypeNode node,
  String value,
) {
  if (node is ListTypeNode) {
    ctx.needsUtilsImport = true;
    final helper =
        _requiresDeepList(node.type, ctx) ? "listHashDeep" : "listHash";
    return "$utilsPrefix$helper($value)";
  }
  if (node is NamedTypeNode) {
    final typeName = node.name.value;
    if (isMapOverride(ctx: ctx, typeName: typeName)) {
      ctx.needsUtilsImport = true;
      return "${utilsPrefix}deepHash($value)";
    }
    return value;
  }
  throw StateError("Invalid type node");
}
