import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/repos/products_repo.dart';

@LazySingleton()
class GetProductsByCategoryUseCase {
  final ProductsRepo _productsRepo;
  GetProductsByCategoryUseCase(this._productsRepo);
  Future<Either<Failure, List<ProductEntity>>> call({
    required String categoryId,
    int page = 1,
  }) async {
    return await _productsRepo.getProductsByCategory(
      categoryId: categoryId,
      page: page,
    );
  }
}