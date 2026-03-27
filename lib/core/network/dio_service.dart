import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/shared/token/token_service.dart';

@lazySingleton
class DioService {
  late final Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dioInterceptor();
  }

  void _dioInterceptor() {
    dio.interceptors.addAll([
      AuthorizationInterceptor(getIt<TokenService>()),
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    ]);
  }
}

@lazySingleton
class AuthorizationInterceptor extends Interceptor {
  final TokenService _tokenService;

  AuthorizationInterceptor(this._tokenService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _tokenService.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = "Bearer $token";
      }
    } catch (e) {
      log("Error from AuthorizationInterceptor --- $e");
    }

    handler.next(options);
  }
}
