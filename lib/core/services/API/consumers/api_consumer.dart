abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> patch(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
