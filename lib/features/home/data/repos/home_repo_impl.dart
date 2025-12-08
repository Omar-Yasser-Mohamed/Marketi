import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final List<ProductEntity> products = [];
      for (var page = 1; ; page++) {
        final data = await homeRemoteDataSource.getAllProducts(page: page);
        if (data.isEmpty) break;
        products.addAll(data);
      }
      return right(products);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestProducts({
    int page = 1,
  }) async {
    try {
      final products = await homeRemoteDataSource.getBestProducts(page: page);
      return right(products);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts({
    int page = 1,
  }) async {
    try {
      final products = await homeRemoteDataSource.getPopularProducts(
        page: page,
      );
      return right(products);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BrandEntity>>> getAllBrands() async {
    try {
      final List<BrandEntity> brands = [];
      for (int page = 1; ; page++) {
        final data = await homeRemoteDataSource.getAllBrands(page: page);
        if (data.isEmpty) break;
        brands.addAll(data);
      }
      return right(brands);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final categories = await homeRemoteDataSource.getAllCategories();
      return right(categories);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
