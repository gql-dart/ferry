import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_link/gql_link.dart';

/// A base class for exceptions thrown by [TypedLink]s
class TypedLinkException extends LinkException {
  const TypedLinkException(
    dynamic originalException,
      StackTrace originalStackTrace,
  ) : super(originalException, originalStackTrace);

  @override
  bool operator ==(Object o) =>
      o is TypedLinkException && o.originalException == originalException;

  @override
  int get hashCode => originalException.hashCode;
}
