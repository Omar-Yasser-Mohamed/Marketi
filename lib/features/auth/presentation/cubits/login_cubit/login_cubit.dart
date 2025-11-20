import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/domain/use_cases/login_use_case.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final loginRequest = LoginRequest(email: email, password: password);
    final result = await loginUseCase.call(params: loginRequest);

    result.fold(
      (failure) {
        emit(LoginFailure(failure.errorMessage));
      },
      (response) {
        emit(LoginSuccess(response.token));
      },
    );
  }
}
