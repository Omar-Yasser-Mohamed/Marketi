import 'package:marketi/core/shared/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUserData();
}
