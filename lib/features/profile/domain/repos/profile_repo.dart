import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getUserData();
}