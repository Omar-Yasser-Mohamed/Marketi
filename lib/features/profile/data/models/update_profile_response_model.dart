import 'package:marketi/features/profile/data/models/user_info_model.dart';

class UpdateProfileResponseModel {
  final String message;
  final UserInfoModel user;

  UpdateProfileResponseModel({required this.message, required this.user});

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      message: json['message'],
      user: UserInfoModel.fromJson(json['user']),
    );
  }
}

