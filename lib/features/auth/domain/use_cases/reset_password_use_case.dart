import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/auth/data/models/reset_password_request.dart';
import 'package:marketi/features/auth/data/models/reset_password_response.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class ResetPasswordUseCase
    implements UseCase<ResetPasswordResponse, ResetPasswordRequest> {
  final AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);
  @override
  Future<Either<Failure, ResetPasswordResponse>> call({
    required ResetPasswordRequest params,
  }) async {
    return await authRepo.resetPassword(request: params);
  }
}
