import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final AuthRepo _authRepo;
  final TokenService _tokenService;

  SplashCubit(this._authRepo, this._tokenService) : super(SplashInitial());

  Future<void> checkAuth() async {
    emit(SplashLoading());

    final token = await _tokenService.getToken();
    if (token == null || token.isEmpty) return emit(SplashUnauthenticated());

    final result = await _authRepo.verifyToken();
    result.fold(
      (failure) => emit(SplashUnauthenticated()),
      (_) => emit(SplashAuthenticated()),
    );
  }
}
