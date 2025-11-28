import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class RegisterUseCase implements UseCase<AuthResponse, SignUpRequest> {
  final AuthRepo authRepo;

  const RegisterUseCase(this.authRepo);

  @override
  Future<Either<Failure, AuthResponse>> call({
    required SignUpRequest params,
  }) async {
    return await authRepo.register(request: params);
  }
}
