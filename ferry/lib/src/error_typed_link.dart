import 'dart:async';
import 'package:meta/meta.dart';
import 'package:ferry_exec/ferry_exec.dart';

export 'package:gql_link/gql_link.dart';

/// A base class for exceptions thrown by [TypedLink]s
@immutable
class TypedLinkException implements Exception {
  /// The original exception causing this exception
  final dynamic originalException;

  const TypedLinkException(
    this.originalException,
  );
}

/// Catches any errors in the [TypedLink.request] chain, and returns a
/// [Stream.errror] with the error.
class ErrorTypedLink extends TypedLink {
  const ErrorTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest, [
    forward,
  ]) {
    try {
      return forward(operationRequest);
    } catch (e) {
      return Stream.error(
        TypedLinkException(e),
      );
    }
  }
}
