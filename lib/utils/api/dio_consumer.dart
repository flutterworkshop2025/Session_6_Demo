import 'package:dio/dio.dart';

import 'api_consumer.dart';
import 'errors/exception.dart';

class DioConsumer extends ApiConsumer {
  final dio = Dio();

  @override
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await Dio().get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      switch (e) {
        case DioExceptionType.sendTimeout:
          //throw ServerException(errorModel: ErrorModel(code:response.da , message: ''));
          break;
        case DioExceptionType.badCertificate:
          break;
        case DioExceptionType.cancel:
          break;
        case DioExceptionType.connectionError:
          break;
        case DioExceptionType.connectionTimeout:
          break;
        case DioExceptionType.receiveTimeout:
          break;
        case DioExceptionType.unknown:
          break;
        case DioExceptionType.badResponse:
          break;
      }
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await Dio().post(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await Dio().put(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await Dio().patch(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await Dio().delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }
}
