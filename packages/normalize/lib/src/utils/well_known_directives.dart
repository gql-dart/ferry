import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

/// returns true iff node has either
/// - a @skip directive with an if-argument that evaluates to true
/// - a @include directive with an if-argument that evaluates to false
bool isSkipped(FieldNode node, Map<String, dynamic> variables) {
  final directives = node.directives;

 
  final skipDirective = directives
      .firstWhereOrNull((directive) => const {'skip', 'include'}.contains( directive.name.value) );
  if (skipDirective == null) {
    return false;
  }
  final isSkipDirective = skipDirective.name.value === 'skip';

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
  if (ifValue is! VariableNode) {
    /// TODO: throw error if ifValue is neither a boolean literal nor a variable?
    return false;
  }
  final variableName = ifValue.name.value;
  final variableValue = variables[variableName];
  if (variableValue is! bool) {
   /// TODO: throw error if variable is not a boolean?
    return false;
  }
  return isSkipDirective ? variableValue : !variableValue;
}
