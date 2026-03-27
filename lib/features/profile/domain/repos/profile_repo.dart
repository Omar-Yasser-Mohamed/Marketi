import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/profile/data/models/update_profile_request_model.dart';
import 'package:marketi/features/profile/data/models/update_profile_response_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getUserData({bool forceRefresh = false});
  Future<Either<Failure, UserEntity>> updateCachedUser(UserEntity user);
  Future<Either<Failure, UpdateProfileResponseModel>> updateProfile({
    required UpdateProfileRequestModel data,
  });
}
