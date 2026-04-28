import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/data/data_sources/remote/cart_remote_data_source.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  CartRemoteDataSourceImpl(this._apiService, this._tokenService);
  final ApiService _apiService;
  final TokenService _tokenService;

  @override
  Future<CartModel> getCart() async {
    final response = await _apiService.get(
      endpoint: ApiConstants.cartEndPoint,
      headers: {
        'token': await _tokenService.getToken(),
      },
    );
    return CartModel.fromJson(response.data['data']);
  }
  
  @override
  Future<void> addProductToCart(String productId) async {
    await _apiService.post(
      endpoint: ApiConstants.cartEndPoint,
      headers: {
        'token': await _tokenService.getToken(),
      },
      data: {
        'productId': productId,
      },
    );
  }
  
  @override
  Future<void> removeProductFromCart(String productId) async {
    await _apiService.delete(
      endpoint: "${ApiConstants.cartEndPoint}/$productId",
      headers: {
        'token': await _tokenService.getToken(),
      },
    );
  }
  
  @override
  Future<void> updateProductFromCart(String productId, int quantity) async {
    await _apiService.put(
      endpoint: "${ApiConstants.cartEndPoint}/$productId",
      headers: {
        'token': await _tokenService.getToken(),
      },
      data: {
        'count': quantity,
      },
    );
  }
}