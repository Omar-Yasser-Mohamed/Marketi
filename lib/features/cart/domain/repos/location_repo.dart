import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/domain/entities/map_location_entity.dart';

abstract class LocationRepo {
  Future<Either<Failure, MapLocationEntity>> getCurrentLocation();
  Future<Either<Failure, MapLocationEntity>> getLocationName({
    required double lat,
    required double lng,
  });
}