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
  OperationResponse<TData, TVars> response,
);

class Mutation<TData, TVars> extends StatefulWidget {
  final OperationRequest<TData, TVars> operationRequest;
  final MutationResponseBuilder<TData, TVars> builder;
  final Client client;

  Mutation({
    @required this.operationRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _MutationState<TData, TVars> createState() =>
      _MutationState(builder: builder);
}

class _MutationState<TData, TVars> extends State<Mutation> {
  final MutationResponseBuilder<TData, TVars> builder;

  Stream<OperationResponse<TData, TVars>> stream;

  _MutationState({this.builder});

  @override
  void initState() {
    super.initState();
    stream = widget.client.responseStream(
      widget.operationRequest,
      executeOnListen: false,
    );
  }

  @override
  void didUpdateWidget(Mutation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.operationRequest != widget.operationRequest) {
      setState(() {
        stream = widget.client.responseStream(
          widget.operationRequest,
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
      widget.client.requestController.add(
        (widget.operationRequest as dynamic).rebuild((b) {
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
    return StreamBuilder<OperationResponse<TData, TVars>>(
      initialData: OperationResponse<TData, TVars>(
        operationRequest: widget.operationRequest,
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
