import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure ,List<ProductEntity>>> getAllProducts({int page = 1});
  Future<Either<Failure ,List<ProductEntity>>> getPopularProducts({int page = 1});
  Future<Either<Failure ,List<ProductEntity>>> getBestProducts({int page = 1});
  Future<Either<Failure ,List<BrandEntity>>> getAllBrands();
  Future<Either<Failure ,List<CategoryEntity>>> getAllCategories();
}
