import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../config/builder_config.dart";
import "../context/generator_context.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../ir/types.dart";
import "../schema/schema.dart";
import "../utils/docs.dart";
import "collection_helpers.dart";
import "../utils/naming.dart";
import "data_emitter_context.dart" show utilsImportAlias, utilsPrefix;
import "emitter_helpers.dart";
import "../logging/diagnostics.dart";

class VarsEmitter {
  final GeneratorContext context;
  final SchemaIndex schema;
  final DocumentIR document;
  final String? utilsUrl;
  final Set<String> extraImports = {};
  late final CollectionPolicy _collections = CollectionPolicy(
    config: config,
    overrides: config.typeOverrides,
  );

  bool _usesTriStateValue = false;
  bool _needsUtilsImport = false;

  VarsEmitter({
    required this.context,
    required this.schema,
    required this.document,
    required this.utilsUrl,
  });

  BuilderConfig get config => context.config;

  Library? buildLibrary({
    required Iterable<FragmentDefinitionNode> ownedFragments,
    required Iterable<OperationDefinitionNode> ownedOperations,
  }) {
    final specs = <Spec>[];
    var operationCount = 0;
    var fragmentCount = 0;

    for (final operation in ownedOperations) {
      if (operation.name == null) continue;
      final op = document.operations[OperationName(operation.name!.value)];
      if (op == null || op.variables.isEmpty) {
        continue;
      }
      operationCount += 1;
      specs.addAll(
        _buildVarsClass(
          "${operation.name!.value}Vars",
          op.variables
              .map(
                (variable) => _fieldSpecFromVariable(variable),
              )
              .toList(),
        ),
      );
    }

    for (final fragment in ownedFragments) {
      final frag = document.fragments[FragmentName(fragment.name.value)];
      if (frag == null || frag.variables.isEmpty) {
        continue;
      }
      fragmentCount += 1;
      specs.addAll(
        _buildVarsClass(
          "${fragment.name.value}Vars",
          frag.variables
              .map(
                (variable) => _fieldSpecFromVariable(variable),
              )
              .toList(),
        ),
      );
    }

    if (specs.isEmpty) {
      context.log.emit(
        LogEvent(
          level: LogLevel.debug,
          category: LogCategory.vars,
          message: "No vars classes emitted.",
        ),
      );
      return null;
    }

    if (_usesTriStateValue) {
      extraImports.add(
        "package:gql_tristate_value/gql_tristate_value.dart",
      );
    }

    _needsUtilsImport = config.generateEquals || config.generateHashCode;
    context.log.emit(
      LogEvent(
        level: LogLevel.debug,
        category: LogCategory.vars,
        message:
            "Emitted ${specs.length} vars specs ($operationCount operations, $fragmentCount fragments).",
      ),
    );

    return Library(
      (b) => b
        ..directives.addAll([
          if (_needsUtilsImport && utilsUrl != null)
            Directive.import(utilsUrl!, as: utilsImportAlias),
          ...extraImports.map(Directive.import),
        ])
        ..body.addAll(specs),
    );
  }

  List<Spec> _buildVarsClass(String name, List<InputFieldSpec> fields) {
    final className = builtClassName(name);
    return [
      Class(
        (b) => b
          ..name = className
          ..fields.addAll(fields.map(_buildField))
          ..constructors.addAll([
            _buildConstructor(fields),
            _buildFromJsonFactory(className, fields),
          ])
          ..methods.addAll([
            _buildToJsonMethod(fields),
            if (config.generateCopyWith)
              buildCopyWithMethod(
                className,
                fields
                    .map(
                      (field) => EmitterField(
                        name: field.propertyName,
                        typeRef: field.typeRef,
                        isNullable: _isNullableField(field),
                      ),
                    )
                    .toList(),
              ),
            if (config.generateEquals)
              buildEqualsMethod(
                className,
                fields.isEmpty
                    ? const []
                    : ["${utilsPrefix}deepEquals(toJson(), other.toJson())"],
              ),
            if (config.generateHashCode)
              buildHashCodeGetter(
                fields.isEmpty
                    ? ["runtimeType"]
                    : ["runtimeType", "${utilsPrefix}deepHash(toJson())"],
              ),
            if (config.generateToString)
              buildToStringMethod(
                className,
                fields.map((field) => field.propertyName).toList(),
              ),
          ]),
      ),
    ];
  }

