import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/repos/products_repo.dart';

@lazySingleton
class CachProductsUseCase {
  final ProductsRepo _repo;
  CachProductsUseCase(this._repo);
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await _repo.cachProducts();
  }
}