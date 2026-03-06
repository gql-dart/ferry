import "package:gql/ast.dart";
import "package:gql/language.dart";

import "../schema/schema.dart";
import "selection_resolver.dart";
import "../schema/type_utils.dart";

class DocumentValidator {
  final SchemaIndex schema;
  final DocumentIndex documentIndex;
  final Map<String, DirectiveDefinitionNode> directiveDefinitions;

  DocumentValidator({
    required this.schema,
    required this.documentIndex,
  }) : directiveDefinitions = _buildDirectiveDefinitions(schema);

  void validate(DocumentNode document) {
    _validateDefinitionNames(document);

    for (final fragment
        in document.definitions.whereType<FragmentDefinitionNode>()) {
      _validateFragmentDefinition(fragment);
    }

    for (final operation
        in document.definitions.whereType<OperationDefinitionNode>()) {
      _validateOperation(operation);
    }
  }

  void _validateDefinitionNames(DocumentNode document) {
    final fragmentNames = <String, int>{};
    final operationNames = <String, int>{};

    for (final definition in document.definitions) {
      if (definition is FragmentDefinitionNode) {
        final name = definition.name.value;
        fragmentNames[name] = (fragmentNames[name] ?? 0) + 1;
      }

      if (definition is OperationDefinitionNode) {
        final nameNode = definition.name;
        if (nameNode == null) {
          throw StateError("Operations must be named");
        }
        final name = nameNode.value;
        operationNames[name] = (operationNames[name] ?? 0) + 1;
      }
    }

    for (final entry in fragmentNames.entries) {
      if (entry.value > 1) {
        throw StateError("Duplicate fragment definition ${entry.key}");
      }
    }

    for (final entry in operationNames.entries) {
      if (entry.value > 1) {
        throw StateError("Duplicate operation definition ${entry.key}");
      }
    }
  }

  void _validateFragmentDefinition(FragmentDefinitionNode fragment) {
    final typeName = fragment.typeCondition.on.name.value;
    final typeDef = _requireTypeDefinition(typeName);
    if (!_isCompositeType(typeDef)) {
      throw StateError("Type condition $typeName is not a composite type");
    }

    _validateDirectives(
      fragment.directives,
      DirectiveLocation.fragmentDefinition,
      context: null,
    );

    final context = ValidationContext(
      operationName: "<fragment>",
      variableDefinitions: const {},
      usedVariables: <String>{},
      allowUndefinedVariables: true,
    );
    _validateSelectionSet(
      fragment.selectionSet,
      typeName,
      context,
      fragmentStack: {fragment.name.value},
    );
  }

  void _validateOperation(OperationDefinitionNode operation) {
    final name = operation.name?.value;
    if (name == null) {
      throw StateError("Operations must be named");
    }

    final variables = <String, VariableDefinitionNode>{};
    for (final definition in operation.variableDefinitions) {
      final varName = definition.variable.name.value;
      if (variables.containsKey(varName)) {
        throw StateError(
          "Duplicate variable definition $varName in operation $name",
        );
      }
      variables[varName] = definition;
      _validateVariableDefinition(definition);
    }

    final context = ValidationContext(
      operationName: name,
      variableDefinitions: variables,
      usedVariables: <String>{},
      allowUndefinedVariables: false,
    );

    _validateDirectives(
      operation.directives,
      _operationDirectiveLocation(operation.type),
      context: context,
    );

    final rootTypeName = schema.determineOperationTypeName(operation.type);
    _validateSelectionSet(
      operation.selectionSet,
      rootTypeName,
      context,
      fragmentStack: const {},
    );

    final unused = variables.keys
        .where((name) => !context.usedVariables.contains(name))
        .toList();
    if (unused.isNotEmpty) {
      throw StateError(
        "Variable ${unused.first} is defined but not used in operation $name",
      );
    }
  }

  void _validateVariableDefinition(VariableDefinitionNode definition) {
    final typeName = unwrapNamedTypeName(definition.type);
    if (typeName == null) {
      throw StateError(
        "Variable ${definition.variable.name.value} has invalid type",
      );
    }

    final typeDef = schema.lookupType(NameNode(value: typeName));
    if (typeDef == null || !_isInputType(typeDef)) {
      throw StateError(
        "Variable ${definition.variable.name.value} has non-input type $typeName",
      );
    }
  }

