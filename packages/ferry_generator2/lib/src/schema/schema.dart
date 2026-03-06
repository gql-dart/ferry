import "package:gql/ast.dart";
import "package:gql/language.dart";

const defaultRootTypes = <OperationType, String>{
  OperationType.query: "Query",
  OperationType.mutation: "Mutation",
  OperationType.subscription: "Subscription",
};

const _introspectionFields = <FieldDefinitionNode>[
  FieldDefinitionNode(
    name: NameNode(value: "__typename"),
    type: NamedTypeNode(name: NameNode(value: "String"), isNonNull: true),
  ),
];

const _queryIntrospectionFields = <FieldDefinitionNode>[
  FieldDefinitionNode(
    name: NameNode(value: "__schema"),
    type: NamedTypeNode(name: NameNode(value: "__Schema"), isNonNull: true),
  ),
  FieldDefinitionNode(
    name: NameNode(value: "__type"),
    type: NamedTypeNode(name: NameNode(value: "__Type"), isNonNull: false),
    args: [
      InputValueDefinitionNode(
        name: NameNode(value: "name"),
        type: NamedTypeNode(name: NameNode(value: "String"), isNonNull: true),
      ),
    ],
  ),
];

final _builtInSchema = parseString("""
scalar Int
scalar String
scalar Float
scalar Boolean
scalar ID

type __Schema {
  description: String
  types: [__Type!]!
  queryType: __Type!
  mutationType: __Type
  subscriptionType: __Type
  directives: [__Directive!]!
}

type __Type {
  kind: __TypeKind!
  name: String
  description: String
  fields(includeDeprecated: Boolean = false): [__Field!]
  interfaces: [__Type!]
  possibleTypes: [__Type!]
  enumValues(includeDeprecated: Boolean = false): [__EnumValue!]
  inputFields: [__InputValue!]
  ofType: __Type
  specifiedByURL: String
}

enum __TypeKind {
  SCALAR
  OBJECT
  INTERFACE
  UNION
  ENUM
  INPUT_OBJECT
  LIST
  NON_NULL
}

type __Field {
  name: String!
  description: String
  args: [__InputValue!]!
  type: __Type!
  isDeprecated: Boolean!
  deprecationReason: String
}

type __InputValue {
  name: String!
  description: String
  type: __Type!
  defaultValue: String
}

type __EnumValue {
  name: String!
  description: String
  isDeprecated: Boolean!
  deprecationReason: String
}

type __Directive {
  name: String!
  description: String
  locations: [__DirectiveLocation!]!
  args: [__InputValue!]!
  isRepeatable: Boolean!
}

enum __DirectiveLocation {
  QUERY
  MUTATION
  SUBSCRIPTION
  FIELD
  FRAGMENT_DEFINITION
  FRAGMENT_SPREAD
  INLINE_FRAGMENT
  VARIABLE_DEFINITION
  SCHEMA
  SCALAR
  OBJECT
  FIELD_DEFINITION
  ARGUMENT_DEFINITION
  INTERFACE
  UNION
  ENUM
  ENUM_VALUE
  INPUT_OBJECT
  INPUT_FIELD_DEFINITION
}
""");

class SchemaIndex {
  final DocumentNode document;
  final Map<String, TypeDefinitionNode> _typeDefinitions;
  final Map<String, List<ObjectTypeExtensionNode>> _objectExtensions;
  final Map<String, List<InterfaceTypeExtensionNode>> _interfaceExtensions;
  final Map<String, List<InputObjectTypeExtensionNode>> _inputExtensions;
  final Map<String, List<EnumTypeExtensionNode>> _enumExtensions;
  final Map<String, List<UnionTypeExtensionNode>> _unionExtensions;

  final Map<String, Map<String, FieldDefinitionNode>> _fieldCache = {};
  final Map<String, Map<String, InputValueDefinitionNode>> _inputFieldCache =
      {};
  final Map<OperationType, TypeDefinitionNode?> _operationTypeCache = {};
  Map<String, Set<String>>? _possibleTypesCache;

