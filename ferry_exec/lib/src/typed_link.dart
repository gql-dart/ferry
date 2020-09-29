import './operation_request.dart';
import './operation_response.dart';

/// Type of the `forward` function
typedef NextTypedLink<TData, TVars> = Stream<OperationResponse<TData, TVars>>
    Function(
  OperationRequest<TData, TVars> request,
);

/// A function which returns a [TypedLink] based on contents of [request]
///
/// Used in [TypedLink.route]
typedef TypedLinkRouter<TData, TVars> = TypedLink Function(
  OperationRequest<TData, TVars> request,
);

/// [TypedLink] as a function
///
/// Used by [TypedLink.function]
typedef TypedLinkFunction = Stream<OperationResponse<TData, TVars>>
    Function<TData, TVars>(
  OperationRequest<TData, TVars> request, [
  NextTypedLink<TData, TVars> forward,
]);

/// A fully typed implementation of gql_link
abstract class TypedLink {
  /// Create a [TypedLink]
  const TypedLink();

  /// Create a [TypedLink] from a [TypedLinkFunction]
  factory TypedLink.function(
    TypedLinkFunction function,
  ) =>
      _FunctionTypedLink(function);

  /// Create a [TypedLink] by chaining multiple [typedLinks]
  factory TypedLink.from(
    List<TypedLink> typedLinks,
  ) =>
      _TypedLinkChain(typedLinks);

  /// Create a [TypedLink] by chaining two [typedLinks]
  factory TypedLink.concat(
    TypedLink first,
    TypedLink second,
  ) =>
      TypedLink.from([first, second]);

  /// Creates a [TypedLink] which routes [OperationRequest] to whichever typedLink is returned from
  /// the [route] function
  factory TypedLink.route(
    TypedLinkRouter route,
  ) =>
      _RouterTypedLink(route);

  /// Create a [TypedLink] which routes to the [left] typedLink if [test] returns `true`.
  /// Otherwise it routes to the [right] typedLink, which defaults to passthrough.
  factory TypedLink.split(
    bool Function<TData, TVars>(OperationRequest<TData, TVars> request) test,
    TypedLink left, [
    TypedLink right,
  ]) =>
      _RouterTypedLink(
          (request) => test(request) ? left : right ?? _PassthroughTypedLink());

  /// Adds [next] after this typedLink
  TypedLink concat(
    TypedLink next,
  ) =>
      TypedLink.concat(this, next);

  /// Route requests after this typedLink
  TypedLink route(
    TypedLinkRouter route,
  ) =>
      concat(_RouterTypedLink(route));

  /// Split requests after this typedLink
  TypedLink split(
    bool Function<TData, TVars>(OperationRequest<TData, TVars> request) test,
    TypedLink left, [
    TypedLink right,
  ]) =>
      concat(
        _RouterTypedLink(
          (request) => test(request) ? left : right ?? _PassthroughTypedLink(),
        ),
      );

  /// A function called when a [request] reaches this [TypedLink]
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    /// An incoming [OperationRequest]
    OperationRequest<TData, TVars> request, [

    /// Function that invokes the [request] function of
    /// the next [TypedLink]
    ///
    /// Terminating [TypedLink]s do not call this function.
    NextTypedLink<TData, TVars> forward,
  ]);

  Future<void> dispose() async => null;
}

class _FunctionTypedLink extends TypedLink {
  final TypedLinkFunction function;

  const _FunctionTypedLink(this.function);

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextTypedLink<TData, TVars> forward,
  ]) =>
      function<TData, TVars>(request, forward);
}

class _TypedLinkChain extends TypedLink {
  final List<TypedLink> typedLinks;

  const _TypedLinkChain(this.typedLinks);

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextTypedLink<TData, TVars> forward,
  ]) =>
      typedLinks.reversed.fold<NextTypedLink<TData, TVars>>(
        forward,
        (fw, typedLink) => (op) => typedLink.request(op, fw),
      )(request);

  @override
  Future<void> dispose() =>
      Future.wait(typedLinks.map((typedLink) => typedLink.dispose()));
}

class _PassthroughTypedLink extends TypedLink {
  const _PassthroughTypedLink();

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextTypedLink<TData, TVars> forward,
  ]) =>
      forward(request);
}

class _RouterTypedLink extends TypedLink {
  final TypedLinkRouter routeFn;

  const _RouterTypedLink(
    this.routeFn,
  ) : assert(routeFn != null);

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextTypedLink<TData, TVars> forward,
  ]) async* {
    final typedLink = routeFn(request);

    yield* typedLink.request(
      request,
      forward,
    );
  }
}
