import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/auth/data/models/auth_response.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class LoginUseCase implements UseCase<AuthResponse, LoginRequest> {
  final AuthRepo authRepo;

  const LoginUseCase(this.authRepo);

  @override
  Future<Either<Failure, AuthResponse>> call({
    required LoginRequest params,
  }) async {
    return await authRepo.login(request: params);
  }
}
