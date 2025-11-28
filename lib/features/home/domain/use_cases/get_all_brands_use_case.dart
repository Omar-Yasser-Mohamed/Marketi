import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

@LazySingleton()
class GetAllBrandsUseCase implements UseCase<List<BrandEntity>, int> {
  final HomeRepo homeRepo;

  GetAllBrandsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BrandEntity>>> call({
    required int params,
  }) async {
    return await homeRepo.getAllBrands(page: params);
  }
}
