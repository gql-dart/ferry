import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';

typedef OperationResponseBuilder<TData, TVars> = Widget Function(
  BuildContext context,
  OperationResponse<TData, TVars> response,
);

class Query<TData, TVars> extends StatefulWidget {
  final OperationRequest<TData, TVars> operationRequest;
  final OperationResponseBuilder<TData, TVars> builder;
  final Client client;

  Query({
    @required this.operationRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _QueryState<TData, TVars> createState() => _QueryState();
}

class _QueryState<TData, TVars> extends State<Query<TData, TVars>> {
  Stream<OperationResponse<TData, TVars>> stream;

  Stream<OperationResponse<TData, TVars>> _getStream() =>
      widget.client.responseStream(widget.operationRequest).distinct();

  @override
  void initState() {
    super.initState();
    stream = _getStream();
  }

  @override
  void didUpdateWidget(Query<TData, TVars> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.operationRequest != widget.operationRequest) {
      setState(() => stream = _getStream());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OperationResponse<TData, TVars>>(
      initialData: OperationResponse<TData, TVars>(
        operationRequest: widget.operationRequest,
        dataSource: DataSource.None,
      ),
      stream: stream,
      builder: (context, snapshot) => widget.builder(
        context,
        snapshot.data,
      ),
    );
  }
}
