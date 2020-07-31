import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';

typedef MutateFunction<TData, TVars> = Function({
  TVars variables,
  TData optimisticResponse,
  String updateCacheHandlerKey,
  Map<String, dynamic> updateCacheHandlerContext,
  FetchPolicy fetchPolicy,
});

typedef MutationResponseBuilder<TData, TVars> = Widget Function(
  BuildContext context,
  MutateFunction<TData, TVars> mutate,
  QueryResponse<TData, TVars> response,
);

class Mutation<TData, TVars> extends StatefulWidget {
  final QueryRequest<TData, TVars> queryRequest;
  final MutationResponseBuilder<TData, TVars> builder;
  final Client client;

  Mutation({
    @required this.queryRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _MutationState<TData, TVars> createState() =>
      _MutationState(builder: builder);
}

class _MutationState<TData, TVars> extends State<Mutation> {
  final MutationResponseBuilder<TData, TVars> builder;

  Stream<QueryResponse<TData, TVars>> stream;

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
  void didUpdateWidget(Mutation oldWidget) {
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

// TODO: avoid casting to dynamic
  void _mutate<TData, TVars>({
    TVars variables,
    TData optimisticResponse,
    String updateCacheHandlerKey,
    Map<String, dynamic> updateCacheHandlerContext,
    FetchPolicy fetchPolicy,
  }) =>
      widget.client.queryController.add(
        (widget.queryRequest as dynamic).rebuild((b) {
          if (variables != null) b.vars = variables;
          if (updateCacheHandlerContext != null)
            b.updateCacheHandlerContext = updateCacheHandlerContext;
          if (optimisticResponse != null)
            b.optimisticResponse = optimisticResponse;
          if (updateCacheHandlerKey != null)
            b.updateCacheHandlerKey = updateCacheHandlerKey;
          if (fetchPolicy != null) b.fetchPolicy = fetchPolicy;
          return b;
        }),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QueryResponse<TData, TVars>>(
      initialData: QueryResponse<TData, TVars>(
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
