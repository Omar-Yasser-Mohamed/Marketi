import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/profile/data/models/update_profile_request_model.dart';
import 'package:marketi/features/profile/domain/use_cases/update_profile_use_case.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._updateProfileUseCase)
    : super(UpdateProfileInitial());
  final UpdateProfileUseCase _updateProfileUseCase;

  void safeEmit(UpdateProfileState state) {
    if (!isClosed) emit(state);
  }

  Future<void> updateProfile({
    String? name,
    String? email,
    String? phone,
  }) async {
    safeEmit(UpdateProfileLoading());

    final result = await _updateProfileUseCase.call(
      data: UpdateProfileRequestModel(
        name: name,
        email: email,
        phone: phone,
      ),
    );

    result.fold(
      (failure) => safeEmit(UpdateProfileFailure(failure)),
      (_) => safeEmit(UpdateProfileSuccess()),
    );
  }

  bool isDataChanged({
    required UserEntity oldData,
    String? name,
    String? email,
    String? phone,
  }) {
    return name != oldData.name ||
        email != oldData.email ||
        phone != oldData.phone;
  }
}
