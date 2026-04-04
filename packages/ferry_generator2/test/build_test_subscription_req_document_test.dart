@TestOn("vm")

import "package:analyzer/dart/constant/value.dart";
import "package:build/build.dart";
import "package:build_test/build_test.dart";
import "package:ferry_generator2/ferry_generator2.dart";
import "package:test/test.dart";
import "test_utils.dart";

const _package = "ferry_generator2";
const _schemaPath = "$_package|lib/schema.graphql";
const _documentPath = "$_package|lib/subscription.graphql";
const _reqPath = "$_package|lib/__generated__/subscription.req.gql.dart";

const _schema = r"""
schema {
  query: Query
  subscription: Subscription
}

type Query {
  _noop: Boolean
}

type Review {
  stars: Int!
}

type Subscription {
  reviewAdded: Review
}
""";

const _document = r"""
subscription ReviewAdded {
  reviewAdded {
    stars
  }
}
""";

void main() {
  test("subscription request document skips root __typename", () async {
    final assets = <String, String>{
      _schemaPath: _schema,
      _documentPath: _document,
    };

    final builder = graphqlBuilder(
      BuilderOptions({
        "schema": {
          "file": _schemaPath,
          "add_typenames": true,
        },
      }),
    );

    final result = await testBuilder(
      builder,
      assets,
      rootPackage: _package,
      generateFor: {_documentPath},
    );

    expect(result.succeeded, isTrue);

    final sources = extractGeneratedDartSources(result.readerWriter, _package);
    final document = await _resolveRequestDocument(sources);
    final operation = document.getField("definitions")?.toListValue()?.single;
    if (operation == null) {
      throw StateError("Missing operation definition");
    }

    final rootSelectionSet = operation.getField("selectionSet");
    if (rootSelectionSet == null) {
      throw StateError("Missing operation selection set");
    }

    expect(_selectionNames(rootSelectionSet), equals(["reviewAdded"]));

    final reviewAdded =
        rootSelectionSet.getField("selections")!.toListValue()!.single;
    final nestedSelectionSet = reviewAdded.getField("selectionSet");
    if (nestedSelectionSet == null) {
      throw StateError("Missing nested selection set");
    }
    expect(
      _selectionNames(nestedSelectionSet),
      equals(["stars", "__typename"]),
    );
  });
}

Future<DartObject> _resolveRequestDocument(Map<String, String> sources) {
  return resolveSources(
    sources,
    (resolver) async {
      final library = await resolver.libraryFor(AssetId.parse(_reqPath));
      final reqClass = library.getClass("GReviewAddedReq");
      if (reqClass == null) {
        throw StateError("Missing request class in resolved library");
      }

      final documentField =
          reqClass.fields.singleWhere((field) => field.name == "_document");
      final documentValue = documentField.computeConstantValue();
      if (documentValue == null) {
        throw StateError("Failed to evaluate _document const value");
      }
      return documentValue;
    },
    rootPackage: _package,
    readAllSourcesFromFilesystem: true,
  );
}

List<String> _selectionNames(DartObject selectionSet) {
  final selections = selectionSet.getField("selections")?.toListValue();
  if (selections == null) {
    throw StateError("Missing selections in SelectionSetNode");
  }

  return [
    for (final selection in selections)
      selection.getField("name")?.getField("value")?.toStringValue() ??
          (throw StateError("Selection is missing a name")),
  ];
}
