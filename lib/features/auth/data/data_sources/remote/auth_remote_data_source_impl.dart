import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/forget_password_request.dart';
import 'package:marketi/features/auth/data/models/forget_password_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/reset_password_request.dart';
import 'package:marketi/features/auth/data/models/reset_password_response.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/features/auth/data/models/verify_otp_request.dart';
import 'package:marketi/features/auth/data/models/verify_otp_response.dart';

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

  @override
  Future<ForgetPasswordResponse> forgetPassword({
    required ForgetPasswordRequest forgetPasswordRequest,
  }) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.forgetPasswordEndPoint,
      data: forgetPasswordRequest.toJson(),
    );
    return ForgetPasswordResponse.fromJson(response.data);
  }

  @override
  Future<ResetPasswordResponse> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    final response = await _apiService.put(
      endpoint: ApiConstants.resetPasswordEndPoint,
      data: resetPasswordRequest.toJson(),
    );
    return ResetPasswordResponse.fromJson(response.data);
  }

  @override
  Future<VerifyOtpResponse> verifyOtp({
    required VerifyOtpRequest verifyOtpRequest,
  }) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.verifyResetCodeEndPoint,
      data: verifyOtpRequest.toJson(),
    );
    return VerifyOtpResponse.fromJson(response.data);
  }
}
