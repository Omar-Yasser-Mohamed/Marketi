import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/errors/failure_code.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/profile/data/models/update_profile_request_model.dart';
import 'package:marketi/features/profile/data/models/update_profile_response_model.dart';
import 'package:marketi/features/profile/domain/repos/profile_repo.dart';

@lazySingleton
class UpdateProfileUseCase {
  final ProfileRepo _profileRepo;

  UpdateProfileUseCase(this._profileRepo);

  Future<Either<Failure, UpdateProfileResponseModel>> call({
    required UpdateProfileRequestModel data,
  }) async {
    UserEntity? user;
    final getCurrentUserData = await _profileRepo.getUserData();

    getCurrentUserData.fold(
      (failure) {
        return left(failure);
      },
      (u) {
        user = u;
      },
    );

    if (user == null) {
      return left(
        const AppFailure(
          failureCode: FailureCode.notFound,
          message: "User not found",
        ),
      );
    }

    final updatedData = UpdateProfileRequestModel(
      name: data.name == user!.name ? null : data.name,
      email: data.email == user!.email ? null : data.email,
      phone: data.phone == user!.phone ? null : data.phone,
    );

    return await _profileRepo.updateProfile(data: updatedData);
  }
}
