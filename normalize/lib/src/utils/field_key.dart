import 'dart:convert';
import 'package:gql/ast.dart';

import 'package:normalize/src/policies/field_policy.dart';

/// A utility class for stringifying a field plus variables.
///
/// If the given [FieldPolicy] includes [FieldPolicy.keyArgs], only those
/// arguments will be used to construct the key. If no [FieldPolicy.keyArgs]
/// are defined, all arguments will be included.
class FieldKey {
  final String fieldName;
  final Map<String, dynamic> args;

  FieldKey(
    FieldNode fieldNode,
    Map<String, dynamic> variables,
    FieldPolicy fieldPolicy,
  )   : fieldName = fieldNode.name.value,
        args = _initArgs(fieldNode, variables, fieldPolicy);

  FieldKey._(this.fieldName, this.args);

  static Map<String, dynamic> _initArgs(
    FieldNode fieldNode,
    Map<String, dynamic> variables,
    FieldPolicy fieldPolicy,
  ) {
    final pertinentArguments = fieldPolicy == null
        ? fieldNode.arguments
        : fieldNode.arguments
            .where(
                (argument) => fieldPolicy.keyArgs.contains(argument.name.value))
            .toList();
    final orderedArguments = List<ArgumentNode>.from(pertinentArguments)
      ..sort((a, b) => a.name.value.compareTo(b.name.value));
    return argsWithValues(variables, orderedArguments);
  }

  @override
  bool operator ==(o) => o.toString() == toString();

  @override
  int get hashCode => toString().hashCode;

  /// Generates a stringified key from the field's name and any arguments.
  @override
  String toString() =>
      args.isEmpty ? fieldName : '$fieldName(${json.encode(args)})';

  static FieldKey parse(String stringified) {
    final openingIndex = stringified.indexOf('(');
    final closingIndex = stringified.lastIndexOf(')');
    final name = openingIndex == -1
        ? stringified
        : stringified.substring(0, openingIndex);
    final Map<String, dynamic> args = openingIndex == -1
        ? {}
        : json.decode(stringified.substring(openingIndex + 1, closingIndex));
    return FieldKey._(name, args);
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
    return int.parse(valueNode.value);
  } else if (valueNode is FloatValueNode) {
    return double.parse(valueNode.value);
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
