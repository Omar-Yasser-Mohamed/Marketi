import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/models/verify_otp_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

part 'verify_otp_state.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this._authRepo) : super(VerifyOtpInitial());
  final AuthRepo _authRepo;

  void safeEmit(VerifyOtpState state) {
    if (!isClosed) emit(state);
  }

  Future<void> verifyOtp({required String resetCode}) async {
    safeEmit(VerifyOtpLoading());

    final VerifyOtpRequest verifyOtpRequest = VerifyOtpRequest(
      resetCode: resetCode,
    );

    final res = await _authRepo.verifyOtp(verifyOtpRequest: verifyOtpRequest);

    res.fold(
      (failure) {
        safeEmit(VerifyOtpFailure(failure));
      },
      (success) {
        safeEmit(VerifyOtpSuccess());
      },
    );
  }
}
