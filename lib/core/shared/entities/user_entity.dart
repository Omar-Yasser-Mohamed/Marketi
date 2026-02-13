import 'package:hive/hive.dart';
import 'package:marketi/core/shared/models/user_model.dart';

part 'user_entity.g.dart';


@HiveType(typeId: 0)
class UserEntity extends UserModel {
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

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.addresses,
  }) : super(
        userId: id,
        userName: name,
        userEmail: email,
        userPhone: phone,
        userAddresses: addresses,
      );
}
