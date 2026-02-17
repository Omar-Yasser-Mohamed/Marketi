import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  void safeEmit(SignupState state) {
    if (!isClosed) emit(state);
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    safeEmit(SignupLoading());

    final signupRequest = SignupRequest(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );

    final res = await authRepo.signup(signupRequest: signupRequest);

    res.fold(
      (failure) {
        safeEmit(SignupFailure(failure));
      },
      (success) {
        safeEmit(SignupSuccess());
      },
    );
  }
}
