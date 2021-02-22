class AuthTokenException implements Exception {
  String cause;
  AuthTokenException(this.cause);

  @override
  String toString() {
    return this.cause;
  }
}