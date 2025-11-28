import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/auth/data/models/forget_password_request.dart';
import 'package:marketi/features/auth/data/models/forget_password_response.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class ForgetPasswordUseCase
    implements UseCase<ForgetPasswordResponse, ForgetPasswordRequest> {
  final AuthRepo authRepo;

  const ForgetPasswordUseCase(this.authRepo);

  @override
  Future<Either<Failure, ForgetPasswordResponse>> call({
    required ForgetPasswordRequest params,
  }) async {
    return await authRepo.forgetPassword(request: params);
  }
}
