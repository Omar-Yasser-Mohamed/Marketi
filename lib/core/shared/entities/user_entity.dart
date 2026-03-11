import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final List<String>? addresses;
  final List<String>? wishlist;
  final String? role;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.addresses,
    this.wishlist,
    this.role,
  });
}
