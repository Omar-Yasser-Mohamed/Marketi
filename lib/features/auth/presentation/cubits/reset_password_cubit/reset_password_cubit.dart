import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/auth/data/models/reset_password_request.dart';
import 'package:marketi/features/auth/domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());
  final ResetPasswordUseCase resetPasswordUseCase;

  String email = '';

  Future<void> resetPassword({
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    final resetPasswordRequest = ResetPasswordRequest(
      email: email,
      newPassword: newPassword,
    );

    final result = await resetPasswordUseCase.call(
      params: resetPasswordRequest,
    );

    result.fold(
      (failure) {
        emit(ResetPasswordFailure(failure.errorMessage));
      },
      (response) {
        emit(ResetPasswordSuccess(response.token));
      },
    );
  }
}
