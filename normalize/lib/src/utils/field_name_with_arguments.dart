import 'dart:convert';
import 'package:gql/ast.dart';

import 'package:normalize/src/policies/field_policy.dart';

Object _resolveValueNode(
  ValueNode valueNode,
  Map<String, dynamic> variables,
) {
  if (valueNode is VariableNode) {
    return variables[valueNode.name.value];
  } else if (valueNode is ListValueNode) {
    return valueNode.values
        .map((node) => _resolveValueNode(
              node,
              variables,
            ))
        .toList();
  } else if (valueNode is ObjectValueNode) {
    return {
      for (var field in valueNode.fields)
        field.name.value: _resolveValueNode(
          field.value,
          variables,
        )
    };
  } else if (valueNode is IntValueNode) {
    return valueNode.value;
  } else if (valueNode is FloatValueNode) {
    return valueNode.value;
  } else if (valueNode is StringValueNode) {
    return valueNode.value;
  } else if (valueNode is BooleanValueNode) {
    return valueNode.value;
  } else if (valueNode is EnumValueNode) {
    return valueNode.name.value;
  } else {
    return null;
  }
}

Map<String, dynamic> argsWithValues(
  Map<String, dynamic> variables,
  List<ArgumentNode> arguments,
) =>
    {
      for (var argument in arguments)
        argument.name.value: _resolveValueNode(
          argument.value,
          variables,
        )
    };

String fieldNameWithArguments(
  FieldNode fieldNode,
  Map<String, dynamic> variables,
  FieldPolicy fieldPolicy,
) {
  if (fieldNode.arguments.isEmpty) return fieldNode.name.value;
  final pertinentArguments = fieldPolicy == null
      ? fieldNode.arguments
      : fieldNode.arguments
          .where(
              (argument) => fieldPolicy.keyArgs.contains(argument.name.value))
          .toList();
  final orderedArguments = List<ArgumentNode>.from(pertinentArguments)
    ..sort((a, b) => a.name.value.compareTo(b.name.value));
  final args = argsWithValues(variables, orderedArguments);
  final hashedArgs = json.encode(args);
  return '${fieldNode.name.value}($hashedArgs)';
}
