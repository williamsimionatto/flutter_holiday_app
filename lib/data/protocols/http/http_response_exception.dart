class HttpResponseException implements Exception {
  final String message;

  const HttpResponseException({required this.message});
}
