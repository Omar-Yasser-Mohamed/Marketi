import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/forget_password_request.dart';
import 'package:marketi/features/auth/data/models/forget_password_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/reset_password_request.dart';
import 'package:marketi/features/auth/data/models/reset_password_response.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/features/auth/data/models/verify_otp_request.dart';
import 'package:marketi/features/auth/data/models/verify_otp_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required LoginRequest request});
  Future<AuthResponse> register({required SignUpRequest request});
  Future<ForgetPasswordResponse> forgetPassword({
    required ForgetPasswordRequest request,
  });
  Future<VerifyOtpResponse> verifyOtp({required VerifyOtpRequest request});
  Future<ResetPasswordResponse> resetPassword({required ResetPasswordRequest request});
}
