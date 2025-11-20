import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/auth/data/models/forget_password_request.dart';
import 'package:marketi/features/auth/domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase)
    : super(ForgetPasswordInitial());
  final ForgetPasswordUseCase forgetPasswordUseCase;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final forgetPasswordRequest = ForgetPasswordRequest(email: email);
    final result = await forgetPasswordUseCase.call(
      params: forgetPasswordRequest,
    );

    result.fold(
      (failure) {
        emit(ForgetPasswordFailure(failure.errorMessage));
      },
      (response) {
        emit(ForgetPasswordSuccess(response.message));
      },
    );
  }
}
