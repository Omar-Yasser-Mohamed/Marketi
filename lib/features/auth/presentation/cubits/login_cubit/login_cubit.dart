import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  void safeEmit(LoginState state) {
    if (!isClosed) emit(state);
  }

  Future<void> login({required String email, required String password}) async {
    safeEmit(LoginLoading());
    final loginRequest = LoginRequest(
      email: email,
      password: password,
    );

    final res = await authRepo.login(loginRequest: loginRequest);

    res.fold(
      (failure) {
        safeEmit(LoginFailure(failure));
      },
      (success) {
        safeEmit(LoginSuccess());
      },
    );
  }
}
