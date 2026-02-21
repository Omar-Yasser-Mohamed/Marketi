import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/functions/products_mapper.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductEntity>> getAllProducts({int page = 1});
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
}
