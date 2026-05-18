import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/functions/products_mapper.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductEntity>> getAllProducts({int page = 1});
  Future<List<ProductEntity>> getPopularProducts({int page = 1});
  Future<List<ProductEntity>> getBestProducts({int page = 1});
  Future<ProductModel> getProductById(String id);
}

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiService _apiService;

  const ProductsRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ProductEntity>> getAllProducts({int page = 1}) async {
    final response = await _apiService.get(
      endpoint: ApiConstants.allProductsEndPoint,
      queryParameters: {
        "page": page,
      },
    );

    final List<ProductEntity> products = productsMapper(response.data);

    return products;
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await _apiService.get(
      endpoint: "${ApiConstants.allProductsEndPoint}/$id",
    );

    return ProductModel.fromJson(response.data['data']);
  }

  @override
  Future<List<ProductEntity>> getPopularProducts({int page = 1}) async {
    final response = await _apiService.get(
      endpoint: ApiConstants.allProductsEndPoint,
      queryParameters: {
        "page": page,
        "sort": "-sold",
      },
    );

    final List<ProductEntity> products = productsMapper(response.data);

    return products;
  }

  @override
  Future<List<ProductEntity>> getBestProducts({int page = 1}) async {
    final response = await _apiService.get(
      endpoint: ApiConstants.allProductsEndPoint,
      queryParameters: {
        "page": page,
        "sort": "-ratingsAverage",
      },
    );

    final List<ProductEntity> products = productsMapper(response.data);

    return products;
  }
}
