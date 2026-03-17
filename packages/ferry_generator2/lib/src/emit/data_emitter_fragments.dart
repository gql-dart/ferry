import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "data_emitter_classes.dart";
import "data_emitter_context.dart";
import "data_emitter_fields.dart";
import "data_emitter_types.dart";
import "../ir/model.dart";
import "../ir/names.dart";
import "../ir/types.dart";
import "../utils/naming.dart";
import "../utils/docs.dart";

void indexFragments({required DataEmitterContext ctx}) {
  for (final fragment in ctx.document.fragments.values) {
    final resolved = fragment.selection;
    ctx.fragmentInfo[fragment.name] = FragmentInfo(
      name: fragment.name,
      typeCondition: fragment.typeCondition,
      selectionSet: resolved,
      inlineTypes: resolved.inlineFragments.keys.toSet(),
    );
    _indexFragmentInterfaceSelections(
      ctx: ctx,
      fragmentName: fragment.name,
      selectionSet: resolved,
    );
  }
}

({List<Spec> specs, DataEmitterContext ctx}) buildFragmentInterfaces({
  required DataEmitterContext ctx,
  required FragmentDefinitionNode fragment,
}) {
  final fragmentName = FragmentName(fragment.name.value);
  final info = ctx.fragmentInfo[fragmentName];
  if (info == null) return (specs: const <Spec>[], ctx: ctx);

  final specs = <Spec>[];
  final baseKey = fragmentName.value;
  specs.add(
    _buildFragmentInterfaceClass(
      ctx: ctx,
      interfaceKey: baseKey,
      selectionSet: info.selectionSet,
      implementsRefs: const [],
    ),
  );
  specs.addAll(
    _buildFragmentNestedInterfaces(
      ctx: ctx,
      interfaceKey: baseKey,
      selectionSet: info.selectionSet,
    ),
  );

  for (final entry in info.selectionSet.inlineFragments.entries) {
    final typeName = entry.key.value;
    final inlineKey = "${fragmentName.value}__as$typeName";
    specs.add(
      _buildFragmentInterfaceClass(
        ctx: ctx,
        interfaceKey: inlineKey,
        selectionSet: entry.value,
        implementsRefs: [refer(builtClassName(fragmentName.value))],
      ),
    );
    specs.addAll(
      _buildFragmentNestedInterfaces(
        ctx: ctx,
        interfaceKey: inlineKey,
        selectionSet: entry.value,
      ),
    );
  }

  return (specs: specs, ctx: ctx);
}

({List<Spec> specs, DataEmitterContext ctx}) buildFragmentData({
  required DataEmitterContext ctx,
  required FragmentDefinitionNode fragment,
}) {
  final fragmentName = FragmentName(fragment.name.value);
  final resolved = ctx.fragmentInfo[fragmentName]?.selectionSet;
  if (resolved == null) return (specs: const <Spec>[], ctx: ctx);

  final baseName = "${fragmentName.value}Data";
  final specs = buildSelectionSetClasses(
    ctx: ctx,
    baseName: baseName,
    selectionSet: resolved,
    classImplements: [
      refer(builtClassName(fragmentName.value)),
    ],
    fragmentName: fragmentName.value,
  );

  return (specs: specs, ctx: ctx);
}

void _indexFragmentInterfaceSelections({
  required DataEmitterContext ctx,
  required FragmentName fragmentName,
  required SelectionSetIR selectionSet,
}) {
  _registerInterfaceSelection(
    ctx: ctx,
    fragmentName: fragmentName,
    interfaceKey: fragmentName.value,
    selectionSet: selectionSet,
  );
  for (final entry in selectionSet.inlineFragments.entries) {
    _registerInterfaceSelection(
      ctx: ctx,
      fragmentName: fragmentName,
      interfaceKey: "${fragmentName.value}__as${entry.key.value}",
      selectionSet: entry.value,
    );
  }
}

void _registerInterfaceSelection({
  required DataEmitterContext ctx,
  required FragmentName fragmentName,
  required String interfaceKey,
  required SelectionSetIR selectionSet,
}) {
  if (ctx.fragmentInterfaceSelections.containsKey(interfaceKey)) {
    return;
  }
  ctx.fragmentInterfaceSelections[interfaceKey] = selectionSet;
  ctx.interfaceKeyToFragmentName[interfaceKey] = fragmentName;

  for (final field in selectionSet.fields.values) {
    if (field.selectionSet == null) continue;
    if (ctx.config.dataClassConfig.reuseFragments &&
        field.selectionSet?.reuseFragment != null) {
      continue;
    }
    final nestedKey = "${interfaceKey}_${field.responseKey.value}";
    _registerInterfaceSelection(
      ctx: ctx,
      fragmentName: fragmentName,
      interfaceKey: nestedKey,
      selectionSet: field.selectionSet!,
    );
  }
}

