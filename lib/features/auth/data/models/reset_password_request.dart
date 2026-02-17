class ResetPasswordRequest {
  final String email;
  final String newPassword;

  const ResetPasswordRequest({required this.email, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "newPassword": newPassword,
    };
  }
}
