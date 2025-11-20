import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/token/token_service.dart';
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
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authDataSource;
  final TokenService tokenService;

  const AuthRepoImpl(this.authDataSource, this.tokenService);

  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required ForgetPasswordRequest request,
  }) async {
    try {
      final response = await authDataSource.forgetPassword(request: request);
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest request,
  }) async {
    try {
      final response = await authDataSource.login(request: request);
      if (response.message == 'success') {
        await tokenService.setToken(response.token);
        log('token from repo ----  ${await tokenService.getToken()}');
      }
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register({
    required SignUpRequest request,
  }) async {
    try {
      final response = await authDataSource.register(request: request);
      if (response.message == 'success') {
        await tokenService.setToken(response.token);
        log('token from repo ----  ${await tokenService.getToken()}');
      }
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required ResetPasswordRequest request,
  }) async {
    try {
      final response = await authDataSource.resetPassword(request: request);
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required VerifyOtpRequest request,
  }) async {
    try {
      final response = await authDataSource.verifyOtp(request: request);
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