Class _buildFragmentInterfaceClass({
  required DataEmitterContext ctx,
  required String interfaceKey,
  required SelectionSetIR selectionSet,
  required List<Reference> implementsRefs,
}) {
  final fieldsList = _buildFragmentInterfaceFieldSpecs(
    ctx: ctx,
    interfaceKey: interfaceKey,
    selectionSet: selectionSet,
  );

  return Class(
    (b) => b
      ..abstract = true
      ..name = builtClassName(interfaceKey)
      ..docs.addAll(ctx.docsForType(selectionSet.parentTypeName))
      ..implements.addAll(implementsRefs)
      ..methods.addAll(
        fieldsList.map(
          (field) => _buildGetter(field, isOverride: false),
        ),
      ),
  );
}

List<Spec> _buildFragmentNestedInterfaces({
  required DataEmitterContext ctx,
  required String interfaceKey,
  required SelectionSetIR selectionSet,
}) {
  final specs = <Spec>[];
  for (final field in selectionSet.fields.values) {
    if (field.selectionSet == null) continue;
    if (ctx.config.dataClassConfig.reuseFragments &&
        field.selectionSet?.reuseFragment != null) {
      continue;
    }
    final nestedKey = "${interfaceKey}_${field.responseKey.value}";
    if (ctx.generatedInterfaces.add(nestedKey)) {
      specs.add(
        _buildFragmentInterfaceClass(
          ctx: ctx,
          interfaceKey: nestedKey,
          selectionSet: field.selectionSet!,
          implementsRefs: const [],
        ),
      );
    }
    specs.addAll(
      _buildFragmentNestedInterfaces(
        ctx: ctx,
        interfaceKey: nestedKey,
        selectionSet: field.selectionSet!,
      ),
    );
  }
  return specs;
}

List<FieldSpec> _buildFragmentInterfaceFieldSpecs({
  required DataEmitterContext ctx,
  required String interfaceKey,
  required SelectionSetIR selectionSet,
}) {
  final fieldsList = <FieldSpec>[];
  for (final selection in selectionSet.fields.values) {
    final fieldName = selection.responseKey.value;
    final propertyName = identifier(fieldName);
    final namedTypeName = selection.namedType.name.value;
    final namedTypeKind = selection.namedType.kind;

    final fragmentName = ctx.config.dataClassConfig.reuseFragments
        ? selection.selectionSet?.reuseFragment
        : null;
    Reference namedTypeRef;

    if (fragmentName != null) {
      namedTypeRef = fragmentInterfaceReference(
        ctx: ctx,
        fragmentName: fragmentName,
      );
    } else if (selection.selectionSet != null) {
      namedTypeRef = Reference(
        builtClassName("${interfaceKey}_$fieldName"),
      );
    } else if (namedTypeKind == GraphQLTypeKind.enumType ||
        namedTypeKind == GraphQLTypeKind.inputObject) {
      namedTypeRef = Reference(
        builtClassName(namedTypeName),
        "#schema",
      );
    } else if (namedTypeKind == GraphQLTypeKind.scalar) {
      namedTypeRef = scalarReference(ctx: ctx, typeName: namedTypeName);
    } else {
      namedTypeRef = refer("Object");
    }

    final typeRef = typeReferenceForTypeNode(
      selection.typeNode,
      namedTypeRef,
    );
    final description = ctx.fieldDescription(
      parentTypeName: selectionSet.parentTypeName,
      fieldName: selection.fieldName,
      isSynthetic: selection.isSynthetic,
    );

    fieldsList.add(
      FieldSpec(
        responseKey: fieldName,
        propertyName: propertyName,
        typeNode: selection.typeNode,
        namedType: selection.namedType,
        typeRef: typeRef,
        namedTypeRef: namedTypeRef,
        selectionSet: selection.selectionSet,
        description: description,
      ),
    );
  }
  return fieldsList;
}

Method _buildGetter(FieldSpec field, {required bool isOverride}) {
  return Method(
    (b) => b
      ..annotations.addAll(
        isOverride ? [refer("override")] : const <Expression>[],
      )
      ..docs.addAll(docLines(field.description))
      ..returns = field.typeRef
      ..type = MethodType.getter
      ..name = field.propertyName,
  );
}
