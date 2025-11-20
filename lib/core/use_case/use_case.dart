import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}

class NoParam {}
