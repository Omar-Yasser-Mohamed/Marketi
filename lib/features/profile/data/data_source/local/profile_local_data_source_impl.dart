import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/hive_constants.dart';
import 'package:marketi/core/helpers/hive_helper.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';

import 'profile_local_data_source.dart';

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<UserEntity?> getUserData() async {
    return HiveHelper.get<UserEntity>(
      boxName: HiveConstants.userBox,
      key: HiveConstants.userKey,
    );
  }

  @override
  Future<void> saveUserData(UserEntity user) async {
    return await HiveHelper.put(
      boxName: HiveConstants.userBox,
      key: HiveConstants.userKey,
      data: user,
    );
  }
}
