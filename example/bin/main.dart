import '../generated/graphql_api.dart';
import '../../lib/src/client/client.dart';

main() {
  () async {
    final mutation = AddSongQuery();

    final client = Client();

    final queryRef = client.query(
        SongsQuery(variables: SongsArguments(first: 10)),
        QueryOptions(pollInterval: Duration(seconds: 1)));

    final result = await queryRef.future;

    // cache.root.writeQuery(
    //     query: query.document, variables: query.getVariablesMap(), data: data);

    // final result = cache.root
    //     .readQuery(query: query.document, variables: query.getVariablesMap());
    // print(result);
  }();
}
