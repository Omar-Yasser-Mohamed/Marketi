import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required LoginRequest loginRequest});
  Future<AuthResponse> signup({required SignupRequest signupRequest});
}
