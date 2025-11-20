import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/auth/data/models/verify_otp_request.dart';
import 'package:marketi/features/auth/data/models/verify_otp_response.dart';
import 'package:marketi/features/auth/domain/use_cases/verify_otp_use_case.dart';

part 'verify_otp_state.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this.verifyOtpUseCase) : super(VerifyOtpInitial());
  final VerifyOtpUseCase verifyOtpUseCase;

  String email = '';

  Future<void> verifyOtp({required String resetCode}) async {
    emit(VerifyOtpLoading());
    final verifyOtpRequest = VerifyOtpRequest(resetCode: resetCode);
    final result = await verifyOtpUseCase.call(params: verifyOtpRequest);

    result.fold(
      (failure) {
        emit(VerifyOtpFailure(failure.errorMessage));
      },
      (response) {
        emit(VerifyOtpSuccess(response));
      },
    );
  }
}
