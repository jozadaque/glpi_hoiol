class IFailure implements Exception {
  final String? message;
  final StackTrace? stackTrace;
  const IFailure({
    this.message = '',
    this.stackTrace,
  });
}