  void _validateSelectionSet(
    SelectionSetNode selectionSet,
    String parentTypeName,
    ValidationContext context, {
    required Set<String> fragmentStack,
  }) {
    final parentType = _requireTypeDefinition(parentTypeName);
    if (!_isCompositeType(parentType)) {
      throw StateError(
        "Selection set cannot be applied to non-composite type $parentTypeName",
      );
    }

    for (final selection in selectionSet.selections) {
      if (selection is FieldNode) {
        _validateField(selection, parentType, context, fragmentStack);
      } else if (selection is InlineFragmentNode) {
        _validateInlineFragment(
          selection,
          parentTypeName,
          context,
          fragmentStack,
        );
      } else if (selection is FragmentSpreadNode) {
        _validateFragmentSpread(
          selection,
          parentTypeName,
          context,
          fragmentStack,
        );
      }
    }
  }

  void _validateField(
    FieldNode field,
    TypeDefinitionNode parentType,
    ValidationContext context,
    Set<String> fragmentStack,
  ) {
    final fieldDefinition =
        schema.lookupFieldDefinitionNode(parentType, field.name);
    if (fieldDefinition == null) {
      throw StateError(
        "Failed to find type for field ${field.name.value} on ${parentType.name.value}",
      );
    }

    final fieldTypeDef =
        schema.lookupTypeDefinitionFromTypeNode(fieldDefinition.type);
    if (fieldTypeDef == null) {
      throw StateError(
        "Missing type definition for field ${field.name.value}",
      );
    }

    final isComposite = _isCompositeType(fieldTypeDef);
    if (field.selectionSet == null && isComposite) {
      throw StateError(
        "Field ${field.name.value} of type ${fieldTypeDef.name.value} must have a selection set",
      );
    }
    if (field.selectionSet != null && !isComposite) {
      throw StateError(
        "Field ${field.name.value} of type ${fieldTypeDef.name.value} must not have a selection set",
      );
    }

    _validateArguments(
      field.arguments,
      fieldDefinition.args,
      "field ${field.name.value}",
      context,
    );
    _validateDirectives(
      field.directives,
      DirectiveLocation.field,
      context: context,
    );

    if (field.selectionSet != null) {
      _validateSelectionSet(
        field.selectionSet!,
        fieldTypeDef.name.value,
        context,
        fragmentStack: fragmentStack,
      );
    }
  }

  void _validateInlineFragment(
    InlineFragmentNode fragment,
    String parentTypeName,
    ValidationContext context,
    Set<String> fragmentStack,
  ) {
    final typeConditionName =
        fragment.typeCondition?.on.name.value ?? parentTypeName;
    final typeDef = _requireTypeDefinition(typeConditionName);
    if (!_isCompositeType(typeDef)) {
      throw StateError(
        "Type condition $typeConditionName is not a composite type",
      );
    }

    _assertTypeConditionApplicable(parentTypeName, typeConditionName);

    _validateDirectives(
      fragment.directives,
      DirectiveLocation.inlineFragment,
      context: context,
    );

    _validateSelectionSet(
      fragment.selectionSet,
      typeConditionName,
      context,
      fragmentStack: fragmentStack,
    );
  }

  void _validateFragmentSpread(
    FragmentSpreadNode spread,
    String parentTypeName,
    ValidationContext context,
    Set<String> fragmentStack,
  ) {
    _validateDirectives(
      spread.directives,
      DirectiveLocation.fragmentSpread,
      context: context,
    );

    final name = spread.name.value;
    if (fragmentStack.contains(name)) {
      throw StateError("Fragment spread cycle detected at $name");
    }

    final fragment = documentIndex.fragments[name];
    if (fragment == null) {
      throw StateError("Missing fragment definition for $name");
    }

    final fragmentTypeName = fragment.typeCondition.on.name.value;
    final fragmentTypeDef = _requireTypeDefinition(fragmentTypeName);
    if (!_isCompositeType(fragmentTypeDef)) {
      throw StateError(
        "Type condition $fragmentTypeName is not a composite type",
      );
    }

    _assertTypeConditionApplicable(parentTypeName, fragmentTypeName);

    _validateSelectionSet(
      fragment.selectionSet,
      fragmentTypeName,
      context,
      fragmentStack: {...fragmentStack, name},
    );
  }