  SchemaIndex._(
      this.document,
      this._typeDefinitions,
      this._objectExtensions,
      this._interfaceExtensions,
      this._inputExtensions,
      this._enumExtensions,
      this._unionExtensions);

  factory SchemaIndex.fromDocuments(Iterable<DocumentNode> documents) {
    final definitions = <DefinitionNode>[
      ...documents.expand((doc) => doc.definitions),
      ..._builtInSchema.definitions,
    ];
    final document = DocumentNode(definitions: definitions);
    final typeDefinitions = <String, TypeDefinitionNode>{};
    final objectExtensions = <String, List<ObjectTypeExtensionNode>>{};
    final interfaceExtensions = <String, List<InterfaceTypeExtensionNode>>{};
    final inputExtensions = <String, List<InputObjectTypeExtensionNode>>{};
    final enumExtensions = <String, List<EnumTypeExtensionNode>>{};
    final unionExtensions = <String, List<UnionTypeExtensionNode>>{};

    for (final def in definitions) {
      if (def is TypeDefinitionNode) {
        typeDefinitions.putIfAbsent(def.name.value, () => def);
      } else if (def is ObjectTypeExtensionNode) {
        objectExtensions.putIfAbsent(def.name.value, () => []).add(def);
      } else if (def is InterfaceTypeExtensionNode) {
        interfaceExtensions.putIfAbsent(def.name.value, () => []).add(def);
      } else if (def is InputObjectTypeExtensionNode) {
        inputExtensions.putIfAbsent(def.name.value, () => []).add(def);
      } else if (def is EnumTypeExtensionNode) {
        enumExtensions.putIfAbsent(def.name.value, () => []).add(def);
      } else if (def is UnionTypeExtensionNode) {
        unionExtensions.putIfAbsent(def.name.value, () => []).add(def);
      }
    }

    return SchemaIndex._(document, typeDefinitions, objectExtensions,
        interfaceExtensions, inputExtensions, enumExtensions, unionExtensions);
  }

  TypeDefinitionNode? lookupType(NameNode name) => _typeDefinitions[name.value];

  TType? lookupTypeAs<TType extends TypeDefinitionNode>(NameNode name) {
    final def = lookupType(name);
    if (def is TType) return def;
    return null;
  }

  TypeDefinitionNode? lookupOperationType(OperationType operationType) {
    if (_operationTypeCache.containsKey(operationType)) {
      return _operationTypeCache[operationType];
    }
    final opNode =
        document.definitions.expand<OperationTypeDefinitionNode?>((definition) {
      if (definition is SchemaDefinitionNode) {
        return definition.operationTypes;
      }
      if (definition is SchemaExtensionNode) {
        return definition.operationTypes;
      }
      return [];
    }).firstWhere(
      (element) => element != null && element.operation == operationType,
      orElse: () => null,
    );

    final typeName =
        opNode?.type.name ?? NameNode(value: defaultRootTypes[operationType]!);
    return _operationTypeCache[operationType] = lookupType(typeName);
  }

  String determineOperationTypeName(OperationType operationType) {
    return lookupOperationType(operationType)?.name.value ??
        defaultRootTypes[operationType]!;
  }

  Iterable<ObjectTypeDefinitionNode> lookupConcreteTypes(NameNode name) {
    final typeDefinition = lookupType(name);
    if (typeDefinition is ObjectTypeDefinitionNode) {
      return [typeDefinition];
    }
    final possibleTypes = possibleTypesMap()[name.value];
    if (possibleTypes == null || possibleTypes.isEmpty) return const [];
    return possibleTypes.map((typeName) {
      final def =
          lookupTypeAs<ObjectTypeDefinitionNode>(NameNode(value: typeName));
      if (def == null) {
        throw StateError("Missing type definition for $typeName");
      }
      return def;
    });
  }

