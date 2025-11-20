import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/auth/data/models/verify_otp_request.dart';
import 'package:marketi/features/auth/data/models/verify_otp_response.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class VerifyOtpUseCase implements UseCase<VerifyOtpResponse, VerifyOtpRequest> {
  final AuthRepo authRepo;

  const VerifyOtpUseCase(this.authRepo);

  @override
  Future<Either<Failure, VerifyOtpResponse>> call({
    required VerifyOtpRequest params,
  }) async {
    return await authRepo.verifyOtp(request: params);
  }
}
