import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/domain/entities/map_location_entity.dart';
import 'package:marketi/features/cart/domain/repos/location_repo.dart';

@LazySingleton()
class GetCurrentLocationUseCase {
  final LocationRepo _locationRepo;

  GetCurrentLocationUseCase(this._locationRepo);

  Future<Either<Failure, MapLocationEntity>> call() async {
    return await _locationRepo.getCurrentLocation();
  }
}