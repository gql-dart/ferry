import 'package:ferry/src/operation_request.dart';
import 'package:ferry/src/operation_response.dart';

/// Type of the `forward` function
typedef NextResponder<TData, TVars> = Stream<OperationResponse<TData, TVars>>
    Function(
  OperationRequest<TData, TVars> request,
);

/// A function which returns a [Responder] based on contents [OperationRequest]
///
/// Used in [Responder.route]
typedef ResponderRouter<TData, TVars> = Responder Function(
  OperationRequest<TData, TVars> request,
);

/// [Responder] as a function
///
/// Used by [Responder.function]
typedef ResponderFunction = Stream<OperationResponse<TData, TVars>>
    Function<TData, TVars>(
  OperationRequest<TData, TVars> request, [
  NextResponder<TData, TVars> forward,
]);

/// [DocumentNode]-based GraphQL execution interface
abstract class Responder {
  /// Create a [Responder]
  const Responder();

  /// Create a [Responder] from a [ResponderFunction]
  factory Responder.function(
    ResponderFunction function,
  ) =>
      _FunctionResponder(function);

  /// Create a [Responder] by chaining multiple [responders]
  factory Responder.from(
    List<Responder> responders,
  ) =>
      _ResponderChain(responders);

  /// Create a [Responder] by chaining two [responders]
  factory Responder.concat(
    Responder first,
    Responder second,
  ) =>
      Responder.from([first, second]);

  /// Creates a [Responder] which routes [OperationRequest] to whichever responder is returned from
  /// the [route] function
  factory Responder.route(
    ResponderRouter route,
  ) =>
      _RouterResponder(route);

  /// Create a [Responder] which routes to the [left] responder if [test] returns `true`.
  /// Otherwise it routes to the [right] responder, which defaults to passthrough.
  factory Responder.split(
    bool Function<TData, TVars>(OperationRequest<TData, TVars> request) test,
    Responder left, [
    Responder right,
  ]) =>
      _RouterResponder(
          (request) => test(request) ? left : right ?? _PassthroughResponder());

  /// Adds [next] after this responder
  Responder concat(
    Responder next,
  ) =>
      Responder.concat(this, next);

  /// Route requests after this responder
  Responder route(
    ResponderRouter route,
  ) =>
      concat(_RouterResponder(route));

  /// Split requests after this responder
  Responder split(
    bool Function<TData, TVars>(OperationRequest<TData, TVars> request) test,
    Responder left, [
    Responder right,
  ]) =>
      concat(
        _RouterResponder(
          (request) => test(request) ? left : right ?? _PassthroughResponder(),
        ),
      );

  /// A function called when a [request] reaches this [Responder]
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    /// An incoming [OperationRequest]
    OperationRequest<TData, TVars> request, [

    /// Function that invokes the [request] function of
    ///   the next [Responder]
    ///
    /// Terminating [Responder]s do not call this function.
    NextResponder<TData, TVars> forward,
  ]);

  Future<void> dispose() async => null;
}

class _FunctionResponder extends Responder {
  final ResponderFunction function;

  const _FunctionResponder(this.function);

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextResponder<TData, TVars> forward,
  ]) =>
      function<TData, TVars>(request, forward);
}

class _ResponderChain extends Responder {
  final List<Responder> responders;

  const _ResponderChain(this.responders);

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextResponder<TData, TVars> forward,
  ]) =>
      responders.reversed.fold<NextResponder<TData, TVars>>(
        forward,
        (fw, responder) => (op) => responder.responseStream(op, fw),
      )(request);
}

class _PassthroughResponder extends Responder {
  const _PassthroughResponder();

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextResponder<TData, TVars> forward,
  ]) =>
      forward(request);
}

class _RouterResponder extends Responder {
  final ResponderRouter routeFn;

  const _RouterResponder(
    this.routeFn,
  ) : assert(routeFn != null);

  @override
  Stream<OperationResponse<TData, TVars>> responseStream<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    NextResponder<TData, TVars> forward,
  ]) async* {
    final responder = routeFn(request);

    yield* responder.responseStream(
      request,
      forward,
    );
  }
}
