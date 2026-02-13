import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;

  const AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<AuthResponse> login({required LoginRequest loginRequest}) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.loginEndPoint,
      data: loginRequest.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponse> signup({required SignupRequest signupRequest}) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.signupEndPoint,
      data: signupRequest.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }
}
