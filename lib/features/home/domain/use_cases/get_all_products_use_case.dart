import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

@LazySingleton()
class GetAllProductsUseCase implements UseCase<List<ProductEntity>, NoParam> {
  final HomeRepo homeRepo;

  GetAllProductsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call({
    required NoParam params,
  }) async {
    return await homeRepo.getAllProducts();
  }
}