  void _validateArguments(
    List<ArgumentNode> arguments,
    List<InputValueDefinitionNode> definitions,
    String contextName,
    ValidationContext context,
  ) {
    final defsByName = <String, InputValueDefinitionNode>{
      for (final def in definitions) def.name.value: def,
    };
    final providedNames = <String>{};

    for (final argument in arguments) {
      final argName = argument.name.value;
      if (!defsByName.containsKey(argName)) {
        throw StateError(
          "Unknown argument $argName on $contextName",
        );
      }
      if (!providedNames.add(argName)) {
        throw StateError(
          "Duplicate argument $argName on $contextName",
        );
      }

      final expectedType = defsByName[argName]!.type;
      _validateValue(
        argument.value,
        expectedType,
        context,
        "argument $argName on $contextName",
      );
    }

    for (final definition in definitions) {
      final isRequired =
          definition.type.isNonNull && definition.defaultValue == null;
      if (isRequired && !providedNames.contains(definition.name.value)) {
        throw StateError(
          "Missing required argument ${definition.name.value} on $contextName",
        );
      }
    }
  }

  void _validateDirectives(
    List<DirectiveNode> directives,
    DirectiveLocation location, {
    required ValidationContext? context,
  }) {
    for (final directive in directives) {
      final name = directive.name.value;
      final definition = directiveDefinitions[name];
      if (definition == null) {
        throw StateError("Unknown directive @$name");
      }

      if (!definition.locations.contains(location)) {
        throw StateError(
          "Directive @$name cannot be used on ${_directiveLocationName(location)}",
        );
      }

      _validateArguments(
        directive.arguments,
        definition.args,
        "directive @$name",
        context ?? ValidationContext.empty(),
      );
    }
  }

  void _validateValue(
    ValueNode value,
    TypeNode expectedType,
    ValidationContext context,
    String contextName,
  ) {
    if (value is VariableNode) {
      _validateVariableUsage(value, expectedType, context);
      return;
    }

    if (value is NullValueNode) {
      if (expectedType.isNonNull) {
        throw StateError(
          "Invalid value for $contextName: expected ${_typeString(expectedType)}",
        );
      }
      return;
    }

    if (expectedType.isNonNull) {
      _validateValue(
          value, _withNonNullFalse(expectedType), context, contextName);
      return;
    }

    if (expectedType is ListTypeNode) {
      if (value is ListValueNode) {
        for (final entry in value.values) {
          _validateValue(entry, expectedType.type, context, contextName);
        }
        return;
      }
      _validateValue(value, expectedType.type, context, contextName);
      return;
    }

    if (expectedType is NamedTypeNode) {
      final typeDef = schema.lookupType(expectedType.name);
      if (typeDef == null) {
        throw StateError(
          "Missing type definition for ${expectedType.name.value}",
        );
      }

      if (typeDef is InputObjectTypeDefinitionNode) {
        if (value is! ObjectValueNode) {
          throw StateError(
            "Invalid value for $contextName: expected ${expectedType.name.value}",
          );
        }
        _validateInputObjectValue(value, typeDef, context);
        return;
      }

      if (typeDef is EnumTypeDefinitionNode) {
        if (value is! EnumValueNode) {
          throw StateError(
            "Invalid value for $contextName: expected ${expectedType.name.value}",
          );
        }
        final allowedValues = schema
            .lookupEnumValueDefinitions(typeDef)
            .map((entry) => entry.name.value)
            .toSet();
        if (!allowedValues.contains(value.name.value)) {
          throw StateError(
            "Invalid value for $contextName: expected ${expectedType.name.value}",
          );
        }
        return;
      }

      if (typeDef is ScalarTypeDefinitionNode) {
        if (!_isScalarLiteralCompatible(typeDef.name.value, value)) {
          throw StateError(
            "Invalid value for $contextName: expected ${expectedType.name.value}",
          );
        }
        return;
      }
    }
  }