  Constructor _buildConstructor(List<InputFieldSpec> fields) {
    final wrapFields = fields.where(_needsCollectionWrapper).toList();
    final wrapNames = wrapFields.map((field) => field.propertyName).toSet();

    final parameters = fields.map((field) {
      final useToThis = !wrapNames.contains(field.propertyName);
      return Parameter(
        (b) => b
          ..name = field.propertyName
          ..named = true
          ..required = field.isRequired
          ..toThis = useToThis
          ..type = useToThis ? null : field.typeRef
          ..defaultTo =
              field.isTriState ? const Code("const Value.absent()") : null,
      );
    });

    final initializers = <Code>[];
    for (final field in wrapFields) {
      final propertyName = field.propertyName;
      final wrapper = _collectionWrapperExpression(field, propertyName);
      initializers.add(Code("$propertyName = $wrapper"));
    }

    return Constructor(
      (b) => b
        ..constant = wrapFields.isEmpty
        ..optionalParameters.addAll(parameters)
        ..initializers.addAll(initializers),
    );
  }

  Constructor _buildFromJsonFactory(
    String className,
    List<InputFieldSpec> fields,
  ) {
    final args = <String, Expression>{};
    for (final field in fields) {
      args[field.propertyName] = _fromJsonExpression(field);
    }
    final constructorCall = refer(className).call([], args);
    return Constructor(
      (b) => b
        ..name = "fromJson"
        ..factory = true
        ..requiredParameters.add(
          Parameter((b) => b
            ..name = "json"
            ..type = _mapStringDynamicType()),
        )
        ..body = Block.of([constructorCall.returned.statement]),
    );
  }

  Method _buildToJsonMethod(List<InputFieldSpec> fields) {
    final statements = <Code>[
      const Code(r"final _$result = <String, dynamic>{};"),
    ];
    for (final field in fields) {
      final localName = "_\$${field.propertyName}Value";
      statements.add(Code("final $localName = this.${field.propertyName};"));
      final localRef = refer(localName);
      if (field.isTriState) {
        statements.add(Code("if ($localName.isPresent) {"));
        final requiredName = "_\$${field.propertyName}Required";
        statements.add(
          Code("final $requiredName = $localName.requireValue;"),
        );
        final valueExpr = _toJsonExpression(
          field,
          valueExpr: refer(requiredName),
        );
        statements.add(
          refer(r"_$result")
              .index(literalString(field.responseKey))
              .assign(valueExpr)
              .statement,
        );
        statements.add(const Code("}"));
      } else if (field.isRequired) {
        final valueExpr = _toJsonExpression(field, valueExpr: localRef);
        statements.add(
          refer(r"_$result")
              .index(literalString(field.responseKey))
              .assign(valueExpr)
              .statement,
        );
      } else {
        final valueExpr = _toJsonExpression(
          field,
          valueExpr: localRef,
          includeTopLevelNullGuard: false,
        );
        statements.add(Code("if ($localName != null) {"));
        statements.add(
          refer(r"_$result")
              .index(literalString(field.responseKey))
              .assign(valueExpr)
              .statement,
        );
        statements.add(const Code("}"));
      }
    }
    statements.add(refer(r"_$result").returned.statement);

    return Method(
      (b) => b
        ..name = "toJson"
        ..returns = _mapStringDynamicType()
        ..body = Block.of(statements),
    );
  }

  Field _buildField(InputFieldSpec field) => Field(
        (b) => b
          ..name = field.propertyName
          ..docs.addAll(docLines(field.description))
          ..type = field.typeRef
          ..modifier = FieldModifier.final$,
      );

  bool _isNullableField(InputFieldSpec field) {
    final typeRef = field.typeRef;
    if (typeRef is TypeReference) {
      return typeRef.isNullable ?? false;
    }
    return false;
  }

