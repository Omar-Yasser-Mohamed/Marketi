class ForgetPasswordResponse {
  final String statusMsg;
  final String message;

  ForgetPasswordResponse({
    required this.statusMsg,
    required this.message,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      statusMsg: json['statusMsg'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
