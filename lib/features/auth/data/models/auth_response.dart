import 'package:marketi/core/shared/models/user_model.dart';

class AuthResponse {
  final String message;
  final String token;
  final UserModel user;

  AuthResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> data) {
    return AuthResponse(
      message: data["message"],
      token: data["token"],
      user: UserModel.fromJson(data["user"]),
    );
  }
}
