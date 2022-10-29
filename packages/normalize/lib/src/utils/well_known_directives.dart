import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

/// returns true iff node has either
/// - a @skip directive with an if-argument that evaluates to true
/// - a @include directive with an if-argument that evaluates to false
bool isSkipped(SelectionNode node, Map<String, dynamic> variables) {
  final directives = node.accept(_SelectionNodeDirectiveVisitor.instance);

  final skipOrIncludeDirective = directives?.firstWhereOrNull(
      (directive) => const {'skip', 'include'}.contains(directive.name.value));
  if (skipOrIncludeDirective == null) {
    return false;
  }
  final isSkipDirective = skipOrIncludeDirective.name.value == 'skip';

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
    return false;
  }
  final variableName = ifValue.name.value;
  final variableValue = variables[variableName];
  if (variableValue is! bool) {
    return false;
  }
  return isSkipDirective ? variableValue : !variableValue;
}

class _SelectionNodeDirectiveVisitor
    extends SimpleVisitor<List<DirectiveNode>?> {
  static final instance = _SelectionNodeDirectiveVisitor();

  @override
  List<DirectiveNode> visitFieldNode(FieldNode node) {
    return node.directives;
  }

  @override
  List<DirectiveNode> visitFragmentSpreadNode(FragmentSpreadNode node) {
    return node.directives;
  }

  @override
  List<DirectiveNode> visitInlineFragmentNode(InlineFragmentNode node) {
    return node.directives;
  }
}
