import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final data = await _authRemoteDataSource.login(
        loginRequest: loginRequest,
      );
      return right(data);
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
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
