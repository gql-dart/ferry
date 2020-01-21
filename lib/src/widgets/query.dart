import 'package:flutter/material.dart';
import 'package:gql_client/gql_client.dart';

typedef QueryResponseBuilder<T> = Widget Function(
    BuildContext context, AsyncSnapshot<QueryResponse<T>> snapshot);

class Query<T> extends StatefulWidget {
  final QueryRequest<T> queryRequest;
  final QueryResponseBuilder<T> builder;
  final GQLClient client;

  Query(
      {@required this.queryRequest,
      @required this.builder,
      @required this.client});

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
    () async {
      stream = widget.client.responseStream(widget.queryRequest);
      await Future.delayed(Duration.zero);
      widget.client.queryController.add(widget.queryRequest);
    }();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QueryResponse<T>>(
      stream: stream,
      builder: builder,
    );
  }
}
