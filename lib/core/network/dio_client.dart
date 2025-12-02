import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/constants/api_constants.dart';

@LazySingleton()
class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
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
