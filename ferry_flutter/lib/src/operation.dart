import 'package:flutter/material.dart';
import 'package:ferry_exec/ferry_exec.dart';

typedef OperationResponseBuilder<TData, TVars> = Widget Function(
  BuildContext context,
  OperationResponse<TData, TVars> response,
  Object error,
);

class Operation<TData, TVars> extends StatefulWidget {
  final OperationRequest<TData, TVars> operationRequest;
  final OperationResponseBuilder<TData, TVars> builder;
  final TypedLink client;

  Operation({
    @required this.operationRequest,
    @required this.builder,
    @required this.client,
  });

  @override
  _OperationState<TData, TVars> createState() => _OperationState();
}

class _OperationState<TData, TVars> extends State<Operation<TData, TVars>> {
  Stream<OperationResponse<TData, TVars>> stream;

  Stream<OperationResponse<TData, TVars>> _getStream() =>
      widget.client.request(widget.operationRequest).distinct();

  @override
  void initState() {
    super.initState();
    stream = _getStream();
  }

  @override
  void didUpdateWidget(Operation<TData, TVars> oldWidget) {
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
        snapshot.error,
      ),
    );
  }
}