  InputFieldSpec _fieldSpecFromVariable(VariableIR variable) {
    final responseKey = variable.name.value;
    final propertyName = identifier(variable.name.value);
    final namedTypeName = variable.namedType.name.value;
    final namedTypeKind = variable.namedType.kind;

    Reference namedTypeRef;
    if (namedTypeKind == GraphQLTypeKind.inputObject ||
        namedTypeKind == GraphQLTypeKind.enumType) {
      namedTypeRef = Reference(
        builtClassName(namedTypeName),
        "#schema",
      );
    } else if (namedTypeKind == GraphQLTypeKind.scalar) {
      namedTypeRef = _scalarReference(namedTypeName);
    } else {
      namedTypeRef = refer("Object");
    }

    final typeNode = variable.typeNode;
    final isTriState = _useTriState && !typeNode.isNonNull;
    if (isTriState) {
      _usesTriStateValue = true;
    }

    final typeRef = _typeReferenceForTypeNode(
      typeNode,
      namedTypeRef,
      isTriState: isTriState,
    );
    final description = _typeDescription(namedTypeName);

    return InputFieldSpec(
      responseKey: responseKey,
      propertyName: propertyName,
      typeNode: typeNode,
      namedType: variable.namedType,
      typeRef: typeRef,
      namedTypeRef: namedTypeRef,
      isTriState: isTriState,
      description: description,
    );
  }

  String? _typeDescription(String typeName) {
    if (!config.generateDocs) return null;
    final definition = schema.lookupType(NameNode(value: typeName));
    return definition?.description?.value;
  }

  Reference _scalarReference(String typeName) {
    final override = config.typeOverrides[typeName];
    if (override?.type != null) {
      if (override!.import != null) {
        extraImports.add(override.import!);
      }
      return Reference(override.type);
    }

    return switch (typeName) {
      "Int" => refer("int"),
      "Float" => refer("double"),
      "Boolean" => refer("bool"),
      "ID" => refer("String"),
      "String" => refer("String"),
      _ => refer("Object"),
    };
  }

  bool _canUseListFrom({
    required String typeName,
    required NamedTypeInfo namedType,
    required TypeOverrideConfig? override,
  }) {
    if (namedType.kind != GraphQLTypeKind.scalar) return false;
    if (override?.fromJsonFunctionName != null) return false;
    if (_isBuiltinScalarName(typeName)) return true;
    final overrideType = override?.type;
    if (overrideType == null) return false;
    final normalized = overrideType.replaceAll(" ", "");
    if (normalized == "Object" ||
        normalized == "Object?" ||
        normalized == "dynamic") {
      return false;
    }
    return true;
  }

  bool _isBuiltinScalarName(String typeName) => switch (typeName) {
        "Int" => true,
        "Float" => true,
        "Boolean" => true,
        "ID" => true,
        "String" => true,
        _ => false,
      };

  Reference _typeReferenceWithNullability(
    Reference typeRef, {
    required bool isNullable,
  }) {
    if (typeRef is TypeReference) {
      return typeRef.rebuild((b) => b..isNullable = isNullable);
    }
    return TypeReference(
      (b) => b
        ..symbol = typeRef.symbol
        ..url = typeRef.url
        ..isNullable = isNullable,
    );
  }

  Reference _typeReferenceForTypeNode(
    TypeNode typeNode,
    Reference namedTypeRef, {
    required bool isTriState,
    bool forceNonNullOuter = false,
  }) {
    if (isTriState && !typeNode.isNonNull && !forceNonNullOuter) {
      final innerType = _typeReferenceForTypeNode(
        typeNode,
        namedTypeRef,
        isTriState: false,
        forceNonNullOuter: true,
      );
      return TypeReference(
        (b) => b
          ..symbol = "Value"
          ..types.add(innerType),
      );
    }

    if (typeNode is ListTypeNode) {
      final innerType = _typeReferenceForTypeNode(
        typeNode.type,
        namedTypeRef,
        isTriState: false,
      );
      return TypeReference(
        (b) => b
          ..symbol = "List"
          ..isNullable = forceNonNullOuter ? false : !typeNode.isNonNull
          ..types.add(innerType),
      );
    }

    if (typeNode is NamedTypeNode) {
      if (namedTypeRef is TypeReference) {
        return namedTypeRef.rebuild(
          (b) =>
              b..isNullable = forceNonNullOuter ? false : !typeNode.isNonNull,
        );
      }
      return TypeReference(
        (b) => b
          ..symbol = namedTypeRef.symbol
          ..url = namedTypeRef.url
          ..isNullable = forceNonNullOuter ? false : !typeNode.isNonNull,
      );
    }

    throw StateError("Invalid type node");
  }

