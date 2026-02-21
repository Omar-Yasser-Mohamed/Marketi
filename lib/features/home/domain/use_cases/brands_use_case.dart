import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/repos/brands_repo.dart';

@lazySingleton
class BrandsUseCase {
  final BrandsRepo _brandsRepo;

  const BrandsUseCase(this._brandsRepo);

  Future<Either<Failure, List<BrandEntity>>> call({int page = 1}) async {
    return await _brandsRepo.getBrands(page: page);
  }
}
