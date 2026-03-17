import "package:gql/ast.dart";

import "../utils/naming.dart";

class DocumentSource {
  final String url;
  final DocumentNode document;
  final Set<DocumentSource> imports;

  const DocumentSource({
    required this.url,
    required this.document,
    this.imports = const {},
  });

  Iterable<DocumentSource> uniqueSources() sync* {
    yield* _walkUnique(<String>{});
  }

  Iterable<DocumentSource> _walkUnique(Set<String> visitedUrls) sync* {
    if (!visitedUrls.add(url)) return;
    yield this;
    final orderedImports = imports.toList()
      ..sort((left, right) => left.url.compareTo(right.url));
    for (final import in orderedImports) {
      yield* import._walkUnique(visitedUrls);
    }
  }

  DocumentNode get flatDocument => DocumentNode(
        definitions: <DefinitionNode>[
          for (final source in uniqueSources()) ...source.document.definitions,
        ],
      );

  Set<SourceRef> getRefs() => {
        for (final source in uniqueSources())
          ...source.document.definitions.map(
            (definition) => SourceRef(
              identifier(definitionName(definition)),
              source.url,
            ),
          ),
      };
}

class SourceRef {
  final String symbol;
  final String url;

  const SourceRef(this.symbol, this.url);
}

String definitionName(DefinitionNode def) {
  if (def is DirectiveDefinitionNode) return def.name.value;
  if (def is TypeDefinitionNode) return def.name.value;
  if (def is FragmentDefinitionNode) return def.name.value;
  if (def is TypeExtensionNode) return def.name.value;

  if (def is SchemaDefinitionNode) return "schema";

  if (def is OperationDefinitionNode) {
    if (def.name != null) return def.name!.value;
    if (def.type == OperationType.query) return "query";
    if (def.type == OperationType.mutation) return "mutation";
    if (def.type == OperationType.subscription) return "subscription";
  }
  throw Exception("Unknown DefinitionNode type");
}
