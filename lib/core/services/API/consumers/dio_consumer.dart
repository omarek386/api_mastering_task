// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import '../Errors/dio_error_cases.dart';
import '../constants/api_endpoints.dart';
import '../constants/interceptors/dio_interceptor.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  Dio dio;
  DioConsumer({
    required this.dio,
  }) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
    dio.interceptors.add(DioInterceptor());
  }
  @override
  Future<dynamic> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final Response response = await dio.delete(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorCases.throwDioExceptions(e);
    }
  }

  @override
  Future<dynamic> get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final Response response = await dio.get(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorCases.throwDioExceptions(e);
    }
  }

  @override
  Future<dynamic> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final Response response = await dio.patch(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorCases.throwDioExceptions(e);
    }
  }

  @override
  Future<dynamic> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final Response response = await dio.post(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorCases.throwDioExceptions(e);
    }
  }

  @override
  Future<dynamic> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final Response response = await dio.put(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorCases.throwDioExceptions(e);
    }
  }
}
