import 'package:gql_http_link/gql_http_link.dart';

import '../lib/graphql_api.dart';
import '../../lib/src/client/client.dart';

main() {
  () async {
    final link = HttpLink('https://api.kundalini.dev');

    final client = Client(link: link);

    final queryRef = client.query(
        SongsQuery(variables: SongsArguments(first: 10, offset: 0)),
        pollInterval: Duration(seconds: 1));

    queryRef.stream.listen((response) {
      print(response.data.Song.length);
    });

    await Future.delayed(Duration(seconds: 3));

    final refetchResult = await queryRef.refetch(
        query: SongsQuery(variables: SongsArguments(first: 10, offset: 10)));

    final refetchMergeResult = await queryRef.refetch(
        query: SongsQuery(variables: SongsArguments(first: 15, offset: 20)),
        updateResult: (original, updated) {
          original.Song = [...original.Song, ...updated.Song];
          return original;
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
