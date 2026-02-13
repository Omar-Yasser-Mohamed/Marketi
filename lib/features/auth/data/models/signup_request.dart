class SignupRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  SignupRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": confirmPassword,
      "phone": phone,
    };
  }
}
