import 'package:injectable/injectable.dart';
import 'package:marketi/core/constants/api_constants.dart';
import 'package:marketi/core/functions/products_mapper.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/token/token_service.dart';
import 'package:marketi/features/favourites/data/data_source/remote/favorites_remote_data_source.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

@LazySingleton(as: FavoritesRemoteDataSource)
class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiService apiService;
  final TokenService tokenService;

  FavoritesRemoteDataSourceImpl(this.apiService, this.tokenService);

  @override
  Future<List<ProductEntity>> addToFavorites({
    required String productId,
  }) async {
    await apiService.post(
      endPoint: ApiConstants.favoritesEndPoint,
      data: {
        'productId': productId,
      },
      headers: {
        'token': await tokenService.getToken(),
      },
    );
    return await getFavorites();
  }

  @override
  Future<List<ProductEntity>> getFavorites() async {
    final response = await apiService.get(
      endPoint: ApiConstants.favoritesEndPoint,
      headers: {
        'token': await tokenService.getToken(),
      },
    );
    final products = productsMapper(response.data);

    return products;
  }

  @override
  Future<List<ProductEntity>> removeFromFavorites({
    required String productId,
  }) async {
    await apiService.delete(
      endPoint: '${ApiConstants.favoritesEndPoint}/$productId',
      headers: {
        'token': await tokenService.getToken(),
      },
    );
    return await getFavorites();
  }
}
