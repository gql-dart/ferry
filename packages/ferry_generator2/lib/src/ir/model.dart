import "package:gql/ast.dart";

import "names.dart";
import "types.dart";

/// Top-level IR container for a document: operations + fragments.
final class DocumentIR {
  /// Operation definitions keyed by operation name.
  final Map<OperationName, OperationIR> operations;

  /// Fragment definitions keyed by fragment name.
  final Map<FragmentName, FragmentIR> fragments;

  const DocumentIR({
    required this.operations,
    required this.fragments,
  });
}

/// IR representation of a named operation.
final class OperationIR {
  /// Operation name as defined in the document.
  final OperationName name;

  /// GraphQL operation type (query/mutation/subscription).
  final OperationType type;

  /// Resolved root type name for this operation (schema query/mutation/etc.).
  final TypeName rootTypeName;

  /// Root selection set for the operation.
  final SelectionSetIR selection;

  /// Variables referenced by the operation.
  final List<VariableIR> variables;

  /// All fragments referenced by this operation (including nested spreads).
  final Set<FragmentName> usedFragments;

  const OperationIR({
    required this.name,
    required this.type,
    required this.rootTypeName,
    required this.selection,
    required this.variables,
    required this.usedFragments,
  });
}

/// IR representation of a named fragment definition.
final class FragmentIR {
  /// Fragment name as defined in the document.
  final FragmentName name;

  /// Type condition for the fragment.
  final TypeName typeCondition;

  /// Root selection set for the fragment.
  final SelectionSetIR selection;

  /// All fragments referenced by this fragment (including nested spreads).
  final Set<FragmentName> usedFragments;

  /// Inline fragment type conditions used under this fragment.
  final Set<TypeName> inlineTypes;

  /// Variables referenced by this fragment.
  final List<VariableIR> variables;

  const FragmentIR({
    required this.name,
    required this.typeCondition,
    required this.selection,
    required this.usedFragments,
    required this.inlineTypes,
    required this.variables,
  });
}

final class SelectionSetIR {
  /// GraphQL parent type name for this selection set (object/interface/union).
  final TypeName parentTypeName;

  /// Concrete field selections keyed by response key.
  final Map<ResponseKey, FieldIR> fields;

  /// Type-conditioned branches that cannot be merged into the base selection.
  ///
  /// Keys are concrete type names (e.g. "Human", "Droid") and values are the
  /// selections that apply only when __typename matches that type.
  final Map<TypeName, SelectionSetIR> inlineFragments;

  /// All fragment spreads referenced anywhere in this selection set.
  ///
  /// This is a dependency list and includes conditional spreads.
  final Set<FragmentName> fragmentSpreads;

  /// Fragment spreads that are unconditionally applied (no @skip/@include).
  ///
  /// This is used for interface typing: conditional spreads are excluded to
  /// avoid claiming fields that may not be present.
  final Set<FragmentName> unconditionalFragmentSpreads;

  /// Fragment reuse target when this selection set is just a fragment spread.
  ///
  /// This is set only when the source selection set contained a single fragment
  /// spread (plus optional __typename) and no other fields or inline fragments.
  final FragmentName? reuseFragment;

  const SelectionSetIR({
    required this.parentTypeName,
    required this.fields,
    required this.inlineFragments,
    required this.fragmentSpreads,
    required this.unconditionalFragmentSpreads,
    required this.reuseFragment,
  });
}

/// IR representation of a field selection.
final class FieldIR {
  /// Response key (alias or field name).
  final ResponseKey responseKey;

  /// Schema field name (not aliased).
  final FieldName fieldName;

  /// GraphQL type node for this field (with nullability applied).
  final TypeNode typeNode;

  /// Named type info for this field's base type.
  final NamedTypeInfo namedType;

  /// Nested selection set when this field returns an object/interface/union.
  final SelectionSetIR? selectionSet;

  /// True when this field was injected (e.g. __typename).
  final bool isSynthetic;

  const FieldIR({
    required this.responseKey,
    required this.fieldName,
    required this.typeNode,
    required this.namedType,
    required this.selectionSet,
    required this.isSynthetic,
  });
}

/// IR representation of a variable definition.
final class VariableIR {
  /// Variable name (without the $).
  final VariableName name;

  /// GraphQL type node for the variable.
  final TypeNode typeNode;

  /// Named type info for the variable's base type.
  final NamedTypeInfo namedType;

  const VariableIR({
    required this.name,
    required this.typeNode,
    required this.namedType,
  });
}
