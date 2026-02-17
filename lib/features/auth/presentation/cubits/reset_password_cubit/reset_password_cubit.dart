import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/models/reset_password_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';
import 'package:marketi/features/auth/domain/services/email_flow.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._authRepo, this._emailFlow)
    : super(ResetPasswordInitial());
  final AuthRepo _authRepo;
  final EmailFlow _emailFlow;

  void safeEmit(ResetPasswordState state) {
    if (!isClosed) emit(state);
  }

  Future<void> resetPassword({
    required String newPassword,
  }) async {
    safeEmit(ResetPasswordLoading());
    final email = _emailFlow.email;

    final ResetPasswordRequest request = ResetPasswordRequest(
      email: email!,
      newPassword: newPassword,
    );

    final result = await _authRepo.resetPassword(
      resetPasswordRequest: request,
    );

    result.fold(
      (failure) {
        safeEmit(ResetPasswordFailure(failure));
      },
      (r) {
        _emailFlow.clear();
        safeEmit(ResetPasswordSuccess());
      },
    );
  }
}
