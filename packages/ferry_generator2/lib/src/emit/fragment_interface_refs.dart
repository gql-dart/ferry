import "package:code_builder/code_builder.dart";

import "data_emitter_context.dart";
import "../ir/names.dart";
import "../utils/naming.dart";

List<Reference> fragmentInterfaceRefs({
  required DataEmitterContext ctx,
  required Set<FragmentName> fragmentSpreads,
  required TypeName parentTypeName,
  required List<Reference> baseImplements,
}) {
  final refs = <Reference>[...baseImplements];
  final seen = <String>{
    for (final ref in baseImplements)
      if (ref.symbol != null) "${ref.symbol}|${ref.url ?? ''}",
  };

  final expanded = _expandFragmentSpreads(
    ctx: ctx,
    fragmentSpreads: fragmentSpreads,
  );

  for (final fragmentName in expanded) {
    final interfaceName = _fragmentInterfaceForType(
      ctx: ctx,
      fragmentName: fragmentName,
      typeName: parentTypeName,
    );
    final fragmentUrl = ctx.fragmentSourceUrls[fragmentName];
    if (fragmentUrl == null) continue;
    final url = "$fragmentUrl#data";
    final key = "$interfaceName|$url";
    if (!seen.add(key)) continue;
    refs.add(Reference(interfaceName, url));
  }

  return refs;
}

List<FragmentName> _expandFragmentSpreads({
  required DataEmitterContext ctx,
  required Set<FragmentName> fragmentSpreads,
}) {
  final ordered = <FragmentName>[];
  final seen = <FragmentName>{};

  void visit(FragmentName name) {
    if (!seen.add(name)) return;
    ordered.add(name);
    final info = ctx.fragmentInfo[name];
    if (info == null) return;
    for (final nested in info.selectionSet.unconditionalFragmentSpreads) {
      visit(nested);
    }
  }

  for (final name in fragmentSpreads) {
    visit(name);
  }

  return ordered;
}

String _fragmentInterfaceForType({
  required DataEmitterContext ctx,
  required FragmentName fragmentName,
  required TypeName typeName,
}) {
  final info = ctx.fragmentInfo[fragmentName];
  if (info == null) return builtClassName(fragmentName.value);
  if (info.inlineTypes.contains(typeName)) {
    return builtClassName(
      "${fragmentName.value}__as${typeName.value}",
    );
  }
  return builtClassName(fragmentName.value);
}
