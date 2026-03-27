import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/models/user_model.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:marketi/features/profile/data/models/update_profile_request_model.dart';
import 'package:marketi/features/profile/data/models/update_profile_response_model.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService _apiService;
  final TokenService _tokenService;

  ProfileRemoteDataSourceImpl(this._apiService, this._tokenService);

  @override
  Future<UserModel> getUserData() async {
    final id = await _tokenService.getUserId();

    final response = await _apiService.get(
      endpoint: "${ApiConstants.userEndPoint}/$id",
    );

    return UserModel.fromJson(response.data['data']);
  }

  @override
  Future<UpdateProfileResponseModel> updateProfile({
    required UpdateProfileRequestModel data,
  }) async {
    final response = await _apiService.put(
      endpoint: ApiConstants.updateUserEndPoint,
      data: data.toJson(),
      headers: {
        'token': await _tokenService.getToken(),
      },
    );

    return UpdateProfileResponseModel.fromJson(response.data);
  }
}
