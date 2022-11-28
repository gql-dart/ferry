import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart' as gql_exec;

/// A [Link] which adds an authorization header to requests
class AddAuthHeaderLink extends Link {
  final Future<String?> Function() getToken;

  AddAuthHeaderLink(this.getToken);

  @override
  Stream<gql_exec.Response> request(gql_exec.Request request,
      [NextLink? forward]) async* {
    assert(forward != null);
    final token = await getToken();
    if (token != null) {
      final newReq = gql_exec.Request(
          operation: request.operation,
          variables: request.variables,
          context: request.context.updateEntry<gql_exec.HttpLinkHeaders>(
              (headers) => gql_exec.HttpLinkHeaders(headers: {
                    ...?headers?.headers,
                    'Authorization': 'Bearer $token',
                  })));
      yield* forward!(newReq);
    } else {
      yield* forward!(request);
    }
  }
}