  Expression _fromJsonExpression(InputFieldSpec field) {
    final accessExpr = refer("json").index(literalString(field.responseKey));
    if (field.isTriState) {
      final inner = _fromJsonForTypeNode(field.typeNode, field, accessExpr);
      final condition = refer("json")
          .property("containsKey")
          .call([literalString(field.responseKey)]);
      final presentExpr = refer("Value").newInstanceNamed("present", [inner]);
      final absentExpr = refer("Value").newInstanceNamed("absent", []);
      final valueExpr =
          _conditionalExpression(condition, presentExpr, absentExpr);
      return valueExpr;
    }
    final valueExpr = _fromJsonForTypeNode(field.typeNode, field, accessExpr);
    return valueExpr;
  }

  Expression _fromJsonForTypeNode(
    TypeNode node,
    InputFieldSpec field,
    Expression valueExpr,
  ) {
    if (node is ListTypeNode) {
      if (node.type is NamedTypeNode) {
        final innerNode = node.type as NamedTypeNode;
        final typeName = innerNode.name.value;
        final override = config.typeOverrides[typeName];
        if (_canUseListFrom(
          typeName: typeName,
          namedType: field.namedType,
          override: override,
        )) {
          final scalarRef = _scalarReference(typeName);
          final innerTypeRef = _typeReferenceWithNullability(
            scalarRef,
            isNullable: !innerNode.isNonNull,
          );
          final listTypeRef = TypeReference(
            (b) => b
              ..symbol = "List"
              ..types.add(innerTypeRef),
          );
          final castExpr = valueExpr.asA(_listDynamicType());
          final fromExpr = listTypeRef.property("from").call([castExpr]);
          final wrapped = _wrapListIfNeeded(node, field, fromExpr);
          if (node.isNonNull) {
            return wrapped;
          }
          return _nullGuard(valueExpr, wrapped);
        }
      }
      final innerExpr = _fromJsonForTypeNode(node.type, field, refer(r"_$e"));
      final castExpr = valueExpr.asA(_listDynamicType());
      final mapped = castExpr
          .property("map")
          .call([
            Method(
              (b) => b
                ..requiredParameters.add(
                  Parameter((b) => b..name = r"_$e"),
                )
                ..lambda = true
                ..body = innerExpr.code,
            ).closure,
          ])
          .property("toList")
          .call([]);
      final wrapped = _wrapListIfNeeded(node, field, mapped);
      if (node.isNonNull) {
        return wrapped;
      }
      return _nullGuard(valueExpr, wrapped);
    }
    if (node is NamedTypeNode) {
      final typeName = node.name.value;
      final override = config.typeOverrides[typeName];
      final inner = _fromJsonForNamedType(
        typeName: typeName,
        namedType: field.namedType,
        override: override,
        field: field,
        valueExpr: valueExpr,
      );
      if (node.isNonNull) {
        return inner;
      }
      return _nullGuard(valueExpr, inner);
    }
    throw StateError("Invalid type node");
  }

  Expression _fromJsonForNamedType({
    required String typeName,
    required NamedTypeInfo namedType,
    required TypeOverrideConfig? override,
    required InputFieldSpec field,
    required Expression valueExpr,
  }) {
    if (override?.fromJsonFunctionName != null) {
      return refer(override!.fromJsonFunctionName!).call([valueExpr]);
    }
    if (namedType.kind == GraphQLTypeKind.enumType) {
      return field.namedTypeRef.property("fromJson").call([
        valueExpr.asA(refer("String")),
      ]);
    }
    if (namedType.kind == GraphQLTypeKind.inputObject) {
      return field.namedTypeRef.property("fromJson").call([
        valueExpr.asA(_mapStringDynamicType()),
      ]);
    }

    final scalarType = _scalarReference(typeName);
    final castExpr = valueExpr.asA(scalarType);
    return _collections.wrapMap(
      typeName: typeName,
      innerExpr: castExpr,
    );
  }

  Expression _wrapListIfNeeded(
    TypeNode node,
    InputFieldSpec field,
    Expression innerExpr,
  ) {
    final listTypeRef = _typeReferenceForTypeNode(
      node,
      field.namedTypeRef,
      isTriState: false,
      forceNonNullOuter: true,
    );
    return _collections.wrapList(
      listTypeRef: listTypeRef,
      innerExpr: innerExpr,
    );
  }

