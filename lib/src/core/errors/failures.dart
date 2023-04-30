abstract class IFailure implements Exception {
  final String message;
  const IFailure(this.message);
}
