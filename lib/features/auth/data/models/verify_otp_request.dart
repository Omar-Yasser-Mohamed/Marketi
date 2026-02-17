class VerifyOtpRequest {
  final String resetCode;

  const VerifyOtpRequest({required this.resetCode});

  Map<String, dynamic> toJson() {
    return {
      "resetCode": resetCode,
    };
  }
}
