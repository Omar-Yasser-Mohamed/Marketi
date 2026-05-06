import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/features/favorites/data/data_sources/remote/fav_remote_data_source.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

@LazySingleton(as: FavRemoteDataSource)
class FavRemoteDataSourceImpl implements FavRemoteDataSource {
  final ApiService _apiService;
  final TokenService _tokenService;

  FavRemoteDataSourceImpl(this._apiService, this._tokenService);

  @override
  Future<void> addFavProduct(String productId) async {
    await _apiService.post(
      endpoint: ApiConstants.favoritesEndPoint,
      data: {"productId": productId},
      headers: {
        'token': await _tokenService.getToken(),
      },
    );
  }

  @override
  Future<List<ProductModel>> getFavProducts() async {
    final resposne = await _apiService.get(
      endpoint: ApiConstants.favoritesEndPoint,
      headers: {
        'token': await _tokenService.getToken(),
      },
    );
    return (resposne.data['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> removeFavProduct(String productId) async {
    await _apiService.delete(
      endpoint: "${ApiConstants.favoritesEndPoint}/$productId",
      headers: {
        'token': await _tokenService.getToken(),
      },
    );
  }
}
