class VerifyTokenModel {
  final String id;
  final String name;
  final String role;
  final num iat;
  final num exp;

  VerifyTokenModel({
    required this.id,
    required this.name,
    required this.role,
    required this.iat,
    required this.exp,
  });

  factory VerifyTokenModel.fromJson(Map<String, dynamic> json) {
    return VerifyTokenModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      iat: json['iat'],
      exp: json['exp'],
    );
  }
}
