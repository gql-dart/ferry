import 'package:flutter/material.dart';
import 'package:gql_client/gql_client.dart';

typedef QueryResponseBuilder<T> = Widget Function(
    BuildContext context, QueryResponse<T> snapshot);

class Query<T> extends StatefulWidget {
  final QueryRequest<T> queryRequest;
  final QueryResponseBuilder<T> builder;
  final GQLClient client;

  Query({
    @required this.queryRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _QueryState<T> createState() => _QueryState(builder: builder);
}

class _QueryState<T> extends State<Query> {
  final QueryResponseBuilder<T> builder;

  Stream<QueryResponse<T>> stream;

  _QueryState({this.builder});

  @override
  void initState() {
    super.initState();
    stream = widget.client.responseStream(widget.queryRequest);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QueryResponse<T>>(
      initialData: QueryResponse<T>(queryRequest: widget.queryRequest),
      stream: stream,
      builder: (context, snapshot) {
        // TODO: handle errors
        final result = snapshot.data;
        return builder(context, result);
      },
    );
  }
}
