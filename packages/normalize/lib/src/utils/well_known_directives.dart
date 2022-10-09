import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

/// returns true iff node has either
/// - a @skip directive with an if-argument that evaluates to true
/// - a @include directive with an if-argument that evaluates to false
bool isSkipped(FieldNode node, Map<String, dynamic> variables) {
  final directives = node.directives;

  if (directives.isEmpty) {
    return false;
  }

  final DirectiveNode? skipOrIncludeDirective;
  final bool isSkipDirective;

  final skipDirective = directives
      .firstWhereOrNull((directive) => directive.name.value == 'skip');
  if (skipDirective != null) {
    skipOrIncludeDirective = skipDirective;
    isSkipDirective = true;
  } else {
    final includeDirective = directives
        .firstWhereOrNull((directive) => directive.name.value == 'include');
    if (includeDirective != null) {
      skipOrIncludeDirective = includeDirective;
      isSkipDirective = false;
    } else {
      skipOrIncludeDirective = null;
      isSkipDirective = false;
    }
  }

  if (skipOrIncludeDirective == null) {
    return false;
  }

  final ifArgument = skipOrIncludeDirective.arguments
      .firstWhereOrNull((argument) => argument.name.value == 'if');

  if (ifArgument == null) {
    return false;
  }

  final ifValue = ifArgument.value;

  // argument to if: is boolean literal -> use that literal directly
  if (ifValue is BooleanValueNode) {
    return isSkipDirective ? ifValue.value : !ifValue.value;
  }
  // argument to if is a variable -> look up value of that variable in variables map
  if (ifValue is VariableNode) {
    final variableName = ifValue.name.value;
    final variableValue = variables[variableName];
    if (variableValue is bool) {
      return isSkipDirective ? variableValue : !variableValue;
    }

    /// TODO: throw error if variable is not a boolean?
  }

  /// TODO: throw error if ifValue is neither a boolean literal nor a variable?
  return false;
}
