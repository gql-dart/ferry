import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_exec/gql_exec.dart';

Widget Function(
  BuildContext context,
  Object error,
  LinkException linkException,
  List<GraphQLError> graphqlErrors, [
  OperationRequest operationRequest,
// ignore: prefer_function_declarations_over_variables
]) defaultOperationErrorBuilder = (
  context,
  error,
  linkException,
  graphqlErrors, [
  operationRequest,
]) =>
    Column(
      children: [
        if (operationRequest?.operation?.operationName != null)
          Text(operationRequest.operation.operationName),
        if (error != null) Text('${error.runtimeType}: $error'),
        if (graphqlErrors != null)
          ...graphqlErrors?.map((e) => Text(e.toString())),
        if (linkException != null) Text(linkException.toString()),
      ],
    );

typedef OperationResponseBuilder<TData, TVars> = Widget Function(
  BuildContext context,
  OperationResponse<TData, TVars> response,
);

typedef OperationErrorBuilder = Widget Function(
  BuildContext context,
  Object error,
  LinkException linkException,
  List<GraphQLError> graphqlErrors,
);

class Operation<TData, TVars> extends StatefulWidget {
  final OperationRequest<TData, TVars> operationRequest;
  final OperationResponseBuilder<TData, TVars> builder;
  final TypedLink client;
  final OperationErrorBuilder errorBuilder;

  Operation({
    @required this.operationRequest,
    @required this.builder,
    @required this.client,
    this.errorBuilder,
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
      builder: (context, snapshot) {
        if (snapshot.hasError || snapshot.data?.hasErrors == true) {
          if (widget.errorBuilder != null) {
            return widget.errorBuilder(
              context,
              snapshot.error,
              snapshot.data?.linkException,
              snapshot.data?.graphqlErrors,
            );
          }

          return defaultOperationErrorBuilder(
            context,
            snapshot.error,
            snapshot.data?.linkException,
            snapshot.data?.graphqlErrors,
            widget.operationRequest,
          );
        }

        return widget.builder(context, snapshot.data);
      },
    );
  }
}