  Expression _toJsonExpression(
    InputFieldSpec field, {
    required Expression valueExpr,
    bool includeTopLevelNullGuard = true,
  }) {
    return _toJsonForTypeNode(
      field.typeNode,
      field,
      valueExpr,
      includeNullGuardAtCurrentLevel: includeTopLevelNullGuard,
    );
  }

  bool _needsCollectionWrapper(InputFieldSpec field) {
    if (field.isTriState) return false;
    return _collections.needsWrapper(field.typeNode);
  }

  String _collectionWrapperExpression(
    InputFieldSpec field,
    String propertyName,
  ) {
    return _collections.wrapConstructor(
      node: field.typeNode,
      propertyName: propertyName,
    );
  }

  Expression _toJsonForTypeNode(
    TypeNode node,
    InputFieldSpec field,
    Expression valueExpr, {
    bool includeNullGuardAtCurrentLevel = true,
  }) {
    if (node is ListTypeNode) {
      final innerExpr = _toJsonForTypeNode(
        node.type,
        field,
        refer(r"_$e"),
      );
      final mapped = valueExpr
          .property("map")
          .call([
            Method(
              (b) => b
                ..requiredParameters.add(
                  Parameter((b) => b..name = r"_$e"),
                )
                ..lambda = true
                ..body = innerExpr.code,
            ).closure,
          ])
          .property("toList")
          .call([]);
      if (node.isNonNull) {
        return mapped;
      }
      if (!includeNullGuardAtCurrentLevel) {
        return mapped;
      }
      return _nullGuard(valueExpr, mapped);
    }
    if (node is NamedTypeNode) {
      final typeName = node.name.value;
      final override = config.typeOverrides[typeName];
      final inner = _toJsonForNamedType(
        typeName: typeName,
        namedType: field.namedType,
        override: override,
        field: field,
        valueExpr: valueExpr,
      );
      if (node.isNonNull) {
        return inner;
      }
      if (!includeNullGuardAtCurrentLevel) {
        return inner;
      }
      return _nullGuard(valueExpr, inner);
    }
    throw StateError("Invalid type node");
  }

  Expression _toJsonForNamedType({
    required String typeName,
    required NamedTypeInfo namedType,
    required TypeOverrideConfig? override,
    required InputFieldSpec field,
    required Expression valueExpr,
  }) {
    if (override?.toJsonFunctionName != null) {
      return refer(override!.toJsonFunctionName!).call([valueExpr]);
    }
    if (namedType.kind == GraphQLTypeKind.enumType ||
        namedType.kind == GraphQLTypeKind.inputObject) {
      return valueExpr.property("toJson").call([]);
    }
    return valueExpr;
  }

  bool get _useTriState =>
      config.triStateOptionalsConfig == TriStateValueConfig.onAllNullableFields;
}

class InputFieldSpec {
  final String responseKey;
  final String propertyName;
  final TypeNode typeNode;
  final NamedTypeInfo namedType;
  final Reference typeRef;
  final Reference namedTypeRef;
  final bool isTriState;
  final String? description;

  const InputFieldSpec({
    required this.responseKey,
    required this.propertyName,
    required this.typeNode,
    required this.namedType,
    required this.typeRef,
    required this.namedTypeRef,
    required this.isTriState,
    required this.description,
  });

  bool get isRequired => !isTriState && typeNode.isNonNull;
}

Expression _conditionalExpression(
  Expression condition,
  Expression whenTrue,
  Expression whenFalse,
) {
  return CodeExpression(
    Block.of([
      condition.code,
      const Code(" ? "),
      whenTrue.code,
      const Code(" : "),
      whenFalse.code,
    ]),
  );
}

Expression _nullGuard(Expression valueExpr, Expression innerExpr) {
  return CodeExpression(
    Block.of([
      valueExpr.code,
      const Code(" == null ? null : "),
      innerExpr.code,
    ]),
  );
}

TypeReference _mapStringDynamicType() => TypeReference(
      (b) => b
        ..symbol = "Map"
        ..types.addAll([
          refer("String"),
          refer("dynamic"),
        ]),
    );

TypeReference _listDynamicType() => TypeReference(
      (b) => b
        ..symbol = "List"
        ..types.add(refer("dynamic")),
    );
