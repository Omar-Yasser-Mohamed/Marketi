import 'package:injectable/injectable.dart';
import 'package:marketi/core/constants/api_constants.dart';
import 'package:marketi/core/functions/brands_mapper.dart';
import 'package:marketi/core/functions/categories_mapper.dart';
import 'package:marketi/core/functions/products_mapper.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> getAllProducts({int page = 1}) async {
    final data = await apiService.get(
      endPoint: '${ApiConstants.allProductsEndPoint}?page=$page',
    );
    final List<ProductEntity> products = productsMapper(data.data);
    return products;
  }

  @override
  Future<List<ProductEntity>> getBestProducts({int page = 1}) async {
    final data = await apiService.get(
      endPoint: '${ApiConstants.bestProductsEndPoint}&page=$page',
    );
    final List<ProductEntity> products = productsMapper(data.data);
    return products;
  }

  @override
  Future<List<ProductEntity>> getPopularProducts({int page = 1}) async {
    final data = await apiService.get(
      endPoint: '${ApiConstants.popularProductsEndPoint}&page=$page',
    );
    final List<ProductEntity> products = productsMapper(data.data);
    return products;
  }

  @override
  Future<List<BrandEntity>> getAllBrands({int page = 1}) async {
    final data = await apiService.get(
      endPoint: '${ApiConstants.allBrandsEndPoint}?page=$page',
    );
    final List<BrandEntity> brands = brandsMapper(data.data);
    return brands;
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    final data = await apiService.get(
      endPoint: ApiConstants.allCategoriesEndPoint,
    );
    final List<CategoryEntity> categories = categoriesMapper(data.data);
    return categories;
  }
}
