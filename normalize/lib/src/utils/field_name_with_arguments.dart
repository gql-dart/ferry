import 'dart:convert';
import 'package:gql/ast.dart';

import '../options/type_policy.dart';

Object _resolveValueNode(
  ValueNode valueNode,
  Map<String, dynamic> variables,
) {
  if (valueNode is VariableNode)
    return variables[valueNode.name.value];
  else if (valueNode is ListValueNode)
    return valueNode.values
        .map((node) => _resolveValueNode(
              node,
              variables,
            ))
        .toList();
  else if (valueNode is ObjectValueNode) {
    return {
      for (var field in valueNode.fields)
        field.name.value: _resolveValueNode(
          field.value,
          variables,
        )
    };
  } else if (valueNode is IntValueNode)
    return valueNode.value;
  else if (valueNode is FloatValueNode)
    return valueNode.value;
  else if (valueNode is StringValueNode)
    return valueNode.value;
  else if (valueNode is BooleanValueNode)
    return valueNode.value;
  else if (valueNode is EnumValueNode)
    return valueNode.name.value;
  else
    return null;
}

String fieldNameWithArguments(
  FieldNode fieldNode,
  Map<String, dynamic> variables,
  TypePolicy typePolicy,
) {
  if (fieldNode.arguments.isEmpty) return fieldNode.name.value;
  final fieldPolicy = (typePolicy?.fields ?? const {})[fieldNode.name.value];
  final pertinentArguments = fieldPolicy == null
      ? fieldNode.arguments
      : fieldNode.arguments
          .where(
              (argument) => fieldPolicy.keyArgs.contains(argument.name.value))
          .toList();
  final orderedArguments = List.from(pertinentArguments)
    ..sort((a, b) => a.name.value.compareTo(b.name.value));
  final Map<String, dynamic> argumentsObject = {
    for (var argumentNode in orderedArguments)
      argumentNode.name.value: _resolveValueNode(
        argumentNode.value,
        variables,
      )
  };
  final hashedArgs = json.encode(argumentsObject);
  return '${fieldNode.name.value}($hashedArgs)';
}
