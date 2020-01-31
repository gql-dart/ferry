class NetworkError {
  final Object error;
  final StackTrace stackTrace;

  const NetworkError(this.error, this.stackTrace);
}
