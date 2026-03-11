import 'package:marketi/core/shared/entities/user_entity.dart';

abstract class ProfileLocalDataSource {
  Future<void> saveUserData(UserEntity user);
  Future<UserEntity?> getUserData();
}