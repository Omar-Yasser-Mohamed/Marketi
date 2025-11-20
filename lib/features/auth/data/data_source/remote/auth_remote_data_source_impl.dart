import 'package:injectable/injectable.dart';
import 'package:marketi/core/constants/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/features/auth/data/data_source/remote/auth_remote_data_source.dart';
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
  final ApiService apiService;

  const AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<AuthResponse> login({required LoginRequest request}) async {
    final response = await apiService.post(
      endPoint: ApiConstants.signinEndPoint,
      data: request.toJson(),
    );

    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponse> register({required SignUpRequest request}) async {
    final response = await apiService.post(
      endPoint: ApiConstants.signupEndPoint,
      data: request.toJson(),
    );

    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword({
    required ForgetPasswordRequest request,
  }) async {
    final response = await apiService.post(
      endPoint: ApiConstants.forgetPasswordEndPoint,
      data: request.toJson(),
    );

    return ForgetPasswordResponse.fromJson(response.data);
  }

  @override
  Future<ResetPasswordResponse> resetPassword({
    required ResetPasswordRequest request,
  }) async {
    final response = await apiService.put(
      endPoint: ApiConstants.resetPasswordEndPoint,
      data: request.toJson(),
    );

    return ResetPasswordResponse.fromJson(response.data);
  }

  @override
  Future<VerifyOtpResponse> verifyOtp({
    required VerifyOtpRequest request,
  }) async {
    final response = await apiService.post(
      endPoint: ApiConstants.verifyResetCodeEndPoint,
      data: request.toJson(),
    );

    return VerifyOtpResponse.fromJson(response.data);
  }
}
