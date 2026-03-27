class UpdateProfileRequestModel {
  final String? name;
  final String? email;
  final String? phone;

  UpdateProfileRequestModel({
    this.name,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
    };
  }
}
