import 'package:dio/dio.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioService {
  late final Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dioInterceptor();
  }

  void _dioInterceptor() {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}