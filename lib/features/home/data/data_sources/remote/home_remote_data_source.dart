import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getAllProducts({int page = 1});
  Future<List<ProductEntity>> getPopularProducts({int page = 1});
  Future<List<ProductEntity>> getBestProducts({int page = 1});
  Future<List<BrandEntity>> getAllBrands({int page = 1});
  Future<List<CategoryEntity>> getAllCategories();
}
