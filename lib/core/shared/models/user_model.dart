class UserModel {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userPhone;
  final String? userRole;
  final String? userIsActive;
  final List<String>? userAddresses;
  final List<String>? userWishlist;

  UserModel({
    this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    this.userAddresses,
    this.userWishlist,
    this.userRole,
    this.userIsActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userId: data["_id"] ?? data["id"],
      userName: data["name"],
      userEmail: data["email"],
      userPhone: data["phone"],
      userAddresses: data["addresses"],
      userWishlist: data["wishlist"],
      userRole: data["role"],
      userIsActive: data["active"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": userId,
      "name": userName,
      "email": userEmail,
      "phone": userPhone,
      "addresses": userAddresses,
      "wishlist": userWishlist,
      "role": userRole,
      "active": userIsActive,
    };
  }
}
