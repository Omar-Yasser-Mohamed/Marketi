import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

@LazySingleton()
class GetPopularProductUseCase implements UseCase<List<ProductEntity>, int> {
  final HomeRepo homeRepo;

  GetPopularProductUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call({
    required int params,
  }) async {
    return await homeRepo.getPopularProducts(page: params);
  }
}