  Map<String, Set<String>> possibleTypesMap() {
    final cached = _possibleTypesCache;
    if (cached != null) return cached;
    final possibleTypes = <String, Set<String>>{};

    // Build interface -> super-interfaces graph (includes extensions).
    final interfaceSupers = <String, Set<String>>{};
    for (final definition in document.definitions) {
      if (definition is InterfaceTypeDefinitionNode) {
        final name = definition.name.value;
        final supers = interfaceSupers[name] ?? <String>{};
        supers.addAll(definition.interfaces.map((t) => t.name.value));
        for (final ext in _interfaceExtensions[name] ?? const []) {
          supers.addAll(ext.interfaces.map((t) => t.name.value));
        }
        interfaceSupers[name] = supers;
      }
    }

    // Compute transitive super-interfaces for a given interface.
    final superCache = <String, Set<String>>{};
    Set<String> collectSupers(String interfaceName, Set<String> stack) {
      final cached = superCache[interfaceName];
      if (cached != null) return cached;
      if (stack.contains(interfaceName)) {
        throw StateError(
          "Interface inheritance cycle detected: ${[
            ...stack,
            interfaceName
          ].join(' -> ')}",
        );
      }
      final direct = interfaceSupers[interfaceName] ?? const <String>{};
      if (direct.isEmpty) {
        return superCache[interfaceName] = const <String>{};
      }
      final nextStack = {...stack, interfaceName};
      final result = <String>{...direct};
      for (final sup in direct) {
        result.addAll(collectSupers(sup, nextStack));
      }
      return superCache[interfaceName] = result;
    }

    // Populate interface possible-types from object implementations (includes object extensions).
    for (final definition in document.definitions) {
      if (definition is! ObjectTypeDefinitionNode) continue;

      final objectName = definition.name.value;
      final directInterfaces = <String>{
        ...definition.interfaces.map((t) => t.name.value),
        ...(_objectExtensions[objectName] ?? const [])
            .expand((ext) => ext.interfaces.map((t) => t.name.value)),
      };

      final allInterfaces = <String>{};
      for (final iface in directInterfaces) {
        allInterfaces.add(iface);
        allInterfaces.addAll(collectSupers(iface, const <String>{}));
      }

      for (final iface in allInterfaces) {
        final types = possibleTypes[iface] ?? <String>{};
        types.add(objectName);
        possibleTypes[iface] = types;
      }
    }

    // Populate union possible-types (includes union extensions).
    final unionNames = <String>{
      ...document.definitions
          .whereType<UnionTypeDefinitionNode>()
          .map((d) => d.name.value),
      ..._unionExtensions.keys,
    };
    for (final unionName in unionNames) {
      final unionDef =
          lookupTypeAs<UnionTypeDefinitionNode>(NameNode(value: unionName));
      final unionExtensions = _unionExtensions[unionName] ?? const [];
      final members = <String>{
        ...?unionDef?.types.map((t) => t.name.value),
        ...unionExtensions.expand((ext) => ext.types.map((t) => t.name.value)),
      };

      if (members.isEmpty) continue;

      final types = possibleTypes[unionName] ?? <String>{};
      for (final memberName in members) {
        final memberDef = lookupType(NameNode(value: memberName));
        if (memberDef is ObjectTypeDefinitionNode) {
          types.add(memberName);
          continue;
        }
        // Not expected per spec, but we can be permissive and expand.
        final expanded = possibleTypes[memberName];
        if (expanded != null) {
          types.addAll(expanded);
        }
      }
      possibleTypes[unionName] = types;
    }

    return _possibleTypesCache = possibleTypes;
  }

  FieldDefinitionNode? lookupFieldDefinitionNode(
    TypeDefinitionNode onType,
    NameNode field,
  ) {
    if (onType is UnionTypeDefinitionNode) {
      if (field.value == "__typename") {
        return _introspectionFields.first;
      }
      return null;
    }
    return _lookupFieldDefinitionsForTypeDefinitionNode(onType)[field.value];
  }

  TypeNode? lookupTypeNodeFromField(
    TypeDefinitionNode onType,
    NameNode field,
  ) {
    return lookupFieldDefinitionNode(onType, field)?.type;
  }

  TypeNode? lookupTypeNodeForArgument(
    TypeDefinitionNode onType,
    NameNode field,
    ArgumentNode argument,
  ) {
    final fieldDefinition = lookupFieldDefinitionNode(onType, field);
    if (fieldDefinition == null) {
      return null;
    }
    return fieldDefinition.args
        .whereType<InputValueDefinitionNode?>()
        .firstWhere(
          (element) => element?.name.value == argument.name.value,
          orElse: () => null,
        )
        ?.type;
  }

  TypeDefinitionNode? lookupTypeDefinitionFromTypeNode(TypeNode node) {
    if (node is ListTypeNode) {
      return lookupTypeDefinitionFromTypeNode(node.type);
    }
    if (node is NamedTypeNode) {
      return lookupType(node.name);
    }
    throw StateError("Invalid node type");
  }

  List<EnumValueDefinitionNode> lookupEnumValueDefinitions(
    EnumTypeDefinitionNode node,
  ) {
    final enumExtensions = _enumExtensions[node.name.value] ?? [];
    return [
      ...node.values,
      ...enumExtensions.expand((extension) => extension.values),
    ];
  }

  InputValueDefinitionNode? lookupInputFieldDefinition(
    InputObjectTypeDefinitionNode node,
    NameNode field,
  ) =>
      _lookupInputFieldDefinitionsForTypeDefinitionNode(node)[field.value];

  List<InputValueDefinitionNode> lookupInputValueDefinitions(
    InputObjectTypeDefinitionNode node,
  ) =>
      _lookupInputFieldDefinitionsForTypeDefinitionNode(node).values.toList();

  Map<String, FieldDefinitionNode> _lookupFieldDefinitionsForTypeDefinitionNode(
    TypeDefinitionNode onType,
  ) {
    if (_fieldCache.containsKey(onType.name.value)) {
      return _fieldCache[onType.name.value] ?? {};
    }
    if (onType is! ObjectTypeDefinitionNode &&
        onType is! InterfaceTypeDefinitionNode &&
        onType is! UnionTypeDefinitionNode) {
      return _fieldCache[onType.name.value] = {};
    }

    final fields = <FieldDefinitionNode>[
      if (onType is ObjectTypeDefinitionNode)
        ..._listObjectTypeDefinitionFields(onType),
      if (onType is InterfaceTypeDefinitionNode)
        ..._listInterfaceTypeDefinitionFields(onType),
      if (onType == lookupOperationType(OperationType.query))
        ..._queryIntrospectionFields,
      ..._introspectionFields,
    ];

    final fieldMap =
        Map.fromEntries(fields.map((e) => MapEntry(e.name.value, e)));
    _fieldCache[onType.name.value] = fieldMap;
    return fieldMap;
  }

  Map<String, InputValueDefinitionNode>
      _lookupInputFieldDefinitionsForTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) {
    if (_inputFieldCache.containsKey(node.name.value)) {
      return _inputFieldCache[node.name.value] ?? {};
    }
    final fields = <InputValueDefinitionNode>[
      ...node.fields,
      ...(_inputExtensions[node.name.value] ?? [])
          .expand((extension) => extension.fields),
    ];
    final fieldMap =
        Map.fromEntries(fields.map((e) => MapEntry(e.name.value, e)));
    _inputFieldCache[node.name.value] = fieldMap;
    return fieldMap;
  }

  List<FieldDefinitionNode> _listObjectTypeDefinitionFields(
    ObjectTypeDefinitionNode node,
  ) {
    return [
      ...node.fields,
      ...(_objectExtensions[node.name.value] ?? [])
          .expand((extension) => extension.fields),
    ];
  }

  List<FieldDefinitionNode> _listInterfaceTypeDefinitionFields(
    InterfaceTypeDefinitionNode node,
  ) {
    return [
      ...node.fields,
      ...(_interfaceExtensions[node.name.value] ?? [])
          .expand((extension) => extension.fields),
    ];
  }
}
