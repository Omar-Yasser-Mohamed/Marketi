import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({int page = 1});
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts({int page = 1});
  Future<Either<Failure, List<ProductEntity>>> getBestProducts({int page = 1});
  Future<Either<Failure, List<ProductEntity>>> cachProducts();
  Future<Either<Failure, ProductEntity>> getProductById(String id);
}
