import 'package:marketi/core/shared/models/verify_token_model.dart';
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
  Future<AuthResponse> login({required LoginRequest loginRequest});
  Future<AuthResponse> signup({required SignupRequest signupRequest});
  Future<ForgetPasswordResponse> forgetPassword({required ForgetPasswordRequest forgetPasswordRequest});
  Future<VerifyOtpResponse> verifyOtp({required VerifyOtpRequest verifyOtpRequest});
  Future<ResetPasswordResponse> resetPassword({required ResetPasswordRequest resetPasswordRequest});
  Future<VerifyTokenModel> verifyToken();
}
