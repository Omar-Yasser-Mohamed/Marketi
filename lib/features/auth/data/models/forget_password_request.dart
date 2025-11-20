import 'dart:convert';

String forgetPasswordRequestToJson(ForgetPasswordRequest data) =>
    json.encode(data.toJson());

class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest({required this.email});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
