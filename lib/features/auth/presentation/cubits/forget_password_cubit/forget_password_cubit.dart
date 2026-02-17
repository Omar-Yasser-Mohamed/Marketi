import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/models/forget_password_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';
import 'package:marketi/features/auth/domain/services/email_flow.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._authRepo, this._emailFlow)
    : super(ForgetPasswordInitial());
  final AuthRepo _authRepo;
  final EmailFlow _emailFlow;

  void safeEmit(ForgetPasswordState state) {
    if (!isClosed) emit(state);
  }

  Future<void> forgetPassword({required String email}) async {
    safeEmit(ForgetPasswordLoading());

    final forgetPasswordRequest = ForgetPasswordRequest(
      email: email,
    );

    final res = await _authRepo.forgetPassword(
      forgetPasswordRequest: forgetPasswordRequest,
    );

    res.fold(
      (failure) {
        safeEmit(ForgetPasswordFailure(failure));
      },
      (success) {
        _emailFlow.email = email;
        safeEmit(ForgetPasswordSuccess());
      },
    );
  }
}
