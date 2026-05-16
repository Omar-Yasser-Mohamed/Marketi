import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
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

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  });
  Future<Either<Failure, AuthResponse>> signup({
    required SignupRequest signupRequest,
  });
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required ForgetPasswordRequest forgetPasswordRequest,
  });
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required VerifyOtpRequest verifyOtpRequest,
  });
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  });
  Future<Either<Failure, VerifyTokenModel>> verifyToken();
  Future<void> logout();
}
