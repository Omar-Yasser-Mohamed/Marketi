class VerifyOtpResponse {
  final String statusMsg; // For fail
  final String message; // For fail
  final String status; // For success

  VerifyOtpResponse({
    required this.statusMsg,
    required this.message,
    required this.status,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      statusMsg: json['statusMsg'] ?? '',
      message: json['message'] ?? '',
      status: json['status'] ?? '',
    );
  }

  bool get isSuccess {
    return status.toLowerCase() == "success";
  }

  bool get isFail {
    return statusMsg.toLowerCase() == "fail";
  }
}