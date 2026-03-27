import 'package:marketi/core/shared/models/user_model.dart';
import 'package:marketi/features/profile/data/models/update_profile_request_model.dart';
import 'package:marketi/features/profile/data/models/update_profile_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUserData();
  Future<UpdateProfileResponseModel> updateProfile({
    required UpdateProfileRequestModel data,
  });
}