  void _validateInputObjectValue(
    ObjectValueNode value,
    InputObjectTypeDefinitionNode typeDef,
    ValidationContext context,
  ) {
    final fieldsByName = <String, InputValueDefinitionNode>{
      for (final field in schema.lookupInputValueDefinitions(typeDef))
        field.name.value: field,
    };
    final providedNames = <String>{};

    for (final field in value.fields) {
      final fieldName = field.name.value;
      final fieldDef = fieldsByName[fieldName];
      if (fieldDef == null) {
        throw StateError(
          "Unknown field $fieldName on input ${typeDef.name.value}",
        );
      }
      if (!providedNames.add(fieldName)) {
        throw StateError(
          "Duplicate field $fieldName on input ${typeDef.name.value}",
        );
      }
      _validateValue(
        field.value,
        fieldDef.type,
        context,
        "input field $fieldName on ${typeDef.name.value}",
      );
    }

    for (final field in fieldsByName.values) {
      final isRequired = field.type.isNonNull && field.defaultValue == null;
      if (isRequired && !providedNames.contains(field.name.value)) {
        throw StateError(
          "Missing required field ${field.name.value} on input ${typeDef.name.value}",
        );
      }
    }
  }

  void _validateVariableUsage(
    VariableNode variable,
    TypeNode expectedType,
    ValidationContext context,
  ) {
    final variableName = variable.name.value;
    context.usedVariables.add(variableName);

    final definition = context.variableDefinitions[variableName];
    if (definition == null) {
      if (context.allowUndefinedVariables) {
        return;
      }
      throw StateError(
        "Variable $variableName is used but not defined in operation ${context.operationName}",
      );
    }

    if (!_isSubtype(definition.type, expectedType)) {
      throw StateError(
        "Variable $variableName is not compatible with expected type ${_typeString(expectedType)}",
      );
    }
  }

  void _assertTypeConditionApplicable(
    String parentTypeName,
    String typeConditionName,
  ) {
    final parentPossible = _possibleTypesFor(parentTypeName);
    final conditionPossible = _possibleTypesFor(typeConditionName);
    if (parentPossible.isEmpty || conditionPossible.isEmpty) {
      throw StateError(
        "Type condition $typeConditionName is not applicable to $parentTypeName",
      );
    }
    final intersection = parentPossible.intersection(conditionPossible);
    if (intersection.isEmpty) {
      throw StateError(
        "Type condition $typeConditionName is not applicable to $parentTypeName",
      );
    }
  }

  Set<String> _possibleTypesFor(String typeName) {
    final typeDef = schema.lookupType(NameNode(value: typeName));
    if (typeDef is ObjectTypeDefinitionNode) {
      return {typeName};
    }
    return schema.possibleTypesMap()[typeName] ?? {};
  }

  TypeDefinitionNode _requireTypeDefinition(String typeName) {
    final typeDef = schema.lookupType(NameNode(value: typeName));
    if (typeDef == null) {
      throw StateError("Missing type definition for $typeName");
    }
    return typeDef;
  }

  bool _isCompositeType(TypeDefinitionNode typeDef) =>
      typeDef is ObjectTypeDefinitionNode ||
      typeDef is InterfaceTypeDefinitionNode ||
      typeDef is UnionTypeDefinitionNode;

  bool _isInputType(TypeDefinitionNode typeDef) =>
      typeDef is InputObjectTypeDefinitionNode ||
      typeDef is EnumTypeDefinitionNode ||
      typeDef is ScalarTypeDefinitionNode;

  bool _isScalarLiteralCompatible(String typeName, ValueNode value) {
    if (typeName == "Int") return value is IntValueNode;
    if (typeName == "Float") {
      return value is FloatValueNode || value is IntValueNode;
    }
    if (typeName == "String") return value is StringValueNode;
    if (typeName == "Boolean") return value is BooleanValueNode;
    if (typeName == "ID") {
      return value is StringValueNode || value is IntValueNode;
    }
    return true;
  }

  bool _isSubtype(TypeNode variableType, TypeNode expectedType) {
    if (expectedType.isNonNull) {
      if (!variableType.isNonNull) return false;
      return _isSubtype(
        _withNonNullFalse(variableType),
        _withNonNullFalse(expectedType),
      );
    }

    if (variableType.isNonNull) {
      return _isSubtype(_withNonNullFalse(variableType), expectedType);
    }

    if (variableType is ListTypeNode && expectedType is ListTypeNode) {
      return _isSubtype(variableType.type, expectedType.type);
    }

    if (variableType is NamedTypeNode && expectedType is NamedTypeNode) {
      return variableType.name.value == expectedType.name.value;
    }

    return false;
  }

