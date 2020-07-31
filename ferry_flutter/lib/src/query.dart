import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';

typedef QueryResponseBuilder<TData, TVars> = Widget Function(
  BuildContext context,
  QueryResponse<TData, TVars> response,
);

class Query<TData, TVars> extends StatefulWidget {
  final QueryRequest<TData, TVars> queryRequest;
  final QueryResponseBuilder<TData, TVars> builder;
  final Client client;

  Query({
    @required this.queryRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _QueryState<TData, TVars> createState() => _QueryState();
}

class _QueryState<TData, TVars> extends State<Query<TData, TVars>> {
  Stream<QueryResponse<TData, TVars>> stream;

  @override
  void initState() {
    super.initState();
    stream = widget.client.responseStream(widget.queryRequest);
  }

  @override
  void didUpdateWidget(Query oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.queryRequest != widget.queryRequest) {
      setState(() {
        stream = widget.client.responseStream(widget.queryRequest);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QueryResponse<TData, TVars>>(
      initialData: QueryResponse<TData, TVars>(
        queryRequest: widget.queryRequest,
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
