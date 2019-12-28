import 'dart:async';
import 'package:gql/execution.dart';
import 'package:gql_http_link/gql_http_link.dart';

import '../lib/graphql_api.dart';
import '../../lib/src/client/client.dart';
import '../../lib/src/client/query_event.dart';
import '../../lib/src/client/gql_response.dart';

main() {
  () async {
    final link = HttpLink('https://api.kundalini.dev');

    final client = GQLClient(link: link);

    final Map<String, Function> update = {'updateSongs': (j, p) {}};

    final ref =
        client.ref(SongsQuery(variables: SongsArguments(first: 10, offset: 0)));

    ref.stream.listen((response) {
      print(response.data.Song.first.id);
    });

    print(await ref.execute());
    print(await ref.execute());
    print(await ref.execute());

    // final refetchMergeResult = await queryRef.refetch(
    //     query: SongsQuery(variables: SongsArguments(first: 15, offset: 20)),
    //     updateResult: (original, updated) {
    //       original.Song = [...original.Song, ...updated.Song];
    //       return original;
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
