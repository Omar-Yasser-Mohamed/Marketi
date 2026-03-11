import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/profile/domain/repos/profile_repo.dart';

import '../data_source/local/profile_local_data_source.dart';
import '../data_source/remote/profile_remote_data_source.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileLocalDataSource _profileLocalDataSource;
  final ProfileRemoteDataSource _profileRemoteDataSource;

  const ProfileRepoImpl(
    this._profileLocalDataSource,
    this._profileRemoteDataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      // check if data is local
      final userCached = await _profileLocalDataSource.getUserData();
      if (userCached != null) return right(userCached);

      final user = await _profileRemoteDataSource.getUserData();
      // Save user data local
      await _profileLocalDataSource.saveUserData(user.toEntity());

      return right(user.toEntity());
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
