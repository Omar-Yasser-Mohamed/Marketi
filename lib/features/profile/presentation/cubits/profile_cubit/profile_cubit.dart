import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/profile/domain/repos/profile_repo.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  void safeEmit(ProfileState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getUserData({bool forceRefresh = false}) async {
    safeEmit(ProfileLoading());

    final result = await _profileRepo.getUserData(forceRefresh: forceRefresh);

    result.fold(
      (failure) {
        safeEmit(ProfileFailure(failure));
      },
      (user) {
        safeEmit(ProfileSuccess(user));
      },
    );
  }

  Future<void> updateUserData(UserEntity user) async {
    safeEmit(ProfileLoading());
    final result = await _profileRepo.updateCachedUser(user);

    result.fold(
      (failure) {
        safeEmit(ProfileFailure(failure));
      },
      (user) {
        safeEmit(ProfileSuccess(user));
      },
    );
  }
}
