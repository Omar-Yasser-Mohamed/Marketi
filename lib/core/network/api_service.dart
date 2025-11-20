import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/helpers/connectivity_helper.dart';
import 'package:marketi/core/network/dio_client.dart';

@LazySingleton()
class ApiService {
  final DioClient dioClient;
  late final Dio dio;

  ApiService(this.dioClient) {
    dio = dioClient.dio;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final isConnect = await ConnectivityHelper().isConnect();
    if (isConnect) {
      final Response response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options ?? Options(headers: headers),
      );
      return response;
    } else {
      throw Failure('No internet connection');
    }
  }

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async {
    final isConnect = await ConnectivityHelper().isConnect();
    if (isConnect) {
      final Response response = await dio.post(
        endPoint,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: headers),
      );
      return response;
    } else {
      throw Failure('No internet connection');
    }
  }

  Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async {
    final isConnect = await ConnectivityHelper().isConnect();
    if (isConnect) {
      final Response response = await dio.put(
        endPoint,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: headers),
      );
      return response;
    } else {
      throw Failure('No internet connection');
    }
  }

  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async {
    final isConnect = await ConnectivityHelper().isConnect();
    if (isConnect) {
      final Response response = await dio.delete(
        endPoint,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: headers),
      );
      return response;
    } else {
      throw Failure('No internet connection');
    }
  }
}
