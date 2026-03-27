
class UserInfoModel {
  final String name;
  final String email;
  final String role;

  UserInfoModel({required this.name, required this.email, required this.role});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}