import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/helpers/hive_helper.dart';
import 'package:marketi/core/shared/models/verify_token_model.dart';
import 'package:marketi/core/shared/token/token_service.dart';
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
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';
import 'package:marketi/features/profile/data/data_source/local/profile_local_data_source.dart';
import 'package:marketi/features/profile/data/data_source/remote/profile_remote_data_source.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(
    this._authRemoteDataSource,
    this._tokenService,
    this._profileLocalDataSource,
    this._profileRemoteDataSource,
  );
  final AuthRemoteDataSource _authRemoteDataSource;
  final TokenService _tokenService;
  final ProfileLocalDataSource _profileLocalDataSource;
  final ProfileRemoteDataSource _profileRemoteDataSource;

  @override
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final data = await _authRemoteDataSource.login(
        loginRequest: loginRequest,
      );

      // save token
      await _tokenService.saveToken(data.token);
      log("Token ---  ${data.token}");

      await verifyToken();

      // Fetch full user data
      final fullUser = await _profileRemoteDataSource.getUserData();

      // save user data
      await _profileLocalDataSource.saveUserData(fullUser.toEntity());

      return right(AuthResponse(
        message: data.message,
        token: data.token,
        user: fullUser,
      ));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signup({
    required SignupRequest signupRequest,
  }) async {
    try {
      final data = await _authRemoteDataSource.signup(
        signupRequest: signupRequest,
      );

      // save token
      await _tokenService.saveToken(data.token);
      log("Token ---  ${data.token}");

      await verifyToken();

      // Fetch full user data
      final fullUser = await _profileRemoteDataSource.getUserData();

      // save user data
      await _profileLocalDataSource.saveUserData(fullUser.toEntity());

      return right(AuthResponse(
        message: data.message,
        token: data.token,
        user: fullUser,
      ));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required ForgetPasswordRequest forgetPasswordRequest,
  }) async {
    try {
      final data = await _authRemoteDataSource.forgetPassword(
        forgetPasswordRequest: forgetPasswordRequest,
      );
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    try {
      final data = await _authRemoteDataSource.resetPassword(
        resetPasswordRequest: resetPasswordRequest,
      );
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required VerifyOtpRequest verifyOtpRequest,
  }) async {
    try {
      final data = await _authRemoteDataSource.verifyOtp(
        verifyOtpRequest: verifyOtpRequest,
      );
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, VerifyTokenModel>> verifyToken() async {
    try {
      final data = await _authRemoteDataSource.verifyToken();

      // Save User ID
      await _tokenService.saveUserId(data.id);

      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<void> logout() async {
    await _tokenService.deleteToken();
    await _tokenService.deleteUserId();
    await HiveHelper.clearAllUserData();
  }
}
