import 'dart:async';
import 'package:gql_http_link/gql_http_link.dart';

import '../lib/graphql_api.dart';
import '../../lib/src/client/client.dart';
import '../../lib/src/client/cache.dart';

main() {
  () async {
    final link = HttpLink('https://api.kundalini.dev');
    final cache = GQLCache();

    final client = GQLClient(link: link, cache: cache);

    final ref =
        client.ref(SongsQuery(variables: SongsArguments(offset: 0, first: 10)));

    ref.stream.listen((response) {
      print(response.data.Song);
    }, onError: (e) {
      print(e);
    });

    await ref.execute();
    await ref.execute(
        query: SongsQuery(variables: SongsArguments(offset: 10, first: 15)));

    // final refetchMergeResult = await ref.execute(
    //     query: SongsQuery(variables: SongsArguments(offset: 10, first: 15)),
    //     updateRefResult: (previousResult, result) {
    //       result.Song = [...previousResult.Song, ...result.Song];
    //       return result;
    //     });

    print('complete');

    // final mutationRef = client.mutation(AddSongQuery());

    // cache.root.writeQuery(
    //     query: query.document, variables: query.getVariablesMap(), data: data);

    // final result = cache.root
    //     .readQuery(query: query.document, variables: query.getVariablesMap());
    // print(result);
  }();
}
