import 'package:authors_example/src/graphql/authors/__generated__/create_author.data.gql.dart';
import 'package:authors_example/src/graphql/authors/__generated__/create_author.var.gql.dart';
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.data.gql.dart';
import 'package:authors_example/src/graphql/authors/__generated__/get_authors.req.gql.dart';
import 'package:ferry/ferry.dart';

/// this cache handler will add the newly created author to the cached list of authors
UpdateCacheHandler<GCreateAuthorData, GCreateAuthorVars>
    createAuthorUpdateCacheHandler = (
  proxy,
  response,
) {
  final cached = proxy.readQuery(GGetAuthorsReq());
  if (!response.hasErrors) {
    final edges = cached?.authors?.edges?.toList() ?? [];

    proxy.writeQuery(
        GGetAuthorsReq(),
        GGetAuthorsData((b) => b.authors.edges
          ..addAll(edges)
          ..add(GGetAuthorsData_authors_edges((b) => b
            ..node.id = response.data!.createAuthor!.id
            ..node.firstName = response.data?.createAuthor?.firstName
            ..node.lastName = response.data?.createAuthor?.lastName))));
  }
};
