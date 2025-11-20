import 'dart:convert';

String verifyOtpRequestToJson(VerifyOtpRequest data) =>
    json.encode(data.toJson());

class VerifyOtpRequest {
  final String resetCode;

  VerifyOtpRequest({required this.resetCode});

  Map<String, dynamic> toJson() {
    return {
      "resetCode": resetCode,
    };
  }
}
