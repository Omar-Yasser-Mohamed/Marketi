import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/failure.dart';
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
  Future<Either<Failure, AuthResponse>> login({required LoginRequest request});
  Future<Either<Failure, AuthResponse>> register({required SignUpRequest request});
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({required ForgetPasswordRequest request});
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({required VerifyOtpRequest request});
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({required ResetPasswordRequest request});
}
