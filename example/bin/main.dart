import 'dart:async';
import 'package:gql_http_link/gql_http_link.dart';

import '../lib/graphql_api.dart';
import '../../lib/src/client/client.dart';

main() {
  () async {
    final link = HttpLink('https://api.kundalini.dev');

    final client = GQLClient(link: link);

    final ref =
        client.ref(SongsQuery(variables: SongsArguments(offset: 0, first: 10)));

    ref.stream.listen((response) {
      print(response.data.Song);
    });

    await ref.execute();

    final refetchMergeResult = await ref.execute(
        query: SongsQuery(variables: SongsArguments(offset: 10, first: 15)),
        updateResult: (previousResult, result) {
          result.Song = [...previousResult.Song, ...result.Song];
          return result;
        });

    print('complete');

    // final mutationRef = client.mutation(AddSongQuery());

    // cache.root.writeQuery(
    //     query: query.document, variables: query.getVariablesMap(), data: data);

    // final result = cache.root
    //     .readQuery(query: query.document, variables: query.getVariablesMap());
    // print(result);
  }();
}
