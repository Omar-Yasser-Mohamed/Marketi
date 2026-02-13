import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  });
  Future<Either<Failure, AuthResponse>> signup({
    required SignupRequest signupRequest,
  });
}
