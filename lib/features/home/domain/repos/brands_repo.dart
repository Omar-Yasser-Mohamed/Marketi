import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';

abstract class BrandsRepo {
  Future<Either<Failure, List<BrandEntity>>> getBrands({int page = 1});
}