  TypeNode _withNonNullFalse(TypeNode node) {
    if (node is NamedTypeNode) {
      return NamedTypeNode(name: node.name, isNonNull: false);
    }
    if (node is ListTypeNode) {
      return ListTypeNode(type: node.type, isNonNull: false);
    }
    throw StateError("Invalid type node");
  }

  String _typeString(TypeNode node) => printNode(node);

  static Map<String, DirectiveDefinitionNode> _buildDirectiveDefinitions(
    SchemaIndex schema,
  ) {
    final definitions = <String, DirectiveDefinitionNode>{};

    for (final definition in schema.document.definitions) {
      if (definition is DirectiveDefinitionNode) {
        definitions[definition.name.value] = definition;
      }
    }

    for (final builtIn in _builtInDirectives) {
      definitions.putIfAbsent(builtIn.name.value, () => builtIn);
    }

    return definitions;
  }

  static final List<DirectiveDefinitionNode> _builtInDirectives = [
    DirectiveDefinitionNode(
      name: NameNode(value: "skip"),
      args: [
        InputValueDefinitionNode(
          name: NameNode(value: "if"),
          type:
              NamedTypeNode(name: NameNode(value: "Boolean"), isNonNull: true),
        ),
      ],
      locations: const [
        DirectiveLocation.field,
        DirectiveLocation.fragmentSpread,
        DirectiveLocation.inlineFragment,
      ],
      repeatable: false,
    ),
    DirectiveDefinitionNode(
      name: NameNode(value: "include"),
      args: [
        InputValueDefinitionNode(
          name: NameNode(value: "if"),
          type:
              NamedTypeNode(name: NameNode(value: "Boolean"), isNonNull: true),
        ),
      ],
      locations: const [
        DirectiveLocation.field,
        DirectiveLocation.fragmentSpread,
        DirectiveLocation.inlineFragment,
      ],
      repeatable: false,
    ),
  ];
}

class ValidationContext {
  final String operationName;
  final Map<String, VariableDefinitionNode> variableDefinitions;
  final Set<String> usedVariables;
  final bool allowUndefinedVariables;

  const ValidationContext({
    required this.operationName,
    required this.variableDefinitions,
    required this.usedVariables,
    required this.allowUndefinedVariables,
  });

  factory ValidationContext.empty() => const ValidationContext(
        operationName: "<unknown>",
        variableDefinitions: <String, VariableDefinitionNode>{},
        usedVariables: <String>{},
        allowUndefinedVariables: true,
      );
}

DirectiveLocation _operationDirectiveLocation(OperationType type) =>
    switch (type) {
      OperationType.query => DirectiveLocation.query,
      OperationType.mutation => DirectiveLocation.mutation,
      OperationType.subscription => DirectiveLocation.subscription,
    };

String _directiveLocationName(DirectiveLocation location) => switch (location) {
      DirectiveLocation.query => "QUERY",
      DirectiveLocation.mutation => "MUTATION",
      DirectiveLocation.subscription => "SUBSCRIPTION",
      DirectiveLocation.field => "FIELD",
      DirectiveLocation.fragmentDefinition => "FRAGMENT_DEFINITION",
      DirectiveLocation.fragmentSpread => "FRAGMENT_SPREAD",
      DirectiveLocation.inlineFragment => "INLINE_FRAGMENT",
      DirectiveLocation.variableDefinition => "VARIABLE_DEFINITION",
      DirectiveLocation.schema => "SCHEMA",
      DirectiveLocation.scalar => "SCALAR",
      DirectiveLocation.object => "OBJECT",
      DirectiveLocation.fieldDefinition => "FIELD_DEFINITION",
      DirectiveLocation.argumentDefinition => "ARGUMENT_DEFINITION",
      DirectiveLocation.interface => "INTERFACE",
      DirectiveLocation.union => "UNION",
      DirectiveLocation.enumDefinition => "ENUM",
      DirectiveLocation.enumValue => "ENUM_VALUE",
      DirectiveLocation.inputObject => "INPUT_OBJECT",
      DirectiveLocation.inputFieldDefinition => "INPUT_FIELD_DEFINITION",
    };
