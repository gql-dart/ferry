import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';

typedef QueryResponseBuilder<T> = Widget Function(
  BuildContext context,
  QueryResponse<T> response,
);

class Query<T> extends StatefulWidget {
  final QueryRequest<T> queryRequest;
  final QueryResponseBuilder<T> builder;
  final Client client;

  Query({
    @required this.queryRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _QueryState<T> createState() => _QueryState();
}

class _QueryState<T> extends State<Query<T>> {

  Stream<QueryResponse<T>> stream;


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
    return StreamBuilder<QueryResponse<T>>(
      initialData: QueryResponse<T>(
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
