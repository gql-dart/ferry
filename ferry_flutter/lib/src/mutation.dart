import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:ferry/ferry.dart';

typedef MutateFunction<T> = Function({
  Map<String, dynamic> variables,
  Context context,
  Map<String, dynamic> optimisticResponse,
  String updateCacheHandlerKey,
  FetchPolicy fetchPolicy,
});

typedef MutationResponseBuilder<T> = Widget Function(
  BuildContext context,
  MutateFunction<T> mutate,
  QueryResponse<T> response,
);

class Mutation<T> extends StatefulWidget {
  final QueryRequest<T> queryRequest;
  final MutationResponseBuilder<T> builder;
  final Client client;

  Mutation({
    @required this.queryRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _MutationState<T> createState() => _MutationState(builder: builder);
}

class _MutationState<T> extends State<Query> {
  final MutationResponseBuilder<T> builder;

  Stream<QueryResponse<T>> stream;

  _MutationState({this.builder});

  @override
  void initState() {
    super.initState();
    stream = widget.client.responseStream(
      widget.queryRequest,
      executeOnListen: false,
    );
  }

  @override
  void didUpdateWidget(Query oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.queryRequest != widget.queryRequest) {
      setState(() {
        stream = widget.client.responseStream(
          widget.queryRequest,
          executeOnListen: false,
        );
      });
    }
  }

  void _mutate<T>({
    Map<String, dynamic> variables,
    Context context,
    Map<String, dynamic> optimisticResponse,
    String updateCacheHandlerKey,
    FetchPolicy fetchPolicy,
  }) =>
      widget.client.queryController.add(
        widget.queryRequest.copyWith(
          variables: variables,
          context: context,
          optimisticResponse: optimisticResponse,
          updateCacheHandlerKey: updateCacheHandlerKey,
          fetchPolicy: fetchPolicy,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QueryResponse<T>>(
      initialData: QueryResponse<T>(
        queryRequest: widget.queryRequest,
        dataSource: DataSource.None,
      ),
      stream: stream,
      builder: (context, snapshot) => builder(
        context,
        _mutate,
        snapshot.data,
      ),
    );
  }
}
